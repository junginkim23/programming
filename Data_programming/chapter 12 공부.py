#!/usr/bin/env python
# coding: utf-8

# In[13]:


import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.preprocessing import MinMaxScaler #값의 범위 조정을 위한 변수 표준화
from sklearn.metrics import silhouette_score #실루엣 값을 이용하여 군집이 잘 이루어 졌는지 확인, -1~1사이의 값인데 -1에 가까울수록 군집이 잘 안된 것이고, 1에 가까울수록 군집이 잘 된 것이다. 

t=pd.read_csv('C:/Users/USER/Desktop/data/telecom.csv')
#k평균 군집화를 한 후에 MinMaxScaler을 이용해서 범위를 조정하고, 그리고 실루엣 값을 이용해서 군집이 잘 되었는지 확인 
t.dropna()
t_features=t[['LONGDIST','International','LOCAL']]

scaler_m=MinMaxScaler()
t_m=pd.DataFrame(scaler_m.fit_transform(t_features))
t_m.columns=['LONGDIST_m','International_m','LOCAL_m']

si=list()
K=range(2,10)
for k in K:
    km=KMeans(n_clusters=k)
    km.fit(t_m)# 데이터를 가지고 학습을 하고! 
    predict=pd.DataFrame(km.predict(t_m))# 학습된 모델을 이용해서, 데이터가 어디 군집에 들어가는지 군집 번호를 예측한다. 
    predict.columns=['Predict']#예측된 군집번호가 들어간 데이터프레임의 컬럼을 바꿔준다. 
    si.append(silhouette_score(t_m,predict,metric='euclidean'))#전체 데이터가 군집이 어느정도로 잘 되었는지 확인해주는 실루엣 값을 구한다. 

plt.plot(K,si,'bx-')#군집의 수에 따라, 실루엣 값을 보면서, 군집의 수가 몇일 때 군집화가 잘 되는지 확인한다. 

