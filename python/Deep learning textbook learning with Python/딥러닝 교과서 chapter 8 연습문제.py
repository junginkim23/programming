#!/usr/bin/env python
# coding: utf-8

# In[34]:


import pandas as pd
import numpy as np

index=['growth','mission','ishikawa','pro']
data=[50,7,26,1]

series=pd.Series(data,index=index)
print(series)
print()
aidemy=series.sort_index()
print(aidemy)

aidemy1=pd.Series({"tutor":30})
aidemy2=series.append(aidemy1)

print(aidemy1)
print()
print(aidemy2)


# In[35]:


df=pd.DataFrame()
for index in index:
    df[index]=np.random.choice(range(1,11),10)
df.index=range(1,11)
aidemy3=df.loc[range(2,6),["ishikawa"]]
print()
print(aidemy3)
#np.random.choice(range(1,11),10) 데이터 셋 1~10 사이에서 10개 선택! 
#numpy.random.choice(a, size=None, replace=True, p=None) -> replace=TRUE를 하게 되면 중복되서 선택될 수 있고 FALSE이면 중복되서 선택될 수 없다. 

