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

#plt.imshow(inimg,'gray',vmin=0,vmax=255)
#plt.show()

#Contrast stretching
h,w=inimg.shape
#maxval=np.amax(inimg)
#minval=np.amin(inimg)
maxval=inimg[0][0]
minval=inimg[0][0]
for i in range(0,inimg.shape[0]):
    for j in range(0,inimg.shape[1]):
            if maxval<=inimg[i][j]:
                    maxval=inimg[i][j]
            elif minval>=inimg[i][j]:
                    minval=inimg[i][j]
print(maxval,minval)

#plt.hist(inimg.flatten(),256,[0,256])
#plt.show()

outimg=np.zeros(inimg.shape)
outimg=255*np.float32(inimg[:,:]-minval)/float(maxval-minval)
outimg=np.uint8(outimg)

#plt.imshow(outimg,'gray',vmin=0,vmax=255)
#plt.show()
#plt.hist(outimg.flatten(),256,[0,256])
#plt.show()

fig=plt.figure(figsize=(6,6))
a=fig.add_subplot(2,2,1)
b=fig.add_subplot(2,2,2)
c=fig.add_subplot(2,2,3)
d=fig.add_subplot(2,2,4)
a.imshow(inimg,'gray',vmin=0,vmax=255)
b.hist(inimg.flatten(),256,[0,256])
c.imshow(outimg,'gray',vmin=0,vmax=255)
d.hist(outimg.flatten(),256,[0,256])
plt.subplots_adjust(wspace=1,hspace=1)
a.set_title('original image')
b.set_title('original image histogram')
c.set_title('contrast stretching image')
d.set_title('stretching image histogram')
b.grid(True)
d.grid(True)
plt.show()