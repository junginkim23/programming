# -*- coding: utf-8 -*-
"""
Created on Wed May 27 17:26:27 2020

@author: USER
"""


import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 
 
#img = scipy.misc.imread('parrot.png', mode='RGB') 
img = plt.imread('parrot.png') 
img = np.uint8(255*img) 
 
plt.imshow(img) 
plt.show() 
 
#gamma correction 
gcorimg = np.power(img/255.0,5) 
gcorimg = gcorimg*255.0 
gcorimg = np.uint8(gcorimg) 
plt.imshow(gcorimg) 
plt.show() 
 
 