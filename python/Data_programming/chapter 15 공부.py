#!/usr/bin/env python
# coding: utf-8

# In[9]:


import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from dtreeplt import dtreeplt

data = pd.read_csv('C:/Users/USER/Desktop/data/customerChurn.csv')

X=data.drop(['sex','Churn'],axis=1)
y=data['Churn']
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=42)

tree=DecisionTreeClassifier(criterion='gini',random_state=0)

tree.fit(X_train,y_train)

print('Accuracy for train {:.3f}'.format(tree.score(X_train,y_train)))
#학습 데이터를 가지고 만든 의사결정나무 모형이 학습 데이터를 얼마나 잘 나누는지 정확도를 보여준다. 
print('Accuracy for test {:.3f}'.format(tree.score(X_test,y_test)))

dtree=dtreeplt(model=tree,feature_names=X_train.columns,target_names=['yes','no'])
#feature_names: 입력변수이 들어간다. target_names: 목표 변수의 이름이 들어간다. 
fig=dtree.view()
fig


# In[7]:


tree=DecisionTreeClassifier(criterion='gini',max_depth=4,random_state=0)

tree.fit(X_train,y_train)

print('Accuracy for train {:.3f}'.format(tree.score(X_train,y_train)))
#학습 데이터를 가지고 만든 의사결정나무 모형이 학습 데이터를 얼마나 잘 나누는지 정확도를 보여준다. 
print('Accuracy for test {:.3f}'.format(tree.score(X_test,y_test)))

dtree=dtreeplt(model=tree,feature_names=X_train.columns,target_names=['yes','no'])
#feature_names: 입력변수이 들어간다. target_names: 목표 변수의 이름이 들어간다. 
fig=dtree.view()
fig
#아래의 그림을 보면, gini 계수 순수도가 점점 0이 되어가고 있는 것을 볼 수 있다. 지니계수는 0~1사이의 값으로 표현되며, 
#지니계수가 0으로 가까워지면, 노드에 포함된 데이터가 모두 다른 범주인 경우이고, 1로 가까워지면, 노드에 포함된 데이터가 모두 같은 범주인 경우가 된다.
#하지만, 아래의 최대 나무(full tree)는 뿌리노드에서 말단 노드로 갈 수록 gini가 작아진다. 즉, sklearn 라이브러리를 통해 만든 의사결정나무는
#gini를 분순도로 측정한다. 불순도=1-순수도, 그래서 불순도가 점점 0이 되는 것이 좋은 것이다. 

#단순하지만, 과적합되지 않은 최적의 모형 복잡도를 가진 모형을 만드는 것이 중요하다.
#DecisionTreeClassifier는 의사결정나무 모형을 만든 후에 가지치기를 통해 최적의 모형을 만드는 것이 불가능하다.
#모형을 만들때, 미리 데이터의 수 또는 나무의 깊이를 제한하여 최적의 모형 복잡도를 가진 모형을 만들 수 있다. 


# In[13]:


print('Iportances: \n{}'.format(tree.feature_importances_))
#의사결정나무를 생성한 이후에 입력변수로 사용된 변수들의 중요도를 구할 수 있다. 
#의사결정나무를 만들고 나서 중요도를 파악할 수 있고, 중요도가 크면 클수록 좋다. 
#중요도는 크면 클수록, 의사결정나무를 만드는데 영향을 많이 줬다는 것이다. 
#데이터 컬럼의 순서대로, age,recency,frequency,monetary
#중요도의 값은 0~1 사이의 값으로 나온다. 
#0은 의사결정나무 생성에 전혀 사용되지 않았다는 뜻이고, 영향을 주지 않았고, 중요도의 합은 1이다. 
a=tree.feature_importances_
a.sum()


# In[32]:


import matplotlib.pyplot as plt


def plot_feature_importance(model):
    n_features=model.feature_importances_.shape[0]
    plt.barh(range(n_features),model.feature_importances_,align='edge')#align인수로는 'center'와 'edge'가 있다. label('Monetary'와 같은 것)
                                                                       #이 막대의 가장자리에 위차할때는 'center', 왼쪽 가장 자리에 위치할 때는 'edge'를 사용한다. 
    plt.yticks(np.arange(n_features),X.columns)#y축에 label을 붙인다. 즉, 첫 번째 인수의 배열의 값에 맞춰서 그 값에 label을 붙인다. 이 코드에서는 1,2,3,4에 맞춰 입력 변수의 컬럼의 이름이 붙여졌다. 
    plt.xlabel('Feature Importances')
    plt.ylabel('Features')
    plt.ylim(-1,n_features)#plt.ylim(): y축값의 범위를 지정해주는 함수
    
plot_feature_importance(tree)


# In[57]:


#지금까지 입력변수에 대해서는 수치형 변수만 사용하였다. 입력 변수로 범주형 변수를 사용하기 위해 pandas의 get_dummies 함수를 사용하여
#범주형 변수를 수치형으로 변화시켜 준다. 
data.head()
X=data.drop(['Churn'],axis=1)
y=data['Churn']
X_ohe=pd.get_dummies(X,drop_first=True)#drop_first=True를 하면, 범주형 변수의 범주의 개수 n에 n-1개 만큼의 열이 생긴다. 
                                       #옆에 코드를 통한 결과를 보면, sex 변수의 범주는 M,F인데 drop_first를 설정해주지 않으면, sex_M, sex_F이렇게 두 개가 나온다.
                                       #그래서 drop_first=True를 해주면, 하나의 열로 sex라는 변수의 범주를 표시해줄 수 있다. 
X_ohe.head(10)
#n개의 범주를 갖는 변수는 n-1개의 dummy 변수를 생성하여야 한다. 


# In[60]:


X_train,X_test,y_train,y_test=train_test_split(X_ohe,y,test_size=0.2,random_state=42)
tree=DecisionTreeClassifier(criterion='gini',random_state=0)
tree.fit(X_train,y_train)
print('Accuracy for train {:.3f}'.format(tree.score(X_train,y_train)))
#학습 데이터를 가지고 만든 의사결정나무 모형이 학습 데이터를 얼마나 잘 나누는지 정확도를 보여준다. 
print('Accuracy for test {:.3f}'.format(tree.score(X_test,y_test)))
data['Frequency'].astype(str)


# In[62]:


#get_dummies 함수는 n개의 범주를 갖는 변주형 변수를 n-1개의 수치형 dummy 변수로 바꿔준다.
#sklearn의 LabelEncoder와 OneHotEncoder는 n개의 범주를 갖는 변주형 변수를 n개의 dummy 변수로 바꿔준다. 
#이것이 get_dummy 함수와의 차이다. 그리고 범주형 변수를 수치형 변수로 바꿔준다. 
#get_dummies함수는 만약 수치로 되어 있느 범주형 변수인 경우에는 작용하지 않는다. 그래서, 수치를 문자로 변경해준 후 get_dummies 함수룰 사용한다.
#수치-> 문자로 바꿔줄 수 있는 함수는 astype(str)을 쓰면 된다. data['sex'].astype(str)이렇게 하면 수치가 문자로 바뀐다. 


# In[ ]:




