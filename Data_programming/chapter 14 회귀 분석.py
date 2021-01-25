#!/usr/bin/env python
# coding: utf-8

# ##### <지도학습>
# ###### 지도학습은 과거의 경험을 통해 목표 변수의 답을 알고 있는 경우에 이를 이용해 새로운 데이터를 예측할 모형을 학습하는 방안이다.
# ###### 학습에 사용된 데이터에 기반하여 데이터를 가장 잘 설명하거나 정확하게 예측 혹은 분류하는 모형이 생성된다.
# ###### 생성된 모형을 테스트 데이터에 적용하여 모형의 성과를 평가한다. 
# ###### 모형의 성과가 높고 안정적이라면 신규 데이터에 기반하여 예측하거나 분류하는 서비스에 적용하게 된다. 
# ###### 회귀분석은 통계학에서 관찰된 연속형 변수들에 대해 독립변수와 종속변수 사이의 상관관계에 따른 수학적 모델인 선형적 관계식을 구하여
# ###### 어떤 독립변수가 주어졌을 때 이에 따른 종속변수를 예측한다. 
# ###### 또는 이 수학적 모델이 얼마나 잘 설명하고 있는지를 판별하기 위한 적합도를 측정하는 분석 방법이다. 
# ###### 종속 변수는 연속형이어야 하며, 독립변수는 이산형, 연속형, 범주형인 수치 데이터이어야 한다. 
# ###### 독립변수가 하나인 경우를 단순 회귀분석이라고 하고 독립변수가 여러 개인 경우는 다중 회귀분석이라고 한다. 

# ##### <비지도학습>
# ###### 비지도학습은 지도학습과 다르게 목표 변수가 존재하지 않는 방안이며, 젠체 데이터를 가지고 데이터의 이해도를 높이거나 데이터간의 규칙을 추출하는데 사용된다. 
# ###### 군집화와 장바구니 분석이 대표적인 비지도학습 방안이다. 

# # <단일 회귀분석>

# In[7]:



import pandas as pd
import matplotlib.pyplot as plt

movie=pd.read_csv('C:/Users/USER/Desktop/data/MoviePerformance.csv')


# In[11]:


movie2=movie[movie.ScreenFirst>500]
movie_train=movie2.iloc[0:80]
movie_test=movie2.iloc[80:]
plt.scatter(movie_train.ScreenFirst,movie_train.BoxOffice)
plt.xlabel('ScreenFirst')
plt.ylabel('BoxOffice')
plt.show()


# In[70]:


#피어슨 상관관계: 두 변수 X와 Y간의 선형 상관 관계를 계량화한 수치이다. 코시-슈바르츠 부등식에 의해 +1~-1의 값을 가지고, +1은 완벽한
#양의 상관관계, 0은 선형 상관 관계 없음, -1은 완벽한 음의 선형 상관 관계를 의미한다. 일반적으로 상관관계는 피어슨 상관관계를 의미한다. 
from scipy.stats.stats import pearsonr#피어슨 관계: 독립변수와 종속변수의 선형적인 관계 (R)
                                      #결정계수(R-Squared: R**2),수정결정계수: 목표변수에 영향을 주지도 않는데, 그저 독립변수의 수가 늘어난다고 결정계수가 커지는 문제가 발생한다. 이런 문제에 대비해 수정결정계수를 만들었다. 
    

pearsonr1=pearsonr(movie_train['ScreenFirst'],movie_train['BoxOffice']) #output(두 인수의 상관계수, p_value) p_value가 0.05보다 훨씬 작기 때문에, Screenfirst는 boxoffice에 큰 영향을 준다. 
#여기서, screenfirst는 종속변수에 영향을 미치기 때문에 독립변수라고 볼 수 있다. 
#상관관계가 인과관계를 뜻하진 않는다, 즉 인관관계까 명확하지만 상관관계가 높은 변수들이 존재한다는 소리이다.

#회귀분석에서는 실제값과 두 변수로 이루어진 선 위에 존재하는 예측값간의 차이를 오차라고 한다면 오차의 합을 최소화하는 선을 찾는다. 
import statsmodels.api as sm 

x=movie_train['ScreenFirst']
y=movie_train['BoxOffice']
X=sm.add_constant(x)#상수항 1.0 결합을 위한 add_constant 함수이다.

model=sm.OLS(y,X).fit()#sm.OLS는 가장 기본적인 결정론적 선형 회귀 방법으로 잔차제곱합(RSS:Residual Sum of Squares)를 최소화하는 
#가중치 벡터를 행렬 미분으로 구하는 방법이다.
#상수항을 결합하는 이유: 회귀분석모형 수식을 간단하게 만들기 위해 다음과 같이 상수항을 독립변수 데이터에 추가한다.  
predictions=model.predict(X)
print(pearsonr1)
model.summary()
#R-squared의 값의 범위는 0~1이며, 1에 가까울수록 회귀모형이 종속변수의 변동을 많이 설명한다. 
#screenfirst coef: 기울기, const coef: 절편, coef: 계수
#const는 상수를 뜻한다. 독립변수의 계수관점에서 해석한거 같다. 독립변수의 값에 상수항을 결합하였기 때문. 


# In[30]:


plt.scatter(x,y,color='black')
plt.plot(x,predictions) #독립변수와 독립변수를 통해 예측한 예측값간의 선형 관계를 보여주는 선을 나타낸다. 
plt.show()
#회귀분석의 결과에서 확인해야 하는 지표는 R-squared(회귀분석의 성과를 평가하는 기준)이다. 
#R-squared의 값의 범위가 0~1이며, 1에 가까울수록 회귀모형이 종속변수의 변동을 많이 설명한다. 
#종속변수의 총 변동에 대비해 회귀모형이 얼마나 그 변동을 설명하는지를 뜻한다.
#회귀모형에 의해 설명되는 변동은 ESS(Explained sum of squares)라고 하며 예측치와 종속변수의 평균간의 차이를 제곱해서 합한 값으로 정의한다. 
#잔차는 종속변수의 실제값과 예측치의 차이이며, RSS는 잔차의 제곱의 합이다. 
#R-Squared를 구하는 식: ESS/TSS = 1-RSS/TSS


# #### <목표변수가 수치형 변수인 경우, 예측 오차를 측정하는 지표: MAE,RMSE,MAPE> 
# ###### 1)MAE(Mean Absolute Error, 평균절대오차) : 가장 기본적인 예측모형의 성과평가 , 예측치와 실제값의 오차를 측정하는 것
# ###### 2)RMSE(Root Mean Square Error, 평균제곱근오차) : MAE에 비해 오차값이 클 수록 더 크게 반영되는 지표로 MAE와 같거나 더 큰 수치를 보인다.
# ###### 3)MAPE(Mean Absolute Percentage Error, 평균절대퍼센티지오차) : 평균절대오차에서 실제값으로 오차를 나누어서 오차의 비율을 고려하는 것

# In[59]:


#import math #수학과 관련된 다양한 함수들과 상수들이 미리 정의되어 있다. 

x_test=movie_test['ScreenFirst']
y_test=movie_test['BoxOffice']
X_test=sm.add_constant(x_test) #x_test에 상수항을 결합한다. 

test_predictions=model.predict(X_test)
#MAE
mae=sum(abs(test_predictions-y_test)/len(test_predictions))
#RMSE
rmse=math.sqrt(sum((test_predictions-y_test)**2)/len(test_predictions))
#MAPE
mape=(abs(test_predictions-y_test)/len(y_test)*100).mean() #오차의 비율의 평균을 구한다. 
#sklearn.metrics 라이브러리를 이용해서 쉽게 rmse,mae,mape를 구할 수 있다. 
from sklearn.metrics import mean_squared_error,mean_absolute_error
rmse1=math.sqrt(mean_squared_error(test_predictions,y_test))
mae1=mean_absolute_error(test_predictions,y_test)
print(mae,mae1,rmse,rmse1,mape)


# # <다중 회귀분석> : 독립변수가 다양하다. 

# In[71]:


x_train=movie_train[['ScreenFirst','BoxOfficeFirst','Rating','Users']]
y_train=movie_train['BoxOffice']
X_train=sm.add_constant(x_train)

model=sm.OLS(y_train,X_train).fit()
train_predictions=model.predict(X_train) 
model.summary() 
#회귀분석의 성과를 평가하는 기준은 R-squared(결정계수)를 확인해보면, 단일 회귀분석일때에 비해서 더 좋아졌다. 
#독립변수의 수가 늘어날 수록 결정계수의 값도 증가하는 경향이 있는데, 독립변수들이 목표변수에 영햐을 잘 미치지 못하더라도 그냥 독립변수의
#수가 늘어났다고 해서 결정계수가 늘어나는 경우가 있다. 그래서 이러한 문제를 보정한 것이 독립변수의 수를 보정한 adg.R-squared(수정결정계수)값을 확인해야 한다. 
x_test=movie_test[['ScreenFirst','BoxOfficeFirst','Rating','Users']]
y_test=movie_test['BoxOffice']
X_test=sm.add_constant(x_test)


# In[74]:


test_predictions=model.predict(X_test)

#MAE
mae=sum(abs(test_predictions-y_test)/len(test_predictions))
#RMSE
rmse=math.sqrt(sum((test_predictions-y_test)**2)/len(test_predictions))
#MAPE
mape=(abs(test_predictions-y_test)/y_test*100).mean() #오차의 비율의 평균을 구한다. 

print('MAE: ',mae)
print('RMSE: ',rmse)
print('MAPE: ',mape)

