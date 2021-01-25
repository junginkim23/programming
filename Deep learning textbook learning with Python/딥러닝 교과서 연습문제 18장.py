#!/usr/bin/env python
# coding: utf-8

# In[14]:


import requests
#python에서 HTTP 요청을 보내는 모듈, HTTP: 인터넷에서, 웹 서버와 사용자의 인터넷 브라우저 사이에 문서를 전송하기 위해 사용되는 통신규약
import io
import pandas as pd
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from sklearn.model_selection import RandomizedSearchCV 

vote_data_url='http://archive.ics.uci.edu/ml/machine_learning-databases/voting-records/house-votes-84.data'
s=requests.get(vote_data_url).content#해당 url로 get 요청을 보냄(reguest)
vote_data=pd.read_csv(io.StringIO(s.decode('utf-8')),header=None)
#io.StringIO -> str 객체를 기대하고 생성한다. 
vote_data.columns=['class Name','handicapped-infants','water-project-cost-sharing','adoption-of-the-budget-resoulution','physician-fee-freeze',
                  'el-salvador-aid','religiou-groups-in-schools','anti-satelite-test-ban','aid-to-nicaraguan-contras','mx=missile','immigration','synfuels=corporation-cutback',
                  'education-spending','superfundright-d','cr9d','asdsdsad','dssdsds']
label_encode=preprocessing.LabelEncoder()

