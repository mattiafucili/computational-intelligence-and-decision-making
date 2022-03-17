import tensorflow as tf
import pandas as pd
import numpy as np
from sklearn import preprocessing

n_nodes_hl1 = 50
n_nodes_hl2 = 50

n_classes = 2
batch_size = 100

x = tf.placeholder("float", [None, 5])
y = tf.placeholder("float")

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


def neural_network_model(data):
    hidden_1_layer = {'weights': tf.Variable(tf.random_normal([5, n_nodes_hl1])),
                      'biases': tf.Variable(tf.random_normal([n_nodes_hl1]))}

    hidden_2_layer = {'weights': tf.Variable(tf.random_normal([n_nodes_hl1, n_nodes_hl2])),
                      'biases': tf.Variable(tf.random_normal([n_nodes_hl2]))}

    output_layer = {'weights': tf.Variable(tf.random_normal([n_nodes_hl2, n_classes])),
                    'biases': tf.Variable(tf.random_normal([n_classes])), }

    l1 = tf.add(tf.matmul(data, hidden_1_layer['weights']), hidden_1_layer['biases'])
    l1 = tf.nn.relu(l1)

    l2 = tf.add(tf.matmul(l1, hidden_2_layer['weights']), hidden_2_layer['biases'])
    l2 = tf.nn.relu(l2)

    output = tf.matmul(l2, output_layer['weights']) + output_layer['biases']

    return output


def train_neural_network():
    prediction = neural_network_model(x)
    cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(logits=prediction, labels=y))
    optimizer = tf.train.AdamOptimizer().minimize(cost)

    hm_epochs = 10
    with tf.Session() as sess:
        sess.run(tf.global_variables_initializer())

        for epoch in range(hm_epochs):
            epoch_loss = 0
            i = 0
            while i < len(train):
                start = i
                end = i + batch_size
                batch_x = np.array(train[start:end])
                batch_y = np.array(train_targets[start:end])

                _, c = sess.run([optimizer, cost], feed_dict={x: batch_x, y: batch_y})
                epoch_loss += c
                i += batch_size

            print('Epoch', epoch, 'completed out of', hm_epochs, 'loss:', epoch_loss)

        correct = tf.equal(tf.argmax(prediction, 1), tf.argmax(y, 1))

        accuracy = tf.reduce_mean(tf.cast(correct, 'float'))
        print('Accuracy:', accuracy.eval({x: test, y: test_targets}))


# Train & test set
data_set = pd.read_csv("mushrooms.csv")
# for i in range(len(FEATURES)):
#     encoder = preprocessing.LabelEncoder()
#     encoder.fit(data_set[FEATURES[i]])
#     data_set[FEATURES[i]] = encoder.transform(data_set[FEATURES[i]])
for i in range(len(FEATURES)):
    feature = FEATURES[i]
    if feature == "class":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "e":
                data_set[feature][j] = np.float32(1.0)
            else:
                data_set[feature][j] = np.float32(2.0)
    elif feature == "odor":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "a":
                data_set[feature][j] = np.float32(1.0)
            elif data_set[feature][j] == "c":
                data_set[feature][j] = np.float32(2.0)
            elif data_set[feature][j] == "f":
                data_set[feature][j] = np.float32(3.0)
            elif data_set[feature][j] == "l":
                data_set[feature][j] = np.float32(4.0)
            elif data_set[feature][j] == "m":
                data_set[feature][j] = np.float32(5.0)
            elif data_set[feature][j] == "n":
                data_set[feature][j] = np.float32(6.0)
            elif data_set[feature][j] == "p":
                data_set[feature][j] = np.float32(7.0)
            elif data_set[feature][j] == "s":
                data_set[feature][j] = np.float32(8.0)
            elif data_set[feature][j] == "y":
                data_set[feature][j] = np.float32(9.0)
    elif feature == "gill-color":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "b":
                data_set[feature][j] = np.float32(1.0)
            elif data_set[feature][j] == "e":
                data_set[feature][j] = np.float32(2.0)
            elif data_set[feature][j] == "g":
                data_set[feature][j] = np.float32(3.0)
            elif data_set[feature][j] == "h":
                data_set[feature][j] = np.float32(4.0)
            elif data_set[feature][j] == "k":
                data_set[feature][j] = np.float32(5.0)
            elif data_set[feature][j] == "n":
                data_set[feature][j] = np.float32(6.0)
            elif data_set[feature][j] == "o":
                data_set[feature][j] = np.float32(7.0)
            elif data_set[feature][j] == "p":
                data_set[feature][j] = np.float32(8.0)
            elif data_set[feature][j] == "r":
                data_set[feature][j] = np.float32(9.0)
            elif data_set[feature][j] == "u":
                data_set[feature][j] = np.float32(10.0)
            elif data_set[feature][j] == "w":
                data_set[feature][j] = np.float32(11.0)
            elif data_set[feature][j] == "y":
                data_set[feature][j] == np.float32(12.0)
    elif feature == "stalk-surface-above-ring":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "f":
                data_set[feature][j] = np.float32(1.0)
            elif data_set[feature][j] == "k":
                data_set[feature][j] = np.float32(2.0)
            elif data_set[feature][j] == "s":
                data_set[feature][j] = np.float32(3.0)
            elif data_set[feature][j] == "y":
                data_set[feature][j] = np.float32(4.0)
    elif feature == "ring-type":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "c":
                data_set[feature][j] = np.float32(1.0)
            elif data_set[feature][j] == "e":
                data_set[feature][j] = np.float32(2.0)
            elif data_set[feature][j] == "f":
                data_set[feature][j] = np.float32(3.0)
            elif data_set[feature][j] == "l":
                data_set[feature][j] = np.float32(4.0)
            elif data_set[feature][j] == "n":
                data_set[feature][j] = np.float32(5.0)
            elif data_set[feature][j] == "p":
                data_set[feature][j] = np.float32(6.0)
            elif data_set[feature][j] == "s":
                data_set[feature][j] = np.float32(7.0)
            elif data_set[feature][j] == "z":
                data_set[feature][j] = np.float32(8.0)
    elif feature == "spore-print-color":
        for j in xrange(len(data_set[feature])):
            if data_set[feature][j] == "b":
                data_set[feature][j] = np.float32(1.0)
            elif data_set[feature][j] == "h":
                data_set[feature][j] = np.float32(2.0)
            elif data_set[feature][j] == "k":
                data_set[feature][j] = np.float32(3.0)
            elif data_set[feature][j] == "n":
                data_set[feature][j] = np.float32(4.0)
            elif data_set[feature][j] == "o":
                data_set[feature][j] = np.float32(5.0)
            elif data_set[feature][j] == "r":
                data_set[feature][j] = np.float32(6.0)
            elif data_set[feature][j] == "u":
                data_set[feature][j] = np.float32(7.0)
            elif data_set[feature][j] == "w":
                data_set[feature][j] = np.float32(8.0)
            elif data_set[feature][j] == "y":
                data_set[feature][j] = np.float32(9.0)

msk = np.random.rand(len(data_set)) < 0.8
train_set = data_set[msk]
test_set = data_set[~msk]

# Prepare train
train = preprocess_features(train_set)
train_targets = preprocess_targets(train_set)

# Prepare test
test = preprocess_features(test_set)
test_targets = preprocess_targets(test_set)

train_neural_network()