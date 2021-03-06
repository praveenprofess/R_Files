## Clustering. From Chap 6 of R and Data Mining (Zhao)
## Using Iris data set
#######################################################
iris2 <- iris
iris2$Species <- NULL
kmeans.result <- kmeans(iris2,3)
str(kmeans.result)
## Note: we're dealing with 4-diminsional euclidean space
## Checking number of observations per Species
nrow(subset(iris, subset =(iris$Species == "setosa")))
nrow(subset(iris, subset =(iris$Species == "versicolor")))
nrow(subset(iris, subset =(iris$Species == "virginica")))

## Check kmeans clustering results
kmeans.result$withinss
kmeans.result$centers
kmeans.result$size
kmeans.result$cluster
table(iris$Species, kmeans.result$cluster)

## Do some plotting of clustering results - in 2-dim euclidean space
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
## Plot cluster centers
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col =  1:3, pch=8, cex=2)
## Note that in 2-dim space, due to projection, some points appear closer to another cluster. 
## Need 4-dim space to see truth

plot(iris2[c("Petal.Length", "Petal.Width")], col = kmeans.result$cluster)
points(kmeans.result$centers[,c("Petal.Length", "Petal.Width")], col =  1:3, pch=8, cex=2)
#######################################################
## Analysis using fpc package and K-Metoids technique
## Dependencies: fpc package
pamk.result <- pamk(iris2)
pamk.result$nc  # check number of clusters
## check clustering against species
table(pamk.result$pamobject$clustering,iris$Species)
plot(pamk.result$pamobject)
## Now lets try pam() where k = 3
pam.result <- pam(iris2, 3)
table(pam.result$clustering, iris$Species)
## Note that pam() with k = 3 gives same clustering as k-means
