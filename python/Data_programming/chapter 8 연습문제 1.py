#!/usr/bin/env python
# coding: utf-8

# # Chapter 8
# ## 연습문제 1
# ### 다음 코드를 사용하여 1일부터 7일까지의 뉴욕 타임즈 웹페이지 방문 로그 데이터를 다운로드하자. 
# #### (1) 1일부터 7일까지의 일별 전체 방문자 수를 나타내는 그래프를 그리시오.

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


# In[2]:


day1=pd.read_csv("http://stat.columbia.edu/~rachel/datasets/nyt1.csv")
day2=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt2.csv')
day3=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt3.csv')
day4=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt4.csv')
day5=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt5.csv')
day6=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt6.csv')
day7=pd.read_csv('http://stat.columbia.edu/~rachel/datasets/nyt7.csv')


# In[5]:


x=['day1','day2','day3','day4','day5','day6','day7']
y=[day1.shape[0],day2.shape[0],day3.shape[0],day4.shape[0],day5.shape[0],day6.shape[0],day7.shape[0]]
plt.plot(x,y,color='r',marker='*',linestyle='--')
plt.xlabel("Day")
plt.ylabel("Visitor")
plt.title("Vistor per day")
plt.show()


# #### (2) 1일부터 7일까지의 로그인 한 사람과 로그인 하지 않은 사람의 일별 평균 Click Through Rate(CTR)을 구하고 이를 그래프로 나타내시오

# In[29]:


day1['CTR']=day1.Clicks/day1.Impressions
day2['CTR']=day2.Clicks/day2.Impressions
day3['CTR']=day3.Clicks/day3.Impressions
day4['CTR']=day4.Clicks/day4.Impressions
day5['CTR']=day5.Clicks/day5.Impressions
day6['CTR']=day6.Clicks/day6.Impressions
day7['CTR']=day7.Clicks/day7.Impressions
day1_mean=day1.groupby('Signed_In').mean()
day2_mean=day2.groupby('Signed_In').mean()
day3_mean=day3.groupby('Signed_In').mean()
day4_mean=day4.groupby('Signed_In').mean()
day5_mean=day5.groupby('Signed_In').mean()
day6_mean=day6.groupby('Signed_In').mean()
day7_mean=day7.groupby('Signed_In').mean()


# In[42]:


a=[day1_mean['CTR'][0],day2_mean['CTR'][0],day3_mean['CTR'][0],day4_mean['CTR'][0],day5_mean['CTR'][0],day6_mean['CTR'][0],day7_mean['CTR'][0]]
b=[day1_mean['CTR'][1],day2_mean['CTR'][1],day3_mean['CTR'][1],day4_mean['CTR'][1],day5_mean['CTR'][1],day6_mean['CTR'][1],day7_mean['CTR'][1]]
plt.plot(x,a,color='r',marker='*',linestyle='--',label='un_signed')
plt.plot(x,b,color='b',marker='*',linestyle='--',label='signed')
plt.xlabel("Day")
plt.ylabel("CTR")
plt.title("CTR per day")
plt.legend(loc='best')
plt.show()

