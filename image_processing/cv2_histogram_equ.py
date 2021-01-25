# -*- coding: utf-8 -*-
"""
Created on Thu Jun  4 17:54:37 2020

@author: USER

"""
import cv2 
import matplotlib.pyplot as plt
import numpy as np

image=cv2.imread('cap.png')


def aidemy_imshow(name,img):
  b,g,r=cv2.split(img)
  img=cv2.merge([r,g,b])
  plt.imshow(img)
  plt.show()

cv2.imshow=aidemy_imshow

img_yuv = cv2.cvtColor(image, cv2.COLOR_BGR2YUV)

# equalize the histogram of the Y channel

img_yuv[:,:,0] = cv2.equalizeHist(img_yuv[:,:,0])

# convert the YUV image back to RGB format
img_output = cv2.cvtColor(img_yuv, cv2.COLOR_YUV2BGR)

cv2.imshow('Color input image', image)
cv2.imshow('Histogram equalized', img_output)
cv2.imwrite('new_result.png',img_output)
plt.hist(img_output.flatten(),256,[0,256])
plt.show()
plt.hist(image.flatten(),256,[0,256])
plt.show()
cv2.waitKey(0)
