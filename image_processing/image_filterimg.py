# -*- coding: utf-8 -*-
"""
Created on Wed May 27 17:27:43 2020

@author: USER
"""

#Image filtering 
import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 
 
# A simple lowpass filter 
kernel1 = np.array([[1/9, 1/9, 1/9],                     
                    [1/9, 1/9, 1/9],                     
                    [1/9, 1/9, 1/9]]) 
kernel2 = np.array([[1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49],                     
                    [1/49, 1/49, 1/49, 1/49, 1/49, 1/49, 1/49]])
 
kernel3 = np.array([[1/64, 1/64, 1/64,1/64,1/64,1/25,1/25,1/25],                     
                    [1/64, 1/64, 1/64,1/64,1/64,1/25,1/25,1/25],                     
                    [1/64, 1/64, 1/64,1/64,1/64,1/25,1/25,1/25],
                    [1/64, 1/64, 1/64,1/64,1/64,1/25,1/25,1/25],
                    [1/64, 1/64, 1/64,1/64,1/64,1/25,1/25,1/25],
                    [1/64, 1/64, 1/64,1/64,1/64,1/64,1/25,1/25],
                    [1/64, 1/64, 1/64,1/64,1/64,1/64,1/25,1/25],
                    [1/64, 1/64, 1/64,1/64,1/64,1/64,1/25,1/25]]
                    ) 
#img = scipyipy.misc.imread('parrot.png', mode='RGB') 
img = plt.imread('parrot.png') 
img = np.uint8(255*img) 
 
plt.imshow(img) 
plt.show() 
 
h,w,z = img.shape 
lumimg = img[:,:,0] * 0.2126 + img[:,:,1] * 0.7152 + img[:,:,2] * 0.0722  
 
lowpass = ndimage.convolve(lumimg, kernel1) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:,0] = lowpassc[:,:,1]= lowpassc[:,:,2] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc) 
#plt.show() 
 
lowpass = ndimage.convolve(lumimg, kernel3) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:,0] = lowpassc[:,:,1]= lowpassc[:,:,2] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc) 
plt.show() 

lowpass = ndimage.convolve(lumimg, kernel3) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:,0] = lowpassc[:,:,1]= lowpassc[:,:,2] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc) 
plt.show() 
 
lowpass1= np.zeros(img.shape) 
lowpass1[:,:,0] = ndimage.convolve(np.float32(img[:,:,0]), kernel2) 
lowpass1[:,:,1] = ndimage.convolve(np.float32(img[:,:,1]), kernel2) 
lowpass1[:,:,2] = ndimage.convolve(np.float32(img[:,:,2]), kernel2) 
lowpass1=np.uint8(lowpass1) 
plt.imshow(lowpass1) 
plt.show() 
 