#!/usr/bin/env python
# coding: utf-8

# In[5]:


from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

#데이터 준비
X,y=make_classification(n_samples=1250,n_features=4,n_informative=2,n_redundant=2,random_state=42)
train_X,test_X,train_y,test_y=train_test_split(X,y,random_state=42)

kernel_list=['linear','rbf','poly','sigmoid']#linear: 선형 svm이며, linearsve와 거의 동일 
                                             #rbf: 비교적 높은 정확도를 보여준다. 
                                             #poly: 입체 투영
                                             #sigmoid: 로지스틱 회귀 모델과 동일한 작업을 수행
                                             #precomputed: 데이터 전처리로 미리 가공된 경우에 사용
#인수: n_informative : 독립 변수 중 종속 변수와 상관 관계가 있는 성분의 수                

for i in kernel_list:
    model=SVC(kernel=i,random_state=42)
    model.fit(train_X,train_y)
    accuracy=model.score(test_X,test_y)
    print(i)
    print(accuracy)
    print()
    print()

