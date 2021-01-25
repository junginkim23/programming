#!/usr/bin/env python
# coding: utf-8

# In[9]:


import pandas as pd
import numpy as np
from numpy import nan as NA
from collections import Counter

df=pd.read_csv('http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data',header=None)
#header=None은 컬럼명을 쓰지 않고 value값을 쓰고 싶을 때 header=None을 해주면 1,2,3,4,5,6,,,이런 식으로 수치가 들어간다. 
df.columns=['','Alcohol','Malic acid','Ash','Alcalinity of ash','Magnesium','Total phenols','Flavanoids','Nonflavanoid phenols','Proanthocyanins','Color intensity','Hue','0D280/0D315 of diluted wines','Proline']

df_ten=df.head(10)
print(df_ten)

df_ten.iloc[1,0]=NA
df_ten.iloc[2,3]=NA
df_ten.iloc[4,8]=NA
df_ten.iloc[7,3]=NA
print(df_ten)

df_ten.fillna(df_ten.mean())
print(df_ten)

df_ten.append(df_ten.loc[3])
df_ten.append(df_ten.loc[6])
df_ten.append(df_ten.loc[9])
df_ten=df_ten.drop_duplicates()
print(df_ten)

alcohol_bins=[0,5,10,15,20,25]
alcoholr_cut_data=pd.cut(df_ten['Alcohol'],alcohol_bins)

print(pd.value_counts(alcoholr_cut_data))

