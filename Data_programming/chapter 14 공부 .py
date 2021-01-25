#!/usr/bin/env python
# coding: utf-8

# In[106]:


import pandas as pd
import numpy as np
from mlxtend.preprocessing import TransactionEncoder #mlxtend(머신러닝 익스텐드)라이브러리에 구현된 연관규칙 함수를 활용하여 실습한다. 
from mlxtend.frequent_patterns import apriori #연관규칙 함수를 알아내기 위해 apriori 알고리즘을 사용한다. 

dataset=pd.read_csv('C:/Users/USER/Desktop/data/shopping.csv')
lst=[]
for sublist in dataset.values.tolist(): 
    clean_list=[item for item in sublist if item is not np.nan]
    lst.append(clean_list)
#데이터프레임 내에 있던 nan값이 삭제되고 각각의 행을 리스트로 만들어서 하나의 리스트에 추가시켰다. 
te=TransactionEncoder() #apriori알고리즘에 맞는 입력 데이터로 변환하기 위해서 사용한다.
te_ary=te.fit(lst).transform(lst)#lst 데이터셋에 대해서 학습을 하고! 데이터 셋의 각각의 원소들이 컬럼이 되어 각각의 리스트에 그 원소가 있다면 true, 없다면 false로 입력되어 배열로 반환된다. 
te.columns_#te.columns_를 하게 되면 학습한 데이터의 각각의 요소들이 뽑혀서 리스트를 만들어 낸다. 
df=pd.DataFrame(te_ary,columns=te.columns_)
frequent_itemsets=apriori(df,min_support=0.3,use_colnames=True)
from mlxtend.frequent_patterns import association_rules #다양한 지표(신뢰도,지지도,향상도)를 이용해서 연관규칙을 파악해보기 위한 라이브러리 호출
rule=association_rules(frequent_itemsets,metric='confidence',min_threshold=0.85)#신뢰도를 이용해서 연관규칙을 파악해보려한다.
rules=association_rules(frequent_itemsets,metric='lift',min_threshold=1.2)
rules['antecedents_len']=rules['antecedents'].apply(lambda x:len(x))
rules


# In[112]:


#생성한 컬럼과 지표 값이 포함된 컬럼을 이용하여 특정 조건에 해당하는 규칙을 찾을 수 있다.
rules[(rules['antecedents_len']>=2) & (rules['confidence']>0.75) & (rules['lift']>1.2)]


# In[118]:


#특정 제품명이 포함된 규칙을 찾을 수도 있다. 
rules[rules['antecedents']=={'Beans'}]


# In[102]:


frequent_itemsets=apriori(df,min_support=0.3,use_colnames=True)
frequent_itemsets


# In[104]:


#dataset에 대해서 다양한 지표를 이용하여 연관규칙을 보여주는 dataframe 생성 코드이다. 
rule=association_rules(frequent_itemsets,metric='confidence',min_threshold=0.3)
#association_rules()의 parameter을 살펴보자.
#frequent_itemsets는 apriori 알고리즘을 이용하여 반환된 데이터프레임이다. 
#metric는 신뢰도, 지지도, 향상도 중에 하나를 선택하고, min_threshold에 입력된 임계값을 최소로 하는 신뢰도,지지도,향상도에 해당하는 데이터만을 뽑아내어 데이터 프레임으로 반환한다. 
rule
#아래의 데이터 프레임의 각각의 컬럼에서, antecedents는 선행사건을 말하는 것으로서, 만약 antecedents가 (Corn)이고, consequents가 (Beans)라면,
#corn을 사고 bean을 산 지지도 신뢰도 향상도를 보여주고 있다. 그리고 각각을 샀을 때의 지지도 또한 보여주고 있다.
#여기서 지지도란 전체 데이터 중에 해당 데이터를 산 확률을 말한다. 


# In[91]:


te.columns_#te.columns_를 하게 되면 학습한 데이터의 각각의 요소들이 뽑혀서 리스트를 만들어 낸다. 


# In[90]:


frequent_itemsets=apriori(df,min_support=0.3,use_colnames=True)
frequent_itemsets

