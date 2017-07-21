##################################################
#
#
#
# Miguel P Xochicale <http://mxochicale.github.io/>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2018)
#

library(data.table)
library(ggplot2)
library(fNonlinear)
library(plot3D)



# times <- seq(0, 100, by = 0.001)
tn <- seq(0, 100, by = 0.01)
NN <- length(tn)


## 3D
## Lorenz Attractor
lspace <- lorentzSim(
times = tn,
parms = c(sigma = 16, r = 45.92, b = 4),
start = c(-14, -13, 47),
doplot = FALSE
)

lspace <- as.data.table(lspace)


fsNNtmp <-function(x) {list("Lorenz")}
lspace[,c("type"):=fsNNtmp(), ]
setcolorder(lspace, c(5,1:4))



################################
### (4.2) Windowing Data
windowframe = 750:1000
lspace <- lspace[,.SD[windowframe]]



# ################################################################################
# # Plotting time series
plotting <- ggplot(lspace) +
   geom_line(aes(x=t,y=x, col=type),lwd = 3,alpha=0.7)+
   facet_wrap(~type, scales = 'free', nrow = 4)+
   labs( x = 'time', y='x(t)' )+
   theme(axis.text=element_text(size=20),
         axis.title=element_text(size=25))+
   theme(legend.position="none")+
   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
  panel.background = element_blank(), axis.line = element_line(colour = "black"))


png(filename="B.png",
 type="cairo",
 width = 500, height = 300, units = "px",
 pointsize=50,
 res=75,
 bg = "transparent"
 )

plot(plotting)

dev.off()
