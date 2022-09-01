# Función hclust
hc <- hclust(dist(USArrests), "ave")
plot(hc)

# Función diana
library(cluster)
data(votes.repub)
dv <- diana(votes.repub, metric = "manhattan", stand = TRUE)
print(dv)
plot(dv)