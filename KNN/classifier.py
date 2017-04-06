# Instantiate your new classifier, "train" it with your training data,
# then use it to make predictions on the test data.

class Classifier(object):
    def train(self, inputVector, targetVector):
        pass
    def predict(self, inputVector):
        return [x * 0 for x in range(len(inputVector))]
