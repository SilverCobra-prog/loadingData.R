#load in datasets
library(dlyr)
library(ggplot2)

# Unsupervised learning; k-means clustering

iris_numerics <-select(iris, -Species) %>%
    scale()

iris_clusters <-kmeans(iris_numerics, centers = 3)
iris_clusters #our results

iris_clusters$clusters #vector designating a cluster for each row
iris$clusters  <- iris_clusters$clusters #add a cluster column to original

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(aes(color = as.factor(cluster)))

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(aes(color = Species))

ggplot(rating, aes(x=runtime, y=box_office)) +
  geom_point(aes(color = genre))

ggplot(rating, aes(x=runtime, y=box_office)) +
  geom_point(aes(color = description))

#split into training test, and validation sets
greetings <-c(rep("hello",5),rep("goodbye", 3)) %>%
  sample(8, replace = F)
greetings

iris_lens <- nrow(iris)

iris$label <- c(rep("training", ceiling(.6*iris_lens)),
                rep("test", ceiling(.2*iris_len)),
                rep("validation", ceiling(.2*iris_len)) %>%
  sample(iris_len, replace = F)
  
head(iris)

iris_train <- filter(iris, label == "training")
iris_test <- filter(iris, label == "test")
iris_valid <- filter(iris, label == "validation")

## linear model

iris_lm <-lm(Petal.Length ~ Petal.Width + Sepal.Width, data = iris_train)
iris_lm

## select out only the x values we use (Petal. Width and Sepal.Length)
iris_lm_predictions <- select(iris_test, Petal.Width, Sepal.Length)
  predict(object = iris_lm)
  
iris_train$lm_pred <- iris_lm_predictions

head(iris_train)