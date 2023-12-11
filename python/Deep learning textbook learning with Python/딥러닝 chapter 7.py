#!/usr/bin/env python
# coding: utf-8

# In[19]:


import pandas as pd
import numpy as np
arr=np.arange(9).reshape(3,3)
arr.sum(axis=1)


# In[22]:


arr


# In[42]:


print(arr.max(axis=0))
print(arr.min())
print(arr.mean(axis=0))#열의 평균
print(arr.argmax(axis=0))
print(arr.argmin(axis=1))
print(np.average(arr))
print(np.std(arr))#표준편차
print(np.var(arr))#분산 


# In[47]:


np.array([np.arange(4)])


# In[57]:


np.array([1,2,3])#np.array(리스트)
np.arange(10)#np.arange(인수) => 둘 다 배열 만드는 함수.

