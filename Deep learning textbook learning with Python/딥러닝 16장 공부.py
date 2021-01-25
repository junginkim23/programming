#!/usr/bin/env python
# coding: utf-8

# In[20]:


#데이터 준비하기 
from sklearn.datasets import make_classification
import matplotlib as plt
X,y = make_classification(n_samples=50,n_features=2,n_redundant=0,random_state=0)

plt.pyplot.scatter(X[:,0],X[:,1],c=y,marker='.',cmap=plt.cm.get_cmap(name='bwr'),alpha=0.7)
plt.pyplot.grid(True)
plt.pyplot.show()


# In[155]:


#머신러닝 모델을 구현하는 것은 쉽지 않다. 하지만, 파이썬에는 머신러닝에 특화된 라이브러리가 많이 존재한다. 
#그 중 scikit-learn이 유명한 머신러닝 라이브러리이다. 
from sklearn.linear_model import LogisticRegression 
from sklearn.svm import LinearSVC,SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
import numpy as np
import matplotlib
import matplotlib.pyplot as plt

get_ipython().run_line_magic('matplotlib', 'inline')



X,y=make_classification(n_samples=100,n_features=2,n_redundant=0,random_state=42)

train_X,test_X,train_y,test_y=train_test_split(X,y,random_state=42)

model=LogisticRegression(random_state=42)

model.fit(train_X,train_y)

pred_y=model.predict(test_X)
print(np.where(pred_y==1,True,False))
print(np.where(pred_y==1))


# In[162]:


XI=np.linspace(-10,10) #-10~10사이에 난수 생성, 이 때 간격은 거의 동일하다. 
Y= -model.coef_[0][0]/model.coef_[0][1]* XI - model.intercept_ / model.coef_[0][1]
plt.plot(XI,Y)
plt.xlim(min(X[:,0])-0.5,max(X[:,0])+0.5)
plt.ylim(min(X[:,1])-0.5,max(X[:,1])+0.5)

plt.axes().set_aspect('equal','datalim')


# In[171]:


model.coef_[0,0]
model.intercept_


# In[ ]:




