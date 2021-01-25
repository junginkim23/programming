#!/usr/bin/env python
# coding: utf-8

# # 연습문제 2
# ### 1.customerSales와 병합된 customerAll에서 type이 Basic인 고객의 남녀 고객 수와 premium 타입인 고객의 남녀 고객수를 구하라. 

# In[1]:


import numpy as np
import pandas as pd 


# In[2]:


customerAll=pd.read_csv('C:/Users/USER/Desktop/data/customerAll.csv')
customerSales=pd.read_csv('C:/Users/USER/Desktop/data/customerSales.csv')


# In[3]:


customerAll=pd.merge(customerAll,customerSales,how='outer')
Basic=customerAll[customerAll.type=='Basic']
#Basic=customerAll.type[customerAll.type=='Basic']: 이렇게 하면 type column에서 Basic인 것들만 뽑아서 series의 형태로 넣어준다. 
Premium=customerAll[customerAll.type=='Premium']


# In[4]:


Basic_M=Basic[Basic.sex=='M']
Basic_F=Basic[Basic.sex=='F']
Premium_M=Premium[Premium.sex=='M']
Premium_F=Premium[Premium.sex=='F']
print('Basic인 남성의 수:',Basic_M.shape[0])
print('Basic인 여성의 수:',Basic_F.shape[0])
print('Premium인 남성의 수:',Premium_M.shape[0])
print('Premium인 여성의 수:',Premium_F.shape[0])


# ### 2.customerSales와 병합된 customerAll에서 type이 Basic인 고객의 평균 주문횟수와 평균 구매금액, Premium인 고객의 평균 주문횟수와 평균연령을 구하라. 
# ### (구해야 하는 값들을 소수점 이하 둘째 자리까지 표시하였다.)

# In[5]:


B_Mean_fre=np.mean(Basic.frequency)
B_Mean_sales=np.mean(Basic.sales)
print('Basic의 평균 주문횟수:',round(B_Mean_fre,2))
print('Basic의 평균 구매금액:',round(B_Mean_sales,2))


# In[6]:


P_Mean_fre=np.mean(Premium.frequency)
P_Mean_age=np.mean(Premium.age)
print('Premium의 평균 주문횟수:',round(P_Mean_fre,2))
print('Premium의 평균 연령:',round(P_Mean_age,2))


# ### 3.customerSales와 병합된 customerAll에서 성별이 남성인 고객의 평균 주문횟수와 구매금액, 여성인 고객의 평균 주문횟수와 평균연령을 구하라.
# ### (구해야 하는 값들을 소수점 이하 둘째 자리까지 표시하였다.)

# In[9]:


Male=customerAll[customerAll.sex=='M']
Female=customerAll[customerAll.sex=='F']
M_Mean_fre=np.mean(Male.frequency)
M_Mean_sales=np.mean(Male.sales)
F_Mean_fre=np.mean(Female.frequency)
F_Mean_age=np.mean(Female.age)
print('남성 고객의 평균 주문횟수:',round(M_Mean_fre,2))
print('남성 고객의 평균 구매금액:',round(M_Mean_sales,2))
print('여성 고객의 평균 주문횟수:',round(F_Mean_fre,2))
print('여성 고객의 평균 연령:',round(F_Mean_age,2))


# ### 4.customerSales와 병합된 customerAll 데이터 프레임에는 status라는 컬럼이 있다. status가 활동하는 고객인 경우에는 1의 값을 갖고, 휴면고객인 경우는 0의 값을 갖는다고 하자. 현재는 모든 사용자가 1의 값을 가지고 있다. sales값을 기준으로 값이 NA인 사용자의 status를 0으로 변환하라. 

# In[10]:


#numpy의 where함수를 사용하여, sales column을 기준으로 null값이 들어가 있는 경우 사용자의 status를 1에서 0으로 바꿔주었다.
customerAll.status=np.where(customerAll['sales'].isnull()==True,0,1)
customerAll[customerAll.status==0]
customerAll.head(20)


# In[11]:


#데이터프레임 내에 sales라는 column안에 null값이 들어가 있다면 True를 반환하는 함수를 사용하여, sales column내에 null값이 들어가 있는 index만 뽑아 내었다.
customerAll[customerAll['sales'].isnull()==True]

