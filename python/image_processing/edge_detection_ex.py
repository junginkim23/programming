# -*- coding: utf-8 -*-
"""
Created on Mon Jun  8 01:54:46 2020

@author: USER
"""


import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 

img=plt.imread('lena.png')
img=np.uint8(255*img)
plt.imshow(img,'gray',vmin=0,vmax=255)
plt.show() 

sobel_x=np.array([[-1/4,0,1/4],[-2/4,0,2/4],[-1/4,0,1/4]])
sobel_y=np.array([[-1/4,-2/4,-1/4],[0,0,0],[1/4,2/4,1/4]])







lowpass=ndimage.convolve(np.float32(img),sobel_x)
lowpassc=np.zeros(img.shape)
lowpassc=lowpass[:,:]

plt.imshow(img,'gray',vmin=0,vmax=255)
plt.show()
plt.imshow(lowpassc,'gray',vmin=0,vmax=255)
plt.show()
