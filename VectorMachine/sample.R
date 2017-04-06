library (e1071)
get.data <- function (csv.file.name, split.percent) {
  myDataSet = read.csv(csv.file.name, head=TRUE, sep=",")
  allRows = 1:nrow(myDataSet)
  testRows = sample(allRows, trunc(length(allRows) * split.percent))
  myDataSet.test = myDataSet[testRows,]
  myDataSet.train = myDataSet[-testRows,]
  return(list(myDataSet.train, myDataSet.test))
}
run.svm <- function(train, test, target.index, kernel, gamma, cost) {
  target.name <- names(train)[[target.index]]
  print(paste("Target:", target.name, "Kernel:", kernel, "Gamma:", gamma, "Cost:", cost))
  model = svm(as.formula(paste(target.name, "~ .")), data = train, kernel=kernel, gamma = gamma, cost = cost)
  prediction = predict(model, test[-target.index])
  confusion_matrix = table(pred = prediction, true = test[[target.name]])
  agreement = prediction == test[[target.name]]
  accuracy = prop.table(table(agreement))
  print(accuracy)
}

run.ten.svm <- function(csv.file.name, target.column) {
  data <- get.data(csv.file.name, .3)
  run.svm(data[[1]], data[[2]], target.column, "radial", .001, 10)
  run.svm(data[[1]], data[[2]], target.column, "linear", .001, 10)
  run.svm(data[[1]], data[[2]], target.column, "polynomial", .001, 10)
  run.svm(data[[1]], data[[2]], target.column, "sigmoid", 10, 10)
  run.svm(data[[1]], data[[2]], target.column, "radial", 10, 10)
  run.svm(data[[1]], data[[2]], target.column, "linear", 10, 10)
  run.svm(data[[1]], data[[2]], target.column, "polynomial", 10, 10)
  run.svm(data[[1]], data[[2]], target.column, "sigmoid", 10, 10)
  run.svm(data[[1]], data[[2]], target.column, "radial", .001, 100)
  run.svm(data[[1]], data[[2]], target.column, "linear", .001, 100)
  run.svm(data[[1]], data[[2]], target.column, "polynomial", .001, 100)
  run.svm(data[[1]], data[[2]], target.column, "sigmoid", .001, 100)
}
run.ten.svm('vowel.csv', 13)
run.ten.svm('letters.csv', 1)
run.ten.svm('abalone.csv', 9)
