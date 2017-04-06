# HardCoded classifier class is created with fit/train and predict methods
# Fit (or Train) accepts training data
# Predict makes a prediction for the data it receives (at this point, it always predicts the same answer)

class HardCodedClassifier(object):
    def __init__(self):
        pass
    def fit(self, inputVector, targetVector):
        pass
    def predict(self, inputVector):
        return [self.classify(x) for x in range(len(inputVector))]
    def classify(self, instance):
        return 0
