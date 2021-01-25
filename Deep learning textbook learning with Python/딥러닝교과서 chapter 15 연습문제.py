#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt
import cv2 #pip install opencv-python
import numpy as np
import time

get_ipython().run_line_magic('matplotlib', 'inline')

def aidemy_imshow(name,img):
    b,g,r=cv2.split(img)
    img=cv2.merge([r,g,b])
    plt.imshow(img)
    plt.show()
    
cv2.imshow=aidemy_imshow


# In[2]:


img=cv2.imread('C:/Users/USER/Desktop/source/cleansing_data/sample.jpg')

cv2.imshow('Original',img)

blur_img=cv2.GaussianBlur(img,(77,77),0)

cv2.imshow('Blur',blur_img)

bit_img=cv2.bitwise_not(img)
cv2.imshow('Bit',bit_img)

retval, thre_img=cv2.threshold(img,90,255,cv2.THRESH_TOZERO)#이미지 용량을 줄이기 위해 일정 이상 밝은 것 또는 일정 이상 어두운 것을 같은 값으로 만들어 버리는 것
cv2.imshow('Thresh',thre_img)

