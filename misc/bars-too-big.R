library(tidyverse)

bmi_data <- read_csv(here::here("data", "bars-too-long.csv"))

bmi_data %>% 
  ggplot(aes(x = heart_disease,
             y = avg_bmi)) +
  geom_col(color = "white") +
  facet_wrap(~ sex)

bmi_data_hispanic <- bmi_data %>% 
  filter(race == "Hispanic") %>% 
  group_by(heart_disease, sex) %>% 
  summarize(avg_bmi_total = mean(avg_bmi)) 

ggplot(data = bmi_data_hispanic, 
       aes(x = heart_disease,
           y = avg_bmi_total)) +
  geom_col(color = "white") +
  facet_wrap(~ sex)

bmi_data %>% 
  group_by(heart_disease, sex) %>% 
  summarize(avg_bmi_total = mean(avg_bmi))

bmi_data_plot <- function(race_filter) {
  
  bmi_data %>% 
    filter(race == race_filter) %>% 
    group_by(heart_disease, sex) %>% 
    summarize(avg_bmi_total = mean(avg_bmi)) %>% 
    ggplot(aes(x = heart_disease,
               y = avg_bmi_total)) +
    geom_col(color = "white") +
    facet_wrap(~ sex)
  
}


bmi_data_plot(race_filter = "White")

msleep %>% 
  ggplot(aes(x = vore)) +
  geom_bar()
