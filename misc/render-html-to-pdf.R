library(tidyverse)
library(pagedown)

chrome_print(input = "slides/slides-week-11.html",
             output = "test.pdf",
             timeout = 180)
