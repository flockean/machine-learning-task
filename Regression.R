library(datarium)

marketing

# Aufgabe 1
Model_1 <- lm(sales~., marketing)
summary(Model_1)

Model_2 <- lm(sales)