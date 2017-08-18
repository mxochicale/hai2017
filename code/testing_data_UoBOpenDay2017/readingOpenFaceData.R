#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:           readingOpenFaceData.R
# FileDescription:
#
# Variables:
#
# NOTE:
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#################
# Start the clock!
start.time <- Sys.time()



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
options(digits=15)



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()


setwd("../")
setwd("../")
setwd("../")
main_path <- getwd()

# r_scripts_path <- paste(main_path,"/code/",sep="")
main_data_path <- paste(main_path,"/DataSets/UoBOpenDay2017/data/OpenFace",sep="")



############################################################################
###   Reading RAW Data from Participants
###

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Setting DataSets paths
setwd(main_data_path)
data_path_list <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE)


participantsNN <- 18
trialsNN <- 0
participant_index <- c(2,4,6,8,10, 12,14,16,18,20,  22,24,26,28,30,   32,34,36,38,40,   42,44,46,48,50 )


pNN_tmp  <- NULL ## initialise variable
pNN_tNN_tmp  <- NULL ## initialise variable


#forSTART......... to read data from participants paths
for(participants_k in 1:participantsNN)
{


    participant_NN_path <-  substring( (toString(data_path_list[ participant_index[participants_k] ])) , 2, last = 1000000L)
    full_participant_NN_path <- paste(main_data_path, participant_NN_path, "/",sep="")
    message(' PATH for PARTICIPANT ', participants_k, '  = ', full_participant_NN_path )
    setwd( full_participant_NN_path )

    details = file.info(list.files(pattern=""))
    files = rownames(details)


    # Particpant Number
    pNN_ <-  paste("p", participants_k, sep="")
    assign (pNN_, fread(  files[2] , header = TRUE, sep=',') )
    temp <- get(pNN_)


    #### adding participant tags to each data.table
    if (participants_k == 1){
    fsNNtmp <-function(x) {list("p01")}
    } else if (participants_k == 2){
    fsNNtmp <-function(x) {list("p02")}
    } else if (participants_k == 3){
    fsNNtmp <-function(x) {list("p03")}
    } else if (participants_k == 4){
    fsNNtmp <-function(x) {list("p04")}
    } else if (participants_k == 5){
    fsNNtmp <-function(x) {list("p05")}
    } else if (participants_k == 6){
    fsNNtmp <-function(x) {list("p06")}
    } else if (participants_k == 7){
    fsNNtmp <-function(x) {list("p07")}
    } else if (participants_k == 8){
    fsNNtmp <-function(x) {list("p08")}
    } else if (participants_k == 9){
    fsNNtmp <-function(x) {list("p09")}
    } else if (participants_k == 10){
    fsNNtmp <-function(x) {list("p10")}
    } else if (participants_k == 11){
    fsNNtmp <-function(x) {list("p11")}
    } else if (participants_k == 12){
    fsNNtmp <-function(x) {list("p12")}
    } else if (participants_k == 13){
    fsNNtmp <-function(x) {list("p13")}
    } else if (participants_k == 14){
    fsNNtmp <-function(x) {list("p14")}
    } else if (participants_k == 15){
    fsNNtmp <-function(x) {list("p15")}
    } else if (participants_k == 16){
    fsNNtmp <-function(x) {list("p16")}
    } else if (participants_k == 17){
    fsNNtmp <-function(x) {list("p17")}
    } else if (participants_k == 18){
    fsNNtmp <-function(x) {list("p18")}
    } else if (participants_k == 19){
    fsNNtmp <-function(x) {list("p19")}
    } else if (participants_k == 20){
    fsNNtmp <-function(x) {list("p20")}
    } else if (participants_k == 21){
    fsNNtmp <-function(x) {list("p21")}
    } else if (participants_k == 22){
    fsNNtmp <-function(x) {list("p22")}
    } else if (participants_k == 23){
    fsNNtmp <-function(x) {list("p23")}
    } else if (participants_k == 24){
    fsNNtmp <-function(x) {list("p24")}
    } else if (participants_k == 25){
    fsNNtmp <-function(x) {list("p25")}
    }
    temp[,c("participant"):=fsNNtmp(), ]
    setcolorder(temp,c(432,1:431) )




        #forSTART...trials
        for(trial_k in 1:trialsNN )
        {

           #### adding trial tags to each data.table
           if (trial_k == 1){
           fsNNtmp <-function(x) {list("t01")}
           } else if (trial_k == 2){
           fsNNtmp <-function(x) {list("t02")}
           } else if (trial_k == 3){
           fsNNtmp <-function(x) {list("t03")}
           } else if (trial_k == 4){
           fsNNtmp <-function(x) {list("t04")}
           } else if (trial_k == 5){
           fsNNtmp <-function(x) {list("t05")}
           } else if (trial_k == 6){
           fsNNtmp <-function(x) {list("t06")}
           }
           temp[,c("trial"):=fsNNtmp(), ]
           setcolorder(temp,c(1,433,2:432) )

           pNN_tmp <- rbind(pNN_tmp, temp)
        }
        #forEND...trials



}
#forEND......... to read data from participants paths



##### dataTable
dataTable <- pNN_tmp




################################
### (4.1) Windowing Data [xdata[,.SD[1:2],by=.(Participant,Activity,Sensor)]]

windowframe = 800:1200;
dataTable <- dataTable[,.SD[windowframe],by=.(participant,trial)];





# > colnames(dataTable)
#   "participant" "trial"


##BASIC
# "frame" the number of the frame processed
# "timestamp" the timer of video being processed in seconds
# "confidence" how confident is the tracker in current landmark detection estimage
# "success" is the track successful (is there a face in the frame or do we think we tracked it well)
##GAZE
#   "gaze_0_x"    "gaze_0_y"    "gaze_0_z"
#   "gaze_1_x"    "gaze_1_y"    "gaze_1_z"
##POSE
#  * "pose_Tx"     "pose_Ty"     "pose_Tz"
#     the location of the head with respect to camera in millimetre (positive Z is away from the camera)
#  * "pose_Rx"     "pose_Ry"     "pose_Rz"
#     Rotation is in radians around X,Y,Z axes with the convention R = Rx * Ry * Rz,
#     left-handed positive sign. The rotation can be either in world or camera coordinates
#     (for visualisation we want rotation with respect to world coordinates)





################################################################################
################################################################################
####    Plotting confidence vs frame
library(ggplot2)


##Change path to save plots
setwd(r_scripts_path) ## go back to the r-script source path


#################
# Plots Features
sensortag <- 'plot'
plotlinewidtg <- 0.7
image_width <- 1208
image_height <- 2480
image_dpi <- 300
image_bg <- "transparent"


# ##Confidence
# Plot <- ggplot(dataTable)+geom_line( aes(x=frame,y=confidence, color=trial), size=1.5)+facet_grid(participant~trial);Plot

# ##Success
# Plot <- ggplot(dataTable)+geom_line( aes(x=frame,y=success, color=trial), size=1.5)+facet_grid(participant~trial);Plot




# Plot <- ggplot(dataTable)+geom_line( aes(x=frame,y=pose_Tx, color=trial), size=1.5)+facet_grid(participant~trial);Plot

# ## Gaze 1
# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=frame,y=gaze_1_x, color='red'), size=1)+
#   geom_line( aes(x=frame,y=gaze_1_y, color='blue'), size=1)+
#   geom_line( aes(x=frame,y=gaze_1_z, color='green'), size=1)+
#   facet_grid(participant~trial);Plot


# ## Gaze 0
# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=frame,y=gaze_0_x, color='red'), size=1)+
#   geom_line( aes(x=frame,y=gaze_0_y, color='blue'), size=1)+
#   geom_line( aes(x=frame,y=gaze_0_z, color='green'), size=1)+
#   facet_grid(participant~trial);Plot


## Pose estimation with respect to the camera

Plot <- ggplot(dataTable)+
  geom_line( aes(x=frame,y=pose_Tx, color='blue'), size=2)+
  scale_color_manual(labels = c("Tx"), values = c("blue")) +
  coord_cartesian(xlim=NULL, ylim=c(-150,150))+
  facet_grid(participant~trial);

png(filename= paste("Tx.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
Plot
dev.off()



# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=frame,y=pose_Tz, color='green2'), size=1)+
#   scale_color_manual(labels = c("Tz"), values = c("green2")) +
#   coord_cartesian(xlim=NULL, ylim=NULL )+
#   facet_grid(participant~trial);Plot

# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=frame,y=pose_Tx, color='red2'), size=1)+
#   geom_line( aes(x=frame,y=pose_Ty, color='blue2'), size=1)+
#   scale_color_manual(labels = c("Tx", "Ty"), values = c("red2", "blue2")) +
#   coord_cartesian(xlim=NULL, ylim=c(-150,150))+
#   facet_grid(participant~trial);Plot




# ## Pose estimation, rotations around x,y,z axes
# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=frame,y=pose_Rx, color='red'), size=1)+
#   geom_line( aes(x=frame,y=pose_Ry, color='blue'), size=1)+
#   geom_line( aes(x=frame,y=pose_Rz, color='green'), size=1)+
#   coord_cartesian(xlim=c(500,1500), ylim=c(-0.5,0.5))+
#   scale_color_manual(labels = c("Rx", "Ry", 'Rz'), values = c("red", "blue", "green")) +
#   facet_grid(participant~trial);Plot



# scale_fill_manual(name="AXIS", labels=c("Rx", "Ry", "Rz"))+
  # coord_cartesian(xlim=NULL, ylim=c(-3,3))+





#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
