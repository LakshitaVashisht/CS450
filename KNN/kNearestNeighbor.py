import sklearn
import panda
from HardCodedClassifier import HardCodedClassifier


import NewClassifier

#Accuracy is the sum of the number of true positives
# and true negatives divided by the total number of examples
# (where means ‘number of’, and TP stands for True Positive, etc.):
def accuracy(output, target):
    truePositive = 0
    falsePositive = 0
    for i in range(len(output)):
        if output[i] == target[i]:
            truePositive = truePositive + 1
        else:
            falsePositive = falsePositive + 1
    return float(truePositive) / len(output)

def run(inputVector, targetVector):
    # Shuffle input and target
    # knuth_shuffle(inputVector, targetVector)
    trainInput, testInput, trainTarget, testTarget = model_selection.train_test_split(inputVector,
                                                                      targetVector,
                                                                      test_size=0.33)
    classifier = NewClassifier.NewClassifier()
    classifier.fit(trainInput, trainTarget)
    testOutput = classifier.predict(testInput)

    print accuracy(testOutput, testTarget)

iris = datasets.load_iris()
run(iris.data, iris.target)
