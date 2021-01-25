#!/usr/bin/env python
# coding: utf-8

# In[2]:


#range 범위 설정
for i in range(1,10,2):
    a,b,c=i,i+1,i+2
    print(a,b,c)


# In[11]:


#리스트에 일반 연산 사용시 출력 결과
x1=[1,2,3]
print(2*x1)
print(x1+x1)


# In[13]:


#문자열 내에 '를 출력하기 위해서 \(백 슬래쉬)를 사용.
hello='it\'s hot'
print(hello)


# In[14]:


#long text를 사용하기 위해 """ """ 사용
hello="""나는 대학원을 갈거야.
누구보다 열심히 해서 꼭 노력한 결과를 받아낼거야.
그러기 위해선 지금 누구보다 열심히 해야해! 알지? let's go for it! 
힘내자!
"""
print(hello)

