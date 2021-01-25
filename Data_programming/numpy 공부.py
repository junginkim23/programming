#!/usr/bin/env python
# coding: utf-8

# In[30]:


import numpy as np

arr=np.array([[1,2],[1,4]])
arr[np.array([[True,True],[True,False]])]

arr1=np.arange(5)
arr1[np.array([True,False,False,False,False])]

print(arr1[np.array([True,True,True,False,False])])

arr2=np.array([[1,2],[1,3],[4,2]])
print(arr2[np.array([[True,True],[False,True],[True,True]])])
print(arr)


# In[ ]:




