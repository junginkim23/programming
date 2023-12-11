#!/usr/bin/env python
# coding: utf-8

# # 연습문제3
# ### 1.customerSales와 병합된 customerAll에서 type이 Basic인 고객의 남녀 고객 수와 Premium 타입인 고객의 남녀 고객수를 구하라. 

# In[1]:


import numpy as np
import pandas as pd


# In[2]:


customerAll=pd.read_csv('C:/Users/USER/Desktop/data/customerAll.csv')
customerSales=pd.read_csv('C:/Users/USER/Desktop/data/customerSales.csv')


# In[3]:


customerAll=pd.merge(customerAll,customerSales,how='outer')
grouped=customerAll.groupby(customerAll['type'])
grouped.sex.value_counts()


# ### 2.customerSales와 병합된 customerAll에서 type이 Basic인 고객의 평균 주문횟수와 평균 구매금액, Premium인 고객의 평균 주문횟수와 평균연령을 구하라. 
# ### (구해야 하는 값들을 소수점 이하 둘째 자리까지 표시하였다.)

# In[4]:


grouped=customerAll.groupby('type').mean()
print('Basic의 평균 주문횟수:',round(grouped['frequency']['Basic'],2))
print('Basic의 평균 구매금액:',round(grouped['sales']['Basic'],2))


# In[5]:


print('Premium의 평균 주문횟수:',round(grouped['frequency']['Premium'],2))
print('Premium의 평균연령:',round(grouped['age']['Premium'],2))


# ### 3.customerSales와 병합된 customerAll에서 성별이 남성인 고객의 평균 주문횟수와 구매금액, 여성인 고객의 평균 주문횟수와 평균연령을 구하라. 
# ### (구해야 하는 값들을 소수점 이하 둘째 자리까지 표시하였다.)

# In[6]:


another_Grouped=customerAll.groupby('sex').mean()
print('남성인 고객의 평균 주문횟수:',round(another_Grouped['frequency']['M'],2))
print('남성인 고객의 평균 구매금액:',round(another_Grouped['sales']['M'],2))


# In[7]:


print('여성인 고객의 평균 주문횟수:',round(another_Grouped['frequency']['F'],2))
print('여성인 고객의 평균연령:',round(another_Grouped['age']['F'],2))

