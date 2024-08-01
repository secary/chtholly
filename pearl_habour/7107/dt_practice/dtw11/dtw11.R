library(tidyverse)
library(tidymodels)
library(vip)
library(ISLR)
library(rpart.plot)

Carseats
car_seats <- as_tibble(Carseats)

car_seats

set.seed(2022)

car_split <- initial_split(car_seats, prop = 3/4)
car_train <- training(car_split)
car_test <- testing(car_split)

car_split

car_rt_spec <- decision_tree(mode = 'regression') %>%
  set_engine('rpart')

car_reg_tree <- car_rt_spec %>%
  fit(Sales~.,data = car_train)

car_reg_tree

rpart.plot(car_reg_tree$fit, extra = 1, type = 2)

predict(car_reg_tree, new_data = car_test)

car_rt_test_preds <- bind_cols(
  predict(car_reg_tree, new_data = car_test),
  truth = car_test$Sales
)
car_rt_test_preds

car_rt_test_preds %>%
  metrics(.pred, truth = truth)

car_reg_tree %>%
  vip()

# Cross Validation

set.seed(2022)
car_cv <- vfold_cv(car_seats, v = 4)
car_cv

car_cv$splits[[1]]

car_resamples <- fit_resamples(
  object = car_rt_spec,
  Sales~.,
  resamples = car_cv
)
car_resamples

car_resamples %>% collect_metrics()
