# Project Description
This is a term project from CAP6619 Deep Learning, offered in Florida Atlantic University, taught by Dr. Xingquan Zhu (a wonderful teacher by the way). The goal is to create an end-to-end model that can detect empty parking spots in an aero footage.

The footage used is from here:

[![watch here](https://img.youtube.com/vi/IZ8NPmp0LPk/maxresdefault.jpg)](https://www.youtube.com/watch?v=IZ8NPmp0LPk)

The detection outcome is presented here:

[![watch here](https://img.youtube.com/vi/WmK37HBfnQ8/maxresdefault.jpg)](https://youtu.be/WmK37HBfnQ8)

# Clarification
The basic method used in this project is **NOT mine**. I borrowed it from [this repo](https://github.com/priya-dwivedi/Deep-Learning/tree/master/parking_spots_detector).

Of course, due to the difference in the footage used, some approaches are not the same, but the general idea is the same.

# Documentation
Most of the documentation is available in the notebook. The code is well organized so there is no need repeating them here.

For those interested, a more detailed write up is provided in the `doc/` folder. That write up is also the term project report.

# Project Structure
* `process_data.ipynb`: It includes all the steps in terms of image processing, from obtaining frame from footage, select white parking lines, Canny edge detection, Hough Line Transformation, and drawing onto an image. It also contains the code to execute prediction based on a learned deep neural network.
* `cnn.ipynb`: It contains all the code to train a deep neural network. I have cheated a bit here as I used a pre-trained network to perform feature extraction. In other words, I did not design the full deep neural network by myself.
* `images/`: It contans the key images of the project, such as each stage in image processing, model accuracy plot, and prediction on still image. These images make more sense when viewed along with the notebook or the write up.
* `spot_parked_detection_model/`: This is the trained model. Refer to `cnn.ipynb` for how the model is trained.
* `spot_dict.pickle`: A pickle file of a dictionary where the keys are the pixel coordinates of all the estimated parking spot location. It makes more sense within the context of `process_data.ipynb`.

# Missing Video Files?
Yes, the video files are not uploaded as they can be acquired from YouTube.

# Missing Data Folder?
The data, including training data and sample frames from the video, is shared on [Kaggle](https://www.kaggle.com/fanchenbao/parking-spots). You can read more about how to use the data there.
