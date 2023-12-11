#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt


# In[76]:


stocks=pd.read_csv('C:/Users/USER/Desktop/data/stock-price.csv')
stocks['AAPL'].head(50)


# In[77]:


stocks.index=pd.to_datetime(stocks['Date'])
stocks=stocks.drop('Date',axis=1)
stocks.head(50)


# In[4]:


stocks.plot() #dataframe의 index가 x축으로 간다. 
plt.ylim((0,500)) #y축의 값을 0~500 달러로 제한해주는 함수.ylim(0,500)
plt.show()


# In[5]:


stocks['AAPL'].plot()


# In[6]:


stocks['AAPL'].loc['11-2018':'12-2018'].plot()#iloc->행 번호 접근, loc->행 이름 접근
#'월-연도'


# In[81]:


#resample->그래프에 표시되는 기간을 다양하게 변경해서 그릴 수 있음. 
apple_quarterly=stocks['AAPL'].resample('M')
#ffill() -> 분기의 값을 하나의 값으로 나머지 data에 다 채워줌. 
#분기의 값을 분기의 값 전에 것으로 채워줌. 
#Q대신에 M:월, W:주간 을 써줄 수도 있다.
#resample의 인수로 'Q'를 넣어주면, 분기별로 기간을 쪼갤 수 있다. 
apple_quarterly.plot(color='r',marker='*',linestyle='--')
plt.show()
#일반적인 분기 기준 1월~12월을 4등분
#9월 1일부터 시작, 9월에 끝나는 경우 : Q-SEP
#ffill()->'NA'의 값, 누락된 값이 있으면 그것의 최근 값으로 대신해주는 함수.
#밑에 그래프를 보면, 2015년을 4등분하여 나타내었다는 것을 알 수 있다.  


# In[82]:


print(apple_quarterly)
stocks['AAPL'].head(65)


# In[9]:


stocks.AAPL.plot(label='price')
stocks.AAPL.rolling(20).mean().plot(label='20 MA')
#MA = moving average(이동 평균선)
stocks.AAPL.rolling(60).mean().plot(label='60 MA')
stocks.AAPL.rolling(120).mean().plot(label='120 MA')
plt.legend(loc='best')
plt.show()


# In[24]:


#<실습-이틀간의 이동평균선 구하기>
data={'score':[1,1,1,2,2,2,3,3,3]}
df=pd.DataFrame(data)
df.rolling(window=2).mean()#rolling(window=n) ==rolling(n)
#NaN이 나온 이유는 첫날의 전 날과 이동 평균을 구해야 하는데 전날이 없기 떄문에 구할 수 없다. 


# In[27]:


#주가수익률 구하기
returns=dict()#막대그래프를 그릴 것이기 떄문에 dictionary로 선언하는게 더 좋다. 
returns['Apple']=stocks.AAPL['2018-12-31']/stocks.AAPL['2018-01-02']-1
#딕셔너리의 키 Apple안에 값을 넣어주는 코드 
#1을 빼면 첫날에 비해서 얼마나 상승했는지의 비율이 나온다. 
returns['Microsoft']=stocks.MSFT['2018-12-31']/stocks.MSFT['2018-01-02']-1
returns['Netflix']=stocks.NFLX['2018-12-31']/stocks.NFLX['2018-01-02']-1

plt.bar(returns.keys(),returns.values(),color=['red','blue','grey'])
#keys():딕셔너리의 키 값 호출, values(): 딕서너리의 값들 호출 
plt.show()


# In[ ]:


#<주가예측>
#시계열 데이터를 이용해 예측을 하려면 통계적인 부분을 많이 알아야 한다. 
#Prophet: 주가예측을 위해 제공해주는 라이브러리 
#이 라이브러리는 윈도우상에서 설치하는데 어려움이 있다. 
#하지만 구글 코랩에서는 가능하다. 

