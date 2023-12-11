# -*- coding: utf-8 -*-
"""
Created on Wed Jun 10 14:33:18 2020

@author: USER
"""


import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt
import edge_fn

img=plt.imread('lena.png')
img=np.uint8(255*img)

plt.imshow(img,'gray',vmin=0,vmax=255)
plt.title('original image')
plt.show() 
            
plt.imshow(edge_fn.makeEdge(img,25),'gray',vmin=0,vmax=255)
plt.title('(c)')
plt.show() 
