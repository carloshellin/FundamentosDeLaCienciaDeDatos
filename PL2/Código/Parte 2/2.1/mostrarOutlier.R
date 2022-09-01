mostrarOutlier <- function(x, int)
{
	for (i in 1:longitud(x))
	{
		if (x[i] < int[1] || x[i] > int[2])
		{
			print(paste0("El suceso ", i, " cuyo valor es ", x[i], " es un suceso anómalo o outlier"))
		}
	}
}