#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# Description:
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
main_rcode_path <- getwd()
setwd("../")
setwd("../")
main_path <- getwd()


# r_scripts_path <- paste(main_path,"/code/",sep="")
main_data_path <- paste(main_path,"/DataSets/UoBOpenDay2017/data/OpenFace",sep="")

## Results Path
results_path <- paste(main_path,"/hai2017/article/latex/figures/results",sep="")





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


startWF <- 700
stopWF <- 1300
WindowFrame <- startWF:stopWF
WindowLength <- stopWF-startWF
dataTable <- dataTable[,.SD[WindowFrame],by=.(participant,trial)];
dataTable <- dataTable[,c(16:433):=NULL] # remove columns



# centering the data
dataTable[,
  c(
    'cgaze_0_x', 'cgaze_0_y', 'cgaze_0_z', 'cgaze_1_x', 'cgaze_1_y',
    'cgaze_1_z', 'cpose_Tx', 'cpose_Ty', 'cpose_Tz'
  )
  :=lapply(.(
    gaze_0_x, gaze_0_y, gaze_0_z, gaze_1_x, gaze_1_y,
    gaze_1_z, pose_Tx, pose_Ty, pose_Tz
    ), scale, center=T, scale=T )
]


################################################################################
### (4.2) Smoothing data with Savitzky-Golay Filter
###
library(signal)# for butterworth filter and sgolay
SavitzkyGolayCoeffs <- sgolay(p=5,n=111 ,m=0)
# SavitzkyGolayCoeffs <- sgolay(p=5,n=155 ,m=0)
# SavitzkyGolayCoeffs <- sgolay(p=5,n=201 ,m=0)

### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}


dataTable[,c('SGcgaze_0_x', 'SGcgaze_0_y', 'SGcgaze_0_z', 'SGcgaze_1_x',
'SGcgaze_1_y', 'SGcgaze_1_z', 'SGcpose_Tx', 'SGcpose_Ty', 'SGcpose_Tz') :=
       lapply(.(
         cgaze_0_x, cgaze_0_y, cgaze_0_z, cgaze_1_x, cgaze_1_y,
         cgaze_1_z, cpose_Tx, cpose_Ty, cpose_Tz ),
         function(x) ( SGolay(x,SavitzkyGolayCoeffs) )
              )
         ]



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
####    Plotting
library(ggplot2)


##Change path to save plots
setwd(results_path)

#################
# Plots Features
sensortag <- 'plot'
plotlinewidtg <- 2
image_width <- 1208
image_height <- 2480
image_dpi <- 300
image_bg <- "transparent"


# ##Confidence
# Plot <- ggplot(dataTable)+geom_line( aes(x=frame,y=confidence, color=trial), size=1.5)+facet_grid(participant~trial);Plot

# ##Success
# Plot <- ggplot(dataTable)+geom_line( aes(x=frame,y=success, color=trial), size=1.5)+facet_grid(participant~trial);Plot

## Pose estimation with respect to the camera
Plot <- ggplot(dataTable)+
  geom_line( aes(x=frame,y=SGcpose_Tx, color='blue'), size=plotlinewidtg, alpha=0.75)+
  scale_color_manual(labels = c("Tx"), values = c("blue")) +
  # coord_cartesian(xlim=NULL, ylim=c(-100,100))+
  coord_cartesian(xlim=NULL, ylim=c(-4,4))+
  facet_grid(participant~trial)+
  theme(legend.position='none')

# dev.new(xpos=0,ypos=0,width=4, height=12)
# Plot


################################################################################
# (3) Creating and Changing to Feature Data Path
#
newpath <- paste(results_path,'/OpenFace/timeseries' ,sep='')
if (file.exists(newpath)){
    setwd(file.path(newpath))
} else {
  dir.create(newpath, recursive=TRUE)
  setwd(file.path(newpath))
}


png(filename= paste("SGcposeTx.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
Plot
dev.off()






################################################################################
################################################################################
####    State Space Reconstruction
source('~/mxochicale/github/r-code_repository/functions/ollin_cencah.R')

################################################################################
# (2) Reading Embedding Parameters
setwd( paste(main_rcode_path,"/embedding_parameters",sep="")  )
EMP <- fread("EmbeddedParameters.dt", header=TRUE)

################################################################################
# (3) Creating and Changing Plot Data Path
#
newpath <- paste(results_path,'/OpenFace/dynamic_invariants' ,sep='')
if (file.exists(newpath)){
    setwd(file.path(newpath))
} else {
  dir.create(newpath, recursive=TRUE)
  setwd(file.path(newpath))
}


selected_participant_number <- c('p01','p02','p03','p04','p05','p06','p07','p08','p09', 'p10',
                                 'p11','p12','p13','p14','p15','p16','p17','p18')

plotlinewidtg <- 0.7
image_width <- 3508
image_height <- 2480
image_dpi <- 300



# #for plotRSS3D2D(RSS)
# image_height_4ssr <- 1080
# image_width_4ssr <- 3508

#for plotRSS2D(RSS)
image_height_4ssr <- 1080
image_width_4ssr <- 1080

image_bg <- "transparent" #image_bg <- "white" #


ED <- data.table()

###[for pNN_k]##################################################################
for(pNN_k in 1:(length(selected_participant_number)) )
{
message("+++Participant number: ", selected_participant_number[pNN_k])
setkey(dataTable, participant)
temp <- dataTable[.(c(selected_participant_number[pNN_k]))]
# timeserie <- temp$pose_Tx
# timeserie <- temp$SGpose_Tx
timeserie <- temp$SGcpose_Tx



# dimension_k <- EMP$min_m[pNN_k]
# delay_k <- EMP$min_tau[pNN_k]


dimension_k <- c(100)# c(60)# c(10,20,30,40)
delay_k <- c(4)#c(5)#c(1,2,3,4,5)


ed <- data.table()
######State Space Reconstruction [for(dim_i... and for(tau_j...]################
        for (dim_i in (1:500)[dimension_k]){
            for (tau_j in (1:500)[delay_k]){

            message('        State Space Reconstruction.  ', 'dimension: ', dim_i, ' delay: ', tau_j)
            temp_takens <- Takens_Theorem(  timeserie,   dim_i,tau_j,1)
            RSS <- PCA( temp_takens ,0)

            # ###### RSS[[5]] Percentage of Variance
            # tmpPoV <- as.data.table(RSS[[5]])
            # setnames(tmpPoV, 'V1', 'PoV')
            #
            # ##### RSS[[5]] PC
            # tmpPC <- as.data.table( t( RSS[[1]] ) )
            # tmpPC[,n:=seq(.N)]
            # names(tmpPC) <- gsub("V", "PC", names(tmpPC))


            filenameimage <- paste(selected_participant_number[pNN_k], "_m",formatC(dim_i,digits=2,flag="0"),"t",formatC(tau_j,digits=1,flag="0"), '_WL', WindowLength ,".png",sep="")
            png(filenameimage,
                 width=image_width_4ssr, height=image_height_4ssr, units="px", res=image_dpi, bg=image_bg)
            # plotRSS3D2D(RSS)
            # plotRSS2D(RSS, 0.3)
            plotRSS2D_rotateddata(RSS, 10)
            dev.off()

            ## Euclidean Distances
            ed <- as.data.table(euclidean.distances_rotateddata(RSS))
            fpNN <- function(x) {list( selected_participant_number[pNN_k] )}
            ed[,c("Participant"):= fpNN(), ]


        }
      }
######State Space Reconstruction [for(dim_i... and for(tau_j...]################



ED <- rbind(ED,ed)


}
###[for pNN_k]##################################################################


names(ED) <- gsub("V1", "EuclideanDistances", names(ED))
setcolorder( ED, c(2,1) )







################################################################################
# (3) Creating and Changing Plot Data Path
#
newpath <- paste(results_path,'/OpenFace/errorbars' ,sep='')
if (file.exists(newpath)){
    setwd(file.path(newpath))
} else {
  dir.create(newpath, recursive=TRUE)
  setwd(file.path(newpath))
}


#################
# Plots Features
image_width <- 3508
image_height <- 1000 #image_height <- 2480
image_dpi <- 300
image_bg <- "transparent"



p.box <-  ggplot(ED, aes(x=Participant, y=EuclideanDistances) )+
          geom_point(aes(fill=Participant),
                    alpha=0.9,
                    size=0.5,
                    shape=21,
                    position=position_jitter(width=0.25, height=0)  )+
         geom_boxplot(lwd=0.5,outlier.colour=NA, fill=NA)+
         labs(x= "Participant", y="")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
         coord_cartesian( ylim=c(0,10) )+
        theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain"),
              axis.text.y = element_text(colour="grey20",size=16,angle=0,hjust=.5,vjust=.5,face="plain"),
              axis.title.x = element_text(colour="grey20",size=18,angle=0,hjust=.5,vjust=.5,face="plain")
              )


png(filename= paste("errorbar.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
p.box
dev.off()



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
