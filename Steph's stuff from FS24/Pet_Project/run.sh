#!/bin/bash

# set proper environment variables
MCNPBASE="$PWD/../../../MCNP_Installation" # needs to be manually set
export DATAPATH="$MCNPBASE/MCNP_DATA"
export ISCDATA="$MCNPBASE/MCNP_CODE/MCNP620/Utilities/ISC/Data"
MCNPPATH="$MCNPBASE/MCNP_CODE/bin"
export PATH="$MCNPPATH:$PATH"
if [ "$DISPLAY" == "" ]; then
    export DISPLAY=0.0
fi

# file specifications, need to be manually set
NAME="pet_project"
LOCATION="$PWD"
OUTPUTFOLDER="$PWD/outputs"

# MCNP I/O specification
    # main files
    INPUT="$LOCATION/$NAME.i"
    OUTPUT="$OUTPUTFOLDER/$NAME.o"
    RUNTPE="$OUTPUTFOLDER/$NAME.runtpe"
    # auxilary/optional
    SOURCE="$OUTPUTFOLDER/$NAME.s"
    COMOUT="$OUTPUTFOLDER/$NAME.comout"
    SRCTP="$OUTPUTFOLDER/$NAME.srctp"
    MESHTAL="$OUTPUTFOLDER/$NAME.meshtal"
    MDATA="$OUTPUTFOLDER/$NAME.mdata"
RUNFILES="inp=$INPUT outp=$OUTPUT s=$SOURCE runtpe=$RUNTPE comout=$COMOUT srctp=$SRCTP meshtal=$MESHTAL mdata=$MDATA"

# mcnp run function
function run_mcnp(){ # 1:RUNOPTIONS 2:RUNFILES 3:THREADS
    mcnp6 $1 $2 tasks $3
}

# file clearing function
file_clearing(){
    echo "Selected directory: $1"
    echo -n 'Delete any files? (y/n):'
    read INPUT
    if [ "$INPUT" == "y" ]; then
        echo -n 'Which files? (o/s/runtpe/comout/srctp/meshtal/mdata/all): '
        read INPUT
        case "$INPUT" in
            "o")
                rm -f $1/*.o
                ;;
            "s")
                rm -f $1/*.s
                ;;
            "runtpe")
                rm -f $1/*.runtpe
                ;;
            "comout")
                rm -f $1/*.comout
                ;;
            "srctp")
                rm -f $1/*.srctp
                ;;
            "meshtal")
                rm -f $1/*.meshtal
                ;;
            "all")
                rm -f $1/*.o $1/*.s $1/*.runtpe $1/*.comout $1/*.srctp $1/*.meshtal $1/*.mdata
                ;;
            *)
                echo 'Invalid input.'
        esac
    fi

    echo
}

while true; do
    echo 'MCNP Actions:'
    echo '-------'
    echo 'z      : Enter plotter mode for tallies'
    echo 'ip     : Plot and debug input file'
    echo 'i      : Debug input file without plotting'
    echo 'run    : Run file normally'
    echo
    echo 'Misc Actions:'
    echo '-------'
    echo 'del    : Delete files'
    echo 'analys : Run analysis script'
    echo 'quit   : Quit'
    echo
    echo -n 'Input: '
    
    read INPUT
    echo
    case "$INPUT" in
        "z")
            run_mcnp "z" "$RUNFILES" "1"
            ;;
        "ip")
            run_mcnp "ip" "$RUNFILES" $(($(nproc) - 1))
            ;;
        "i")
            run_mcnp "i" "$RUNFILES" $(($(nproc) - 1))
            ;;
        "run")
            run_mcnp "" "$RUNFILES" $(($(nproc) - 1))
            ;;
        "del")
            file_clearing $OUTPUTFOLDER
            ;;
        "analys")
            python3 $PWD/analysis.py
            ;;
        "quit")
            break
            ;;
        *)
            echo 'Invalid input.'
        esac
    echo
done