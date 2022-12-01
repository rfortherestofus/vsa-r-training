library(tidyverse)
library(ggtext)

kindergarten_readiness <- tribble(
  ~subject, ~score, ~date,
  "Literacy", 34, "Fall",
  "Literacy", 69, "Spring",
  "Language", 67, "Fall",
  "Language", 75, "Spring"
)

subject_labels <- kindergarten_readiness %>% 
  group_by(subject) %>% 
  filter(score == min(score)) %>% 
  ungroup() %>% 
  mutate(score = score - 10)

kindergarten_readiness %>% 
  ggplot(aes(x = score,
             y = subject,
             color = date,
             label = score)) +
  geom_point(size = 10) +
  geom_text(color = "white") +
  geom_text(data = subject_labels,
            aes(x = score,
                y = subject,
                label = subject)) +
  theme_minimal() +
  scale_color_manual(values = c(
    "Fall" = "#837d80",
    "Spring" = "#bf524e"
  )) +
  labs(title = "Kindergarten readiness increased betwteen <span style='color: #837d80'>Fall</span> and <span style='color: #bf524e'>Spring</span>") +
  scale_x_continuous(limits = c(0, 100),
                     breaks = seq(0, 100, by = 10)) +
  theme(axis.title = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        plot.title = element_markdown(),
        legend.position = "none") 
