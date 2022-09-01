# camberradistance
x <- c(1,2)
y <- c(1,3)
canberradistance(x,y)
canberradistance.details(x,y)

# canberradistanceW
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,3),ncol=2)
weight1 <- c(0.4,0.6)
canberradistanceW(cluster1,cluster2,weight1)
canberradistanceW.details(cluster1,cluster2,weight1)

# chebyshevDistance
x <- c(1,2)
y <- c(1,3)
chebyshevDistance(x,y)
chebyshevDistance.details(x,y)

# chebyshevDistanceW
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,3),ncol=2)
weight1 <- c(0.4,0.6)
chebyshevDistanceW(cluster1,cluster2,weight1)
chebyshevDistanceW.details(cluster1,cluster2,weight1)

# clusterDistance
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,4),ncol=2)
(clusterDistance(cluster1,cluster2,'AVG','MAN'))
clusterDistance.details(cluster1,cluster2,'AVG','MAN')

# clusterDistanceByApproach
distances2 <- c(1:10)
clusterDistanceByApproach(distances2,'MIN')
clusterDistanceByApproach.details(distances2,'MIN')

# complementaryClusters
data <- c(1,2,1,3,1,4,1,5)
components <- toListDivisive(data)
cluster1 <- matrix(c(1,2,1,3),ncol=2)
cluster2 <- matrix(c(1,4,1,5),ncol=2)
complementaryClusters(components,cluster1,cluster2)
complementaryClusters.details(components,cluster1,cluster2)

# correlationHC
data <- matrix(c(1,2,1,4,5,1,8,2,9,6,3,5,8,5,4),ncol= 3)
dataFrame <- data.frame(data)
target1 <- c(1,2,3)
correlationHC(dataFrame, target1)
correlationHC.details(dataFrame, target1)

# distances
cluster1 <- matrix(c(2,3))
cluster2 <- matrix(c(4,5))
weight1 <- c(0.6,0.4)
distances(cluster1, cluster2, 'MAN', weight1)
distances.details(cluster1, cluster2, 'MAN', weight1)

# divisiveHC
a <- c(1,2,1,3,1,4,1,5,1,6)
divisiveHC(a,'EUC','MAX')
divisiveHC.details(a,'EUC','MAX')

# edistance
x <- c(1,2)
y <- c(1,3)
edistance(x,y)
edistance.details(x,y)

# edistanceW
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,3),ncol=2)
weight1 <- c(0.4,0.6)
edistanceW(cluster1,cluster2,weight1)
edistanceW.details(cluster1,cluster2,weight1)

# getCluster
matrixExample <- matrix(c(1:10), ncol=2)
(getCluster(2,matrixExample))
getCluster.details(2,matrixExample)

# getClusterDivisive
getClusterDivisive(2,c(1:10))
getClusterDivisive.details(2,c(1:10))

# initClusters
data <- c(1:8)
listData <- toListDivisive(data)
initClusters(listData)
initClusters.details(listData)

# initData
data <- matrix(c(1,2,1,4,5,1,8,2,9,6,3,5,8,5,4),ncol= 3)
dataFrame <- data.frame(data)
initData(dataFrame)
initData.details(dataFrame)

# initTarget
data <- matrix(c(1,2,1,4,5,1,8,2,9,6,3,5,8,5,4),ncol= 3)
dataFrame <- data.frame(data)
target1 <- matrix(c(2,3))
initTarget(target1,dataFrame)
initTarget.details(target1,dataFrame)

# matrixDistance
data <- c(1:10)
clusters <- toList(data)
(matrixDistance(clusters, 'EUC'))

# maxDistance
maxDistance(1:10)
maxDistance.details(1:10)

# mdAgglomerative
data <- c(1,2,1,3,1,4,1,5,1,6)
clusters <- toList(data)
(mdAgglomerative(clusters, 'EUC', 'MAX'))
mdAgglomerative.details(clusters, 'EUC', 'MAX')

# mdDivisive
data <- c(1,2,1,3,1,4,1,5,1,6)
clusters <- toList(data)
components <- toList(data)
(mdDivisive(clusters, 'EUC', 'MAX', components))
mdDivisive.details(clusters, 'EUC', 'MAX', components)

# mdistance
x <- c(1,2)
y <- c(1,3)
mdistance(x,y)
mdistance.details(x,y)

# mdistanceW
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,3),ncol=2)
weight1 <- c(0.4,0.6)
mdistanceW(cluster1,cluster2,weight1)
mdistanceW.details(cluster1,cluster2,weight1)

# minDistance
minDistance(1:10)
minDistance.details(1:10)

# newCluster
data <- c(1:10)
list <- toList(data)
clusters <- c(1,2)
newCluster(list,clusters)
newCluster.details(list,clusters)

# normalizeWeight
data <- data.frame(matrix(c(1:10),ncol = 2))
weight1 <- c(2,4)
normalizeWeight(FALSE, weight1, data)
normalizeWeight(TRUE, weight1, data)
normalizeWeight.details(FALSE, weight1, data)
normalizeWeight.details(TRUE, weight1, data)

# octileDistance
x <- c(1,2)
y <- c(1,3)
octileDistance(x,y)
octileDistance.details(x,y)

# octileDistanceW
cluster1 <- matrix(c(1,2),ncol=2)
cluster2 <- matrix(c(1,3),ncol=2)
weight1 <- c(0.4,0.6)
octileDistanceW(cluster1,cluster2,weight1)
octileDistanceW.details(cluster1,cluster2,weight1)

# toList
data <- c(1:10)
toList(data)
toList.details(data)

# toListDivisive
data <- c(1:10)
toListDivisive(data)
toListDivisive.details(data)

# usefulClusters
data <- c(1:10)
list <- toList(data)
usefulClusters(list)