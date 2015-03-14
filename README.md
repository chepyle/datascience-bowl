Python start guide for data science bowl
----------------------------------------

The following set of scripts should be a good way to get started with
[Convolution Neural
Networks](http://en.wikipedia.org/wiki/Convolutional_neural_network).  It uses
a [GraphLab-Create's deep
learning](https://dato.com/learn/userguide/#neural-net-classifier) which is
based on CXXNet. 

* **Setup time**: ~2 mins
* **Train time**: ~20 mins on a GPU (it could take much longer on a CPU)
* **Validation score**: 0.769
* **Leaderboard score**: 0.97


Solution
--------

Here is a quick summary of the submission:

* Load images into an SFrame (scalable dataframe).
* Use [Pillow](https://pypi.python.org/pypi/Pillow/) to augment the data with
  rotations with angle 90, 180, and 270.
* Setup a simple deep learning architecture (based on
  [antinucleon](https://github.com/antinucleon/cxxnet/blob/master/example/kaggle_bowl/bowl.conf]))
* Create a "fair" train, validaiton split to make sure the classes are balanced.
* Train a deep learning model.
* Evaluate the multi-class log loss score.
* Save the predictions in Kaggle's format into a submission file called "submission.csv".


Install
-------
Setup for a fresh Ubuntu EC2 instance with GPUs:
```
curl https://raw.githubusercontent.com/chepyle/datascience-bowl/master/setup.sh | sh

```
The system must reboot, we will add the linux headers files for the NVIDIA installation, the version number must be the same as the OS, use `uname -r` to get your version if there is a problem

```

sudo apt-get install -y linux-source
sudo apt-get install -y linux-headers-3.13.0-46-generic 
sudo bash NVIDIA-Linux-x86_64-346.47.run # go through prompts

```

Then install py packages:

```
cd datascience-bowl

sudo pip install -r requirements-gpu.pip
```
Next, get the  graphlab create key from [https://dato.com/products/create/quick-start-guide.html] and follow directions on writing the configruation file 

To get the data directly from the instance, get the data and sampleSubmision files manually using lynx. Once dowloaded extract the archives:

```
unzip train.zip
unzip test.zip
unzip sampleSubmission.csv.zip
```

LEARN!
------

Once the files are downloaded and extracted, run the following script (takes 30mins):

```
python make_submission.py
```


