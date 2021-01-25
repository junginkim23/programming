# -*- coding: utf-8 -*-
"""
Created on Mon Jun  8 15:24:33 2020

@author: USER
"""

#Edge detection
 
import numpy as np 
from scipy import ndimage  

def makeEdge(image,Thresh):
    sobel_y=1/4*np.array([[-1,-2,-1],[0,0,0],[1,2,1]])
    sobel_x=np.transpose(sobel_y)
    h,w=image.shape  
    gradient=np.zeros([h,w])

    gradient_X=ndimage.convolve(np.float32(image),sobel_x)
    gradient_Y=ndimage.convolve(np.float32(image),sobel_y)

    p_g_X=np.power(gradient_X,2)
    p_g_Y=np.power(gradient_Y,2)
    gradient=np.sqrt(p_g_X+p_g_Y)
    
    gradient=np.uint8(gradient)
    edge=np.zeros([h,w])    
    
    for i in range(h):
        for j in range(w):          
            if (gradient[i,j]>Thresh):          
                edge[i,j]=255
            else: 
                edge[i,j]=0
    return edge
            









