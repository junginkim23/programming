#!/usr/bin/env python
# coding: utf-8

# In[37]:


import statsmodels.api as sm 
import pandas as pd 
import numpy as np

movie=pd.read_csv('C:/Users/USER/Desktop/data/MoviePerformance.csv')


# In[38]:


movie2=movie[movie['ScreenFirst']>500]
movie_train=movie2.iloc[0:80]
x=movie_train[['ScreenFirst','BoxOfficeFirst','Rating','Users']]
y=movie_train['BoxOffice']
X=sm.add_constant(x)

model=sm.OLS(y,X).fit()
predictions=model.predict(X)

model.summary()


# In[39]:


'''
X=X.drop(['Rating'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()
'''


# In[40]:


'''
X=X.drop(['Length'],axis=1)
model=sm.OLS(y,X).fit()
model.summary()
'''


# In[41]:


import math
from sklearn.metrics import mean_squared_error
movie_test=movie2.iloc[80:]
x_test=movie_test[['ScreenFirst','BoxOfficeFirst','Rating','Users']]
y_test=movie_test['BoxOffice']
X_test=sm.add_constant(x_test)

test_prediction=model.predict(X_test)

mae=sum(abs(test_prediction-y_test)/len(test_prediction))
rmse=math.sqrt(sum((test_prediction-y_test)**2)/len(test_prediction))
mape=((abs(test_prediction-y_test)/y_test)*100).mean()

print('MAE:',mae)
print('RMSE:',rmse)
print('MAPE:',mape)


# In[ ]:




