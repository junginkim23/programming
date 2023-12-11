# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 16:15:46 2020

@author: USER
"""

import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

img=plt.imread('lena.png')
img = np.uint8(255*img) 
 

def hist_img(image):
    row, col=image.shape
    lum_cnt=np.zeros((256,1))

    for i in range(0,row):
        for j in range(0,col):
            pixel=image[i,j]
            lum_cnt[pixel,]=lum_cnt[pixel,]+1
    print(pixel)
    pdf=lum_cnt/(row*col)

    for i in range(0,255):
        pdf[i+1,]+=pdf[i,]

    hist_img=np.zeros((row,col))

    for i in range(0,row):
        for j in range(0,col):
            pixel=image[i,j]
            hist_img[i][j]=round((255*(float(pdf[pixel,]))))

    hist_img=np.uint8(hist_img)
    return hist_img

plt.imshow(img,'gray',vmin=0,vmax=255)
plt.show()
plt.hist(img.flatten(),256,[0,256])
plt.show()
plt.imshow(hist_img(img),'gray',vmin=0,vmax=255)
plt.show()
plt.hist(hist_img(img).flatten(),256,[0,256])
plt.show()
