#!/usr/bin/env python
# coding: utf-8

# In[2]:


import matplotlib.pyplot as plt
import cv2 #pip install opencv-python
import numpy as np
import time

get_ipython().run_line_magic('matplotlib', 'inline')

def aidemy_imshow(name,img):
    b,g,r=cv2.split(img)
    img=cv2.merge([r,g,b])
    plt.imshow(img)
    plt.show()
    
cv2.imshow=aidemy_imshow


# In[40]:


import cv2
import numpy as np
import argparse
import os
import matplotlib.pyplot as plt


src=cv2.imread('C:/Users/USER/Desktop/data/parrot.png')



dst=cv2.equalizeHist(src)
srcHist = cv2.calcHist(images = [src],
                       channels = [0],
                       mask = None,
                       histSize = [256],
                       ranges = [0, 256])
dsHist= cv2.calcHist(images = [dst],
                       channels = [0],
                       mask = None,
                       histSize = [256],
                       ranges = [0, 256])
cv2.imshow('src',src)
cv2.imshow('dst',dst)


# In[23]:


img_size=(512,512)
type(img_size)

my_img=np.array([[[0,0,255] for _ in range(img_size[1])] for _ in range(img_size[0])],dtype='uint8')

cv2.imshow('sample',my_img)

cv2.imwrite('C:/Users/USER/Desktop/data/my_img.jpg',my_img)


# In[28]:


next_img=np.array([[[0,255,0] for _ in range(img_size[1])] for _ in range(img_size[0])],dtype='uint8')

cv2.imshow('sample1',next_img)
cv2.imwrite('C:/Users/USER/Desktop/data/green1.jpg',next_img)


# In[45]:


size=img.shape
my_img=cv2.resize(img,(img.shape[1]//3,img.shape[0]//3))
cv2.imshow('a',my_img)


# In[54]:


flip_img=cv2.flip(img,1)

cv2.imshow('a',flip_img)


# In[55]:


mat=cv2.getRotationMatrix2D(tuple(np.array(img.shape[:2])/2),180,2.0)

my=cv2.warpAffine(img,mat,img.shape[:2])

cv2.imshow('aa',my)


# In[84]:


my_img=cv2.cvtColor(img,cv2.COLOR_RGB2LAB)
cv2.imshow('sample2',my_img)
my_imgg=cv2.bitwise_not(my_img)
cv2.imshow('sample3',my_imgg)


# In[112]:


for i in range(len(img)):
    for j in range(len(img[i])):
        for k in range(len(img[i][j])):
            img[i][j][k]=255-img[i][j][k]
cv2.imshow('a',img)


# In[117]:


green=cv2.imread('C:/Users/USER/Desktop/data/green1.jpg')
cv2.imshow('a',green)
green.shape


# In[120]:


#임곗값 처리(이진화): 이미지의 용량을 줄이기 위해 일정 이상으로 밝은 것 혹은 일정 이상으로 어두운 것을 모두 같은 값으로 만들어 버리는 것.
retval,my_img1=cv2.threshold(img,100,255,cv2.THRESH_BINARY)

cv2.imshow('threshold',my_img1)


# In[130]:


#마스킹: 이미지의 일부를 추출한다.
lena=cv2.imread('C:/Users/USER/Desktop/data/lena.jpg')
lena_png=cv2.imread('C:/Users/USER/Desktop/data/lena.png',0)#두 번째 인수로 0을 넣으면 채널 수가 1인 이미지로 변환해서 읽는다. 
lena_png=cv2.resize(lena_png,(lena.shape[1],lena.shape[0]))
my_img=cv2.bitwise_and(lena,lena,mask=lena_png)

cv2.imshow('a',my_img)


# In[138]:


im=cv2.imread('C:/Users/USER/Desktop/source/cleansing_data/sample.jpg')

my_img2=cv2.GaussianBlur(im,(999,999),0)

cv2.imshow('a',my_img2)
cv2.imshow('a',im)


# In[140]:


cv2.imshow('s',cv2.fastNlMeansDenoisingColored(my_img2))


# In[150]:


type(my_img2)
filt=np.array([[0,1,0],[1,0,1],[0,1,0]],np.uint8)
my_img=cv2.dilate(img,filt)

cv2.imshow('a',im)

