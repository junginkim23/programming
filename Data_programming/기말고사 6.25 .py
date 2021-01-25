#!/usr/bin/env python
# coding: utf-8

# In[3]:


import surprise
from surprise.model_selection import cross_validate
from sklearn.neighbors import KNeighborsClassifier
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
from datetime import datetime
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori
from mlxtend.frequent_patterns import association_rules
from scipy.stats.stats import pearsonr


# In[4]:


#1번 문제 
data=pd.read_csv('C:/Users/USER/Desktop/test/telecom.csv')
data=data.dropna()
data=data[data.CHURNED!='InVol']
data['CHURNED_NEW']=np.where(data['CHURNED']=='Current','No','Yes')
data


# In[5]:


#2번 문제
new_yes=data[data['CHURNED_NEW']=='Yes'].LOCAL
new_no=data[data['CHURNED_NEW']=='No'].LOCAL
cm=sms.CompareMeans(sms.DescrStatsW(new_yes),sms.DescrStatsW(new_no))
print(cm.ttest_ind(usevar='pooled'))
print(cm.tconfint_diff())


# In[60]:


#3번 문제
x=data[['LONGDIST','International','LOCAL','AGE','CHILDREN','Est_Income']]
y=data['CHURNED_NEW']
y_ohe=pd.get_dummies(y,drop_first=True)

X_train,X_test,y_train,y_test=train_test_split(x,y,test_size=0.2,random_state=None)
tree=DecisionTreeClassifier(criterion='gini',random_state=0)
tree.fit(X_train,y_train)

tree1=DecisionTreeClassifier(criterion='entropy')
scores=cross_val_score(tree,x,y_ohe,cv=5,scoring='f1')
print('모형의 성과-f1 :',scores)
print('정확도의 평균:',np.mean(scores))


# In[20]:


#4번 문제
add_x=data[['LONGDIST','International','LOCAL','AGE','CHILDREN','Est_Income','PAY_MTHD','SEX','STATUS','Car_Owner']]
x_ohe=pd.get_dummies(add_x,drop_first=True)

X_train,X_test,y_train,y_test=train_test_split(x_ohe,y_ohe,test_size=0.2,random_state=42)
tree2=DecisionTreeClassifier(criterion='gini',random_state=0)
tree2.fit(X_train,y_train)

tree3=DecisionTreeClassifier(criterion='entropy')
scores1=cross_val_score(tree3,x_ohe,y_ohe,cv=5,scoring='roc_auc')
print('모형의 성과-auc :',scores1)
print('정확도의 평균:',np.mean(scores1))


# In[ ]:


#5번 문제
print('Importances: {}'.format(tree2.feature_importances_))


# In[134]:


#6번 문제
scaler_s=StandardScaler()
clus_data=data[['LONGDIST','International','LOCAL','AGE','CHILDREN']]
data_features_s=pd.DataFrame(scaler_s.fit_transform(clus_data))

clustering=linkage(data_features_s,'average')
#dn=dendrogram(clustering)

si=[]
K=range(2,11)
for k in K:
    cl=fcluster(clustering,k,criterion='maxclust')
    si.append(silhouette_score(data_features_s,cl,metric='euclidean'))
plt.plot(K,si,'bx-')
plt.xlabel('k')
plt.ylabel('silhouette Score')
plt.show()
print('적합한 군집의 수는:',2)


# In[139]:


#7번 문제
ide_data=data[['LONGDIST','International','LOCAL','AGE','CHILDREN']]
de_data=data['CHURNED_NEW']
de_data_ohe=pd.get_dummies(de_data,drop_first=False)

X_train,X_test,y_train,y_test=train_test_split(ide_data,de_data_ohe,test_size=0.2)

scaler=StandardScaler()
scaler.fit(X_train)

X_train=scaler.transform(X_train)
X_test=scaler.transform(X_test)

classifier=KNeighborsRegressor(n_neighbors=5)
classifier.fit(X_train,y_train)

y_pred=classifier.predict(X_test)

print('Accuracy: {}'.format(classifier.score(X_test,y_test)))


# In[146]:


#8번 문제
las_data=data['Est_Income']
fi_data=data[['LONGDIST','International','LOCAL','AGE','CHILDREN']]
Data=sm.add_constant(fi_data)

X_train,X_test,y_train,y_test=train_test_split(Data,las_data,test_size=0.2,random_state=None)
model=sm.OLS(y_train,X_train).fit()

predictions=model.predict(X_test)
rmse=math.sqrt(mean_squared_error(predictions,y_test))
print('예측성과: ',rmse)


# In[ ]:


#9번 문제 :  사실 단점보다 장점이 더 많았고 개선되었으면 하는 것은 좀 더 깊이 있는 과제가 있었다면 좋았을 거 같습니다. 감사합니다.

