library(tidyverse)

gapminder_wide <- read_csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_wide.csv")

colnames(gapminder_wide)

gapminder_wide %>% 
  pivot_longer(cols = gdpPercap_1952:pop_2007,
               names_sep = "_",
               names_to = c("measure", "year")) %>% 
  mutate(year = as.integer(year))

gapminder_wide %>% 
  pivot_longer(cols = gdpPercap_1952:pop_2007) %>% 
  mutate(new_column = str_extract(name, "[0-9]{1,}"))
