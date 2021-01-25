# -*- coding: utf-8 -*-



import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

img=plt.imread('cap.png')
img = np.uint8(255*img) 
 
a, b,c=img.shape

lum_cnt=np.zeros([768,1])

lumimg = img[:,:,0] * 0.2126 + img[:,:,1] * 0.7152 + img[:,:,2] * 0.0722 
lumimg=np.uint8(lumimg)

for i in range(0,a):
    for j in range(0,b):
        pixel=lumimg[i,j]
        lum_cnt[pixel,]=lum_cnt[pixel,]+1
    
pdf=lum_cnt/(a*b*c)

for i in range(0,767):
    pdf[i+1,]+=pdf[i,]

histo_eq_img=np.zeros((img.shape))

for i in range(0,a):
    for j in range(0,b):
        for h in range(0,c):
            pixel=lumimg[i,j]
            histo_eq_img[i][j][h]=round((255*(float(pdf[pixel,]))))

histo_eq_img=np.uint8(histo_eq_img)


fig=plt.figure(figsize=(6,6))
a=fig.add_subplot(2,2,1)
b=fig.add_subplot(2,2,2)
c=fig.add_subplot(2,2,3)
d=fig.add_subplot(2,2,4)
a.imshow(img,'gray',vmin=0,vmax=255)
b.hist(img.flatten(),256,[0,256])
c.imshow(histo_eq_img,'gray',vmin=0,vmax=255)
d.hist(histo_eq_img.flatten(),256,[0,256])
plt.subplots_adjust(wspace=1,hspace=1) #간격 조절
a.set_title('original image')
b.set_title('original image histogram')
c.set_title('histogram equalization image')
d.set_title('histogram equalization histogram')
b.grid(True)
d.grid(True)
plt.show()