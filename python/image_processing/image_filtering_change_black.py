# -*- coding: utf-8 -*-
"""
Created on Wed May 27 19:55:18 2020

@author: USER
"""
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
kernel3 = np.array([[1/25, 1/25, 1/25,1/25,1/25],                     
                    [1/25, 1/25, 1/25,1/25,1/25],                     
                    [1/25, 1/25, 1/25,1/25,1/25],
                    [1/25, 1/25, 1/25,1/25,1/25],
                    [1/25, 1/25, 1/25,1/25,1/25]]) 
#img = scipyipy.misc.imread('parrot.png', mode='RGB') 
img = plt.imread('lena_512_noise.png') 
img = np.uint8(255*img) 
 
plt.imshow(img,'gray',vmin=0,vmax=255) 
plt.show() 
 
h,w = img.shape 
lumimg = img[:,:]
 
lowpass = ndimage.convolve(lumimg, kernel1) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc,'gray',vmin=0,vmax=255) 
plt.show() 
 
lowpass = ndimage.convolve(lumimg, kernel3) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc,'gray',vmin=0,vmax=255) 
plt.show() 

lowpass = ndimage.convolve(lumimg, kernel2) 
lowpassc= np.zeros(img.shape) 
lowpassc[:,:] = lowpass[:,:] 
lowpassc=np.uint8(lowpassc) 
plt.imshow(lowpassc,'gray',vmin=0,vmax=255) 
plt.show() 

 
#lowpass1= np.zeros(img.shape) 
#lowpass1[:,:,0] = ndimage.convolve(np.float32(img[:,:,0]), kernel2) 
#lowpass1[:,:,1] = ndimage.convolve(np.float32(img[:,:,1]), kernel2) 
#lowpass1[:,:,2] = ndimage.convolve(np.float32(img[:,:,2]), kernel2) 
#lowpass1=np.uint8(lowpass1) 
#plt.imshow(lowpass1) 
#plt.show() 
 

