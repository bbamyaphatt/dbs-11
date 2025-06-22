# install package
install.packages('titanic')
install.packages('tidyverse')

library(titanic)
library(tidyverse)

## copy original dataset
titanic_df <- titanic_train

## drop not use column
titanic_df$PassengerId <- NULL
titanic_df$Name <- NULL
titanic_df$Embarked <- NULL
titanic_df$Ticket <- NULL
titanic_df$Cabin <- NULL
titanic_df$Parch <- NULL
titanic_df$Fare <- NULL
titanic_df$SibSp <- NULL

## check and remove missing value
is.na(titanic_df)
titanic_df <- na.omit(titanic_df)

## build first model to check p-value -> delete not sig column
logit_model <- glm(Survived ~., data = titanic_df, family = "binomial")

## data transformation
titanic_df <- titanic_df %>%
  select(survived = Survived,
         pclass = Pclass,
         sex = Sex,
         age = Age)

## split data
set.seed(39)
n <- nrow(titanic_df)
id <- sample(1:n, size = n*0.8)
train_data <- titanic_df[id, ]
test_data <- titanic_df[-id, ]

## convert data type
train_data$survived <- as.factor(train_data$survived)
train_data$pclass <- as.factor(train_data$pclass)
train_data$sex <- as.factor(train_data$sex)

test_data$survived <- as.factor(test_data$survived)
test_data$pclass <- as.factor(test_data$pclass)
test_data$sex <- as.factor(test_data$sex)

## build second model and use this model to train data
model <- glm(survived ~ ., data = train_data, family = "binomial")

## train data
p_train <- predict(model, type = "response")
train_data$prob <- p_train
train_data$pred <- if_else(train_data$prob >= 0.5, 1, 0)
train_data$interpret <- if_else(train_data$pred == 1, "survived", "died")
train_accuracy <- mean(train_data$survived == train_data$pred)

## test data
p_test <- predict(model, newdata = test_data, type = "response")
test_data$prob <- p_test
test_data$pred <- if_else(test_data$prob >= 0.5, 1, 0)
test_data$interpret <- if_else(test_data$pred == 1, "survived", "died")
test_accuracy <- mean(test_data$survived == test_data$pred)

## delete col
train_data$preb <- NULL

## confusion matrix
conmat <- table(train_data$pred, train_data$survived,
                dnn = c('Predicted','Actual'))
  
## train model evaluation
cat("accuracy:", (conmat[1,1] + conmat[2,2]) / sum(conmat),
"\nprecision:", conmat[2,2] / (conmat[2,1] + conmat[2,2]),
"\nrecall:", conmat[2,2] / (conmat[1,2] + conmat[2,2]),
"\nF1 score:", 2 * (0.7817 * 0.765) / (0.7817 + 0.765))

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
