library(tidyverse)

animals_eating <- msleep %>% 
  drop_na(vore) %>% 
  count(vore) %>% 
  pivot_wider(names_from = vore,
              values_from = n)

ggplot(data = animals_eating) +
  geom_bar(aes(x = carni))

animals_eating_tidy <- animals_eating %>% 
  pivot_longer(cols = everything(),
               names_to = "vore",
               values_to = "n")

ggplot(data = animals_eating_tidy,
       aes(x = vore,
           y = n)) +
  geom_col()


data_mike_week_3 <- read_csv(here::here("data", "mike-data-week-3.csv")) %>% 
  slice(1:10) 

data_mike_week_3 %>% 
  view()

data_mike_week_3_tidy <- data_mike_week_3 %>% 
  select(-Annual) %>% 
  pivot_longer(cols = c(Jan:Dec),
               names_to = "month",
               values_to = "widgets") %>% 
  mutate(widgets_numeric = parse_number(widgets))

data_mike_week_3_tidy %>% 
  group_by(Year) %>% 
  summarize(total_widgets = sum(widgets_numeric))

library(tidycensus)

acs_poverty_wide <- get_acs(year = 2019,
                            geography = "county",
                            state = "OR",
                            variables = c("n_in_poverty_male" = "S1701_C02_011",
                                          "n_in_poverty_female" = "S1701_C02_012",
                                          "n_in_poverty_under_18" = "S1701_C02_002"),
                            output = "wide")

acs_poverty_wide %>% 
  view()

acs_poverty <- get_acs(year = 2019,
                       geography = "county",
                       state = "OR",
                       variables = c("n_in_poverty_male" = "S1701_C02_011",
                                     "n_in_poverty_female" = "S1701_C02_012",
                                     "n_in_poverty_under_18" = "S1701_C02_002"))

acs_poverty_gender <- acs_poverty %>% 
  filter(variable %in% c("n_in_poverty_male", "n_in_poverty_female"))

acs_poverty_age <- acs_poverty %>% 
  filter(variable == "n_in_poverty_under_18")

acs_poverty_age

acs_poverty_gender



gapminder_wide <- read_csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_wide.csv")

gapminder_wide %>% 
  pivot_longer(cols = )
