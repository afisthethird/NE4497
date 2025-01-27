c **************************** cells *************************
c Fuel pellet cells
10  1 -14.3     3 -2 -5   vol=25.88         imp:n=1 u=1 $ fuel pellet stack 1
30  3 -6.56      (-3:2:5) 1 -6 -9    imp:n=1 u=1 $ zirc clad 1
11  1 -14.3     3 -12 -5  vol=25.88     imp:n=1 u=1 $ fuel pellet stack  2
31  3 -6.56      (-3:12:5) 1 -16 -9  imp:n=1 u=1 $ zirc clad 2
12  1 -14.3     3 -22 -5  vol=25.88         imp:n=1 u=1 $ fuel pellet stack  3
32  3 -6.56      (-3:22:5) 1 -26 -9  imp:n=1 u=1  $ zirc clad 3
13  1 -14.3     3 -42 -5  vol=25.88         imp:n=1 u=1 $ fuel pellet stack  4
33  3 -6.56      (-3:42:5) 1 -46 -9  imp:n=1 u=1 $ zirc clad 4
14  1 -14.3     3 -52 -5  vol=25.88         imp:n=1 u=1 $ fuel pellet stack  5
34  3 -6.56      (-3:52:5) 1 -56 -9  imp:n=1 u=1 $ zirc clad 5
15  1 -14.3     3 -62 -5  vol=25.88         imp:n=1 u=1 $ fuel pellet stack  6
35  3 -6.56      (-3:62:5) 1 -66 -9  imp:n=1 u=1  $ zirc clad 6
C Heat Pipe
711 4 -10.2               -71 72 1 -103      u=1       imp:n=1  $outer pipe
712 2  -0.971               -72 1 -103        u=1      imp:n=1  $inner liquid layer
213 6 -3.02        -301 302 -303 305 -304 306 71 9 -103 u=1 imp:n=1
2   5 -4.2 -301 302 -303 305 -304 306 1 -9 6 16 26 46 56 66 71 imp:n=1 u=1 $moderator cell
3 5 -4.2  -301 302 -303 305 -304 306 1 -103 lat=2 imp:n=1 u=3 fill=-6:6 -6:6 0:0
            2 2 2 2 2 2 2 2 2 2 2 2 2 $-6
            2 2 2 2 2 2 1 1 1 1 1 1 2 $-5
            2 2 2 2 2 1 1 1 1 1 1 1 2 $-4
            2 2 2 2 1 1 4 1 1 4 1 1 2 $-3
            2 2 2 1 1 1 1 1 1 1 1 1 2 $-2
            2 2 1 1 1 1 1 1 1 1 1 1 2 $-1
            2 1 1 4 1 1 4 1 1 4 1 1 2 $0
            2 1 1 1 1 1 1 1 1 1 1 2 2 $1
            2 1 1 1 1 1 1 1 1 1 2 2 2 $2
            2 1 1 4 1 1 4 1 1 2 2 2 2 $3
            2 1 1 1 1 1 1 1 2 2 2 2 2 $4
            2 1 1 1 1 1 1 2 2 2 2 2 2 $5
            2 2 2 2 2 2 2 2 2 2 2 2 2 $6
          $-6 5 4 3 2 1 0 1 2 3 4 5 6
4 0 -101 -103 209                      fill=3            imp:n=1 $fills internal reflector with core
5 6 -3.02 (101:-209) -102 -103 104                          imp:n=1 $refcector
6 0 (307:103:-104)                                        imp:n=0
7 6 -3.02 -301 302 -303 305 -304 306 1 -103 imp:n=1 u=2  $ reflector Element
233 0 -307 102 -103 104 imp:n=1 $external flux cylinder
c control rods withdrawn
811 0 -105 1 -103 imp:n=1 u=5 $control rod withdrawn
812 5 -4.2  -301 302 -303 305 -304 306 105 1 -103 imp:n=1 u=5 $control rod housing withdrawn
c control rods inserted
8 7 -2.52 -105 1 -103     vol=175.93   imp:n=1 u=4 $control rods inserted
9 5 -4.2  -301 302 -303 305 -304 306 105 1 -103 imp:n=1 u=4 $control rod housing

c **************************** surfaces *************************
307 cz 30.01                          $ flux cylinder
101 cz 24                      $ Inner reflector Cylinder
109 pz 56.9                    $ Top Plane
209 pz .01                   $ Bottom Plane
102 cz 30                    $ reflector cylinder
103 pz 56 $60                   $ reflector top
104 pz -4  $-8                  $ reflector bottom
105 cz 1.25                   $ control rod diameter
c Hexagon sides *makes it reflective allowing for Kinf
301 px 2.1997                       $ right side
302 px -2.1997                       $ left side
303 p  1  1.738205 0  4.3994        $ top right
304 p -1  1.738205 0  4.3994       $ bottom left
305 p  1  1.738205 0 -4.3994       $ top left
306 p  -1 1.738205 0 -4.3994     $ bottom right 
c fuel pellets and cladding
1  pz   0  $ bottom of clad
3  pz  .5    $ bottom of fuel
5  pz   50.5    $ top of fuel
9  pz   51  $ top of clad
2  c/z   1.27 -.73323 0.41   $ radius of fuel pellet 1
6  c/z   1.27 -.73323 0.575  $ outside radius of clad 1
12 c/z   1.27  .73323 0.41   $ radius of fuel pellet 2
16 c/z   1.27  .73323 0.575  $ outside radius of clad 2
22 c/z   0   1.466469 0.41   $ radius of fuel pellet 3
26 c/z   0    1.466469 0.575 $ outside radius of clad 3
42 c/z   0 -1.466469  0.41   $ radius of fuel pellet 4
46 c/z   0  -1.466469 0.575 $ outside radius of clad 4
52 c/z   -1.27 .73323 0.41   $ radius of fuel pellet 5
56 c/z   -1.27 .73323 0.575  $ outside radius of clad 5
62 c/z  -1.27 -.73323  0.41   $ radius of fuel pellet 6
66 c/z  -1.27 -.73323 0.575  $ outside radius of clad 6
c Heat pipes
71 cz      0.75    $Heat pipe od
72 cz      0.71    $ Heat pipe id
73 cz      0.66    $ Liquid lithium 
74 cz      0.64    $ 69 percent poros lithium and inside is full of lithium 

c *************************** data ******************************
mode n
mphys on
kcode  100000 1.0 15 50
ksrc   0 2 20
c BURN TIME =20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
c      POWER=.5 
c      PFRAC=1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
c      BOPT= 1.0 -14 -1
c      MAT=1 
c FUEL UN
m1   92234.70c -0.004939274223          $Uranium
     92235.70c -0.229723            
     92238.70c -0.684229725777          $Nitrogen
     07014.80c -0.080791841016
     07015.80c -0.000316158984
$mt1   $u-un.40t   $n-un.40t
C Heat pipe cooling Na
m2 11023.80c   -1.0                     $Sodium
C Cladd Zirc 4
m3   40090.80c -0.50343825              $Zr
     40091.80c -0.1097877
     40092.80c -0.16781275
     40094.80c -0.1700633
     40096.80c -0.027398
     50112.80c -0.00013716              $SN
     50114.80c -0.000094995
     50115.80c -0.000049365
     50116.80c -0.0021294
     50117.80c -0.001134465
     50118.80c -0.00360825
     50119.80c -0.0012906
     50120.80c -0.00493608
     50122.80c -0.000713175
     50124.80c -0.00090651
     26054.80c -0.0001354944            $Fe
     26056.80c -0.002205636
     26057.80c -0.0000518496
     26058.80c -0.00000702
     24050.80c -0.0000542581            $Cr
     24052.80c -0.0010880922
     24053.80c -0.0001257568
     24054.80c -0.0000318942
     28058.80c -0.000671978             $Ni
     28060.80c -0.000267759
     28061.80c -0.000011834
     28062.80c -0.000038349
     28064.80c -0.00001008              
     08016.80c -0.001799273             $O
     08017.80c -0.0000007272
C Heat Pipe  Mo
m4   42092.80c 0.145300                 $MO
     42094.80c 0.091500
     42095.80c 0.158400
     42096.80c 0.166700
     42097.80c 0.096000
     42098.80c 0.243900
     42100.80c 0.098200
C Modorator YH2 
m5   39089.80c -0.977828                $Y     
     01001.80c -0.02216690044           $H
     01002.80c -0.00000509956
$mt5  $h-yh2.40t $y-yh2.40t
C Reflector BeO
m6   04009.80c -0.36032                 $Be
     08016.80c -0.639421569             $O
     08017.80c -0.00025843072
$mt6  $be-beo.40t $o-beo.40t
C Control Rod B4C   
m7   05010.80c -0.70024575267           $B
     05011.80c -0.08238424733
     06000.80c -0.21737                 $C
C Control Rod Clad
M8   26054.80c -0.0380202932            $Fe
     26056.80c -0.61891065175
     26057.80c -0.0145492138
     26058.80c -0.00196984125
     24050.80c -0.00709529              $Cr
     24052.80c -0.14228898
     24053.80c -0.01644512
     24054.80c -0.00417078
     28058.80c -0.08063736              $Ni
     28060.80c -0.03213108
     28061.80c -0.00142008
     28062.80c -0.00460188
     28064.80c -0.0012096
     42092.80c -0.003479075             $Mo
     42094.80c -0.002238525
     42095.80c -0.0039165
     42096.80c -0.0041651
     42097.80c -0.002423675
     42098.80c -0.006221125
     42100.80c -0.002556
     06000.80c -0.0003                  $C
     25055.80c -0.002                   $Mn
     14028.80c -0.0068899875            $Si
     14029.80c -0.00036252
     14030.80c -0.0002474925
     15031.80c -0.00045                 $P
     16032.80c -0.0002841459            $S
     16033.80c -0.0000023136
     16034.80c -0.0000135066
     16036.80c -0.0000000336
     07014.80c -0.000996102             $N
     07015.80c -0.000003898
c fc4            flux in fuel pellet but yield average over all cell 10s
c f4:n       $ Cell Number
c sd4  27000   $ volume
 

