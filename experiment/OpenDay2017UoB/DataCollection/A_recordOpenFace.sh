#!/bin/sh
PARTICIPANT_NN=$1
#echo "PARTICIPANT_NN is: $PARTICIPANT_NN"
MAIN_PATH_EXPERIMENT='OpenDay'

## Create Path
cd ~/OpenFace/build/bin
mkdir -p $MAIN_PATH_EXPERIMENT && cd $MAIN_PATH_EXPERIMENT && mkdir -p $PARTICIPANT_NN  && cd $PARTICIPANT_NN

## Record Video at previous PATH
../.././Record   #[Q to exit]
