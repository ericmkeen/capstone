################################################################################
# Datalab 2022 - Day 1
################################################################################

# Joe - what is data science?
# Matthew -- Installing Slack, R Studio, R
# Matthew - R is a fancy calculator
# Then:

################################################################################
# Setting up scripts

# Open file
# Write stuff in scripts
# How to run stuff in your script
# Save file
# Comments
# Why scripts are awesome

################################################################################
# Talk about functions

x <- 1:10
mean(x)
?mean
sqrt(100)
sqrt(x)
rnorm(100)
x <- rnorm(100)
hist(x)
x <- runif(100)
hist(x)
x <- runif(100, 10, 20)
hist(x)

?runif

################################################################################
# Packages - think of them like SHOES

install.packages('dplyr')
install.packages('readr')
install.packages('ggplot2')
install.packages('gsheet')
install.packages("leaflet")
install.packages("wesanderson")

library(dplyr)
library(readr)
library(ggplot2)
library(gsheet)
library(leaflet)
library(wesanderson)

wes_palette("Royal1")
wes_palette("Zissou1")
?wes_palette

################################################################################
# The pipe

1:10 %>% mean
16 %>% sqrt
1:100 %>% mean %>% sqrt %>% round
rnorm(10000) %>% hist
rnorm(n = 10000, mean = 0, sd = 3) %>% hist

# PAUSE & TEST: Find errors
# 5 * 6 +
# sqrt(16
# round(100/3,digits+3)
# my_var < 5
# my_var == 5
#x <- 5
#y <- 1
#X + y

################################################################################
# Read in some data

library(gsheet)

url <- 'https://docs.google.com/spreadsheets/d/1xoecVY2roNzS2gpt8UnvhGhCxrocXjJMpji9eUgiDMw/edit?usp=sharing'

gsheet2tbl(url)

df <- gsheet2tbl(url)

# this is a dataframe

################################################################################
# Make some cool maps

library(leaflet)

leaflet()

leaflet() %>% addTiles()
# zoom in / zoom out

leaflet() %>% addTiles() %>%  addMarkers(data=df)

# Stylize your Tiles
providers

providers$Esri.WorldImagery

# Satellite
leaflet() %>% addProviderTiles(providers$Esri.WorldImagery)
leaflet() %>% addProviderTiles(providers$Esri.WorldImagery) %>%  addMarkers(data=df)

# Topo
leaflet() %>% addProviderTiles(providers$Esri.WorldTopoMap)
leaflet() %>% addProviderTiles(providers$Esri.WorldTopoMap) %>%  addMarkers(data=df)

# Stylize marker
leaflet() %>%
  addProviderTiles(providers$Esri.WorldTopoMap) %>%
  addCircleMarkers(data=df,
                   color = "firebrick",
                   radius = 15)

# Add pop up
leaflet() %>%
  addProviderTiles(providers$Esri.WorldTopoMap) %>%
  addCircleMarkers(data=df,
                   color = "firebrick",
                   radius = 15,
                   popup = 'YSR, yall')

# Add data-driven pop-up
leaflet() %>%
  addProviderTiles(providers$Esri.WorldTopoMap) %>%
  addCircleMarkers(data=df,
                   color = "firebrick",
                   radius = 15,
                   popup = df$description)

# Mapping specific area, without markers
leaflet() %>%
  addProviderTiles(providers$Esri.OceanBasemap) %>%
  fitBounds(lng1 = -165,
            lng2 = -100,
            lat1 = 10,
            lat2 = 50)

################################################################################
# Make each point a different color & radius

################################################################################
# Randomized sample locations

df

latitude <- runif(50, 35.1, 35.3)
latitude
longitude <- runif(50, -86, -85.8)
longitude

new_df <- data.frame(latitude,
                     longitude)
new_df
leaflet() %>% addTiles() %>%  addCircleMarkers(data=new_df)

# Randomly assign to an observer


################################################################################
################################################################################
################################################################################
################################################################################
# Geocoding

install.packages('tidygeocoder')
library(tidygeocoder)

# Create a dataframe with address(es)
addresses <- data.frame(name= 'White House',
                        addr = "1600 Pennsylvania Ave NW, Washington, DC")

# Geocode
lat_longs <-
  addresses %>%
  geocode(addr,
          method = 'osm',
          lat = latitude ,
          long = longitude)

# Check it out
lat_longs

# Map it
leaflet(data=lat_longs) %>%
  addProviderTiles(providers$Stamen.Watercolor) %>%
  addMarkers()


################################################################################
# Exercises

# ==============================================================================
# Part B. Working with variables ===============================================

# 6. Develop a calculation to estimate how many bananas you've eaten in your lifetime,
#    and store that value in a variable (choose whatever name you wish).


# 8. Now estimate how many ice cream sandwiches you've eaten in your lifetime,
#    using a similar method, and store that value in a different variable.

# 9. Now use these variables to calculate your Banana-to-ICS ratio.
#    Store your result in a third variable.

# 10. Who in your pod has the highest Banana-to-ICS ratio?
# (Write their name as a character string)


# 11. What is the average Banana-to-ICS ratio in your pod?


# 12. Let's change the subject.
#     Assign a variable `farenheit` to the numerical value of 32.


# 13. Assign a variable `celsius` to equal the conversion from Farenheit to Celsius.
#     Unless you are a meteorology nerd, you may need to Google the equation.


# 14. Now use this code to determine the Celsius equivalent of 212 degrees Farenheit.


# ==============================================================================
# Part C. Making fancy maps ====================================================

# 15. What line of code would you use to install the package 'leaflet'?


# 16. What line of code would you use to load the `leaflet` functions into
#     your current R session?


# 17. Which one of these commands do you run once,
#     and which do you run every time you sit down to work in R?
#     (provide your answer as a comment.)


# 18. Load the packages 'dplyr', 'readr', and 'tidygeocoder' to use in your R session.
#     If you don't have those packages installed yet, install them then laod them.


# 19. Run this code to "read in" a dataset into R:
whales <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/fin_whales.csv')

head(whales)

# 20. To view this dataset, run this code:
View(whales)

# 21.  In this dataset, each row is a sighting of a fin whale in coastal British Columbia.
#      Which columns correspond to geographic coordinates?
#      Write your answer as a comment.


# 22. Make a beautiful leaflet map of these sightings.

leaflet() %>%
  addProviderTiles(providers$Esri.OceanBasemap) %>%
  addCircleMarkers(data=whales,
                   color='firebrick',
                   radius=1)

# 23. Let's change the subject.
#     Now make a beautiful leaflet map of your favorite restaurant in the world,
#     using a map tile theme you have not used yet.
#     Also, add a "pop up" message that appears when you click on the marker for your restaurant.
#     The steps involved here are provided below.
#     If you need help, refer to this website:
#     http://www.datascience.pizza/interactive-maps.html#geocoding

# a. First, use Google to get the name and address of your restaurant of choice.
#    Save that address as a dataframe:

addresses <- data.frame(name= "Friendly Khmer Satay Noodle House",
                        addr = "434 George Street, North Dunedin, Dunedin 9016, New Zealand")

# b. Use the package 'tidygeocoder' to get the latitude / longitude for this address.
lat_longs <-
  addresses %>%
  geocode(addr,
          method = 'osm',
          lat = latitude,
          long = longitude)

lat_longs # check it out

# c. Build a basic leaflet map using a new tile theme.

leaflet(data=lat_longs) %>%
  addTiles() %>%
  addMarkers()

# d. Modify your map using a new tile them.
#   Use this website to explore your options:
#   https://leaflet-extras.github.io/leaflet-providers/preview/

leaflet(data=lat_longs) %>%
  addProviderTiles(providers$Esri.WorldTopoMap) %>%
  addMarkers()


