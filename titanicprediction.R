library(rattle)
library(rpart.plot)
library(RColorBrewer)

train <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv")
test <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv")

table(train$Survived)
prop.table(table(train$Survived))

# Build the decision tree
my_tree_two <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Time to plot your fancy tree
fancyRpartPlot(my_tree_two)


# Make your prediction using the test set
my_prediction <- predict(my_tree_two,test,type ="class")

# Create a data frame with two columns: PassengerId & Survived. Survived contains your predictions
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Check that your data frame has 418 entries
nrow(my_solution)

# Write your solution to a csv file with the name my_solution.csv
write.csv(my_solution, file= "my_solution.csv", row.names = FALSE)