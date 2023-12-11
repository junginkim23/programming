#!/usr/bin/env python
# coding: utf-8

# In[23]:


import os 
import numpy as np
import matplotlib.pyplot as plt
import cv2

def scratch_image(img, flip=True, thr=True,filt=True,resize=True,erode=True):
    methods=[flip,thr,filt,resize,erode]
    
    img_size=img.shape
    filter1=np.ones((3,3))
    
    images=[img]
    
    scratch=np.array([
        lambda x: cv2.flip(x,1),
        lambda x: cv2.threshold(x,100,255,cv2.THRESH_TOZERO)[1],
        lambda x: cv2.GaussianBlur(x,(5,5),0),
        lambda x: cv2.resize(cv2.resize(x,(img_size[1]//5,img_size[0]//5)),(img_size[1],img_size[0])),
        lambda x: cv2.erode(x,filter1)
    ])
    
    act_scratch=scratch[methods]
    
    act_num=np.sum([methods])
    print(act_num)
    form='0'+str(act_num)+'b'
    print(form)

    cf=np.array([list(format(i,form)) for i in range(2**act_num)])
    print(cf)
    images=[]
    for i in range(2**act_num):
        im=img
        for func in act_scratch[cf[i]=='1']:
            im=func(im)
        images.append(im)
    return images

cat_img=cv2.imread('C:/Users/USER/Desktop/source/cleansing_data/cat_sample.jpg')

scratch_cat_images=scratch_image(cat_img)



# In[31]:


format(12,'05b')

