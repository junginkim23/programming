#!/usr/bin/env python
# coding: utf-8

# # 연습문제 3
# ### 데이터 웹 페이지에 있는 변수들에 대한 설명과 아래 설명을 참조하여 전화 마케팅 캠페인에 의한 정기예금 가입여부인 y 변수와 각 변수들의 관계를 탐색하고, 가입 여부에 많은 영향을 미치는 것 같은 변수와 y 변수간의 관계를 잘 표현해 주는 다섯개 이상의 그래프를 작성하는 코드와 그래프를 그려라 

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


# In[109]:


bank=pd.read_csv("C:/Users/USER/Desktop/data/bank-additional-full.csv",sep=';')


# In[36]:


a=bank[['age','duration','campaign','pdays','previous','emp.var.rate','cons.price.idx','cons.conf.idx','euribor3m','nr.employed','y']].corr()
a.loc[['y',]]


# In[29]:


copy_y=bank.y
bank['copy_y']=copy_y
bank.y=np.where(bank.y=='no',0.0,1.0)


# In[65]:


corr_bank=bank.corr()
array_y=np.array(corr_bank['y'])
list_corr=list(map(abs,array_y))
del list_corr[-1]
for i in range(0,len(list_corr)):
    if list_corr[i]>=0.7:
        print('{}는 y와 강한 상관관계를 갖고 있다.'.format(corr_bank.columns[i]))
    elif list_corr[i]>0.3 and np.abs(array_y[i])<0.7:
        print('{}는 y와 뚜렷한 상관관계를 갖고 있다.'.format(corr_bank.columns[i]))
    elif list_corr[i]>0.1 and np.abs(array_y[i])<0.3:
        print('{}는 y와 약한 상관관계를 갖고 있다.'.format(corr_bank.columns[i]))
    else:
        print('{}는 y와 상관관계가 없다.'.format(corr_bank.columns[i]))


# In[84]:


pd.crosstab(bank.job,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.marital,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.education,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.default,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.housing,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.loan,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.contact,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.month,bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank['day_of_week'],bank.copy_y).plot(kind='bar',stacked=True)
pd.crosstab(bank.poutcome,bank.copy_y).plot(kind='bar',stacked=True)
plt.show()

