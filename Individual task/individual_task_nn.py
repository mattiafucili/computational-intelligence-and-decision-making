from __future__ import print_function
import tensorflow as tf
import numpy as np
import pandas as pd
from sklearn import preprocessing
from tensorflow.python.data import Dataset

FEATURES = ["odor", "gill-color", "stalk-surface-above-ring", "ring-type", "spore-print-color", "class"]


def preprocess_features(data):
    selected_features = data[["odor", "gill-color", "stalk-surface-above-ring", "ring-type", "spore-print-color"]]
    processed_features = selected_features.copy()
    return processed_features


def preprocess_targets(data):
    output_targets = pd.DataFrame()
    output_targets["class"] = data["class"]
    return output_targets


def construct_feature_columns(features):
    return {tf.feature_column.numeric_column(my_feature) for my_feature in features}


def input_fn(features, targets, batch_size=1, num_epochs=None):
    features = {key: np.array(value) for key, value in dict(features).items()}

    ds = Dataset.from_tensor_slices((features, targets))
    ds = ds.batch(batch_size).repeat(num_epochs)

    features, labels = ds.make_one_shot_iterator().get_next()
    return features, labels


def train_nn_classifier_model(learning_rate, batch_size, hidden_units, training_examples, training_targets):
    my_optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate)
    my_optimizer = tf.contrib.estimator.clip_gradients_by_norm(my_optimizer, 5.0)
    train_dnn_classifier = tf.estimator.DNNClassifier(feature_columns=construct_feature_columns(training_examples),
                                                      hidden_units=hidden_units, optimizer=my_optimizer)

    training_input_fn = lambda: input_fn(training_examples, training_targets["class"], batch_size)

    print("Training model...")
    train_dnn_classifier.train(input_fn=training_input_fn, steps=100)
    print("Model training finished.")

    return train_dnn_classifier


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
training = preprocess_features(train_set)
training_targets = preprocess_targets(train_set)

# Prepare test
test = preprocess_features(test_set)
test_targets = preprocess_targets(test_set)
test_fn = lambda: input_fn(test, test_targets["class"], 100)

dnn_classifier = train_nn_classifier_model(learning_rate=0.001, batch_size=100, hidden_units=[10, 10],
                                           training_examples=training, training_targets=training_targets)

accuracy_score = dnn_classifier.evaluate(input_fn=test_fn)["accuracy"]

print("\nAccuracy: {0.2f}".format(accuracy_score))