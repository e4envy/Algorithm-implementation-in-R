#Getting OutBL cluster_value
kmean_outblcluster_values <- function(oneDayData){
  kmean <- kmeans(oneDayData,2,1)
  
  if(kmean$centers[1]< kmean$centers[2])
    outblcluster <- 2
  else
    outblcluster <- 1
  
  clusters <- data.frame(oneDayData,kmean$cluster)
  cluster_values <-  subset(oneDayData, clusters[2] == outblcluster, clusters[1])
  #print("out_bl_cluster is ")
  #print(cluster_values)
  return(cluster_values)
}
