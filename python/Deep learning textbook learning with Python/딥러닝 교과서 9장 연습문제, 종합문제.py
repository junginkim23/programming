#!/usr/bin/env python
# coding: utf-8

# In[26]:


import pandas as pd

df1=pd.DataFrame([["apple","Fruit",120],["orange","Fruit",60],["banana","Fruit",100],["pumpkin","Vegetable",150],["potato","Vegetable",80]],columns=["Name","Type","Price"])
df2=pd.DataFrame([['onion','Vegetable',60],['carrot','Vegetable',50],['beans','Vegetable',100],['grape','Fruit',160],['kiwifruit','Fruit',80],['potato','Vegetable',80]],columns=['Name','Type','Price'])


# In[27]:


df=pd.DataFrame()
df=pd.concat([df1,df2],axis=0)
fruit=df[df.Type=='Fruit']
a=fruit.sort_values(by='Price',ascending=True)
vegetable=df[df.Type=='Vegetable']
b=vegetable.sort_values(by='Price',ascending=True)
print(sum(a[:3]['Price'])+sum(b[:3]['Price']))


# In[48]:


index=['광수','민호','소희','태양','영희']
columns=['국어','수학','사회','과학','영어']
data=[[30,45,12,45,87],[65,47,83,17,58],[64,63,86,57,46],[38,47,62,91,63],[65,36,85,94,36]]
df=pd.DataFrame(data,index=index,columns=columns)
pe_columns=pd.Series([56,43,73,82,62],index=index)
df['체육']=pe_columns
df1=df.sort_values(by='수학',ascending=True)
df1=df1+5
df1.describe().loc[['mean','max','min']]

