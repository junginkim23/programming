#!/usr/bin/env python
# coding: utf-8

# # 연습문제 3
# ### 데이터 웹 페이지에 있는 변수들에 대한 설명과 아래 설명을 참조하여 전화 마케팅 캠페인에 의한 정기예금 가입여부인 y 변수와 각 변수들의 관계를 탐색하고, 가입 여부에 많은 영향을 미치는 것 같은 변수와 y 변수간의 관계를 잘 표현해 주는 다섯개 이상의 그래프를 작성하는 코드와 그래프를 그려라 

# In[2]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from statsmodels.graphics.mosaicplot import mosaic


# In[3]:


bank=pd.read_csv("C:/Users/USER/Desktop/data/bank-additional-full.csv",sep=';')
bank


# #### y와 각 변수 간의 관계 탐색

# In[148]:


list_plot=[pd.crosstab(bank[i],bank.y) for i in bank.loc[:,:'y']]
list_plot_name=bank.columns
for i in range(0,len(list_plot_name)-1):
    if i==1 or (i>=3 and i<=7) or i==14:
        list_plot[i].plot(kind='bar',stacked=True)
    else:
        list_plot[i].plot(marker='o',linestyle='--')
plt.show()


# #### 가입 여부에 많은 영향을 끼칠 것 같은 변수와 y 변수간의 관계 그래프로 표현

# In[14]:


connection_with_y=['age','marital','education','pdays','loan','month','nr.employed','euribor3m']
for i in connection_with_y:
    pd.crosstab(bank[i],bank.y).plot(marker='o',linestyle='--')
    plt.show()

