# 
# name        : plot.pca.R
# author      : Wim de Leeuw
# description : Plot pca plots all combinations of first 3 axis of the PCA
#               and the Proportion of Variance for the first 20 pricipal 
#               components in a 2 by 2 layout.
# inputs      :
#    dPCA   : the result of "prcomp"
#    tags   : list of labels for the points in the plot
#    colors : list of colors for the points in the plot
#
# example usage: 
# source("/data1/projectsdata/scripts/plot.pca.R")
# plot.pca(prcomp(t(My.matrix)))
#


plot.pca<- function(dPCA,tags="",col.list = "blue",markers =20)
{
	# Simple annotated scatterplot 
	pca.scatter <-function(x,y,labx,laby,char,colors,mark)
	{
		normal <- 1.0
		par(mar=c(4,4,1,1))
		plot(x,y,pch=mark,col=colors,xlab=labx,ylab=laby,
		  cex=normal, cex.main=normal, 
		  cex.axis=normal, cex.lab=normal)
		text(x,y,char,col="gray30",pos=4,cex=normal,offset=0.5*normal)
	}
	alab <- paste("PC",1:3,sep="");
	par(mfrow=c(2,2))
	pca.scatter(dPCA$x[,1],dPCA$x[,2],alab[1],alab[2],tags,col.list,markers);
	pca.scatter(dPCA$x[,3],dPCA$x[,2],alab[3],alab[2],tags,col.list,markers);
	pca.scatter(dPCA$x[,1],dPCA$x[,3],alab[1],alab[3],tags,col.list,markers);
	len = min(20,length(as.vector((summary(dPCA))[6][[1]][2,])))
	barplot(summary(dPCA)$importance[2,][1:len],ylab="Proportion of variance")
}

