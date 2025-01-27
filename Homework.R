

library(skimr) 
library(DataExplorer)# Daten manipulation
library(dplyr)
library(tidyverse)
library(magrittr) # piping
library(ggplot2)# Vizualisierung
library(readr) # einlesen csv dok
library(stringr) # String Manipulation

benz <- read.csv("benzfinal.csv")

# Aufgabe 1
summary(data)

skimr::skim(data)

plot_missing(data)

# Aufgabe 2
benz$Sport_wagen <- if_else(benz$Ps > 300, 1, 0)
benz$Luxus_Auto <- if_else(benz$Price > 200000 & benz$Ps > 400, 1, 0)

# Aufgabe 3
result <- filter(benz, Sport_wagen == 1 & Luxus_Auto == 1)

write.csv(result, "Luxery_sport")
luxery_sport <- filter(benz, grepl("Mercedes-Benz", Manufacturer), Price > 300000, Ps > 400)

last_df <- select(luxery_sport, Model, Km, Ps, Price)
View(last_df)

# Aufgabe 4
ps_manufacturer <- benz %>% group_by(Manufacturer) %>% summarize(average_ps = mean(Ps, na.rm = TRUE))
view(ps_manufacturer)

cars_year <- benz %>% group_by(Year) %>% summarize(total_cars_year = n())
view(cars_year)

# Aufgabe 5
gl_models <- benz %>%
  filter(str_detect(Model, "GL"))
view(gl_models)

# Aufgabe 6
hist(benz$Ps, 
     breaks = 10, 
     col = "blue", 
     border = "black", 
     main = "Histogramm der PS-Werte", 
     xlab = "PS", 
     ylab = "Häufigkeit")

# Aufgabe 7
plot(benz$Price, benz$Ps,
     xlab = "Price", ylab = "PS",
     main = "Streudiagramm Preis gegen PS",
     pch = 20,
     col = ifelse(grepl("Mercedes", benz$Manufacturer), "firebrick", "deepskyblue")
)

cars_per_year <- benz %>%
  group_by(Year) %>%
  summarize(total_cars_year = n())

plot(cars_per_year$Year, cars_per_year$total_cars_year, 
     xlab = "Year", ylab = "Produced Cars",
     main = "Verteilung von hergestellten Autos auf Jahre",
     pch = 20,
     col = "deepskyblue"
)

# Aufgabe 8

sorted_by_price <- benz %>% arrange(desc(Price)) %>% head(10)
View(sorted_by_price)

grouped_and_sorted <- benz %>% group_by(Manufacturer) %>% summarize(max_price=max(Price, na.rm=TRUE))
View(grouped_and_sorted)

# Aufgabe 9
over_300_hp <- benz %>% filter(Ps > 300) %>% select(Price)
under_300_hp <- benz %>% filter(Ps < 300) %>% select(Price)
result <- t.test(over_300_hp, under_300_hp, alternative = "greater")
print(result)

correlation <- cor(benz$Price, benz$Ps, method = "pearson")
cat("Die Korrelation zwischen Preis und Ps ist:", correlation, "\n")

# Aufgabe 10
result <- benz %>% filter(Price > 100000) %>% select(Manufacturer, Model, Price,Ps)
View(result)
# Speichere das Ergebnis in einer neuen CSV-Datei
write.csv(result, "dummTeureAutos.csv", row.names = FALSE)

