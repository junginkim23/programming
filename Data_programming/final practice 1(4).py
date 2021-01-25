#!/usr/bin/env python
# coding: utf-8

# In[1]:


# 문제 4 (1)
# (a)
import pandas as pd

mar = pd.read_csv('data/DirectMarketing.csv')
mar = mar.dropna()
mar_features = mar[['Salary', 'Children', 'Location', 'AmountSpent']]
mar_features.head()


# In[2]:


mar_features = pd.get_dummies(mar_features, drop_first = True)
mar_features.head()


# In[3]:


from scipy.cluster.hierarchy import linkage, dendrogram, fcluster
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
mar_features_s = pd.DataFrame(scaler.fit_transform(mar_features))
mar_features_s.columns = [['Salary', 'Children', 'AmountSpent', 'Location']]

clustering = linkage(mar_features_s, 'ward')
dn = dendrogram(clustering)


# In[4]:


# (b)
from sklearn.metrics import silhouette_score

si = []
K = range(2,11)
for k in K:
    cl = fcluster(clustering, k, criterion = 'maxclust')
    si.append(silhouette_score(mar_features_s, cl, metric='euclidean'))


# In[6]:


import matplotlib.pyplot as plt

plt.plot(K, si, 'bx-')
plt.xlabel('k')
plt.ylabel('Silhouette Score')
plt.show()


# In[7]:


# (c)
k = 8
ci = fcluster(clustering, k, criterion = 'maxclust')
mar_features_s['cluster'] = ci
mar_features_s


# In[9]:


grouped = mar_features_s.groupby('cluster')
grouped.mean()


# In[ ]:




