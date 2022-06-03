# CO2 emissions

# source: https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions#global-emissions-have-not-yet-peaked

library(dplyr)
library(ggplot2)
library(readr)

################################################################################
################################################################################
# emissions by 'county'

ghg <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/co2.csv')

# explore
head(ghg)

# fix names to lower case
(names(ghg) <- names(ghg) %>% tolower)

# simplify co2 name
ghg <- ghg %>% rename(co2 = `annual co2 emissions (zero filled)`)

head(ghg)

# Look at "entity"
ghg$entity %>% unique

# Produce a line plot of total worldwide c02 emissions over time
ghgi <- ghg %>% filter(entity == 'World')
ghgi$year

ggplot(ghgi, aes(x=year, y=co2)) +
  geom_line()

# Now use geom_area
ggplot(ghgi, aes(x=year, y=co2)) +
  geom_area(alpha = 0.5)


################################################################################
################################################################################
# emissions by 'county-sector'

# Emissions by sector
sectors <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/co2_sectors.csv')
sectors %>% head

# Show emissions by sector for China over time
sectors <- sectors %>% filter(entity == 'China')
ggplot(mrs, aes(x=year, y=co2, color=sector)) +
  geom_point() 

ggplot()


################################################################################
################################################################################
# scraps


# Show share of emissions from each continent
continents <- c('North America', 'South America', 'Europe', 'Africa', 'Asia')
ghgi <- ghg %>% filter(entity %in% continents)
ghgi$entity %>% unique

ggplot(ghgi, aes(x=year, y=co2, fill=entity)) +
  geom_area()

# Show CO2 emissions for the US alone, using a line plot (not area plot).
dfs <- df %>% filter(entity == 'United States')
ggplot(dfs, aes(x=year, y=co2, color=entity)) +
  geom_line()

# Who were the top 5 emitters in 2019?
(top5 <- df %>% filter(year == 2019) %>%
  arrange(desc(co2)) %>%
  head(20))
# China, United States, India, Russia, Japan

# Show emissions from these top 5 countries as separate lines
dfs <- df %>% filter(entity %in% c('China', 'United States', 'India', 'Russia', 'Japan'))
ggplot(dfs, aes(x=year, y=co2, color=entity)) +
  geom_line()


# Which countries have reduced their emissions since the year 2000


# Which countries have reduce their emissions the most (proportionally) from their peak emissions year?


# Show a plot of US emissions as a share of worldwide emissions


# Which continent is currently producing the most co2 emissions? Show with code.


# Which continent was producing the most in 1990?


# Global reduction in emissions in 2020 vs 2019?


# Which countries had the greatest percent reduction in emissions, 2020 vs 2019?



# In a multi-pane plot, show the emissions by sector over time for the top 6 most carbon-polluting countries

# A bar chart showing total emissions in each sector for 2018
mrs <-
  mr %>%
  filter(year == 2018) %>%
  group_by(sector) %>%
  summarize(total = sum(co2, na.rm=TRUE))
mrs

# Convert this to share of total emissions, such that the bars add up to 1
mrs$share <- round(mrs$total / sum(mrs$total), 2)
mrs
ggplot(mrs, aes(x=sector, y=share)) + geom_col()

# Show the annual trend in the share of Chinese emissions contributed by electricity and heating

# Show this for each continent plus Oceania

# Show trends in emissions from each sector worldwide over time

# Which countries have decreased their electricity/heating emissions from 2000?

# Rank countries by their electricity/heating emissions in 2018 relative to 2000.
# Create a plot with rank on the x axis and 'dela emissions' on the y
# Add a horizontal line at y = 0






