#Getting InBL cluster Cluster
kmean_inblcluster_values <- function(oneDayData){
  kmean <- kmeans(oneDayData,2,1)
  
  if(kmean$centers[1]< kmean$centers[2])
    inblcluster <- 1
  else
    inblcluster <- 2
  
  clusters <- data.frame(oneDayData,kmean$cluster)
  
  #cluster value second is cluster number cluster[1] contain kwh value
  
  cluster_values <-  subset(oneDayData, clusters[2] == inblcluster,cluster[1])
  return(cluster_values)
}
