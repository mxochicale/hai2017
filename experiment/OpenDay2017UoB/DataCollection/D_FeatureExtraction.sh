#!/bin/sh
PARTICIPANT_NN=$1
#echo "PARTICIPANT_NN is: $PARTICIPANT_NN"
MAIN_PATH_EXPERIMENT='OpenDay'

cd ~/OpenFace/build/bin/$MAIN_PATH_EXPERIMENT/$PARTICIPANT_NN

../.././FeatureExtraction -rigid -verbose -f ../../$MAIN_PATH_EXPERIMENT/$PARTICIPANT_NN/out.avi -of "default.txt" -simalign ../../$MAIN_PATH_EXPERIMENT/$PARTICIPANT_NN/aligned
