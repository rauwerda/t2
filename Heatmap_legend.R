#03-01-2007 Heatmap legend generating script. Version 1.  Author: Oskar Bruning, bruning@science.uva.nl#

#This script assumes a symmetrical color distribution!!!#

#edit here################
experiment.name="your.name"

#Info for the color range. Use rgb() for RGB values, hexadecimal codes or colornames (see colors())#
#First (low) color#
Color.Low =

#Second (middle) color#
Color.Mid =

#Last (high) color#
Color.High =

#info about the datarange
min.value =
max.value =

#image orientation#
legend.horizontal = TRUE or FALSE

#no editting needed below########

#needed libraries#
library(gplots)

#making the colorpalette#
mypalette<-colorpanel(1024,Color.Low,Color.Mid,Color.High)

#making a horizontal or vertical image#
if (legend.horizontal) {
 pdf(paste(experiment.name, "_heatmap_legend.pdf", sep=""),width=10,height=1)
 par(mar=c(3,1,1,1))
 image(x = seq(min.value,max.value,length=1024), y = 1, z = matrix(seq(min.value,max.value,length=1024),ncol=1), yaxt = "n", col=mypalette, ylab="", xlab="")
}else {
 pdf(paste(experiment.name, "_heatmap_legend.pdf", sep=""),width=1,height=10)
 par(mar=c(1,3,1,1))
 image(x = 1, y = seq(min.value,max.value,length=1024), z = t(matrix(seq(min.value,max.value,length=1024),ncol=1)), xaxt = "n", col=mypalette, ylab="", xlab="", las=1)
}
graphics.off()
