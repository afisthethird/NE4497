Pet Project
c === Cell Cards ===
 c --- U1: fuel rod ---
  1  6 -14.30  2 -3 -5  IMP:n=1 U=1 $ fuel pellet stack
  2  1 -06.56  -2 -5    IMP:n=1 U=1 $ bottom cladding spacer
  3  1 -06.56  3 -5     IMP:n=1 U=1 $ top cladding spacer
  4  1 -06.56  5        IMP:n=1 U=1 $ cladding
 c --- U2: heat pipe ---
  10  8 -0.00022  12 -13     IMP:n=1 U=2 $ vapor core
  11  9 -3.42000  12 13 -14  IMP:n=1 U=2 $ mesh wick
  12  8 -0.75100  12 14 -15  IMP:n=1 U=2 $ liquid annulus
  13  7 -8.44000  12 15      IMP:n=1 U=2 $ heat pipe container walls
  14  7 -8.44000  -12        IMP:n=1 U=2 $ heat pipe end cap
 c --- U3: fuel assembly ---
  c --- fuel rods ---
   20  0  -28  IMP:n=1 U=3 FILL=1 $ upper fuel rod
   21          LIKE 20 BUT TRCL=1 $ upper left fuel rod
   22          LIKE 20 BUT TRCL=2 $ lower left fuel rod
   23          LIKE 20 BUT TRCL=3 $ lower fuel rod
   24          LIKE 20 BUT TRCL=4 $ lower right fuel rod
   25          LIKE 20 BUT TRCL=5 $ upper right fuel rod
  26  0  -34  IMP:n=1 U=3 FILL=2 $ heat pipe
  c --- moderator matrix slices ---
   27  3 -4.26  36 -37 34 28   IMP:n=1 U=3 $ upper moderator matrix slice
   28  3 -4.26  37 35 34 29    IMP:n=1 U=3 $ upper left moderator matrix slice
   29  3 -4.26  -35 36 34 30   IMP:n=1 U=3 $ lower left moderator matrix slice
   30  3 -4.26  -36 37 34 31   IMP:n=1 U=3 $ lower moderator matrix slice
   31  3 -4.26  -37 -35 34 32  IMP:n=1 U=3 $ lower right moderator matrix slice
   32  3 -4.26  35 -36 34 33   IMP:n=1 U=3 $ upper right moderator matrix slice
 c --- U4: control rod ---
  40  3 -4.26  60   IMP:n=1 U=4 $ moderator surrounding control rod
  41  4 -2.52  -60  IMP:n=1 U=4 $ control rod
 c --- U5: reflector ---
  50  2 -3.01  -38:38  IMP:n=1 U=5
 c --- U6: core lattice ---
  60  0  -22 -25 -23 -26 -24 -27  IMP:n=1 U=6 LAT=2 FILL=-6:6 -6:6 0:0
      $ layout, bottom-->top
       5 5R      5 5 5 5 5 5 5            $
       5 4R     5 3 3 3 3 3 3 5           $
       5 3R    5 3 3 3 3 3 3 3 5          $
       5 2R   5 3 3 4 3 3 4 3 3 5         $
       5 1R  5 3 3 3 3 3 3 3 3 3 5        $
       5    5 3 3 3 3 3 3 3 3 3 3 5       $
           5 3 3 4 3 3 4 3 3 4 3 3 5      $
            5 3 3 3 3 3 3 3 3 3 3 5  5    $
             5 3 3 3 3 3 3 3 3 3 5   5 1R $
              5 3 3 4 3 3 4 3 3 5    5 2R $
               5 3 3 3 3 3 3 3 5     5 3R $
                5 3 3 3 3 3 3 5      5 4R $
                 5 5 5 5 5 5 5       5 5R $
       $ Note: for whatever stupid reason, the lattice surfaces (22 through 27) have to be given in a specific order.
 c --- U7: reflector cap above the core
  70  0  -43  IMP:n=1 U=7 FILL=2 $ heat pipe
  c --- reflector slices ---
   71  2 -3.01  45 -46 43   IMP:n=1 U=7 $ upper reflector matrix slice
   72  2 -3.01  46 44 43    IMP:n=1 U=7 $ upper left reflector matrix slice
   73  2 -3.01  -44 45 43   IMP:n=1 U=7 $ lower left reflector matrix slice
   74  2 -3.01  -45 46 43   IMP:n=1 U=7 $ lower reflector matrix slice
   75  2 -3.01  -46 -44 43  IMP:n=1 U=7 $ lower right reflector matrix slice
   76  2 -3.01  44 -45 43   IMP:n=1 U=7 $ upper right reflector matrix slice
 c --- U8: reflector lattice w/heat pipes above the core ---
  80  0  -22 -25 -23 -26 -24 -27  IMP:n=1 U=8 LAT=2 FILL=-6:6 -6:6 0:0
      $ layout, bottom-->top
       5 5R      5 5 5 5 5 5 5            $
       5 4R     5 7 7 7 7 7 7 5           $
       5 3R    5 7 7 7 7 7 7 7 5          $
       5 2R   5 7 7 4 7 7 4 7 7 5         $
       5 1R  5 7 7 7 7 7 7 7 7 7 5        $
       5    5 7 7 7 7 7 7 7 7 7 7 5       $
           5 7 7 4 7 7 4 7 7 4 7 7 5      $
            5 7 7 7 7 7 7 7 7 7 7 5  5    $
             5 7 7 7 7 7 7 7 7 7 5   5 1R $
              5 7 7 4 7 7 4 7 7 5    5 2R $
               5 7 7 7 7 7 7 7 5     5 3R $
                5 7 7 7 7 7 7 5      5 4R $
                 5 5 5 5 5 5 5       5 5R $
       $ Note: for whatever stupid reason, the lattice surfaces (22 through 27) have to be given in a specific order.
 c --- Actual Geometry ---
  90  0        51 -52 -54     IMP:n=1 U=0 FILL=6 $ core
  91  0        52 -53 -54     IMP:n=1 U=0 FILL=8 $ reflector vessel cap above core
  92  2 -3.01  50 -53 54 -55  IMP:n=1 U=0        $ reflector vessel walls
  93  2 -3.01  50 -51 -54     IMP:n=1 U=0        $ reflector vessel base
  94  0        55:-50:53      IMP:n=0 U=0        $ outside world
c

c === Surface Cards ===
 c --- fuel rod (ref. pos. y-axis) ---
  1 PZ             00.000 $ bottom of bottom cladding spacer
  2 PZ             00.500 $ top of bottom cladding spacer, bottom of fuel pellet stack
  3 PZ             50.500 $ top of fuel pellet stack, bottom of top cladding spacer
  4 PZ             51.000 $ top of top spacer
  5 C/Z 0 1.589288 00.410 $ radius of fuel pellet stack, inside radius of cladding, radius of cladding spacers
  6 C/Z 0 1.589288 00.575 $ outside radius of cladding
 c --- in-core heat pipe ---
  10 PZ 00.000000 $ bottom of heat pipe
  11 PZ 51.000000 $ top of heat pipe (relevant to reactor core)
  12 PZ 0.000710 $ top of heat pipe endcap
  13 CZ 0.589078 $ radius of vapor core
  14 CZ 0.701078 $ outside radius of mesh wick
  15 CZ 0.801078 $ inside radius of heat pipe container
  16 CZ 0.801788 $ outside radius of heat pipe container
 c --- fuel assembly ---
  c --- fuel assembly overall bounds ---
   20   PZ  00.0000 $ bottom of moderator matrix
   21   PZ  51.0000 $ top of moderator matrix
   22   PX  02.1997 $ right bound of moderator matrix
   23 1 PX  02.1997 $ upper right bound of moderator matrix
   24 2 PX  02.1997 $ upper left bound of moderator matrix
   25 3 PX  02.1997 $ left bound of moderator matrix
   26 4 PX  02.1997 $ lower left bound of moderator matrix
   27 5 PX  02.1997 $ lower right bound of moderator matrix
  c --- fuel rod slots ---
   28   C/Z 0 1.589288 0.575 $ upper fuel rod slot
   29 1 C/Z 0 1.589288 0.575 $ upper left fuel rod slot
   30 2 C/Z 0 1.589288 0.575 $ lower left fuel rod slot
   31 3 C/Z 0 1.589288 0.575 $ lower fuel rod slot
   32 4 C/Z 0 1.589288 0.575 $ lower right fuel rod slot
   33 5 C/Z 0 1.589288 0.575 $ upper right fuel rod slot
  34 CZ 0.801788 $ heat pipe slot
  c --- cell simplification slicing ---
   35   PY 0 $ left --> right (x-axis) slice
   36 1 PY 0 $ lower left --> upper right slice
   37 2 PY 0 $ lower right --> upper left slice
 38 PZ 999 $ dummy surface for material universes
 c --- heat pipe and reflector assembly above core ---
  c --- reflector disk overall dimensions ---
   40   PZ  51 $ bottom of reflector disk
   41   PZ  60 $ top of reflector disk
   42   CZ  24 $ radius of reflector disk
  43 CZ 0.801788 $ heat pipe slot
  c --- reflector cell simplification slicing ---
   44   PY 0 $ left --> right (x-axis) slice
   45 1 PY 0 $ lower left --> upper right slice
   46 2 PY 0 $ lower right --> upper left slice
 c --- reflector vessel ---
  50 PZ -04.00 $ bottom of reflector vessel
  51 PZ  00.00 $ bottom of inside of reflector vessel
  52 PZ  51.00 $ top of inside of reflector vessel
  53 PZ  56.00 $ top of reflector vessel
  54 CZ  24.20 $ inside radius of reflector vessel
  55 CZ  30.00 $ outside radius of reflector vessel
 c --- control rod ---
  60 CZ  1.25 $ radius of control rod
c

c === Data Cards ===
 c --- Coordinate Transformations ---
  c --- Standard Hexagon (counterclockwise) ---
   *TR1  0 0 0  060 030 90  150 060 90  90 90 0  1
   *TR2  0 0 0  120 030 90  150 120 90  90 90 0  1
   *TR3  0 0 0  180 090 90  090 180 90  90 90 0  1
   *TR4  0 0 0  120 150 90  030 120 90  90 90 0  1
   *TR5  0 0 0  060 150 90  030 060 90  90 90 0  1
 c --- Run Mode ---
  MODE n
  MPHYS OFF $ don't need it
 c --- Materials ---
  M1 $ clad (Zircaloy-4)
     $ O
      08016.70c  0.006787419800 $ no XS data for 18O --> add to 16O since XS's similar
      08017.70c  0.000002580200
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
  M2 $ reflector (BeO)
     $ O
      08016.70c  0.499810000000 $ no XS data for 18O --> add to 16O since XS's similar
      08017.70c  0.000190000000
     $ Be
      04009.70c  0.500000000000
  M3 $ moderator (YH2)
     $ Y
      39089.70c  0.333333333333
     $ H
      01001.70c  0.666590000000
      01002.70c  0.000076666667
  M4 $ control rod (B4C)
     $ B
      05010.70c  0.159200000000
      05011.70c  0.640800000000
     $ C
      06000.70c  0.200000000000
  M5 $ control rod clad (SS316LN)
     $ C
      06000.70c  -0.000300000000
     $ Mn
      25055.70c  -0.020000000000
     $ P
      15031.70c  -0.000450000000
     $ S
      16032.70c  -0.000284144116
      16033.70c  -0.000002313606
      16034.70c  -0.000013506637
      16036.70c  -0.000000033651
     $ Si
      14028.70c  -0.009186648255
      14029.70c  -0.000483362866
      14030.70c  -0.000329988419
     $ Cr
      24050.70c  -0.007095271645
      24052.70c  -0.142289005132
      24053.70c  -0.016445108007
      24054.70c  -0.004170721786
     $ Ni
      28058.70c  -0.080637180028
      28060.70c  -0.032131128768
      28061.70c  -0.001420029729
      28062.70c  -0.004601782890
      28064.70c  -0.001209779471
     $ Fe
      26054.70c  -0.036806313420
      26056.70c  -0.599153573620
      26057.70c  -0.014084559911
      26058.70c  -0.001907248097
     $ N
      07014.70c  -0.001992204133
      07015.70c  -0.000007796326
     $ Mo
      42092.70c  -0.003537272250
      42094.70c  -0.002258557333
      42095.70c  -0.003932152616
      42096.70c  -0.004168464785
      42097.70c  -0.002414064938
      42098.70c  -0.006171387897
      42100.70c  -0.002517472721
  M6 $ fuel (UN)
     $ U
      92234.70c -0.004939274223
      92235.70c -0.229723000000
      92238.70c -0.684229725777
     $ N
      07014.70c -0.080791841016
      07015.70c -0.000316158984
  M7 $ heat pipe container (Inconel 625)
     $ C
      06000.70c  0.004852000000
     $ Al
      13027.70c  0.008639000000
     $ Si
      14028.70c  0.009567214020
      14029.70c  0.000486021900
      14030.70c  0.000320764080
     $ P
      15031.70c  0.000281000000
     $ S
      16032.70c  0.000258372800
      16033.70c  0.000002040000
      16034.70c  0.000011560000
      16036.70c  0.000000027200
     $ Ti
      22046.70c  0.000401692500
      22047.70c  0.000362253600
      22048.70c  0.003589426800
      22049.70c  0.000263412900
      22050.70c  0.000252214200
     $ Cr
      24050.70c  0.010574861000
      24052.70c  0.203925668200
      24053.70c  0.023123533800
      24054.70c  0.005755937000
     $ Mn
      25055.70c  0.005303000000
     $ Fe
      26054.70c  0.003049161150
      26056.70c  0.047865309180
      26057.70c  0.001105418730
      26058.70c  0.000147110940
     $ Co
      27059.70c  0.009887000000
     $ Ni
      28058.70c  0.395963842698
      28060.70c  0.152524563302
      28061.70c  0.006630137158
      28062.70c  0.021139778490
      28064.70c  0.005383678352
     $ Nb
      41093.70c  0.023124000000
     $ Mo
      42092.70c  0.008154517000
      42094.70c  0.005095883000
      42095.70c  0.008778390000
      42096.70c  0.009209028000
      42097.70c  0.005278076000
      42098.70c  0.013355299000
      42100.70c  0.005338807000
  M8 $ heat pipe working fluid (Na)
     $ Na
      11023.70c  1
  M9 $ saturated heat pipe wick
     $ Inconel 625
      $ C
       06000.70c  -0.000847949016
      $ Al
       13027.70c  -0.003391785928
      $ Si
       14028.70c  -0.003894893035
       14029.70c  -0.000204932921
       14030.70c  -0.000139906259
      $ P
       15031.70c  -0.000126763717
      $ S
       16032.70c  -0.000120063881
       16033.70c  -0.000000977604
       16034.70c  -0.000005707171
       16036.70c  -0.000000014219
      $ Ti
       22046.70c  -0.000268631269
       22047.70c  -0.000247523857
       22048.70c  -0.002504652956
       22049.70c  -0.000187639077
       22050.70c  -0.000183320986
      $ Cr
       24050.70c  -0.007685848400
       24052.70c  -0.154132466955
       24053.70c  -0.017813920789
       24054.70c  -0.004517872883
      $ Mn
       25055.70c  -0.004239732410
      $ Fe
       26054.70c  -0.002393330123
       26056.70c  -0.038959954505
       26057.70c  -0.000915848352
       26058.70c  -0.000124018786
      $ Co
       27059.70c  -0.008478608309
      $ Ni
       28058.70c  -0.333822286327
       28060.70c  -0.133016641503
       28061.70c  -0.005878647672
       28062.70c  -0.019050488684
       28064.70c  -0.005008252382
      $ Nb
       41093.70c  -0.031262673330
      $ Mo
       42092.70c  -0.010906972946
       42094.70c  -0.006964129983
       42095.70c  -0.012124563555
       42096.70c  -0.012853218363
       42097.70c  -0.007443628625
       42098.70c  -0.019029115117
       42100.70c  -0.007762480501
     $ Na
      11023.70c  -0.143488401927
  c --- Material TSL XS Correction ---
   c MT1  u-un.40t  n-un.40t $ don't have MCNP 6.3
   c MT2  be-beo.40t  o-beo.40t $ don't have MCNP 6.3
   MT2  be/o.10t  o/be.10t
   c MT3  y-yh2.40t  h-yh2.40t $ don't have MCNP 6.3
 c --- Criticality Calculation ---
  KCODE 10000 1.0 30 120 2000 0 6500 1
  KSRC 0 2 20
 c --- Tallies ---
  FC4 Fission energy released in each mesh cell per particle simulated
  FMESH4:n ORIGIN= -30 -30 -4 GEOM=REC OUT=COL
       IMESH = 30 IINTS = 300
       JMESH = 30 JINTS = 300
       KMESH = 56 KINTS = 1
  FM4 -1 0 -6 -8 $ note: parentheses may not be used on FMESH multipliers (do not ask me why)
c