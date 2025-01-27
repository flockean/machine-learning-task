
library(DataExplorer)
library(tidymodels) 
library(tidyverse)

# Reading Data
data <- read.csv("Sample_car_dataset.csv")
head(data, 10)


plot_missing(data)


# Complete Missing Data
imputed_data <- mice::mice(data, m = 1, method = "pmm", seed = 111)
data_complete <- complete(imputed_data)

plot_missing(data_complete)

# Splitting Data
split <- initial_split(data, prop = 0.7)
train_data <- training(split)
test_data <- testing(split)


view(train_data)


# Recipe / prepare Data
recipe_prep <- recipe(mpg ~ origin, data = train_data) %>% 
  step_rm(car_name) %>%                  
  step_normalize(all_numeric(), -all_outcomes()) %>%
step_dummy(all_nominal(), -all_outcomes())

# Direkt mit lm
prepped <- prep(recipe_prep, training = train_data)
train_processed <- bake(prepped, new_data = NULL)
model <- lm(mpg ~ ., data = train_processed)
# Mit train()
model_with_recipe <- train(recipe_prep, data = train_data, method ="lm")


# Vorhersagen auf Testdaten
predictions <- predict(model, new_data = test_data)
# RMSE berechnen
rmse <- sqrt(mean((test_data$mpg - predictions)^2))
print(rmse)


control <- trainControl(method = "cv", number = 5)
model_cv <- train(recipe_prep, data = train_data, method = "lm",
                  trControl = control)
print(model_cv)

# Modell speichern
saveRDS(model, "linear_model.rds")

# Modell laden
loaded_model <- readRDS("linear_model.rds")
predict(loaded_model, new_data = test_data)
