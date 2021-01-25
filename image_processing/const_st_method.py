# -*- coding: utf-8 -*-
"""
Created on Wed May 27 21:11:13 2020

@author: USER
"""


# -*- coding: utf-8 -*-
"""
Created on Wed May 27 17:07:23 2020

@author: USER
"""
import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

#inimg=scipy.misc.imread('lena_512_low1.png,mode='L')
inimg=plt.imread('lena.png')
inimg=np.uint8(255*inimg)

plt.imshow(inimg,'gray',vmin=0,vmax=255)
plt.show()
#Contrast stretching method
def cont_st(image):    
    h,w=image.shape
    maxval=np.amax(image)
    minval=np.amin(image)
    print(maxval,minval)
    outimg=np.zeros(image.shape)
    outimg=255*np.float32(image[:,:]-minval)/float(maxval-minval)
    outimg=np.uint8(outimg)
    return outimg
plt.hist(inimg.flatten(),256,[0,256])
plt.show()

plt.imshow(cont_st(inimg),'gray',vmin=0,vmax=255)
plt.show()
