#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


day=pd.read_csv('data/day.csv')


# In[3]:


grouped_a=day['cnt'].groupby(day['season'])
grouped_b=day['cnt'].groupby(day['weekday'])


# In[4]:


grouped_a.mean()


# In[5]:


grouped_b.mean()


# 1번

# In[6]:


import statsmodels.stats.api as sms


# In[7]:


holiday1=day[day['holiday']==1]
holiday0=day[day['holiday']==0]


# In[8]:


import scipy as sp
cm=sms.CompareMeans(sms.DescrStatsW(holiday1.cnt),sms.DescrStatsW(holiday0.cnt))
cm.ttest_ind(usevar='pooled')


# In[9]:


cm.tconfint_diff(usevar='pooled')


# 2번
# 차이X p-value가 0.05이상->대립가설 반박.
# 신뢰구간에 0 포함->이를 지지

# In[10]:


import matplotlib.pyplot as plt


# In[11]:


day.info()


# In[12]:


day.head()


# In[13]:


from datetime import datetime


# In[15]:


day.index=pd.to_datetime(day['dteday'])
day=day.drop('dteday',axis=1)
day.head()


# In[20]:


users.loc['11-2011':'12-2012'].plot()


# In[24]:


from sklearn.cluster import KMeans
from sklearn.preprocessing import MinMaxScaler


# In[25]:


t_features=day[['cnt', 'temp', 'windspeed']]


# In[37]:


scaler_m=MinMaxScaler()
t_features_m=pd.DataFrame(scaler_m.fit_transform(t_features))
t_features_m.columns=[['cnt_m', 'temp_m', 'windspeed_m']]


# In[38]:


sum_of_squared_distances = []


# In[39]:


K = range(2,10)
for k in K:
    km = KMeans(n_clusters=k)
    km.fit(t_features_m)
    sum_of_squared_distances.append(km.inertia_)


# In[40]:


plt.plot(K, sum_of_squared_distances, 'bx-')
plt.xlabel('k')
plt.ylabel('sum_of_squared_distances')
plt.title('The Elbow Method showing the optimal k')
plt.show()


# 4-a:5 or 6

# In[41]:


from sklearn.preprocessing import StandardScaler


# In[42]:


model = KMeans(n_clusters=5)
model.fit(t_features)
predict = pd.DataFrame(model.predict(t_features))
predict.columns=['predict']
data_cluster = pd.concat([t_features,predict],axis=1)


# In[47]:


t_features_m = pd.DataFrame(scaler_m.fit_transform(t_features))
t_features_m.columns=[['cnt_m', 'temp_m', 'windspeed_m']]
t_features_m.describe()


# In[48]:


scaler_s = StandardScaler()
t_features_s = pd.DataFrame(scaler_s.fit_transform(t_features))
t_features_s.columns=[['cnt_s', 'temp_s', 'windspeed_s']]
t_features_s.describe()


# 4-b

# In[52]:


import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import math


# In[51]:


x=day[['temp','windspeed']]
y=day['cnt']
X=sm.add_constant(x)


# In[53]:


X_train,X_test,y_train,y_test=train_test_split(X, y, test_size=0.3, random_state=None)


# In[55]:


model = sm.OLS(y_train, X_train).fit()
predictions = model.predict(X_test)
mae = sum( abs(predictions - y_test) / len(predictions))
mae


# In[57]:


k=range(0,30)
mae30=0
for i in k:
    X_train,X_test,y_train,y_test=train_test_split(X, y, test_size=0.3, random_state=None)
    predictions = model.predict(X_test)
    mae = sum( abs(predictions - y_test) / len(predictions))
    mae30=mae30+mae
    print(mae30)


# In[58]:


mae30/30


# 5-b

# In[61]:


day['usage']=np.where(day['cnt']>=day.cnt.mean(),1,0)


# 6-a

# In[62]:


day.info()


# In[65]:


X = day[['season', 'holiday', 'weekday', 'weathersit', 'temp', 'windspeed']]
y = day['usage']
X_ohe = pd.get_dummies(X,drop_first=True)


# In[66]:


X_ohe.head()


# In[68]:


from sklearn.tree import DecisionTreeClassifier
X_train, X_test, y_train, y_test = train_test_split(X_ohe, y,test_size = 0.2,random_state=42)
tree = DecisionTreeClassifier(criterion='gini', random_state=0)
tree.fit(X_train, y_train)

print("Accuracy for train: {:.3f}".format(tree.score(X_train, y_train)))
print("Accuracy for test: {:.3f}".format(tree.score(X_test, y_test)))


# In[70]:


from sklearn.model_selection import cross_val_score
tree = DecisionTreeClassifier(criterion='entropy')
scores = cross_val_score(tree, X_ohe, y, cv=10,scoring='roc_auc')
scores.mean()


# 6-c
