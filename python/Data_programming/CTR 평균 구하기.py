#!/usr/bin/env python
# coding: utf-8

# ## (3)Age가 30살 이상인 사람의 평균 CTR과 30살 미만인 사람의 평균 CTR을 구하세요. 

# In[5]:


import pandas as pd
day1 = pd.read_csv("http://stat.columbia.edu/~rachel/datasets/nyt1.csv")
day1['CTR'] = day1.Clicks / day1.Impressions
Log=day1[day1.Signed_In==1]
Log.head()


# In[ ]:


day1.CTR[day1.Age>=30].mean()


# In[ ]:


day1.CTR[day1.Age<30].mean()


# In[10]:


a=day1.Impressions[day1.Impressions==3]
print(a)


# In[11]:


print(a)

