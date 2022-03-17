import numpy as np
import tensorflow as tf
import tensorflow.contrib.eager as tfe
import pandas as pd

tfe.enable_eager_execution()

def logistic_regression(inputs):
    return tf.matmul(inputs, W) + b

def loss_fn(inference_fn, inputs, labels):
    return tf.reduce_mean(tf.nn.sparse_softmax_cross_entropy_with_logits(logits=inference_fn(inputs), labels=labels))


data_set = pd.read_csv("credit.csv")

learning_rate = 0.01
num_steps = 10
batch_size = 20
display_step = 100

msk = np.random.rand(len(data_set)) < 0.8
train_set = data_set[msk]
test_set = data_set[~msk]

training = train_set.ix[:, 2]
training_targets = train_set.ix[:, 10]

test = test_set.ix[:, 2]
test_targets = test_set.ix[:, 10]

n_samples = len(train_set)

W = tfe.Variable(tf.zeros([2, 2]), name='weights')
b = tfe.Variable(tf.zeros([2]), name='bias')

optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate)

grad = tfe.implicit_gradients(loss_fn)

average_loss = 0.
for step in range(num_steps):

    try:
        d = dataset_iter.next()
    except StopIteration:
        dataset_iter = tfe.Iterator(dataset)
        d = dataset_iter.next()

    x_batch = d[0]
    y_batch = tf.cast(d[1], dtype=tf.string)

    # Compute the batch loss
    batch_loss = loss_fn(logistic_regression, x_batch, y_batch)
    average_loss += batch_loss

    if step == 0:
        # Display the initial cost, before optimizing
        print("Initial loss= {:.9f}".format(average_loss))

    # Update the variables following gradients info
    optimizer.apply_gradients(grad(logistic_regression, x_batch, y_batch))

    # Display info
    if (step + 1) % display_step == 0 or step == 0:
        if step > 0:
            average_loss /= display_step
        print("Step:", '%04d' % (step + 1), " loss=",
              "{:.9f}".format(average_loss), " accuracy=")
        average_loss = 0.