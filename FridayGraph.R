#### Load in csv file ####
x <- 5

library(ggplot2)

movie_data <-read.csv("C:Users\cools\Downloads\highest_grossing_hollywood_movie.csv")
View(movie_data)


ggplot(data = hero_data, aes(x = License, y = Movie_Runtime)) +
  geom_point() +
  scale_x_continuous(breaks = seq(from = 0, to = 1000, by = 100))

