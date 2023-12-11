# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 14:11:51 2020

@author: USER
"""


import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

img=plt.imread('parrot.png')
img=np.uint8(255*img) 


lumimg = img[:,:,0] * 0.2126 + img[:,:,1] * 0.7152 + img[:,:,2] * 0.0722 
Cb=0.5*((img[:,:,2]-lumimg)/(1-0.0722))
Cr=0.5*((img[:,:,1]-lumimg)/(1-0.2126))

lumimg = np.uint8(255*lumimg)
Cb=np.uint8(255*Cb)
Cr=np.uint8(255*Cr)
row, col,h=img.shape
lum_cnt=np.zeros((256,1))
cb_cnt=np.zeros((256,1))
cr_cnt=np.zeros((256,1))

for i in range(0,row):
    for j in range(0,col):
        pixel1=lumimg[i,j]
        pixel2=Cb[i,j]
        pixel3=Cr[i,j]
        lum_cnt[pixel1,]=lum_cnt[pixel1,]+1
        cb_cnt[pixel2,]=cb_cnt[pixel2,]+1
        cr_cnt[pixel3,]=cr_cnt[pixel3,]+1
    
pdf1=lum_cnt/(row*col)
pdf2=cb_cnt/(row*col)
pdf3=cr_cnt/(row*col)

for i in range(0,255):
    pdf1[i+1,]+=pdf1[i,]
    pdf2[i+1,]+=pdf2[i,]
    pdf3[i+1,]+=pdf3[i,]

histo_eq_img1=np.zeros((row,col))
histo_eq_img2=np.zeros((row,col))
histo_eq_img3=np.zeros((row,col))

for i in range(0,row):
    for j in range(0,col):
        pixel1=lumimg[i,j]
        pixel2=Cb[i,j]
        pixel3=Cr[i,j]
        histo_eq_img1[i][j]=np.round((255*(pdf1[pixel1,])))
        histo_eq_img2[i][j]=np.round((255*(pdf2[pixel2,])))
        histo_eq_img3[i][j]=np.round((255*(pdf3[pixel3,])))
        
histo_eq_img=np.zeros(img.shape)
histo_eq_img[:,:,0]=(histo_eq_img1+2*histo_eq_img3*(1-0.2126))
histo_eq_img[:,:,1]=(histo_eq_img1-histo_eq_img3*(2*0.2126*(1-0.2126))/0.7152-histo_eq_img2*(2*0.0722*(1-0.0722))/0.7152)
histo_eq_img[:,:,2]=(histo_eq_img1+2*histo_eq_img2*(1-0.7152))


histo_eq_img=np.uint8(255*histo_eq_img)


fig=plt.figure(figsize=(6,6))
a=fig.add_subplot(2,2,1)
b=fig.add_subplot(2,2,2)
c=fig.add_subplot(2,2,3)
d=fig.add_subplot(2,2,4)
a.imshow(img)
b.hist(img.flatten(),256,[0,256])
c.imshow(histo_eq_img)
d.hist(histo_eq_img.flatten(),256,[0,256])
plt.subplots_adjust(wspace=1,hspace=1) #간격 조절
a.set_title('original image')
b.set_title('original image histogram')
c.set_title('histogram equalization image')
d.set_title('histogram equalization histogram')
b.grid(True)
d.grid(True)
plt.show()