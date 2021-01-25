#!/usr/bin/env python
# coding: utf-8

# In[43]:


import pandas as pd 
import numpy as np
import scipy as sp 
import statsmodels.stats.api as sms
import matplotlib.pyplot as plt
from sklearn.metrics import silhouette_score
from scipy.cluster.hierarchy import linkage,dendrogram
from scipy.cluster.hierarchy import fcluster
from sklearn.cluster import AgglomerativeClustering
from sklearn.preprocessing import StandardScaler
from scipy.cluster.hierarchy import linkage,dendrogram
from scipy.cluster.hierarchy import fcluster
from sklearn.cluster import AgglomerativeClustering
from sklearn.preprocessing import StandardScaler
import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import math
from sklearn.metrics import mean_squared_error,mean_absolute_error
from sklearn.tree import DecisionTreeClassifier
from dtreeplt import dtreeplt
from sklearn.model_selection import cross_val_score
import sklearn.metrics as sm2
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans
from sklearn.neighbors import KNeighborsRegressor


# ### 1. 다음과 같은 값을 구하여라. (groupby 사용) (각 3점) 
# #### (a) 계절 별 평균 사용자 수 
# #### (b) 요일 별 평균 사용자 수 

# In[42]:


data=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')
grouped1=data['cnt'].groupby(data['season'])
grouped2=data['cnt'].groupby(data['weekday'])
print(grouped1.mean(),grouped2.mean())
#data.iloc[np.r_[1:10,15:20,50:100]]
#data.loc[0:10,['season','weekday']]


# ### 2. 공휴일과 평일의 모든 사용자 수 평균이 차이가 있는 지를 통계적으로 검증하시 오. (9점) 
# 

# In[11]:


cm=sms.CompareMeans(sms.DescrStatsW(data[data['holiday']==1].cnt),sms.DescrStatsW(data[data['holiday']==0].cnt))
print(cm.ttest_ind(usevar='pooled'))
print(cm.tconfint_diff(usevar='pooled'))
print('t 값이 0.5이하이고, p-value 또한 0.05 이상이고, 신뢰구간에 0이 포함되므로 두 평균에 차이는 없다.')


# ### 3. 2011년 1월 1일부터 2012년 12월 31일까지의 일별 일반 사용자 수, 회원 사용 자 수, 모든 사용자 수를 보여주는 그래프를 그리시오. (6점)

# In[5]:


data=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')
data.index=pd.to_datetime(data['dteday'])
data=data[['casual','registered','cnt']]
data.plot()
#plt.ylim((0,500))
plt.show()


# ### 4. cnt, temp, windspeed 세 개의 변수만을 사용하여 k-평균 군집화를 수행하려고 한다.  
#  
# #### (a) 군집의 수를 2개부터 10개까지 늘려가면서 sum_of_squared_distance를 구하 고 그래프로 나타내라. 팔꿈치 방안을 통해 적합한 군집의 수를 정하라. (6점) 

# In[6]:


data=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')
data=data.dropna()
t_features=data[['cnt','temp','windspeed']]
scaler_m=MinMaxScaler()
t_features_m=pd.DataFrame(scaler_m.fit_transform(t_features))
t_features_m.columns=['cnt_m','temp_m','windspeed_m']

Sum_of_squared_distances=[]
K=range(2,11)
for k in K:
    km=KMeans(n_clusters=k)
    km.fit(t_features_m)
    Sum_of_squared_distances.append(km.inertia_)

plt.plot(K,Sum_of_squared_distances,'bx-')
plt.xlabel('k')
plt.ylabel('Sum_of_squared_Distances')
plt.show()
print('적합한 군집의 수 :',5)


# #### (b) (a)에서 정해진 적합한 군집의 수로 k-평균 군집화를 수행하라. 얻어진 군집 들의 변수별 평균 값을 출력하고 각 군집의 의미를 기술하라.  (9점) 

# In[7]:


model=KMeans(n_clusters=5)
model.fit(t_features_m)
predict=pd.DataFrame(model.predict(t_features_m))
predict.columns=['predict']
data_cluster=pd.concat([t_features_m,predict],axis=1)
var_mean=[]
for i in range(1,5):
    var_mean.append(np.mean(data_cluster[data_cluster['predict']==i]))
    
for j in range(4):
    print('{}군집의 변수별 평균값'.format(j+1))
    print(var_mean[j])


# ### 5. 다음과 같이 회귀 분석을 수행하라. (총 20점) 
# #### (a) cnt 를 종속변수로 temp와 windspeed를 독립변수로하여 회귀분석을 수행하라. 학습집합과 테스트 집합은 무작위로 7:3으로 분할하고, 예측성과는 mae로 측정 하여라.  

# In[8]:


data=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')

data=data.dropna()
x=data[['temp','windspeed']]
#x=pd.get_dummies(x,drop_first=True)
y=data['cnt']
X=sm.add_constant(x)


X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=None)

model=sm.OLS(y_train,X_train).fit()
predictions=model.predict(X_test)

mae=mean_absolute_error(predictions,y_test)
print('예측성과 {}'.format(mae))


# #### (b) (a)를 30회 반복 실시하고, 30회 반복해서 얻어진 mae 값의 평균을 출력하라. 

# In[9]:


mae=[]
for i in range(30):
    X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=None)
    model=sm.OLS(y_train,X_train).fit()
    predictions=model.predict(X_test)

    mae.append(mean_absolute_error(predictions,y_test))
print(np.mean(mae))


# ### 6. 다음과 같이 의사결정나무 모형 생성 및 성과를 분석하라. (총 20점) (a) cnt 값이 cnt의 평균값 이상인 경우를 1, 평균값 미만인 경우는 0의 값을 갖 는 usage라는 컬럼을 생성하라. 

# In[10]:


data=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')

data.dropna()
cnt_mean=np.mean(data['cnt'])
data['usage']=np.where(data['cnt']>=cnt_mean,1,0)
data


# #### (b) season, holiday, weekday, weathersit, temp, windspeed 를 입력변수로 usage를 목표 변수로하는 의사결정나무 모형을 만들어라. 범주형 변수의 경우에는 one hot encoding을 통해 새로운 변수들을 만들고, 새로 만들어진 변수들을 대신 입 력변수로 추가하여야 한다. (max_depth 등의 제약은 하지 않는다.) 

# In[116]:


x=data[['season','holiday','weekday','weathersit','temp','windspeed']]
y=data['usage']
x_ohe=pd.get_dummies(x,drop_first=True)

X_train,X_test,y_train,y_test=train_test_split(x_ohe,y,test_size=0.2,random_state=None)
tree=DecisionTreeClassifier(criterion='gini',random_state=0)
tree.fit(X_train,y_train)

dtree=dtreeplt(model=tree,
              feature_names=X_train.columns,
              target_names=['1','0'],
            )
fig=dtree.view()


# #### (c) (b)에서 만들어진 의사결정나무 모형의 성과를 10겹 교차검증으로 측정하고, 10겹 교차검증의 AUC 평균값을 출력하라. 

# In[118]:


scoring=['accuracy','precision','recall','f1','roc_auc']

for i in scoring:
    #tree1=DecisionTreeClassifier(criterion='entropy')
    scores=cross_val_score(tree,x_ohe,y,cv=10,scoring=i)
    print('모형의 성과 {}:'.format(i),scores)
    if i=='roc_auc':
        print('AUC의 평균:{}'.format(np.mean(scores)))
#tree1=DecisionTreeClassifier(criterion='entropy')

