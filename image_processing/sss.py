# -*- coding: utf-8 -*-
"""
Created on Wed May 27 20:33:27 2020sdsdad

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
inimg=plt.imread('lena_512_low1.png')
inimg=np.uint8(255*inimg)

plt.imshow(inimg,'gray',vmin=0,vmax=255)
plt.show()

#Contrast stretching
h,w=inimg.shape
maxval=np.amax(inimg)
minval=np.amin(inimg)
print(maxval,minval)

plt.hist(inimg.flatten(),256,[0,256])
plt.show()

outimg=np.zeros(inimg.shape)
outimg=255*np.float32(inimg[:,:]-minval)/float(maxval-minval)
outimg=np.uint8(outimg)

plt.imshow(outimg,'gray',vmin=0,vmax=255)
plt.show()
plt.hist(outimg.flatten(),256,[0,256])
plt.show()

fig=plt.figure(figsize=(255,255))
sub=fig.add_subplot(2,2,1)
sub1=fig.add_subplot(2,2,2)
sub=plt.hist(outimg.flatten(),256,[0,256])
sub1=plt.imshow(outimg,'gray',vmin=0,vmax=255)
plt.show()