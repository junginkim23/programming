#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[9]:


df=pd.read_csv('http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data',names=('sepal length','sepal width','petal length','petal width','class'))
#df.columns=('sepal length','sepal width','petal length','petal width','class')
df


# In[32]:


#csv 라이브러리를 이용하여 csv 파일 생성 
import csv

with open('C:/Users/USER/Desktop/data/test.csv','w') as csvfile:
    writer = csv.writer(csvfile,lineterminator='\n')
    
    writer.writerow(['100','a','a','111'])#제일 위에 것이 열이 된다. 열의 이름의 중복을 저절로 없애준다. 열에 해당하는 값이 없을 경우 NaN 값 이 들어간다. 
    writer.writerow(['sd','df','sd','1'])

dff=pd.read_csv('C:/Users/USER/Desktop/data/test.csv') 
dff


# In[35]:


data={'os':['Machintosh','Windows','Linux'],
     'release':[1984,1985,1991],
     'country':['US','US','']}

test=pd.DataFrame(data)
test.to_csv('C:/Users/USER/Desktop/data/test1.csv')


# In[86]:


from pandas import Series,DataFrame

attri_data1={'ID':['100','101','102','103','104','106','108','110','111','113'],
            'city':['서울','부산','대전','광주','서울','서울','부산','대전','광주','서울'],
            'birth_year':[1990,1989,1992,1997,1982,1991,1988,1990,1995,1981],
            'name':['영이','순돌','짱구','태양','션','유리','현아','태식','민수','호식']}

attri_data_frame1=DataFrame(attri_data1)

attri_data2={'ID':['107','109'],
            'city':['봉화','전주'],
            'birth_year':[1994,1988]}

attri_data_frame2=DataFrame(attri_data2)
#attri_data_frame1.append(attri_data_frame2)
#attri_data_frame1.sort_values(by='ID',ascending=True).reset_index(drop=True) #dataframe 정렬: df.sort_values(by='정렬할 기준 컬럼 or 컬림 리스트',ascending=True(오름차순))
#행 번호 다시 매기기: reset_index(drop=True)  
pd.merge(attri_data_frame1,attri_data_frame2,how='outer').sort_values(by='ID',ascending=True).reset_index(drop=True)


# In[117]:


import numpy as np
from numpy import nan as NA 

sample_data_frame=pd.DataFrame(np.random.rand(10,4))

sample_data_frame.iloc[1,0]=NA
sample_data_frame.iloc[2,2]=NA
sample_data_frame.iloc[5:,3]=NA

a=sample_data_frame.copy()
a.dropna()
sample_data_frame[[0,1,3]].dropna()


# In[136]:


np.random.seed(0)

sample_data_frame=pd.DataFrame(np.random.rand(10,4))

sample_data_frame.iloc[1,0]=NA
sample_data_frame.iloc[6:,2]=NA

sample_data_frame.fillna(sample_data_frame.mean())


# In[158]:


a=pd.read_csv('https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data',header=None)
a.columns=('','Alcohol','Malic acid','Ash','Alcalinity of ash','Magnesium','Total phenols','Flavanoids','Nonflavanoid phenols','Proanthocyanins','Color intensity','Hue','0D280/0D315 of diluted wines','Proline')
#많은 컬럼 중 하나만이 아닌 여러 가지도 수정 가능 컬럼의 이름을 바꿀 때 유용 
#a.rename(columns={a.columns[0]:'hey',a.columns[1]:'aa'},inplace=True)
a['Magnesium'].mean()


# In[165]:


dupli_data=pd.DataFrame({'col1':[1,1,2,3,4,4,6,6,7,7,7,8,9,9],'col2':['a','b','b','b','c','c','b','b','d','d','c','b','c','c']})
dupli_data.drop_duplicates().reset_index(drop=True)


# In[185]:


from pandas import DataFrame

attri_data1={'ID':['100','101','102','103','104','106','108','110','111','113'],
            'city':['서울','부산','대전','광주','서울','서울','부산','대전','광주','서울'],
            'birth_year':[1990,1989,1992,1997,1982,1991,1988,1990,1995,1981],
            'name':['영이','순돌','짱구','태양','션','유리','현아','태식','민수','호식']}

attri_data_frame1=DataFrame(attri_data1)

city_map={'서울':'중부','대전':'중부','광주':'남부','부산':'남부'}

attri_data_frame1['region']=attri_data_frame1['city'].map(city_map)
pd.value_counts(attri_data_frame1.region)

ID_bins=[1980,1985,1990,1995,2000]
birth_name=['first','second','third','fourth']
ID_cut_data=pd.cut(attri_data_frame1['birth_year'],ID_bins,labels=birth_name)
#pd.cut(cut할 column,나눈 구간 리스트,labels=구간에 이름붙인 리스트)
ID_cut_data
pd.value_counts(ID_cut_data)

id_two=pd.cut(attri_data_frame1['birth_year'],2)
pd.value_counts(id_two)


# In[ ]:




