#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt #pyplot를 써줘야 하는 이유는 ylim같이 y축을 제한할 때 사용한다. 
import numpy as np


# In[3]:


np.random.seed(100)


# In[17]:


random_number_1=np.random.rand(10000)
random_number_2=np.random.randn(10000)
random_number_3=np.random.binomial(100,0.5,size=10000)

plt.figure(figsize=(5,5))

plt.hist(random_number_1,bins=50)
plt.title('uniform_distribution')
plt.grid(True)
plt.show()

#plt.hist(random_number_2,bins=50)
#plt.hist(random_number_3,bins=50)


# In[20]:


plt.figure(figsize=(5,5))
plt.hist(random_number_2,bins=50)
plt.title('normal_distribution')
plt.grid(True)
plt.show()


# In[21]:


plt.figure(figsize=(5,5))
plt.hist(random_number_3,bins=50)
plt.title('binomial_distribution')
plt.grid(True)
plt.show()

