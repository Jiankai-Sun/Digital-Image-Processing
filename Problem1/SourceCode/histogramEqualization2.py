#!/usr/bin/python3
# -*- utf-8 -*-
# Reference: http://blog.csdn.net/jnulzl/article/details/47171549

from matplotlib import pyplot as plt 
import cv2
import numpy as np 
from skimage import exposure

image = cv2.imread("../fig/Fig1.jpg")
# image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
plt.figure()
plt.title("Original Image")
plt.imshow(image)

# Histogram
hist1 = np.histogram(image, bins=2)  # Calculate histogram with numpy
hist2 = exposure.histogram(image, nbins=2)  # Calculate histogram with skimage
plt.figure("Grayscale Histogram")
arr = image.flatten()
n, bins, patches = plt.hist(arr, bins=256, normed=1, facecolor='black', edgecolor='black')

# Histogram Equalization
img1 = exposure.equalize_hist(image)
arr1 = img1.flatten()
plt.figure("Image after Histogram Equalization")
plt.imshow(img1, plt.cm.gray)  # Image after Histogram Equalization
plt.figure("Histogram Equalization")
plt.hist(arr1, bins=256, normed=1, edgecolor='None', facecolor='red')
plt.show()