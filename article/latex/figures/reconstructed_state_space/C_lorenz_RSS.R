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
require(tseriesChaos)




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


################################################################################
# Emdedding


xinput <- lspace$x
xyz <- embedd(xinput, m=3, d=5)
emdedding <- as.data.table(xyz)


emdedding[,Sample:=seq(.N)]
setcolorder(emdedding,c(4,1:3))
colnames(emdedding)[2:4] <- c("xt1", "xt2", "xt3")



# ################################################################################
# # Plotting State Spaces
#

png(filename="C.png",
  type="cairo",
  width = 1000, height = 1000, units = "px",
  pointsize=25,
  res=75
  )

        #  bg = "white",  res = NA, ...,
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
        #

scatter3D(
  emdedding$xt1, emdedding$xt2, emdedding$xt3, colvar = emdedding$Sample, bty = "u", type = "l", lwd=12,
	axis.scales = TRUE,
	# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
  main = "",
  xlab = '', ylab ='', zlab = '',
  # xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
  # colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
  colkey = FALSE
  )




dev.off()
