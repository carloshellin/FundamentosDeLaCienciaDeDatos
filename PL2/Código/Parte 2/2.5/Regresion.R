read.csv.conjuntos <- function(path)
{
	filenames <- list.files(path, "*.csv")
	
	conjuntos <- list()

	for (i in 1:length(filenames))
	{
		filepath = file.path(path, filenames[i])
		conjuntos[[i]] <- read.csv(filepath, header = TRUE)
	}
	
	conjuntos
}

Sxy <- function(x, y)
{
	mediax <- mediaAritmetica(x)
	mediay <- mediaAritmetica(y)
	
	mul = c()
	n = longitud(x)
	
	for (i in 1:n)
	{
		mul = c(mul, x[i] * y[i])
	}
	
	(sumatorio(mul) / n) - (mediax * mediay)
}

bRecta <- function(x, y)
{
	Sxy(x, y) / desTip(x) ^ 2
}

aRecta <- function(x, y, b)
{
	mediaAritmetica(y) - b * mediaAritmetica(x)
}

yCalculada <- function(x, a, b)
{
	yc = c()
	
	for (i in 1:longitud(x))
	{
		yc = c(yc, a + b * x[i])
	}
	
	yc
}

residuos <- function(x, y, a, b)
{
	yc = yCalculada(x, a, b)
	
	res <- c()
	for (i in 1:longitud(y))
	{
		res <- c(res, y[i] - yc[i])
	}
	
	res
}

SSR <- function(yc, yMedia)
{
	sumatorio(yc, -yMedia, 2)
}

SSy <- function(y, yMedia)
{
	sumatorio(y, -yMedia, 2)
}

Rcuadrado <- function(x, y)
{
	b <- bRecta(x, y)
	a <- aRecta(x, y, b)
	yc <- yCalculada(x, a, b)
	yMedia <- mediaAritmetica(yc)
	
	SSR(yc, yMedia) / SSy(y, yMedia)
}

Regresion <- function(x, y, d)
{
	b <- bRecta(x, y)
	a <- aRecta(x, y, b)
	res <- residuos(x, y, a, b)
	sr <- desTip(res)
	
	for(i in 1:length(res))
	{
		if (res[i] > d * sr)
		{
			print(paste0("El suceso ", i, " cuyo valor es ", round(res[i], 5), " es un suceso an?malo o outlier"))
		}
	}
}