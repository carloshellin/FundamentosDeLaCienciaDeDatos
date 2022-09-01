intervaloCyB <- function(x, d)
{
	cuar1r <- cuantil(x, 0.25)
	cuar3r <- cuantil(x, 0.75)
	
	c(cuar1r - d * (cuar3r - cuar1r), cuar3r + d * (cuar3r - cuar1r))
}

CajayBigotes <- function(x, d)
{
	int = intervaloCyB(x, d)
	
	mostrarOutlier(x, int)
}