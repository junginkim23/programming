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

#Contrast stretching method
def cont_st(image):    
    h,w=image.shape
    #maxval=np.amax(image)
    maxval=image[0][0]
    minval=image[0][0]
    for i in range(0,image.shape[0]):
        for j in range(0,image.shape[1]):
           
            if maxval<=image[i][j]:
                maxval=image[i][j]
            elif minval>=image[i][j]:
                minval=image[i][j]
    #minval=np.amin(image)
    print(maxval,minval)
    outimg=np.zeros(image.shape)
    outimg=255*np.float32(image[:,:]-minval)/float(maxval-minval)
    outimg=np.uint8(outimg)
    return outimg

fig=plt.figure(figsize=(6,6))
a=fig.add_subplot(2,2,1)
b=fig.add_subplot(2,2,2)
c=fig.add_subplot(2,2,3)
d=fig.add_subplot(2,2,4)
a.imshow(inimg,'gray',vmin=0,vmax=255)
b.hist(inimg.flatten(),256,[0,256])
c.imshow(cont_st(inimg),'gray',vmin=0,vmax=255)
d.hist(cont_st(inimg).flatten(),256,[0,256])
plt.subplots_adjust(wspace=1,hspace=1)
a.set_title('original image')
b.set_title('original image histogram')
c.set_title('contrast stretching image')
d.set_title('stretching image histogram')
b.grid(True)
d.grid(True)
plt.show()
