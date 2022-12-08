library(tidyverse)
library(palmerpenguins)
library(rmarkdown)


# Render one report -------------------------------------------------------

render(input = "misc/penguins-parameterized-report.Rmd",
       output_file = "parameterized-report.html",
       params = list(species = "Adelie"))

# Render multiple reports -------------------------------------------------

penguin_species <- penguins %>%
  distinct(species) %>% 
  pull(species) %>% 
  as.character()

render_penguins_report <- function(species_to_use) {
  
  render(
    input = "misc/penguins-parameterized-report.Rmd",
    output_file = str_glue("{species_to_use}.html"),
    params = list(species = species_to_use)
  )
  
}

walk(penguin_species, render_penguins_report)

render_penguins_report("Adelie")
render_penguins_report("Gentoo")
render_penguins_report("Chinstrap")

