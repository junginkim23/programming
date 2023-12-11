#!/usr/bin/env python
# coding: utf-8

# # 연습문제1 
# ## Age는 방문자의 나이, Gender는 성별, Impressions는 노출된 기사의 수, Clicks는 클릭한 기사의 수이며, Signed_In은 로그인 한 경우에는 1, 그렇지 않은 경우는 0값을 갖는다. 로그인을 하지 않은 방문자의 나이와 성별을 알 수 없으므로 Age, Gender에 0으로 입려되어 있다.

# In[2]:


import pandas as pd
import numpy as np


# In[3]:


day1=pd.read_csv("http://stat.columbia.edu/~rachel/datasets/nyt1.csv")
day1.head()


# ### (1) day 1의 총 방문자 수, 총 노출된 기사의 수, 총 클릭 수를 산출하라. 

# In[4]:


print('총 방문자 수:',day1.shape[0])
print('총 노출된 기사의 수:',day1.Impressions.sum())
print('총 클릭 수:',day1.Clicks.sum())


# ### (2)day1의 총 방문자 중 로그인한 사람 수와 로그인하지 않은 사람 수, 로그인한 사람 중 Gender가 0인 사람 수와 1인 사람의 수를 구하라. 

# In[29]:


yes=day1[day1.Signed_In==1]
print('총 방문자 중 로그인한 사람 수:',yes.Signed_In.sum())
no=day1[day1.Signed_In==0]
print('총 방문자 중 로그인하지 않은 사람 수:',no.Signed_In.sum())


# In[33]:


gender1=yes[yes.Gender==1]
print('로그인한 사람 중 Gender가 1인 사람 수:',gender1.Gender.sum())
gender0=yes[yes.Gender==0]
print('로그인한 사람 중 Gender가 0인 사람 수:',gender0.Gender.sum())


# ### (3)로그인한 사람의 평균 클릭 수와 로그인하지 않은 사람의 평균 클릭 수를 비교하라. 

# In[37]:


print('로그인한 사람의 평균 클릭 수:',yes.Clicks.mean())
print('로그인하지 않은 사람의 평균 클릭 수:',no.Clicks.mean())


# In[39]:


np.mean(yes.Clicks)


# In[41]:


np.mean(no.Clicks)


# ### (4)가장 많은 기사를 클릭한 방문자를 찾아 방문자들의 나이, 성별, 클릭한 기사의 수, 로그인 여부를 보여라. 

# In[56]:


Best_Click=day1[day1.Clicks==day1.Clicks.max()]
Best_Clicks=Best_Click.drop('Impressions',axis=1)
Best_Clicks


# In[57]:


Best_Click.iloc[:,np.r_[0:2,3:5]]


# In[61]:


num=day1.Clicks.idxmax()
max_value=day1.iloc[num,3]#max_Value, 최대 클릭 수를 구하는 코드. 행과 열을 입력하여 해당하는 값을 도출할 수 있다.
max_value


# # 연습문제 2 
# ### (1)Impressions 대비 Clicks 비율, 즉 Clicks / Impressions이 노출된 기사 중 클릭한 기사의 비율이므로 Click Through Rate (CTR)을 구할 수 있다. 각 방문자의 CTR을 구하여 day1의 새로운 컬럼으로 추가하라. 

# In[66]:


day1.loc[:,'CTR']=day1.Clicks/day1.Impressions
#또 다른 방법
#day1['CTR']=day1.Clicks/day1.Impressions
day1


# ### (2)로그인한 사람 중 Gender가 0인 사람과 1인 사람의 평균 CTR을 구하라. 

# In[74]:


Log=day1[day1.Signed_In==1]
print('로그인한 사람 중 Gender가 0인 사람의 CTR 평균:',Log.CTR[Log.Gender==0].mean())#Log.CTR[조건]->조건을 성립하는 데이터프레임의 CTR 값들을 반환 


# In[75]:


Log.CTR[Log.Gender==1].mean()
print('로그인한 사람 중 Gender가 1인 사람의 CTR 평균:',Log.CTR[Log.Gender==1].mean())

