#!/usr/bin/env python
# coding: utf-8

# ### 문제 1) 다음 질문에 답하라. (각 5점) 
# ### (1) K겹 교차검증을 하는 이유는 무엇인가? 
# #### 무작위로 data를 train, test로 나눴을 경우 우연히 분류 성과가 좋거나 나쁘게 될 수 있다. 이러한 우연성을 줄어들게 하기 위해서 모든 데이터를 테스트에 이용하기 위한 방안으로 k겹 교차검증을 사용하는 것이다. 
# ### (2) 분류의 성과지표로 정확도외에 정밀도, 재현율이 사용되는 이유는 무엇이며, 정밀도와 재현율을 모두 고려한 f1 score가 사용되는 이유는 무엇인가? 
# #### 정밀도가 사용되는 이유는 True라고 분류한 경우에 실제값이 True인 경우의 비율을 알아보기 위함이고, 재현율이 사용되는 이유는 실제값이 True인 경우가 예측치에서도 True라고 분류되는 비율을 알아보기 위함이다. 그리고 f1 score는 재현율과 정밀도의 조화 평균을 통해 구해지는 값인데, 정밀도와 재현율이 상출 관계 즉, trade off 관계에 있기 때문에 이러한 상충관계를 고려하기 위해 만드러낸 지표이다. 

# ### 문제 2) facebook.csv 는 페이스북의 브랜드 페이지에 올려진 포스트들에 대한 정보이며, 각 컬럼은 다음과 같다. 

# #### (1) NA 가 포함된 행은 모두 제거하시오. (2점) 

# In[5]:


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
data=pd.read_csv('C:/Users/USER/Desktop/test/facebook.csv')
data=data.dropna()
#data.isnull().any().any() #nan 값이 있는지 반환


# #### (2) Photo와 Video 포스트에 대한 좋아요 수 평균에 차이가 있는 지를 통계적으로 검증하시오. (5점)

# In[102]:


Photo_mean=data[data['Type']=='Photo'].Like
Video_mean=data[data['Type']=='Video'].Like
cm=sms.CompareMeans(sms.DescrStatsW(Photo_mean),sms.DescrStatsW(Video_mean))
print(cm.ttest_ind(usevar='unequal'))
print(cm.tconfint_diff())
print('t 값이 0.5이하가 되고, 유의수준이 0.05를 넘어가기 때문에 두 집단의 평균에는 차이가 없다고 본다.')


# #### (3) 월요일부터 금요일까지는 1 값을 갖고, 토요일, 일요일은 0 값을 갖는 day 라는 컬럼을 생성하고, day 값이 1인 경우와 0인 경우의 포스트가 노출된 사용자 수 평균에 차이가 있는 지를 통계적으로 검증하시오. (8점) 

# In[101]:


#data['day']=np.where((data['Weekday']==6)|(data['Weekday']==7),0,1) # 둘 중 아무거나 사용가능 
data['day']=data['Weekday'].apply(lambda x:0 if (x==6) | (x==7) else 1 )
day1_mean=data[data['day']==1].Impressions
day2_mean=data[data['day']==0].Impressions
cm=sms.CompareMeans(sms.DescrStatsW(day1_mean),sms.DescrStatsW(day2_mean))
print(sp.stats.ttest_ind(day1_mean,day2_mean,equal_var=False))
print(cm.ttest_ind(usevar='unequal'))
print(cm.tconfint_diff())
print('t 값이 0.5이상이 되고, 신뢰구간에 0이 들어가고, 유의수준이 0.05를 넘기 때문에 평균에 차이가 있다..')


# ### 문제 3) day.csv 는 공유자전거 사용량을 보여주는 데이터이며, 각 컬럼은 아래와 같다.

# #### (1) 2011년 1월 1일부터 2012년 12월 31일까지의 일별 일반 사용자 수, 회원 사용자 수, 모든 사용자 수를 보여주는 그래프를 그리시오. (8점) 

# In[6]:


data1=pd.read_csv('C:/Users/USER/Desktop/test/day.csv')
data2=data1.copy()
data2.index=pd.to_datetime(data2['dteday'])
data2_g=data2[['casual','registered','cnt']]
data2_g.plot()
plt.show()


# ### 문제 4) DirectMarketing.csv 데이터는 한 인터넷 쇼핑몰의 고객에 대한 정보와 지금까지의 총 구매금액을 포함하고 있다. 

# ### (1) Salary, Children, Location, AmountSpent 네 개의 변수만을 사용하여 계층 군집화를 수행하려고 한다.  
#  
# #### (a) ward 방안을 활용하여 계층 군집화를 수행하라. (3점) 

# In[117]:


market=pd.read_csv('C:/Users/USER/Desktop/test/DirectMarketing.csv')
from scipy.cluster.hierarchy import linkage,dendrogram
from scipy.cluster.hierarchy import fcluster
from sklearn.cluster import AgglomerativeClustering
from sklearn.preprocessing import StandardScaler
market=market.dropna()

scaler_s=StandardScaler()
market=market[['Salary','Children','Location','AmountSpent']]
used_data_dummy=pd.get_dummies(market,drop_first=True)
data_features_s=pd.DataFrame(scaler_s.fit_transform(used_data_dummy))

clustering=linkage(data_features_s,'ward')
dn=dendrogram(clustering)


# #### (b) 군집의 수를 2개부터 10개까지 늘려가면서 실루엣 스코어를 구하고, 군집 수와 실루엣 스코어를 그래프로 나타내라. 실루엣 스코어로 보았을 때 가장 적절한 군 집의 수는 몇개인가? (7점) 

# In[114]:


si=[]
K=range(2,11)
for k in K:
    cl=fcluster(clustering,k,criterion='maxclust')
    si.append(silhouette_score(data_features_s,cl,metric='euclidean'))
plt.plot(K,si,'bx-')
plt.xlabel('k')
plt.ylabel('silhouette Score')
plt.show()


# #### (c) (b)에서 정해진 적합한 군집의 수로 군집을 생성하라. 얻어진 군집들의 변수별 평 균 값을 출력하고 각 군집의 의미를 기술하라.  (10점)

# In[134]:


k=8
var_mean=[]
market['cluster']=fcluster(clustering,k,criterion='maxclust')
for i in range(1,9):
    var_mean.append(np.mean(market[market['cluster']==i]))
    
for j in range(8):
    print('{}군집의 변수별 평균값'.format(j+1))
    print(var_mean[j])


# ### (2) 다음과 같이 회귀 분석을 수행하라.  

# #### (a) AmountSpent 를 종속변수로 Salary, Children, History, Catalogs를 독립변수로하여 회귀분석을 수행하라. 학습집합과 테스트 집합은 무작위로 8:2으로 분할하고, 예측성 과는 rmse로 측정하여라. (8점) 

# In[174]:


import statsmodels.api as sm 
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import math
from sklearn.metrics import mean_squared_error,mean_absolute_error

market1=pd.read_csv('C:/Users/USER/Desktop/test/DirectMarketing.csv')
market1=market1.dropna()
x=market1[['Salary','Children','History','Catalogs']]
x=pd.get_dummies(x,drop_first=True)
y=market1['AmountSpent']
X=sm.add_constant(x)


X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=None)

model=sm.OLS(y_train,X_train).fit()
predictions=model.predict(X_test)

rmse=math.sqrt(mean_squared_error(predictions,y_test))
print('예측성과 {}'.format(rmse))


# #### (b) (a)를 30회 반복 실시하고, 30회 반복해서 얻어진 rmse 값의 평균을 출력하라. (7점) 

# In[177]:


rmse=[]
for i in range(30):
    X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=None)
    model=sm.OLS(y_train,X_train).fit()
    predictions=model.predict(X_test)

    rmse.append(math.sqrt(mean_squared_error(predictions,y_test)))
print(np.mean(rmse))


# ### (3) 다음과 같이 의사결정나무 모형 생성 및 성과를 분석하라. 

# #### (a) AmountSpent 값이 AmountSpent의 평균값 이상인 경우를 1, 평균값 미만인 경우는 0의 값을 갖는 Spent라는 컬럼을 생성하라. (3점) 

# In[183]:


market2=pd.read_csv('C:/Users/USER/Desktop/test/DirectMarketing.csv')

mean_spent=np.mean(market1.AmountSpent)

market2['Spent']=np.where((market2['AmountSpent']>=mean_spent),1,0)


# #### (b) Age, Gender, OwnHome, Married, Location, Salary, Children 를 입력변수로 Spent를 목표 변수로하는 의사결정나무 모형을 만들어라. 범주형 변수의 경우에는 one hot encoding을 통해 새로운 변수들을 만들고, 새로 만들어진 변수들을 대신 입력변수로 추가하여야 한다.만들어진 의사결정나무의 모양을 출력하라. (max_depth 등의 제약은 하지 않는다.) (10점) 

# In[210]:


from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from dtreeplt import dtreeplt

x1=market2[['Age','Gender','OwnHome','Married','Location','Salary','Children']]
y1=market2['Spent']
x1_dummy=pd.get_dummies(x1,drop_first=True)

X_train,X_test,y_train,y_test=train_test_split(x1_dummy,y1,test_size=0.2,random_state=None)
tree=DecisionTreeClassifier(criterion='gini',random_state=0)
tree.fit(X_train,y_train)

dtree=dtreeplt(model=tree,
              feature_names=X_train.columns,
              target_names=['1','0'],
            )
fig=dtree.view()


# #### (c) (b)에서 만들어진 의사결정나무 모형의 성과를 5겹 교차검증으로 측정하고, 5겹 교차검증의 정확도 평균값을 출력하라. (5점) 
# 

# In[229]:


from sklearn.model_selection import cross_val_score
import sklearn.metrics as sm
scoring=['accuracy','precision','recall','f1','roc_auc']

for i in scoring:
    #tree1=DecisionTreeClassifier(criterion='entropy')
    scores=cross_val_score(tree,x1_dummy,y1,cv=5,scoring=i)
    print('모형의 성과 {}:'.format(i),scores)
    if i=='accuracy':
        print('정확도의 평균:{}'.format(np.mean(scores)))
#tree1=DecisionTreeClassifier(criterion='entropy')


# #### (d) (b)~(c)에서 만들어진 의사결정나무 모형과 입력변수, 목표변수는 동일하지만, max_depth 값을 2부터 10까지 늘려 가면서 의사결정나무 모형들을 만들어라. 각 모형들의 성과를 5겹 교차검증을 통해 검증하고, max_depth에 따른 AUC 평균값 변화를 나타내는 그래프를 출력하라. (10점)  

# In[235]:


auc_list=[]

for k in range(2,11):
    tree3=DecisionTreeClassifier(criterion='gini',max_depth=k,random_state=42)
    tree3.fit(X_train,y_train)
    for z in scoring:
        scores=cross_val_score(tree3,x1_dummy,y1,cv=5)
        #print('------------max_depth가 {}일 때 모형의 성과 지표------------'.format(k))
        print('max_depth가 {}일 때,모형의 성과 {}:'.format(k,z),scores)
        if z=='roc_auc':
            auc_list.append(np.mean(scores))
plt.plot(range(2,11),auc_list,'bx-')
plt.xlabel('max_depth')
plt.ylabel('mean_auc')
plt.show()
    

