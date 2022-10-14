library(tidyverse)
library(scales)

tfff_dark_green <- "#265142"

# Working on recreating this graph: https://show.rfor.us/hJFyQL

race_ethnicity <- read_csv("data/race-ethnicity.csv") %>%
  filter(geography == "Multnomah") %>%
  filter(year == 2020) %>% 
  select(population, value)

race_ethnicity %>% 
  mutate(population = fct_rev(population)) %>% 
  mutate(col_label = paste0(population, ": ", percent(value, accuracy = 0.1))) %>% 
  ggplot() +
  geom_col(aes(y = population,
               x = 1),
           fill = "transparent",
           linetype = "dotted",
           color = "black") +
  geom_col(aes(x = value,
               y = population),
           fill = tfff_dark_green) +
  geom_text(aes(y = population,
                x = value * 1.3,
                label = col_label),
            size = 2.5) +
  theme_void()
