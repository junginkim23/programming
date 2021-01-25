#!/usr/bin/env python
# coding: utf-8

# # 연습문제 2
# ### (1) 로그인한 사용자와 그렇지 않은 사용자 수를 비교하는 그래프를 그리시오.

# In[64]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


# In[65]:


day1=pd.read_csv("http://stat.columbia.edu/~rachel/datasets/nyt1.csv")


# In[66]:


day1['Signed_to_string']=np.where(day1.Signed_In==1,'signed','unsigned')
day1


# In[67]:


signed_count=day1.Signed_to_string.value_counts()
plt.bar(signed_count.index,signed_count.values,color=['blue','red'])
plt.title('signed & unsigned')
plt.show()


# ### (2) 로그인한 사용자 중 성별이 0인 사용자와 1인 사용자수를 비교하는 그래프를 그리시오.

# In[71]:


Day1=day1[day1.Signed_to_string=='signed']
counts=pd.crosstab(Day1.Signed_to_string,Day1.Gender)
counts.plot(kind='bar')
plt.title('Compare between Gender 0 and 1')
plt.show()

