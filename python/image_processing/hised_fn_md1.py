# -*- coding: utf-8 -*-
"""
Created on Wed Jun 17 15:14:22 2020

@author: USER
"""


import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 
 
'''
0~255 사이의 index를 가지는 1차원 배열 
freg: 각 pixel의 밝기값의 빈도수에 해당
prob: 확률값
cprob: 누적확률분포의 array
eqval: equalization된 값이 대응하는 array
 ㄴ0~255의 밝기값이 각각 어디로 대응되는지를 알려주는 array
 '''

def  histeq_fn(inimg):  
    lumimg = inimg[:,:,0] * 0.2126 + inimg[:,:,1] * 0.7152 + inimg[:,:,2] * 0.0722
    lumimg=np.uint8(lumimg)    
    h,w=lumimg.shape 
    freq=np.zeros(256)   
    prob=np.zeros(256) 
    cprob=np.zeros(256)     
    eqval=np.zeros(256)     
    outimg=np.zeros(lumimg.shape)    
    outimg_ratio=np.zeros(lumimg.shape)
    for i in range(h):       
        for j in range(w):
            pval=lumimg[i,j]          
            freq[pval]=freq[pval]+1    
    for i in range(256):  
        prob[i]=float(freq[i])/float(h*w)       
        if (i>0):          
            cprob[i]=cprob[i-1]+prob[i]       
        else:          
            cprob[i]=prob[i]       
        eqval[i]=round(255*cprob[i])    
    for i in range(h):       
        for j in range(w):
            outimg[i,j]=eqval[lumimg[i,j]]
    #outimg=np.uint8(outimg)
    #outimg_ratio=outimg/lumimg
    
    for i in range(h):
        for j in range(w):
            if outimg[i,j]!=0 and lumimg[i,j]!=0:
                outimg[i,j]=outimg[i,j]
                lumimg[i,j]=lumimg[i,j]
            else: 
                outimg[i,j]=1
                lumimg[i,j]=1
    
    outimg_ratio=outimg/lumimg  
    print(lumimg)
    print('')
    print(outimg)
    #for i in range(h):
     #   for j in range(w):
      #      if outimg_ratio[i,j]==0:
       #         outimg_ratio[i,j]=1
    #outimg_ratio=np.double(outimg_ratio)          
    print(outimg_ratio)
    return(outimg_ratio)     

