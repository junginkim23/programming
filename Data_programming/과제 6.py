#!/usr/bin/env python
# coding: utf-8

# # 연습문제 3 
# ## 연습문제 2의 (1)번이 독립변수를 후진 제거법(backward elimination)을 통해 선정하고, 모형을 학습하여라. 생성된 모형으로 예측을 수행하고, 예측 성과를 MAE, RMSE, MAPE로 보고하라.

# In[40]:


import statsmodels.api as sm 
import pandas as pd 
import numpy as np
import math
from sklearn.metrics import mean_squared_error

data=pd.read_csv('C:/Users/USER/Desktop/data/boston.csv')
data


# In[41]:


data_train=data.iloc[0:233]
y=data_train['medv']
x=data_train.drop(['medv'],axis=1)
X=sm.add_constant(x)

model=sm.OLS(y,X).fit()
predictions=model.predict(X)
model.summary()


# In[42]:


#p-value가 0.05이하이면 해당 독립변수가 종속변수에 유의한 영향을 미치는 것으로 해석 
#신뢰구간 안에 0이 포함되어 있으면 안된다. 
#indus의 p-value가 가장 크고, 신뢰구간에 0이 포함되어 있다. 
X=X.drop(['indus'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[43]:


#전체 p-value에서 chas가 가장 크기 때문에 drop을 이용하여 삭제한다.
#신뢰구간 또한 0이 들어가기 때문에! 
#이후로 이러한 과정을 거쳐서 종속변수에 유의하지 않은 영향을 주는 독립변수를 삭제한다.
X=X.drop(['chas'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[44]:


X=X.drop(['lstat'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[45]:


X=X.drop(['zn'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[46]:


X=X.drop(['ID'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[47]:


X=X.drop(['rad'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()


# In[48]:


data_test=data.iloc[233:]
x_test=data_test[['crim','nox','rm','age','dis','tax','ptratio','black']]
y_test=data_test['medv']
X_test=sm.add_constant(x_test)

test_prediction=model.predict(X_test)

mae=sum(abs(test_prediction-y_test)/len(test_prediction))
rmse=math.sqrt(sum((test_prediction-y_test)**2)/len(test_prediction))
mape=((abs(test_prediction-y_test)/y_test)*100).mean()

print('MAE:',mae)
print('RMSE:',rmse)
print('MAPE:',mape)

