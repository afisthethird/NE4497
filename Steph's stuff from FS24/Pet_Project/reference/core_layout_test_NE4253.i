Fuel Rod
c === Cell Cards ===
 c --- U1: fuel rod ---
  1 1 -10.410E-0  3 -2 -5         IMP:n=1 U=1 $ fuel pellet stack
  2 2 -01.225E-3  (5:2) 3 -4 -7   IMP:n=1 U=1 $ helium gap
  3 3 -06.500E-0  (-3:4:7) -6 -9  IMP:n=1 U=1 $ zirc clad
  4 4 -01.000E-0  6:9             IMP:n=1 U=1 $ water outside of clad
 c --- U2: fuel elements in fuel assembly ---
  5 4 -1 -11 10 -13 12  IMP:n=1 U=2 LAT=1 FILL=-8:8 -8:8 0:0 $ fuel assembly
      $ layout, bottom-->top
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 1 1 2 1 1 2 1 1 2 1 1 1 1 1
       1 1 1 2 1 1 1 1 1 1 1 1 1 2 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 2 1 1 2 1 1 2 1 1 2 1 1 2 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 2 1 1 2 1 1 2 1 1 2 1 1 2 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 2 1 1 2 1 1 2 1 1 2 1 1 2 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 2 1 1 1 1 1 1 1 1 1 2 1 1 1
       1 1 1 1 1 2 1 1 2 1 1 2 1 1 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
       $
 c --- U3: fuel assemblies in core layout
  6 4 -1  -21 20 -23 22  IMP:n=1 U=3 LAT=1 FILL=-8:8 -8:8 0:0 $ core assembly
      $ layout, bottom-->top
       3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
       3 3 3 3 3 3 3 2 2 2 3 3 3 3 3 3 3
       3 3 3 3 3 2 2 2 2 2 2 2 3 3 3 3 3
       3 3 3 3 2 2 2 2 2 2 2 2 2 3 3 3 3
       3 3 3 2 2 2 2 2 2 2 2 2 2 2 3 3 3
       3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3
       3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3
       3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3
       3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3
       3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3
       3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3
       3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3
       3 3 3 2 2 2 2 2 2 2 2 2 2 2 3 3 3
       3 3 3 3 2 2 2 2 2 2 2 2 2 3 3 3 3
       3 3 3 3 3 2 2 2 2 2 2 2 3 3 3 3 3
       3 3 3 3 3 3 3 2 2 2 3 3 3 3 3 3 3
       3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
       $
 c --- U0: actual geometry ---
  7  0            -40 -75 74        IMP:n=1  U=0 FILL=3 $ core
  8  5 -8.000000  40 -41 -75 74     IMP:n=1  U=0        $ core vessel lining
  9  4 -1.000000  -50               IMP:n=16 U=0        $ water sphere
  10 6 -0.001205  41 -60 -75 74     IMP:n=4  U=0        $ first simulation sector around core vessel
  11 6 -0.001205  60 -61 -75 74     IMP:n=8  U=0        $ second simulation sector around core vessel
  12 6 -0.001205  61 -70 -75 74 50  IMP:n=16 U=0        $ third simulation sector around core vessel
  13 0            70:75:-74         IMP:n=0  U=0        $ outside world
c

c === Surface Cards ===
 c --- fuel rod components ---
  1 PZ -50.115 $ bottom of clad (bottom of fuel element)
  3 PZ -50.000 $ bottom of fuel
  5 PZ  50.000 $ top of fuel
  7 PZ  70.000 $ top of plenum
  9 PZ  70.155 $ top of clad
  2 CZ  00.410 $ radius of fuel pellet
  4 CZ  00.420 $ inside radius of clad
  6 CZ  00.575 $ outside radius of clad
 c --- fuel/water element bounds ---
  10 PX -00.630
  11 PX  00.630
  12 PY -00.630
  13 PY  00.630
  14 PZ -50.115 $ bottom of element
  15 PZ  75.000 $ top of element
 c --- fuel/water assembly bounds ---
  20 PX -10.700
  21 PX  10.700
  22 PY -10.700
  23 PY  10.700
  24 PZ -50.115 $ bottom of assembly
  25 PZ  75.000 $ top of assembly
 c --- core bounds ---
  30 PX -181.900
  31 PX  181.900
  32 PY -181.900
  33 PY  181.900
  34 PZ -050.115 $ bottom of core
  35 PZ  075.000 $ top of core
 c --- core vessel bounds ---
  40 CZ  181.900 $ inside radius of core vessel
  41 CZ  186.900 $ outside radius of core vessel
  44 PZ -050.115 $ bottom of core vessel
  45 PZ  075.000 $ top of core vessel
 c --- sphere of water outside core ---
  50 S 286.900 0 12.4425 5 $ sphere surface
 c --- simulation sectoring for importance weighting (to account for loss of neutrons further from core) ---
  60 CZ 220.23333 $ first importance increase point
  61 CZ 253.56666 $ second importance increase point
 c --- simulation bounds
  70 CZ  291.900 $ bounding cylinder to keep particles available for the sphere
  74 PZ -050.115 $ bottom of simulation
  75 PZ  075.000 $ top of simulation
c

c === Data Cards ===
 c --- Run Mode ---
  MODE n $ neutron tracking mode
 c --- Materials ---
  M1 $ fuel (3 wt% enriched UO2)
       92235.70c -0.02644200
       92238.70c -0.85495800
        8016.70c -0.11860000
  M2 $ gap (He)
       2003.70c  0.00000134
       2004.70c  0.99999866
  M3 $ clad (Zircaloy-4)
       $ O
        8016.70c  0.006787419800 $ no XS data for 18O --> add to 16O since XS's similar
        8017.70c  0.000002580200
       $ Cr
        24050.70c  0.000075646450
        24052.70c  0.001458766490
        24053.70c  0.000165412410
        24054.70c  0.000041174650
       $ Fe
        26054.70c  0.000189494900
        26056.70c  0.002974664680
        26057.70c  0.000068697980
        26058.70c  0.000009142440
       $ Zr
        40090.70c  0.502949475000
        40091.70c  0.109681110000
        40092.70c  0.167649825000
        40094.70c  0.169898190000
        40096.70c  0.027371400000
       $ Sn
        50112.70c  0.000103566900
        50114.70c  0.000070468200
        50115.70c  0.000036301800
        50116.70c  0.001552435800
        50117.70c  0.000819993600
        50118.70c  0.002585969400
        50119.70c  0.000917154300
        50120.70c  0.003478566600
        50122.70c  0.000494345100
        50124.70c  0.000618198300
  M4 $ coolant (H2O)
       1001.70c  0.666590333295
       1002.70c  0.000076666705
       8016.70c  0.333206333460
       8017.70c  0.000126666540
  M5 $ core vessel lining (SS304L)
       $ C
        6000.70c  0.003635000000
       $ Mn
        25055.70c  0.019870000000
       $ P
        15031.70c  0.000793000000
       $ S
        16032.70c  0.000485398900
        16033.70c  0.000003832500
        16034.70c  0.000021717500
        16036.70c  0.000000051100
       $ Si
        14028.70c  0.017922617820
        14029.70c  0.000910482900
        14030.70c  0.000600899280
       $ Cr
        24050.70c  0.008665798350
        24052.70c  0.167111295270
        24053.70c  0.018949079430
        24054.70c  0.004716826950
       $ Ni
        28058.70c  0.060141175767
        28060.70c  0.023166273233
        28061.70c  0.001007021857
        28062.70c  0.003210826335
        28064.70c  0.000817702808
       $ Fe
        26054.70c  0.039042904950
        26056.70c  0.612890111340
        26057.70c  0.014154305490
        26058.70c  0.001883678220
  M6 $ air
       $ C
        6000.70c  0.000150000000
       $ N
        7014.70c  0.781573678440
        7015.70c  0.002855321560
       $ O
        8016.70c  0.210669915000
        8017.70c  0.000080085000
       $ Ar
        18036.70c  0.000015717915
        18038.70c  0.000002952072
        18040.70c  0.004652330013
 c --- Material TSL XS Correction ---
  MT1  u/o2.10t  o2/u.10t
  MT4  lwtr.10t
 c --- Criticality Calculation ---
  KCODE 500000 1.0 30 130
  KSRC 0 0 0
 c --- Cell Volume Specification for Tallies ---
  c SD04 52.810173                                          $ cell 1 volume
  c SD14 52.810173                                          $ cell 1 volume
  c SD24 52.810173 13.691061 58.421901 73.709439 198.632574 $ cell 1 / 2 / 3 / 4 / (1+2+3+4) volume
  c SD34 198.632574                                         $ cell (1+2+3+4) volume
  c SD44 52.810173 52.810173                                $ cell 1 / 1 volume
  c SD54 52.810173 288r 52.810173                           $ cell 1 volume x289, average of all cell 1 volumes
  c SD64 198.632574 288r 198.632574                         $ cell (1+2+3+4) volume x289, average of all cell (1+2+3+4) volumes
  c SD74 198.632574 288r 198.632574                         $ cell (1+2+3+4) volume x289, average of all cell (1+2+3+4) volumes
  c SD84 198.632574 288r 198.632574                         $ cell (1+2+3+4) volume x289, average of all cell (1+2+3+4) volumes
  c SD94 198.632574 288r 198.632574                         $ cell (1+2+3+4) volume x289, average of all cell (1+2+3+4) volumes
  SD104 523.5987756                                        $ cell 9 volume
 c --- Tallies ---
  c --- Regular Tallies ---
   c F04:n 1
   c F14:n (1<5<6)
   c F24:n 1 2 3 4 T
   c F34:n (1 2 3 4)
   c F44:n (1<5[-8 8 0, -1 0 0]<6)
   c F54:n (1<5[-8:8 -8:8 0]<6) T
   c F64:n ((1 2 3 4)<5[-8:8 -8:8 0]<6) T
   c F74:n ((1 2 3 4)<5[-8:8 -8:8 0]<6<7) T
   c F84:n ((1 2 3 4)<5[-8:8 -8:8 0]<6[0 0 0]<7) T
   c F94:n ((1 2 3 4)<5[-8:8 -8:8 0]<6[7 0 0]<7) T
   F104:n 9
  c --- Mesh Tallies ---
   c FMESH204:n ORIGIN=-10.71 -10.71 -50.115 GEOM=REC                      OUT=COL FACTOR=1
   c      IMESH=9.45 10.71 JMESH=10.71   KMESH=75
   c      IINTS=16 1       JINTS=17      KINTS=1
   c FMESH214:n ORIGIN=0 0 -50.115           GEOM=cyl AXS=0 0 1 VEC=1 0 0  OUT=COL FACTOR=1
   c      IMESH=0.63 10.08 JMESH=125.115 KMESH=1
   c      IINTS=1 8        JINTS=1       KINTS=1
 c --- Tally Comments ---
  c FC004 flux in fuel pellet as avg over all cell 10s
  c FC014 same as F04
  c FC024 combined flux in all cell 1/2/3/4s
  c FC034 equivalent to F24
  c FC044 flux of cell 10 at lattice positions -8 8 0 and -1 0 0
  c FC054 gives the seperate fluxes of the 289 cell 10s and then the total thereof
  c FC064 gives the seperate fluxes of the 289 cell (10+20+30+40)s and the total, summed flux thereof
  c FC074 gives the separate fluxes of the 289 cell (10+20+30+40)s and the total in the core
  c FC084 gives the separate fluxes of the 289 cell (10+20+30+40)s and the total in the core
  c FC094 gives the separate fluxes of the 289 cell (10+20+30+40)s and the total in the core
  FC104 gives the flux in the water sphere
c