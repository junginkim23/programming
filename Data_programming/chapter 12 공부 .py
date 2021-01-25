#!/usr/bin/env python
# coding: utf-8

# In[24]:


#k 평균 군집화
from sklearn.cluster import KMeans
import pandas as pd
import matplotlib.pyplot as plt

points=[(3,5),(4,6),(5,3),(3,7),(6,8),(7,4),(4,8),(7,3),(8,2)]
labels=['x','y']
data=pd.DataFrame(points,columns=labels)
plt.plot(data.x,data.y,'bo')
plt.show()
#K 평균 군집화 시행됨.
model=KMeans(n_clusters=3,init='random')#초기점의 갯수와 초기점을 random하게 생성하는 model 구현
model.fit(data) # DataFrame을 학습 데이터로 넣어준다. 
predict=pd.DataFrame(model.predict(data))#data의 군집 예측 
predict.columns=['Predict']
data_cluster=pd.concat([data,predict],axis=1)
plt.scatter(data_cluster.x,data_cluster.y,c=data_cluster.Predict,alpha=0.5)#c는 CLUSTER 별로 색깔을 달리한다. 


# In[5]:


import numpy as np
import math 
print(np.sqrt(12))
print(math.sqrt(12))


# In[48]:


telecom=pd.read_csv('C:/Users/USER/Desktop/data/telecom.csv')
telecom.dropna()
t_features=telecom[['LONGDIST','International','LOCAL']]
t_features.describe()
t_model=KMeans(n_clusters=3)
t_model.fit(t_features)
predict=pd.DataFrame(t_model.predict(t_features))
predict.columns=['Predict']
telecom_cluster=pd.concat([t_features,predict],axis=1)
telecom_cluster
plt.scatter(telecom_cluster.LONGDIST,telecom_cluster.International,c=telecom_cluster.Predict,alpha=0.5)
plt.show()
plt.scatter(telecom_cluster.International,telecom_cluster.LOCAL,c=telecom_cluster.Predict,alpha=0.5)
plt.show()
plt.scatter(telecom_cluster.LONGDIST,telecom_cluster.LOCAL,c=telecom_cluster.Predict,alpha=0.5)
plt.show()
#c에 predict된 값을 넣어줌으로써, x,y가 predict에 따라 색깔이 달라진다. 즉, 군집에 따라 색깔이 다르고 값에 따라 농도가 다르게 해주는 alpha값! 


# In[64]:


#위의 그림을 보면, 패턴을 찾기 어렵다. 
#LOCAL의 값의 범위가 다른 두 개에 비해 훨씬 크기 떄문에 LOCAL 값의 차이가 더 많은 영향을 끼친다. 
#이로 인해 변수의 값의 범위를 동일하게 조정해주어야 한다.
#범위를 동일하게 조정해주는 함수: MinMaxScaler & StandardScaler 
from sklearn.preprocessing import MinMaxScaler 
from sklearn.preprocessing import StandardScaler

#------------범위를 동일하게 조정해주기 위해 MinMaxScaler을 사용하는 코드------------------
scaler_m=MinMaxScaler()#변수의 값을 0< <1로 표준화하는 방법
t_features_m=pd.DataFrame(scaler_m.fit_transform(t_features)) # 변수의 값을 모두 0과 1 사이로 바꿔주고 데이터프레임으로 형성 
#------------------------------------------------------------------------------------------
t_features_m.columns=['LONGDIST','International','LOCAL']
t_model=KMeans(n_clusters=3)
t_model.fit(t_features_m)
predict=pd.DataFrame(t_model.predict(t_features_m))
predict.columns=['Predict']
telecom_cluster=pd.concat([t_features_m,predict],axis=1)
plt.scatter(telecom_cluster.LONGDIST,telecom_cluster.International,c=telecom_cluster.Predict,alpha=0.5)
plt.xlabel('LONGDIST_m')
plt.ylabel('International_m')
plt.show()
plt.scatter(telecom_cluster.LOCAL,telecom_cluster.International,c=telecom_cluster.Predict,alpha=0.5)
plt.ylabel('International_m')
plt.xlabel('Local_m')
plt.show()
plt.scatter(telecom_cluster.LONGDIST,telecom_cluster.LOCAL,c=telecom_cluster.Predict,alpha=0.5)
plt.xlabel('LONGDIST_m')
plt.ylabel('LOCAL_m')
plt.show()


# In[73]:


scaler_s=StandardScaler()
t_features_s=pd.DataFrame(scaler_s.fit_transform(t_features))#fit_transform: 평균은 0 표준편차는 1을 따르게 표준화한 변수로 바꿔준다.
t_features_s #평균은 0 표준편차는 1을 따르는 변수로 변환
t_features_s.columns=['LONGDIST','International','LOCAL']
s_model=KMeans(n_clusters=3)
s_model.fit(t_features_s)
predict=pd.DataFrame(s_model.predict(t_features_s),columns=['Predict']) 
s_cluster=pd.concat([t_features_s,predict],axis=1)
s_cluster.describe()


# In[81]:


data1=data_cluster.groupby('Predict')
data1.mean()


# In[94]:


data=pd.read_csv('C:/Users/USER/Desktop/data/telecom.csv')
data.dropna()
data=data[['LONGDIST','International','LOCAL']]

m=MinMaxScaler()
data_m=pd.DataFrame(m.fit_transform(data))
data_m.columns=data.columns

total_distance=[]

for k in range(2,10):
    km=KMeans(n_clusters=k)
    km.fit(data_m)
    total_distance.append(km.inertia_) #각 군집내의 거리를 측정하여 모두 더한 값! 
    
K=range(2,10)
plt.plot(K,total_distance,'bx-')
plt.xlabel('K')
plt.ylabel('distance')
plt.title('elbow method to find optimic k')
plt.show()


# In[100]:


from scipy.cluster.hierarchy import linkage,dendrogram,fcluster
data2=pd.read_csv('C:/Users/USER/Desktop/data/telecom.csv')
data2.dropna()
data2=data2[['LONGDIST','International','LOCAL']]

scaler_s=StandardScaler()
data2_s=pd.DataFrame(scaler_s.fit_transform(data2))
data2_s.columns=data2.columns


clustering=linkage(data2,'complete') #data2를 가장 유사한 데이터끼리 묶고 그리고 묶은 후, 집합과 데이터 간의 거리는 각각의 점과의 거리의 최댓값으로 설정한다. 그 후, 다시 한번 유사한 데이터집합 혹은 데이터끼리 묶는다. 군집화 시킨다. 
dn=dendrogram(clustering)
k=3
data['cluster']=fcluster(clustering,k,criterion='maxclust')
data# fcluster를 사용하는 경우, 군집 번호가 1,2로 나온다. 
from sklearn.cluster import AgglomerativeClustering
data['cluster_using_sklearn']=AgglomerativeClustering().fit(data)


# In[107]:


from sklearn.metrics import silhouette_score #계층적 군집화의 군집 수를 결정하는 방법! 
#실루엣 값이 -1~1사이에 존재하며, -1에 가까울수록 군집이 잘 안된것이고 1에 가까울수록 군집이 잘된것이다. 
si=[]
K=range(2,10)
for k in K:
    cl=fcluster(clustering,k,criterion='maxclust') #데이터 군집화된 clustering에 군집의 수를 2로 잡았을 경우, 각각의 clustering 된 집합의 군집 번호가 cl에 들어간다. 
    si.append(silhouette_score(data2_s,cl,metric='euclidean'))#군집의 수(k)에 따라, 실루엣 값을 측정했다. ->실루엣 값은 군집이 잘 되었는지 안되었는지 확인하는 지표이다. 
    print(cl,si)

plt.plot(K,si,'bx-')

