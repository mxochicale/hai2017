#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:           readingRAZORdata.R
# FileDescription:
#
# Variables:
#     participantsNN number
#     aNN: activities
#     sNN: sensors
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
main_data_path <- paste(main_path,"/DataSets/UoBOpenDay2017/data/Razor",sep="")


# main_outcomesdata_path <- getwd()


############################################################################
###   Reading RAW Data from Participants
###

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Setting DataSets paths
setwd(main_data_path)
data_path_list <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE)

participantsNN <- 18
trialsNN <- 1
sNN <- c(1:4)

participant_index <- c(2:26)


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




    #forSTART......... sensors
    for(sNN_k in sNN )
    {


      sNN_label <- substring( (toString(   files[sNN_k]  )) , 1, last = 3)
      pNN_sNN_ <-  paste("p", participants_k, "_",sNN_label, sep="")


      if (sNN_label == 's01'){

        #read file for s01
        assign (pNN_sNN_, fread(  files[sNN_k]   , header = FALSE, sep=',') )
        # add column names
        s1tmpvar <- get(pNN_sNN_)
        setnames(s1tmpvar, c("Yaw", "Pitch", "Roll", "AccX", "AccY", "AccZ", "GyroX", "GyroY",	"GyroZ") )
        #add sample label
        s1tmpvar[,sample:=seq(.N)]
        setcolorder(s1tmpvar,c(10,1:9))
        # add s01 label to sensor
        fsNNtmp <-function(x) {list("s01")}
        s1tmpvar[,c("sensor"):=fsNNtmp(), ]
        setcolorder(s1tmpvar,c(11,1:10) )



      } else if (sNN_label == 's02'){

        #read file for s02
        assign (pNN_sNN_, fread(  files[sNN_k]   , header = FALSE, sep=',') )
        # add column names
        s2tmpvar <- get(pNN_sNN_)
        setnames(s2tmpvar, c("Yaw", "Pitch", "Roll", "AccX", "AccY", "AccZ", "GyroX", "GyroY",	"GyroZ") )
        #add sample label
        s2tmpvar[,sample:=seq(.N)]
        setcolorder(s2tmpvar,c(10,1:9))
        # add s02 label to sensor
        fsNNtmp <-function(x) {list("s02")}
        s2tmpvar[,c("sensor"):=fsNNtmp(), ]
        setcolorder(s2tmpvar,c(11,1:10) )


      } else if (sNN_label == 's03'){

        #read file for s03
        assign (pNN_sNN_, fread(  files[sNN_k]   , header = FALSE, sep=',') )
        # add column names
        s3tmpvar <- get(pNN_sNN_)
        setnames(s3tmpvar, c("Yaw", "Pitch", "Roll", "AccX", "AccY", "AccZ", "GyroX", "GyroY",	"GyroZ") )
        #add sample label
        s3tmpvar[,sample:=seq(.N)]
        setcolorder(s3tmpvar,c(10,1:9))
        # add s03 label to sensor
        fsNNtmp <-function(x) {list("s03")}
        s3tmpvar[,c("sensor"):=fsNNtmp(), ]
        setcolorder(s3tmpvar,c(11,1:10) )


      } else if (sNN_label == 's04'){


        #read file for s04
        assign (pNN_sNN_, fread(  files[sNN_k]   , header = FALSE, sep=',') )
        # add column names
        s4tmpvar <- get(pNN_sNN_)
        setnames(s4tmpvar, c("Yaw", "Pitch", "Roll", "AccX", "AccY", "AccZ", "GyroX", "GyroY",	"GyroZ") )
        #add sample label
        s4tmpvar[,sample:=seq(.N)]
        setcolorder(s4tmpvar,c(10,1:9))
        # add s04 label to sensor
        fsNNtmp <-function(x) {list("s04")}
        s4tmpvar[,c("sensor"):=fsNNtmp(), ]
        setcolorder(s4tmpvar,c(11,1:10) )
      }


    }#forEND......... sensors




    ####################################################
    ### THREE AND FOUR SENSORS
    ###

    # #forSTART......... sensors
    # for(sNN_k in sNN )
    # {
    #
    #   sNN_label <- substring( (toString(   files[sNN_k]  )) , 1, last = 3)
    #   message(sNN_label)

    #
    # }#forEND......... sensors


      if (sNN_label == 'NA'){
        ## three sensors
        message('three sensors: ', files[1:3] )
        message('NA')


      } else {
        ## four sensors
        message('four sensors: ', files[1:4] )
        pNN_sNN_tmp <- rbind(s1tmpvar,s2tmpvar,s3tmpvar,s4tmpvar)


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
        pNN_sNN_tmp[,c("participant"):=fsNNtmp(), ]
        setcolorder(pNN_sNN_tmp,c(12,1:11) )



        pNN_tmp <- rbind(pNN_tmp, pNN_sNN_tmp)

      }






}
#forEND......... to read data from participants paths



dataTable <- pNN_tmp








################################################################################
################################################################################



# dataTable <- ptNN_sNN_tmp
#
#
# setkey(dataTable, Sensor)
# dataTable <- dataTable[.(c("s02"))]
# # dataTable <- dataTable[.(c("s02","s04"))]
#
# # ################################
# # ### (4.2) Windowing Data
#
#
# #### Faster
# windowframe = 4100:4500;
# dataTable <- dataTable[,.SD[windowframe],by=.(Trial,Sensor)];
#
#
# # #### Normal
# # windowframe = 3000:3400;
# # dataTable <- dataTable[,.SD[windowframe],by=.(Trial,Sensor)];
#
#
# # #### Slow
# # windowframe = 1000:1400;
# # dataTable <- dataTable[,.SD[windowframe],by=.(Trial,Sensor)];
#



################################################################################
################################################################################
####    Plotting Data
library(ggplot2)


# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=sample,y=AccX, color=sensor))+
#   facet_grid(participant~sensor)+scale_y_continuous()+
#   coord_cartesian(xlim=NULL, ylim=c(-500,500))
# Plot

# Plot <- ggplot(dataTable)+
#   geom_line( aes(x=sample,y=AccY, color=sensor))+
#   facet_grid(participant~sensor)+scale_y_continuous()+
#   coord_cartesian(xlim=NULL, ylim=c(-500,500))
# Plot


#ISSUE: sensor01 is not displaying
Plot <- ggplot(dataTable)+  geom_line( aes(x=sample,y=AccZ, color=sensor))+
  facet_grid(participant~sensor)+scale_y_continuous()+
  coord_cartesian(xlim=NULL, ylim=c(-500,500))
Plot


# Plot <- ggplot(dataTable)+  geom_line( aes(x=sample,y=GyroX, color=sensor))+
#   facet_grid(participant~sensor)+scale_y_continuous()+
#   coord_cartesian(xlim=NULL, ylim=c(-4,4))
# Plot

# Plot <- ggplot(dataTable)+  geom_line( aes(x=sample,y=GyroY, color=sensor))+
#   facet_grid(participant~sensor)+scale_y_continuous()+
#   coord_cartesian(xlim=NULL, ylim=c(-3,3))
# Plot

# Plot <- ggplot(dataTable)+  geom_line( aes(x=sample,y=GyroZ, color=sensor))+
#   facet_grid(participant~sensor)+scale_y_continuous()+
#   coord_cartesian(xlim=NULL, ylim=c(-7,7))
# Plot


## coord_cartesian(xlim=NULL, ylim=NULL)





#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
