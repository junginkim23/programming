#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np


# In[3]:


df=pd.DataFrame({"영어성적":[[10,20,3],20,10],"국어성적":[20,10,30],"수학성적":[32,12,32],"이름":['10','2','3']})
display(df)


# In[4]:


display(df.loc[0])
#display(df)
#df=df.set_index('이름')
#display(df)


# In[5]:


for i in range(0,2):
    df.iloc[i]
    display(df)


# In[ ]:




