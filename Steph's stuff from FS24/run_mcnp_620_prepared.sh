#!/bin/bash

# set proper environment variables
MCNPBASE="$PWD/MCNP_Installation"
export DATAPATH="$MCNPBASE/MCNP_DATA"
export ISCDATA="$MCNPBASE/MCNP_CODE/MCNP620/Utilities/ISC/Data"
MCNPPATH="$MCNPBASE/MCNP_CODE/bin"
export PATH="$MCNPPATH:$PATH"
if [ "$DISPLAY" == "" ]; then
    export DISPLAY=0.0
fi

# name specification
NAME="pet_project"
PARENTFOLDER="NE4253"
FOLDERNAME="Pet_Project"
#location specification
SIMULATIONFOLDER="$PWD/MCNP_Simulations"
LOCATION="$SIMULATIONFOLDER/$PARENTFOLDER/$FOLDERNAME"

# file specification
    # main files
    INPUT="$LOCATION/$NAME.i"
    OUTPUT="$LOCATION/$NAME.o"
    RUNTPE="$LOCATION/$NAME.runtpe"
    # auxilary/optional
    SOURCE="$LOCATION/$NAME.s"
    COMOUT="$LOCATION/$NAME.comout"
    SRCTP="$LOCATION/$NAME.srctp"
    MESHTAL="$LOCATION/$NAME.meshtal"
    MDATA="$LOCATION/$NAME.mdata"

# run specification
THREADS="6" # laptop has 4, desktop has 8
mcnp6 ip inp=$INPUT outp=$OUTPUT s=$SOURCE runtpe=$RUNTPE comout=$COMOUT srctp=$SRCTP meshtal=$MESHTAL mdata=$MDATA #tasks $THREADS

# optional file clearing
echo -n 'Delete output files? (y/n):'
read INPUT
if [ "$INPUT" == "y" ]; then
    rm -f $OUTPUT $RUNTPE $SOURCE $COMOUT $SRCTP $MESHTAL $MDATA
fi

# additional
