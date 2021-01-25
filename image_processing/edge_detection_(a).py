# -*- coding: utf-8 -*-
"""
Created on Mon Jun  8 00:39:58 2020

@author: USER
"""

#Edge detection

import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 



img=plt.imread('lena.png')
img=np.uint8(255*img)


plt.imshow(img,'gray',vmin=0,vmax=255)
plt.title('original image')
plt.show() 


sobel_y=np.array([[-1,-2,-1],[0,0,0],[1,2,1]])
sobel_x=np.transpose(sobel_y)

h,w=img.shape  
gradient=np.zeros([h,w])

gradient_X=ndimage.convolve(np.float32(img),sobel_x)
gradient_Y=ndimage.convolve(np.float32(img),sobel_y)

#p_g_X=np.power(gradient_X,2)
#p_g_Y=np.power(gradient_Y,2)

gradient=np.abs(gradient_X)+np.abs(gradient_Y)

#gradient=np.uint8(gradient)

edge=np.zeros(img.shape)    
Thresh=128

for i in range(h):
    for j in range(w):          
        if (gradient[i,j]>Thresh):          
            edge[i,j]=255
        else: 
            edge[i,j]=0

            
plt.imshow(edge,'gray',vmin=0,vmax=255)
plt.title('(a)')
plt.show() 










