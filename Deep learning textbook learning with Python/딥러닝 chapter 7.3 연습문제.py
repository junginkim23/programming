#!/usr/bin/env python
# coding: utf-8

# In[41]:


import numpy as np

arr=np.random.randint(0,31,(5,3))
print(arr)


# In[42]:


arr=arr.T
arr


# In[43]:


arr1=arr[:,2:5]
arr1


# In[44]:


arr1.sort(1)
arr1


# In[46]:


arr1.mean(axis=0)


# In[ ]:




