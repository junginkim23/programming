# -*- coding: utf-8 -*-
"""
Created on Wed May 27 17:16:13 2020

@author: USER
"""
import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

def threshold_fn(inimg):
    h,w,z=img.shape
    outimg=np.zeros([h,w])
    
    for i in range(h):
        for j in range(w):
            if(lumimg[i,j]>=0):
                outimg[i,j]=255
            else:
                outimg[i,j]=0
    return outimg
    
#img=scipy.misc.imread('parrot.png',mode='RGB)
img=plt.imread('window.png')
img=np.uint8(255*img)

plt.imshow(img)
plt.show()

#Image threshold
h,w,z=img.shape
lumimg=img[:,:,0] * 0.2126 + img[:,:,1] * 0.7152 + img[:,:,2] * 0.0722
lumimg = np.uint8(lumimg) 
imgthres = np.zeros([h,w]) 
for i in range(h): 
    for j in range(w): 
         if (lumimg[i,j]>=180): 
             imgthres[i,j]=255
         else:
            imgthres[i,j]=0
imgthrescolor=np.zeros(img.shape)
imgthrescolor[:,:,0] = imgthrescolor[:,:,1]= imgthrescolor[:,:,2] = imgthres[:,:] 
plt.imshow(imgthrescolor) 
plt.show() 

imgthres_fn = threshold_fn(img) 
imgthrescolor = np.zeros(img.shape) 
imgthrescolor[:,:,0] = imgthrescolor[:,:,1]= imgthrescolor[:,:,2] = imgthres_fn[:,:] 
plt.imshow(imgthrescolor) 
plt.show()  
