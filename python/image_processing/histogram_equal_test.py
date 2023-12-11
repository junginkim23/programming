# -*- coding: utf-8 -*-
"""
Created on Thu Jun  4 18:43:48 2020

@author: USER
"""
import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

img=plt.imread('parrot.png')
plt.imshow(img)
plt.hist(img.flatten(),256,[0,256])