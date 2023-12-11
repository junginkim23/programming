# -*- coding: utf-8 -*-
"""
Created on Wed Jun 17 13:49:25 2020

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
    h,w,z=inimg.shape    
    freq=np.zeros((256,3))    
    prob=np.zeros((256,3)) 
    cprob=np.zeros((256,3))     
    eqval=np.zeros((256,3))     
    outimg=np.zeros(inimg.shape)    
    for i in range(h):       
        for j in range(w):
            for k in range(z):
                pval=inimg[i,j,k]          
                freq[pval,k]=freq[pval,k]+1    
    for i in range(256):  
        for k in range(z):
            prob[i,k]=float(freq[i,k])/float(h*w)       
            if (i>0):          
                cprob[i,k]=cprob[i-1,k]+prob[i,k]       
            else:          
                cprob[i,k]=prob[i,k]       
            eqval[i,k]=np.round(255*cprob[i,k])
    for i in range(h):       
        for j in range(w):
            for k in range(z):
                outimg[i,j,k]=eqval[inimg[i,j,k],k] 
    outimg = np.uint8(outimg)
    return(outimg) 
 
 