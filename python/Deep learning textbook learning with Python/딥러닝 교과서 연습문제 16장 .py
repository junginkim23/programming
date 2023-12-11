#!/usr/bin/env python
# coding: utf-8

# In[10]:


from sklearn.datasets import make_classification 
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import LinearSVC
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier

X,y=make_classification(n_samples=1000,n_features=2,n_redundant=0,random_state=42)

#학습 데이터와 테스트 데이터로 나누세요(테스트 크기=0.2,random_state=42)
train_X,test_X,train_y,test_y=train_test_split(X,y,test_size=0.2,random_state=42)

model_list={'로지스틱 회귀':LogisticRegression(),'선형 SVM':LinearSVC(),'비선형 SVM':SVC(),'결정 트리':DecisionTreeClassifier(),
            '랜덤 포레스트':RandomForestClassifier()}

for model_name,model in model_list.items(): #dict.items()를 하게 되면 dict의 key값과 해당 값이 모두 나온다. 
    model.fit(train_X,train_y)
    print(model_name)
    accuracy=model.score(test_X,test_y)
    print('정확도 {}'.format(accuracy))
    print()

