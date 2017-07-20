Data Collection
---



# OpenFace OpenDayOne

```
cd ~/OpenFace/build/bin
mkdir -p OpenDay && cd OpenDay
```

## ./A_recordOpenFace.sh pNNtNNgMFaNN

```
cd ~/mxochicale/github/draft_manuscripts/HRI2018/experiment/OpenDay2017UoB/DataCollection
```
chmod +x A_recordOpenFace.sh

./A_recordOpenFace.sh pNNtNNgMFaNN




## ./B_FaceLandmarkVideo.sh pNNtNNgMFaNN
```
cd ~/mxochicale/github/draft_manuscripts/HRI2018/experiment/OpenDay2017UoB/DataCollection
```
chmod +x B_FaceLandmarkVideo.sh


./B_FaceLandmarkVideo.sh pNNtNNgMFaNN




## ./C_playOpenFace.sh pNNtNNgMFaNN
```
cd ~/mxochicale/github/draft_manuscripts/HRI2018/experiment/OpenDay2017UoB/DataCollection
```
chmod +x C_playOpenFace.sh

./C_playOpenFace.sh pNNtNNgMFaNN




## ./D_FeatureExtraction.sh pNNtNNgMFaNN
```
cd ~/mxochicale/github/draft_manuscripts/HRI2018/experiment/OpenDay2017UoB/DataCollection
```
chmod +x D_FeatureExtraction.sh


./D_FeatureExtraction.sh pNNtNNgMFaNN




# RAZOR

1. turn on sensors

2. bind rfcomm ports

cd ~/mxochicale/github/ros/bluetooth_dev_conf/automatic_connection/
./bind_four_automatic_connection_ubuntu1604.sh
WAIT for the a one second LED to turn off


3. ros razor_imu_9dof number_of_samples: XXXX at "razorX.yaml"

cd ~/mxochicale/github/ros/mx_razor_imu_9dof/catkin_ws/razor_imu_9dof/config/
number_of_samples: 2000 # for 40 seconds of data

gedit razor*.yaml


update ~/catkin_ws/src/razor_imu_9dof

```
cd ~/catkin_ws/src/razor_imu_9dof && cp -r ~/mxochicale/github/ros/mx_razor_imu_9dof/catkin_ws/razor_imu_9dof/* .
```

```
cd ~/catkin_ws/ && catkin_make
```

4.  roslaunch
cd ~/catkin_ws/src/razor_imu_9dof/data_path_storage

```
roslaunch razor_imu_9dof razor-pub-four-imus.launch
```
stop
CTRL-C




5. release rfcomm and turn off sensors

./release_four_automatic_connection_ubuntu1604.sh

# NAO

turn on NAO and wait until it say unakmuk (It takes around 2 minutes and 16 seconds).


```
cd ~/mxochicale/github/nao/examples/exporting_animations_to_python/python_scripts
sleep 15 && ./TenUpperArmMovements_FRAME_SEP_30.py
```


# GENERAL INSTRUCTIONS

0. Set Participant Data: pNNtNNgMFaNN
1. turn on sensors
2. bind sensors
  ```
  ./bind_four_automatic_connection_ubuntu1604.sh && sleep 15
  ```
3. Record video
  ```
  ./A_recordOpenFace.sh pNNtNNgMFaNN
  ```
4.  NAO movements
  ```
  sleep 15 && ./TenUpperArmMovements_FRAME_SEP_30.py
  ```
5. IMU data
  ```
  roslaunch razor_imu_9dof razor-pub-four-imus.launch
  ```
6. Exit
  [CTRL-C to exit]
  [Q key to exit in video window]
  release sensor
  turn off sensors


# TODO
* Create a common path to save the data for the camera and the IMUS


# OBSERVATIONS


### Extras

  * Estimate the age of the participants.
  * NAO can perform the movevemtns with music and with no music
    to see an emotianal effect in both the face and in the movements
  * Particiapnts sometimes block the camera with their hands and they look and speak
  to different places while interaction with the robot which is a challenges
  for the head pose estimation and the facial landmarks.
  * By looking the vidoes I observe that some particpants did not follow well the
  movements of the robot.
  * a particpant with black skin had a problem to get the facial landmakrs 


### DATA COLLECTION
* Regarding the razor collection, not all the data from four sensors were collected.
Apparently, there were problems with the communication to which I need to investigate
more about the desconnection of sensors.

* On other hand, data from Openface and razor should be syncrhonirse which is a real
problem that I am thinking that I can plot data from a participant whihc data all
the data is avaibale and one who follows well the rotots


### NAO
  NAO was on from 9h00 to 16h00 (6 hours) for two days
