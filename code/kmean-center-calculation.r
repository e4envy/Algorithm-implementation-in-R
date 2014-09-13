#return:  get two center of cluster first center is for BL cluster and second is InBL cluster
#parameter: oneDayData KwhValue may be whatever e.g. 96 or 144
kmean_center_calculation <- function(oneDayData){
  
  kmean <- kmeans(oneDayData,2,1)
  if(kmean$centers[1]<kmean$centers[2])
    cluster_means <- c(kmean$centers[1],kmean$centers[2])
  else
    cluster_means <- c(kmean$centers[2],kmean$centers[1])
  
  clusters <- data.frame(oneDayData,kmean$cluster)
  return (cluster_means)
}