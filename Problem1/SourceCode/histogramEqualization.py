#!/usr/bin/python3
# -*- utf-8 -*-
# Reference: http://blog.csdn.net/jnulzl/article/details/47171549

from matplotlib import pyplot as plt 
import cv2
import numpy as np 

image = cv2.imread("../fig/Fig1.jpg")
image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
plt.figure()
plt.title("Original Image")
plt.imshow(image)

# Histogram
hist = cv2.calcHist([image], [0], None, [256], [0, 256])

plt.figure()
plt.title("Grayscale Histogram")
plt.xlabel("Bins")
plt.ylabel("Number of Pixels")
plt.plot(hist)
plt.xlim([0, 256])

# Histogram Equalization
histeq = cv2.equalizeHist(image)
plt.figure()
plt.title("Histogram Equalization")
plt.imshow(histeq)
plt.show()
