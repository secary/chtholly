# Load necessary libraries
library(ggplot2)

# Load the mpg dataset
data(mpg)

# Fit the linear model
model <- lm(cty ~ displ, data = mpg)

# Summary of the model to understand the coefficients
summary(model)

# Predict the city fuel efficiency for an engine size of 1.9L
prediction <- predict(model, newdata = data.frame(displ = 1.9), interval = "confidence", level = 0.90)


mpg
lm_cty <- lm(cty ~ displ, mpg)
summary(lm_cty)

pred_value <- tibble(displ = 1.90)
predict(lm_cty,pred_value,interval = 'confidence', level = 0.9)
