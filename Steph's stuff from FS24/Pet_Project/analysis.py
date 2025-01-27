from f4enix import Meshtal
from f4enix import Output
import matplotlib.pyplot as plt
import numpy as np
import math
from shapely.geometry import Polygon, Point
import geopandas as gpd
import pyvista as pv

# package documentation
# ---------------------
# GeoPandas : https://geopandas.org/
# SciPy : https://docs.scipy.org/doc/scipy/
# NumPy : https://numpy.org/doc/
# MCNP : https://mcnp.lanl.gov/
# PyVista : https://docs.pyvista.org/
# F4Enix : https://f4enix.readthedocs.io/
# MatPlotLib : https://matplotlib.org/
# Shapely : https://shapely.readthedocs.io/
# Math : https://docs.python.org/3/library/math.html
# ---------------------

# array rotator (abt. origin)
def arr_rot(unrotated_arr, degreesrotation):

    radiansrotation = np.radians(degreesrotation)

    rotated_arr = np.empty((0, 2))
    for pt in unrotated_arr:
        x_rot = pt[0] * math.cos(radiansrotation) - pt[1] * math.sin(radiansrotation)
        y_rot = pt[0] * math.sin(radiansrotation) + pt[1] * math.cos(radiansrotation)
        rotated_arr = np.vstack((rotated_arr, np.array([x_rot, y_rot])))
    return rotated_arr

# hexagonal point array generator, gens flat side parallel to the x-axis
def hex_arr_gen(pitch, side_hex_count, degreesrotation):

    posarr = np.empty((0, 2))
    negarr = np.empty((0, 2))

    inradius = pitch / 2
    side = (2 / np.sqrt(3)) * inradius

    cols_y_offset = inradius
    cols_x_offset = (3 / 2) * side
    adj_sep = pitch
    
    for x_index in range(side_hex_count):
        
        x_val = x_index * cols_x_offset
        y_val_init = -((((side_hex_count - 1) - x_index) * adj_sep) + (x_index * cols_y_offset))

        # gens up in y-columns at each x-val
        for col_y_index in range((2 * side_hex_count) - (x_index + 1)):
            
            y_val = y_val_init + (col_y_index * adj_sep)

            # only add on both x-sides if not center of grid
            pt_pos = np.array((x_val, y_val))
            pt_neg = np.array((-x_val, y_val))
            if x_index != 0:
                negarr = np.vstack((pt_neg, negarr)) # neg --> pts
            posarr = np.vstack((posarr, pt_pos)) # pts --> pos

    arr_hex = np.vstack((negarr, posarr))
    return arr_rot(arr_hex, degreesrotation)

# hexagon polygon generator
def hex_poly_gen(center_x, center_y, pitch, degreesrotation):
    
    inradius = pitch / 2
    side = (2 / np.sqrt(3)) * inradius
    radius = side

    angles = [i * 60 for i in range(6)]
    points = [(center_x + radius * math.cos(math.radians(angle + degreesrotation)), 
               center_y + radius * math.sin(math.radians(angle + degreesrotation))) for angle in angles]
    
    return Polygon(points)

# information on desired polygons
pitch = 4.3994
side_hex_count = 6
degreesrotation = 90

# information on source and information extraction from o
q_avg = 185.7292455447557
v_avg = 2.456
p_th = 500000

def parse_mcnp_data(sourcespec):
    # information extraction from meshtal
    pp_meshtal = Meshtal('./outputs/pet_project.meshtal')
    pp_meshtal.readMesh()
    pp_fmesh = pp_meshtal.mesh[4]
    pp_grid = pp_fmesh.grid # convert to pyvista DataSet

    pp_cell_vols = np.empty((0, 1))
    for cell in pp_grid.cell:
        cell_bounds = cell.bounds
        cell_vol = (cell_bounds[1] - cell_bounds [0]) * (cell_bounds[3] - cell_bounds [2]) * (cell_bounds[5] - cell_bounds [4])
        pp_cell_vols = np.append(pp_cell_vols, cell_vol)

    # extract numpy arrays from pyvista DataSet
    pp_temp_power_vals = pp_grid['Value - Total']
    pp_temp_power_errs = pp_grid['Error - Total']
    pp_temp_power_errs *= pp_temp_power_vals # convert from relative error to [W] per cell

    pp_xyz_pts = (pp_grid.cell_centers()).points # get cell centers from cell vertices mesh array
    pp_xy_pts = pp_xyz_pts[:,0:2]

    # convert from power density [MeV/srcp cm3] to power [J/s]
    pp_power_vals = pp_temp_power_vals * pp_cell_vols * sourcespec
    pp_power_errs = pp_temp_power_errs * pp_cell_vols * sourcespec

    # convert pyvista DataSet into geopandas GeoDataFrame for averaging over polygons
    pp_xy_gdf = gpd.GeoDataFrame(geometry=[Point(xy) for xy in pp_xy_pts])
    pp_xy_gdf['id'] = range(1, pp_xy_pts.shape[0] + 1)
    pp_xy_gdf['Power [W]'] = pp_power_vals
    pp_xy_gdf['Power Error [W]'] = pp_power_errs

    return pp_xy_gdf

def avg_mcnp_data(pitch, side_hex_count, degreesrotation, pp_gdf):
    # create hexagonal geopandas GeoDataFrame for storage of polygons to average over
    pp_hex_pts = hex_arr_gen(pitch, side_hex_count, degreesrotation)
    pp_hex_polygons = np.empty((0,1))
    for pp_hex_pt in pp_hex_pts:
        pp_hex_polygons = np.append(pp_hex_polygons, hex_poly_gen(pp_hex_pt[0], pp_hex_pt[1], pitch, degreesrotation))
    pp_hex_gdf = gpd.GeoDataFrame(geometry=[hex_poly for hex_poly in pp_hex_polygons])
    pp_hex_gdf['id'] = range(1, pp_hex_polygons.shape[0] + 1)

    # average mesh tally results over specified polygons using geopandas
    pp_overlay_gdf = gpd.sjoin(pp_gdf, pp_hex_gdf, how='left')
    pp_overlay_calcs = pp_overlay_gdf.groupby(by='id_right')[['Power [W]', 'Power Error [W]']].sum()
    pp_hex_gdf = pp_hex_gdf.merge(pp_overlay_calcs, left_on='id', right_index=True, how='outer')

    # add power ratios (useful)
    pp_hex_gdf['Power Ratio'] = pp_hex_gdf['Power [W]'] / np.average(pp_hex_gdf['Power [W]'])

    return pp_hex_gdf

# default source specification
s = (p_th * v_avg)/(q_avg)

# initialization
pp_gdf = None
pp_hex_gdf = None

exitflag = False
while not exitflag:

    print('MCNP Analysis Script\n-------')
    print('Enter source specification : src')
    print('Parse MCNP outputs : pars')
    print('Print select tally statistics : stat')
    print('Specify regions for averaging : reg')
    print('Average tally results over regions : avg')
    print('Plot averaged region results : plot')
    print('Exit this script : exit')
    userselection = input('Selected action: ')

    match userselection:

        case 'src':
            p_th = input('Enter reactor thermal power [W]: ')
            v_avg = input('Enter average neutrons prod. per fission: ')
            q_avg = input('Enter average energy released per fission [MeV/fiss]: ')
            # recalculate source specification
            s = (p_th * v_avg)/(q_avg)
            
        case 'pars':
            pp_gdf = parse_mcnp_data(s)

        case 'stat':
            if(pp_gdf is not None):
                totalpower = sum(pp_gdf['Power [W]'])
                print('Total Power [W]: ' + str(totalpower))

            if(pp_hex_gdf is not None):
                print('Maximum Fuel Assembly Power Ratio: ' + str(np.max(pp_hex_gdf['Power Ratio'])))
            
            if(pp_gdf is not None):
                q_true_ratio = sum(pp_gdf['Power [W]']) / p_th
                print('Expected true Q_avg: ' + str(q_avg * q_true_ratio))

        case 'reg':
            pitch = input('Enter lattice pitch [cm]: ')
            side_hex_count = input('Enter lattice side hex count: ')
            degreesrotation = input('Enter degrees rotated from flat side parallel to x-axis: ')

        case 'avg':
            if(pp_gdf is not None):
                pp_hex_gdf = avg_mcnp_data(pitch, side_hex_count, degreesrotation, pp_gdf)
        
        case 'plot':
            if(pp_hex_gdf is not None):
                fig = plt.figure()
                plot = pp_hex_gdf.plot(column='Power Ratio', legend=True, legend_kwds={'label': 'Power Ratio', 'location': 'top', 'orientation': 'horizontal'})
                plot.set_xlabel('Reactor x-axis position [cm]')
                plot.set_ylabel('Reactor y-axis position [cm]')
                plot.set_label('Power Ratio')
                plt.savefig('test.png', dpi=1200)

        case 'exit':
            exitflag = True
        
        case _:
            print('Invalid input.')
    
    print('')