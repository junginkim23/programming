# -*- coding: utf-8 -*-
"""
Created on Thu Jun  4 18:33:52 2020

@author: USER
"""


import cv2
import os
import matplotlib.pyplot as plt

def hisEqulColor(img):
    ycrcb=cv2.cvtColor(img,cv2.COLOR_BGR2YCR_CB)
    channels=cv2.split(ycrcb)
    print(len(channels))
    cv2.equalizeHist(channels[0],channels[0])
    cv2.merge(channels,ycrcb)
    cv2.cvtColor(ycrcb,cv2.COLOR_YCR_CB2BGR,img)
    return img


fname='cap.png'
img=cv2.imread(fname)

plt.hist(img.flatten(),256,[0,256])
plt.show()


cv2.imshow('img', img)
img2=hisEqulColor(img)
cv2.imshow('img2',img2)


plt.hist(img2.flatten(),256,[0,256])
plt.show()
