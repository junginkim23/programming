#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd

imp=pd.read_csv('C:/Users/USER/Desktop/test/ab_test_imp.csv')
imp


# In[30]:


import numpy as np
click=pd.read_csv('C:/Users/USER/Desktop/test/ab_test_goal.csv')
#click dataframe은 보여진 배너를 사용자가 클릭한 것이 기록되어 있다.
#imp dataframe은 노출된 광고 배너가 무엇인지가 기록되어 있다.
imp_click=pd.merge(imp,click,how='left',on='transaction_id')
imp_click['clicked']=np.where(imp_click['user_id_y'].isnull(),0,1)
imp_click
show_a=imp_click[imp_click['test_case_x']=='A']
show_b=imp_click[imp_click['test_case_x']=='B']
click_a=show_a[show_a['clicked']==1]
click_b=show_b[show_b['clicked']==1]
CTRa=len(click_a)/len(show_a)
CTRb=len(click_b)/len(show_b)
cont=pd.crosstab(imp_click.test_case_x,imp_click.clicked)
sp.stats.chi2_contingency(cont)

