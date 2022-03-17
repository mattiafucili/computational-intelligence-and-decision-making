from __future__ import division
from sklearn import preprocessing, tree, svm
from sklearn.metrics import confusion_matrix, auc, roc_curve
import numpy as np
import pandas as pd

FEATURES = ["class", "odor", "gill-color", "stalk-surface-above-ring", "ring-type", "spore-print-color"]

# Train & test set
data_set = pd.read_csv("mushrooms.csv")
for i in range(len(FEATURES)):
    encoder = preprocessing.LabelEncoder()
    encoder.fit(data_set[FEATURES[i]])
    data_set[FEATURES[i]] = encoder.transform(data_set[FEATURES[i]])

msk = np.random.rand(len(data_set)) < 0.8
train_set = data_set[msk]
test_set = data_set[~msk]

# Prepare training
training = train_set.ix[:, ["odor", "gill-color", "stalk-surface-above-ring", "ring-type", "spore-print-color"]]
training_targets = train_set.ix[:, :1]

# Prepare test
test = test_set.ix[:, ["odor", "gill-color", "stalk-surface-above-ring", "ring-type", "spore-print-color"]]
test_targets = test_set.ix[:, :1]

clf_svm = svm.SVC().fit(training, training_targets)
Z_svm = clf_svm.predict(test)
conf_svm = confusion_matrix(test_targets, Z_svm)
false_positive_rate_svm, true_positive_rate_svm, thresholds_svm = roc_curve(test_targets, Z_svm)
auc_SVM = auc(false_positive_rate_svm, true_positive_rate_svm)
print("--- SVM ---")
print(conf_svm)
print("\nAccuracy: {}".format(conf_svm.trace() / conf_svm.sum()))
print("\nAUC: {}".format(auc_SVM))
print("")

clf_tree = tree.DecisionTreeClassifier().fit(training, training_targets)
Z_tree = clf_tree.predict(test)
conf_tree = confusion_matrix(test_targets, Z_tree)
false_positive_rate_tree, true_positive_rate_tree, thresholds_tree = roc_curve(test_targets, Z_tree)
auc_tree = auc(false_positive_rate_tree, true_positive_rate_tree)
print("--- TREE ---")
print(conf_tree)
print("\nAccuracy: {}".format(conf_tree.trace() / conf_tree.sum()))
print("\nAUC: {}".format(auc_tree))