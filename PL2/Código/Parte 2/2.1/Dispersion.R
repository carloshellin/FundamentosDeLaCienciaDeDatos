intervaloDT <- function(x, d)
{
	media <- mediaAritmetica(x)
	sd <- desTip(x)
	
	c(media - d * sd, media + d * sd)
}

DesviacionTipica <- function(x, d)
{
	int = intervaloDT(x, d)
	
	mostrarOutlier(x, int)
}