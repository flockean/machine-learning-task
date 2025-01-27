# install.packages("tidyverse") # Datenmanipulation
# install.packages("dplyr")

# install.packages("magrittr") # piping
# install.packages("gapminder")
# install.packages("forcats") # Stat befehle


library(tidyverse)
library(dplyr)
library(magrittr)
library(gapminder)
library(forcats)


gp <- gapminder

gp$continent <- fct_expand(gp$continent, "Antarctica") 
fct_count(gp$continent)

gp$continent <- fct_drop(gp$continent, "Antarctica") 
fct_count(gp$continent)

süd_Am <- c("Argentina", "Bolivia", "Brazil", "Chile") 



