
import scipy
import numpy as np
from scipy import ndimage
from matplotlib import pyplot as plt

img=plt.imread('parrot_low.png')
img = np.uint8(255*img) 

a,b,c=img.shape

lum_cnt=np.zeros((256,1))

for i in range(a):
    for j in range(b):
        for h in range(c):
            pixel=img[i,j,h]
            lum_cnt[pixel,]=lum_cnt[pixel,]+1
    
pdf=lum_cnt/(a*b*c)

for i in range(0,255):
    pdf[i+1,]+=pdf[i,]

histo_eq_img=np.zeros(img.shape)

for i in range(a):
    for j in range(b):
        for h in range(c):
            pixel=img[i,j,h]
            histo_eq_img[i][j][h]=np.round((255*((pdf[pixel,]))))

histo_eq_img=np.uint8(histo_eq_img)


fig=plt.figure(figsize=(8,6))
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