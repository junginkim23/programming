#!/usr/bin/env python
# coding: utf-8

# In[14]:


import pandas as pd
import math
import statsmodels.api as sm 
from scipy.stats.stats import pearsonr
import matplotlib.pyplot as plt


# In[28]:


movie=pd.read_csv('C:/Users/USER/Desktop/data/MoviePerformance.csv')
movie2=movie[movie.ScreenFirst>500]
movie_train=movie2.iloc[0:80]
movie_test=movie2.iloc[80:]

x_train=movie_train[['Length','ScreenFirst','BoxOfficeFirst','Rating','Users']]
y_train=movie_train['BoxOffice']
X_train=sm.add_constant(x_train)

model=sm.OLS(y_train,X_train).fit()
predictions=model.predict(X_train)

print(pearsonr(movie_train['ScreenFirst'],movie_train['BoxOffice']))
print(pearsonr(movie_train['Rating'],movie_train['BoxOffice']))
'''이게 되려면 단일 회귀분석에서 독립변수를 단일로 설정했을 경우 학습데이터와 예측데이터 간에 선형 관계의 선을 볼 수 있다. 
plt.scatter(x_train,y_train,color='black')
plt.plot(x_train,predictions)
'''


# In[29]:


model.summary()
X_train=X_train.drop(['Rating'],axis=1) #Dataframe.drop(['column 명'],axis=1) 


# In[31]:


model=sm.OLS(y_train,X_train).fit()
model.summary()
X_train=X_train.drop(['Length'],axis=1) #Dataframe.drop(['column 명'],axis=1) 


# In[34]:


model=sm.OLS(y_train,X_train).fit()
model.summary()


# In[39]:


from sklearn.metrics import mean_squared_error,mean_absolute_error
#test data로 목표변수 예측한다. 학습데이터로 미리 형성한 모델을 이용하여. 
x_test=movie_test[['ScreenFirst','BoxOfficeFirst','Users']]
y_test=movie_test['BoxOffice']
X_test=sm.add_constant(x_test)

#테스트 데이터의 예측값을 본다. 
test_predictions=model.predict(X_test)

rmse=math.sqrt(mean_squared_error(y_test,test_predictions))
rmse1=math.sqrt(mean_squared_error(test_predictions,y_test))
print(rmse,rmse1)


# In[66]:


from sklearn.metrics import mean_squared_error 
from sklearn.model_selection import train_test_split

movie2=movie[movie.ScreenFirst>500]
x=movie2[['ScreenFirst','BoxOfficeFirst','Users']]
y=movie2['BoxOffice']
X=sm.add_constant(x)
#상수항을 결합하는 이유: 회귀분석모형 수식을 간단하게 만들기 위해 다음과 같이 상수항을 독립변수 데이터에 추가한다.

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=None)

model=sm.OLS(y_train,X_train).fit() #학습데이터들을 기반하여 데이터를 가장 잘 설명하거나 정확하게 예측 혹은 분류하는 모형을 생성한다. 
test_predictions=model.predict(X_test)

rmse=math.sqrt(mean_squared_error(y_test,test_predictions))
rmse

