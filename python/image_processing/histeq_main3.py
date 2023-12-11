# -*- coding: utf-8 -*-
"""
Created on Wed Jun 17 13:56:04 2020

@author: USER
"""


import scipy 
import numpy as np
from scipy import ndimage
import matplotlib.pyplot as plt
import hised_fn_md2

inimg = plt.imread('bike_low.png') 
inimg = np.uint8(255*inimg) 
lumimg=inimg[:,:,0]*0.2126+inimg[:,:,1]*0.7152+inimg[:,:,2]*0.0722
lumimg=np.uint8(lumimg)    
outimg_ratio=np.zeros(lumimg.shape)
out_img=np.zeros(lumimg.shape)
new_image=np.zeros(inimg.shape)
h,w,z=inimg.shape

plt.figure(figsize=(6,4))
plt.imshow(inimg) 
plt.title('original image')
plt.show() 
 
plt.figure(figsize=(6,4))
plt.hist(inimg.flatten(),256,[0,256]) 
plt.title('original image histogram')
plt.show() 
 
plt.figure(figsize=(6,4))
out_img = hised_fn_md2.histeq_fn(lumimg)
for i in range(h):
    for j in range(w):
        if lumimg[i,j] == 0:
            out_img[i,j] = out_img[i,j]
        else:
            outimg_ratio[i,j] = out_img[i,j] / lumimg[i,j]

new_image[:,:,0]=inimg[:,:,0]*outimg_ratio
new_image[:,:,1]=inimg[:,:,1]*outimg_ratio
new_image[:,:,2]=inimg[:,:,2]*outimg_ratio

for i in range(h):
    for j in range(w):
        for k in range(z):
            if new_image[i,j,k]>255:
                new_image[i,j,k]=255
new_image=np.uint8(new_image)
plt.title('equalization image')      
plt.imshow(new_image) 
plt.show() 
 
plt.figure(figsize=(6,4))
plt.hist(new_image.flatten(),256,[0,256]) 
plt.title('equalization image histogram')
plt.show() 