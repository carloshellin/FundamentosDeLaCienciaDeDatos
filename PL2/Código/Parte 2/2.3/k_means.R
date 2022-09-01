k_meansCluster <- function(matriz, centroides)
{
	clasificacion <- c()
	for (i in 1:nrow(matriz))
	{
		punto <- matriz[i,]
		cluster_mejor <- 0
		distancia_mejor <- Inf
		
		for (j in 1:nrow(centroides))
		{
			distancia <- distanciaEuclidiana(punto, centroides[j,])
			if (distancia < distancia_mejor)
			{
				distancia_mejor <- distancia
				cluster_mejor <- j
			}
		}

		clasificacion <- c(clasificacion, cluster_mejor)
	}

	as.data.frame(clasificacion)
}

k_meansExtraer <- function(matriz, cluster, centroides)
{
	clusters = cbind(cluster, matriz)
	
	resultado <- c()
	
	for (i in 1:nrow(centroides))
	{
		cluster = subset(clusters, clusters[,1] == i)
		cluster = cluster[,-1]
		
		resultado <- c(resultado, list(cluster))
	}
	
	resultado
}

k_meansRecalcular <- function(clusters)
{
	centroides <- c()
	
	for (cluster in clusters)
	{
		for (colum in cluster)
		{
			centroides <- c(centroides, mediaAritmetica(colum))
		}
	}
	
	t(matrix(centroides, length(clusters[[1]]), length(clusters)))
}

k_means <- function(matriz, centroides)
{
	cluster <- rep(0, longitud(matriz[,1]))
	cluster <- as.data.frame(cluster)
	
	repeat
	{
		nuevoCluster <- k_meansCluster(matriz, centroides)
		
		if (all(cluster == nuevoCluster))
		{
			return(centroides)
		}
		
		clusters <- k_meansExtraer(matriz, nuevoCluster, centroides)
		centroides <- k_meansRecalcular(clusters)
	
		cluster <- nuevoCluster
	}
}