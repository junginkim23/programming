#!/usr/bin/env python
# coding: utf-8

# In[31]:


import pandas as pd
import numpy as np

movie=pd.read_csv('C:/Users/USER/Desktop/test/MoviePerformance.csv')
movie=movie.dropna()
X=movie.iloc[:,np.r_[2,4:8]]
y=movie.iloc[:,8]

from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.20)

scaler=StandardScaler()
scaler.fit(X_train)

X_train=scaler.transform(X_train)
X_test=scaler.transform(X_test)

from sklearn.neighbors import KNeighborsRegressor
classifier=KNeighborsRegressor(n_neighbors=5)
classifier.fit(X_train,y_train)

y_pred=classifier.predict(X_test)
mape=np.mean(abs(y_pred-y_test)/y_test)
mape


# In[34]:


error=[]

for i in range(1,40):
    knn=KNeighborsRegressor(n_neighbors=i)
    knn.fit(X_train,y_train)
    pred_i=knn.predict(X_test)
    error.append(np.mean(abs(pred_i-y_test)/y_test))
    
import matplotlib.pyplot as plt

plt.figure(figsize=(12,6))
plt.plot(range(1,40),error,color='red',linestyle='dashed',marker='o',markerfacecolor='blue',markersize=10)
plt.title('Error Rate K Value')
plt.xlabel('K Value')
plt.ylabel('MAPE')
plt.show()


# In[49]:


import surprise

data=surprise.Dataset.load_builtin('ml-100k')

df=pd.DataFrame(data.raw_ratings,columns=['user','item','rate','id'])
df=df.drop('id',axis=1)

from surprise.model_selection import cross_validate

sim_options={'name':'pearson'}
algo=surprise.KNNBasic(sim_options=sim_options)
cross_validate(algo,data)['test_mae'].mean()


# In[50]:


sim_options={'name':'cosine'}
algo=surprise.KNNBasic(sim_options=sim_options)
cross_validate(algo,data)['test_mae'].mean()


# In[51]:


algo=surprise.SVD(n_factors=100)
cross_validate(algo,data)['test_mae'].mean()


# In[52]:


algo=surprise.NMF(n_factors=100)
cross_validate(algo,data)['test_mae'].mean()


# In[55]:


from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

gc=pd.read_csv('C:/Users/USER/Desktop/test/GermanCredit.csv')
gc.head()

X=gc.iloc[:,1:31]
y=gc['RESPONSE']

X_train,X_test,y_train,y_test=train_test_split(X,y,random_state=0)

clf=KNeighborsClassifier(n_neighbors=3)
clf.fit(X_train,y_train)

print('Predictions: {}'.format(clf.predict(X_test)))

print('Accuracy: {}'.format(clf.score(X_test,y_test)))


# In[57]:


Acc=[]
for i in range(1,21):
    clf=KNeighborsClassifier(n_neighbors=i)
    clf.fit(X_train,y_train)
    Acc.append(clf.score(X_test,y_test))
    
plt.plot(range(1,21),Acc)


# In[58]:


from sklearn.model_selection import cross_val_score
clf=KNeighborsClassifier(n_neighbors=3)
cross_val_score(clf,X,y,scoring='roc_auc',cv=5)

