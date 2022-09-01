# Clasificacion no supervisada
# Muestra
m<-matrix(c(4,4,3,5,1,2,5,5,0,1,2,2,4,5,2,1),2,8)
m
     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
[1,]    4    3    1    5    0    2    4    2
[2,]    4    5    2    5    1    2    5    1

# Matriz transpuesta
(m<-t(m))
     [,1] [,2]
[1,]    4    4
[2,]    3    5
[3,]    1    2
[4,]    5    5
[5,]    0    1
[6,]    2    2
[7,]    4    5
[8,]    2    1

# Centroides
c<-matrix(c(0,1,2,2),2,2)
c
     [,1] [,2]
[1,]    0    2
[2,]    1    2

# Clasificacion no supervisada con el algoritmo kmeans
(clasificacionns=kmeans(m,c,4))
K-means clustering with 2 clusters of sizes 4, 4

Cluster means:
  [,1] [,2]
1 1.25 1.50
2 4.00 4.75

Clustering vector:
[1] 2 2 1 2 1 1 2 1

Within cluster sum of squares by cluster:
[1] 3.75 2.75
 (between_SS / total_SS =  84.8 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
[6] "betweenss"    "size"         "iter"         "ifault"  

# Unir vector de "cluster" con la matriz de muestra
(m=cbind(clasificacionns$cluster, m))
     [,1] [,2] [,3]
[1,]    2    4    4
[2,]    2    3    5
[3,]    1    1    2
[4,]    2    5    5
[5,]    1    0    1
[6,]    1    2    2
[7,]    2    4    5
[8,]    1    2    1

# Subconjunto con los datos cuya primera columna valga "1"
mc1=subset(m,m[,1]==1)
mc1
     [,1] [,2] [,3]
[1,]    1    1    2
[2,]    1    0    1
[3,]    1    2    2
[4,]    1    2    1

# Subconjunto con los datos cuya primera columna valga "2"
mc2=subset(m,m[,1]==2)
mc2
     [,1] [,2] [,3]
[1,]    2    4    4
[2,]    2    3    5
[3,]    2    5    5
[4,]    2    4    5

# Extraer primer cluster
(mc1=mc1[,-1])
     [,1] [,2]
[1,]    1    2
[2,]    0    1
[3,]    2    2
[4,]    2    1

# Extraer segundo cluster
(mc2=mc2[,-1])
     [,1] [,2]
[1,]    4    4
[2,]    3    5
[3,]    5    5
[4,]    4    5
