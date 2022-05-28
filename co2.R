# CO2 emissions

# source: https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions#global-emissions-have-not-yet-peaked

library(dplyr)
library(ggplot2)
library(readr)
df <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/co2.csv')

# explore
head(df)

# fix names to lower case
(names(df) <- names(df) %>% tolower)

# simplify co2 name
df <- df %>% rename(c02 = `Annual co2 emissions (zero filled)`)

head(df)

# Look at "entity"
df$entity %>% unique

# Produce a line plot of total worldwide c02 emissions over time
dfs <- df %>% filter(entity == 'World')
dfs$year

ggplot(dfs, aes(x=year, y=co2)) +
  geom_line()

# Now use geom_area
ggplot(dfs, aes(x=year, y=co2)) +
  geom_area()

# Show share of emissions from each continent
continents <- c('North America', 'South America', 'Europe', 'Africa', 'Asia')
dfs <- df %>% filter(entity %in% continents)
dfs$entity %>% unique

ggplot(dfs, aes(x=year, y=co2, fill=entity)) +
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


# Which countries have reduced their emissions since the yaer 2000


# Which countries have reduce their emissions the most (proportionally) from their peak emissions year?


# Show a plot of US emissions as a share of worldwide emissions


# Which continent is currently producing the most co2 emissions? Show with code.


# Which continent was producing the most in 1990?


# Global reduction in emissions in 2020 vs 2019?


# Which countries had the greatest percent reduction in emissions, 2020 vs 2019?


# Emissions by sector
mr <- read_csv('https://raw.githubusercontent.com/ericmkeen/capstone/master/co2_sectors.csv')
mr %>% head
mr <- mr %>% rename(co2 = value)
mr <- mr %>% filter(sector != 'Land-use change and forestry')
mr$sector %>% unique
mr$sector[mr$sector == 'Industry'] <- 'Manufacturing and construction'
mr$sector[mr$sector == 'Fugitive emissions'] <- 'Other'
mr$sector[mr$sector == 'Waste'] <- 'Other'
mr$sector[mr$sector == 'Buildings'] <- 'Other'
mr$sector[mr$sector == 'Other fuel combustion'] <- 'Other'
mr$sector[mr$sector == 'Aviation and shipping'] <- 'Transport'
head(mr)
mr <- mr %>% group_by(entity, year, sector) %>% summarize(co2 = sum(co2))
head(mr)

mrs <- mr %>% filter(entity == 'China')
mrs <- mr %>% filter(entity == 'United States')
mrs <- mr %>% filter(entity == 'Switzerland')

ggplot(mrs, aes(x=year, y=co2, color=sector)) +
  geom_line()

#write.csv(mr, file='co2_sectors.csv', quote=FALSE, row.names=FALSE)
mr$year %>% max

(mr %>% filter(co2 < 0))$sector %>% unique

mrs <- mr %>%
  filter(sector == 'Agriculture') %>%
  filter(entity %in% c('China', 'United States', 'India', 'Russia', 'Japan'))

ggplot(mrs, aes(x=year, y=co2, color=entity)) +
  geom_line()

