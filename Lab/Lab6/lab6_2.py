import tensorflow as tf
import pandas as pd
import numpy as np
from sklearn import preprocessing
from tensorflow.python.data import Dataset


def preprocess_features(data):
    selected_features = data[["Telephone"]]
    processed_features = selected_features.copy()
    return processed_features


def preprocess_targets(data):
    output_targets = pd.DataFrame()
    output_targets["Class"] = data["Class"]
    return output_targets


def construct_feature_columns(features):
    return {tf.feature_column.numeric_column(my_feature) for my_feature in features}


def input_fn(features, targets, batch_size=1, num_epochs=None):
    features = {key: np.array(value) for key, value in dict(features).items()}

    ds = Dataset.from_tensor_slices((features, targets))
    ds = ds.batch(batch_size).repeat(num_epochs)

    features, labels = ds.make_one_shot_iterator().get_next()
    return features, labels


def train_linear_classifier_model(learning_rate, batch_size, training_examples, training_targets):
    my_optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate)
    my_optimizer = tf.contrib.estimator.clip_gradients_by_norm(my_optimizer, 5.0)
    linear_classifier = tf.estimator.LinearClassifier(
        feature_columns=construct_feature_columns(training_examples),
        optimizer=my_optimizer
    )

    training_input_fn = lambda: input_fn(training_examples, training_targets["Class"], batch_size)

    print "Training model..."
    linear_classifier.train(input_fn=training_input_fn, steps=100)
    print "Model training finished."

    return linear_classifier


data_set = pd.read_csv("credit.csv")
encoder = preprocessing.LabelEncoder()
encoder.fit(data_set["Class"])
data_set["Class"] = encoder.transform(data_set["Class"])

msk = np.random.rand(len(data_set)) < 0.8
train_set = data_set[msk]
test_set = data_set[~msk]

# Prepare training
training = preprocess_features(train_set)
training_targets = preprocess_targets(train_set)

# Prepare test
test = preprocess_features(test_set)
test_targets = preprocess_targets(test_set)
test_fn = lambda: input_fn(test, test_targets["Class"])

linear_classifier = train_linear_classifier_model(learning_rate=0.001, batch_size=100, training_examples=training,
                                                  training_targets=training_targets)

accuracy_score = linear_classifier.evaluate(input_fn=test_fn)["accuracy"]

print("\nAccuracy: {0.2f}".format(accuracy_score))