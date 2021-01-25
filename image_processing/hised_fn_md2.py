# -*- coding: utf-8 -*-
"""
Created on Fri Jun 19 11:44:30 2020

@author: USER
"""




import scipy 
import numpy as np 
from scipy import ndimage 
from matplotlib import pyplot as plt 
 
def  histeq_fn(img): 
    h,w=img.shape 
    freq=np.zeros(256)   
    prob=np.zeros(256) 
    cprob=np.zeros(256)     
    eqval=np.zeros(256)     
    outimg=np.zeros(img.shape)    
    for i in range(h):       
        for j in range(w):
            pval=img[i,j]          
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
            outimg[i,j]=eqval[img[i,j]]
    return(outimg)     

