# -*- coding: utf-8 -*-
"""
Created on Wed Jun 17 13:46:25 2020

@author: USER
"""


import scipy 
import numpy as np
from scipy import ndimage
import matplotlib.pyplot as plt
import histeq_fn_md



inimg = plt.imread('bike_low.png') 
inimg = np.uint8(255*inimg) 

plt.figure(figsize=(6,4))
plt.imshow(inimg,vmin=0,vmax=255) 
plt.title('original image')
plt.show() 
 
#Histogram equalization h,w = inimg.shape 
plt.figure(figsize=(6,4)) 
plt.hist(inimg.flatten(),256,[0,256]) 
plt.title('original image histogram')
plt.show() 

plt.figure(figsize=(6,4)) 
outimg = histeq_fn_md.histeq_fn(inimg)   
plt.title('equalization image')          
plt.imshow(outimg) 
plt.show() 
 
plt.figure(figsize=(6,4))
plt.hist(outimg.flatten(),256,[0,256]) 
plt.title('equalization image histogram')
plt.show() 
 
#scipy.misc.imsave('outimg.png',outimg) 