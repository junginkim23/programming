#!/usr/bin/env python
# coding: utf-8

# In[95]:


from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.datasets import make_classification


# In[93]:


X,y = make_classification(n_samples=100,n_features=2,n_redundant=0,random_state=42)

train_X,test_X,train_y,test_y

