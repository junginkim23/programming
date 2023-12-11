#!/usr/bin/env python
# coding: utf-8

# In[4]:


a=4

def func1(x):
    return 2*x**2-3*x+1

func2=lambda x: 2*x**2-3*x+1

print(func1(a))
print(func2(a))


# In[12]:


add=(lambda x,y:x+y)(3,5)
add


# In[10]:


x,y,z=5,6,2

def func3(x,y,z):
    return x*y+z

func4=lambda x,y,z:x*y+z

print(func3(x,y,z))
print(func4(x,y,z))


# In[14]:


a1,a2=13,32

func5=lambda x:x**2-40*x+350 if x>=10 and x<30 else 50

print(func5(a1))
print(func5(a2))


# In[40]:


test='my/name/is/alex_nice_to_meet/you/again bro'
list1=test.split('/',4)
list1


# In[27]:


self_data='My name is Yuri'
a=self_data.split(' ')
print(a[3])


# In[41]:


import re
re.split('[/_ ]',test)


# In[43]:


time_data='2020/1/5_22:15'
a=re.split('[/_:]',time_data)
print(a[1],a[3])


# In[56]:


from numpy import mean
a=[[1,2,3],[2,4,5,1],[2,4,5,6,2,1],4,5]
list(map(mean,a))


# In[69]:


time_list=['2006/11/26_2:40','2009/1/16_23:35','2014/5/4_14:26','2017/8/9_7:5','2020/1/5_22:15']
get_hour=lambda x:int(re.split('[/_:]',x)[1])-7<0
list(filter(get_hour,time_list))


# In[77]:


time_data=[[2006,11,26,2,40],[2009,1,16,23,35],[2014,5,4,14,26],[2017,8,9,7,5],[2020,1,5,22,15]]

a=sorted(time_data,key=lambda x:x[3])
print(a)


# In[82]:


minute_data=[30,155,180,74,11,60,82]

just_hour_data=[x for x in minute_data if x%60==0]
print(just_hour_data)


# In[84]:


hour=[0,2,3,1,0,1,1]
minute=[30,35,0,14,11,0,22]

h_m_combine=lambda x,y: x*60+y

minute_data1=[h_m_combine(x,y) for x,y in zip(hour,minute)]

print(minute_data1)


# In[88]:


three_place=[0,1]
twos_place=[0,1]
ones_place=[0,1]

digit=([x*4+y*2+z for x in ones_place for y in twos_place for z in three_place])

print(digit)


# In[135]:


from collections import defaultdict,Counter

description='Artificial intelligence (AI, also machine intelligence, MI) is '+'intelligence exhibited by machines, rather than '+'humans or other animals (natural intelligence, NI).'

d=defaultdict(int)
c=Counter(description)
for i in description:
    d[i]+=1
    
print(sorted(d.items(),key=lambda x:x[1],reverse=True)[:10])
c
d.items()


# In[136]:


price=[('apple',50),('banana',120),('grape',500),('apple',70),('lemon',150),('grape',1000)]
d=defaultdict(list)
for key,value in price:
    d[key].append(value)

#print([sum(d[x])/len(d[x]) for x in d.keys()])
print([sum(x)/len(x) for x in d.values()])


# In[139]:


c.most_common(10)


# In[141]:


c=Counter(description)
print(c.most_common(10))

