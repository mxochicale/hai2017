#!/bin/sh
PARTICIPANT_NN=$1
#echo "PARTICIPANT_NN is: $PARTICIPANT_NN"
MAIN_PATH_EXPERIMENT='OpenDay'

cd ~/OpenFace/build/bin/$MAIN_PATH_EXPERIMENT/$PARTICIPANT_NN

## Play and Exit video with VLC
cvlc --play-and-exit flvid.avi
