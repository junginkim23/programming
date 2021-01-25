#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np


# In[205]:


np.random.seed(42)
print(np.random.uniform(0,10,4))
b=np.random.RandomState(123)
print(b.uniform(0,10,4))
 0.8929469543476547, 0.8962930889334381


# In[391]:


def seed_method(size=10,seed=0):
    Rand=np.random.RandomState(seed=seed)
    return Rand.random(size=size)

def seed_method1(size=10,seed=0):
    np.random.seed(seed)
    return np.random.random(size=size)

np.random.seed(3)
A=list(np.random.random(size=6))

B=list(seed_method(2,seed=3))
B+=list(np.random.random(size=2))

print(f"A:{A}")
print(f"B:{B}")

