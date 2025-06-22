install.packages("dplyr")
library(dplyr)

iris2 <- iris %>%
  filter(Species == 'setosa' | Species == 'versicolor')

## check row
nrow(iris2)

## split data
set.seed(33)
n <- nrow(iris2)
id <- sample(1:n, n*0.8)
train_data <- iris2[id, ]
test_data <- iris2[-id, ]

## build model to check p value
f_model <- glm(Species ~ Sepal.Length,
               data = train_data, family = "binomial")
summary(f_model)

## train data
p_train <- predict(f_model, type = "response")
train_data$prob <- p_train
train_data$pred <- if_else(train_data$prob >= 0.6, "versicolor", "setosa")
train_accuracy <- mean(train_data$Species == train_data$pred)

## test data
p_test <- predict(f_model, newdata = test_data, type = "response")
test_data$prob <- p_test
test_data$pred <- if_else(test_data$prob >= 0.6, "versicolor", "setosa")
test_accuracy <- mean(test_data$Species == test_data$pred)

## confusion matrix
cm <- table(train_data$pred, train_data$Species,
            dnn = c("Predicted", "Actual"))

## evaluate data
cat("accuracy:", (cm[1,1] + cm[2,2]) / sum(cm),
    "\nprecision:", cm[1,1] / (cm[1,1] + cm[1,2]),
    "\nrecall:", cm[1,1] / (cm[1,1] + cm[2,1]),
    "\nF1 score:", 2 * (0.8717949 * 0.8947368) / (0.8717949 + 0.8947368))


## check mean to distinguish sepal length between setosa and versicolor
avg_setosa <- iris2 %>%
  filter(Species == 'setosa') %>%
  summarize(mean(Sepal.Length))

avg_versicolor <- iris2 %>%
  filter(Species == 'versicolor') %>%
  summarize(mean(Sepal.Length))

## -> using length 0.6 to distinguish
