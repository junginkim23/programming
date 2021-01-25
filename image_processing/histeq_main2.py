# -*- coding: utf-8 -*-
"""
Created on Wed Jun 17 13:56:04 2020

@author: USER
"""


import scipy 
import numpy as np
from scipy import ndimage
import matplotlib.pyplot as plt
import hised_fn_md1

inimg = plt.imread('parrot_low.png') 
inimg = np.uint8(255*inimg) 

plt.figure(figsize=(6,4))
plt.imshow(inimg) 
plt.title('original image')
plt.show() 
 
plt.figure(figsize=(6,4))
plt.hist(inimg.flatten(),256,[0,256]) 
plt.title('original image histogram')
plt.show() 
 
new_image=np.zeros(inimg.shape)
plt.figure(figsize=(6,4))
outimg_ratio = hised_fn_md1.histeq_fn(inimg)  
new_image[:,:,0]=inimg[:,:,0]*outimg_ratio
new_image[:,:,1]=inimg[:,:,1]*outimg_ratio
new_image[:,:,2]=inimg[:,:,2]*outimg_ratio
new_image=np.uint8(new_image)
plt.title('equalization image')      
plt.imshow(new_image) 
plt.show() 
 
plt.figure(figsize=(6,4))
plt.hist(new_image.flatten(),256,[0,256]) 
plt.title('equalization image histogram')
plt.show() 
 
#scipy.misc.imsave('outimg.png',outimg) 