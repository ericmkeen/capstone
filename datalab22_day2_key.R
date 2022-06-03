# leaflet day 2

# Review

library(dplyr)
library(leaflet)
library(readr)
library(gsheet)

leaflet() %>% addTiles

whales <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/fin_whales.csv')

head(whales)

# Map it
leaflet() %>%
  addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=1)

# Add point size based on data
leaflet() %>%
  addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=whales$size)

# Add mouse over
leaflet() %>%
  addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=whales$size,
                   label = whales$date)

# Add cluster option
leaflet() %>%
  addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=whales$size,
                   label = whales$date,
                   clusterOptions = markerClusterOptions())

# Save it as an object
m <-
  leaflet() %>%
  addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=whales$size)

# One more extra feature
install.packages('leaflet.extras')
library(leaflet.extras)

m %>% addDrawToolbar


################################################################################
# Randomized sample locations

# Replicate the GoogleSheets dataset
latitude <- 35.2
longitude <- -85.9

df <- data.frame(latitude,
                 longitude)

leaflet() %>% addTiles() %>%  addCircleMarkers(data=df)

# Coin flip
rnorm(100)
runif(1)
runif(1) < 0.5
?runif
runif(1, 10, 20)

# Bunch of random-uniform draws
runif(50)

latitude <- runif(50, 35.19, 35.21)
latitude
longitude <- runif(50, -85.93, -85.91)
longitude

df <- data.frame(latitude,
                 longitude)
df
leaflet() %>% addTiles() %>%  addCircleMarkers(data=df)

# Run that code again and the location of the dots again

################################################################################
################################################################################
################################################################################
################################################################################
# Vectors

# Two ways to write vectors
c(1, 5, 2, 8, 6)
1:5

# Two other ways:
seq(0, 100, by = 10)
seq(0, 100, length = 5)

rep(4, times=10)
rep('Hey', times=10)
rep(4:6, each=3)
rep(c('Hey', 'Woohoo'), each=2)

# Math with two vectors (same length)
(x <- 10:15)
(y <- 30:35)
x + y
x - y
x / y

# Long vs one-off vector
x <- 5
y <- 1:10
x + y
x - y
x / y
x == y

# Functions for handling vectors
x <- 36:434
length(x)
x %>% length

(x <- 5:25)
x %>% head
x %>% tail
x[2]
x[2:3]
x[c(5,7)]

(x <- runif(10,0,100) %>% round)
x %>% sort
x %>% sort %>% rev
x %>% min
x %>% max
x %>% mean
x %>% sd

x == 5
which(x == 5)
x[which(x == 5)]
x[x == 5]
5 %in% x


