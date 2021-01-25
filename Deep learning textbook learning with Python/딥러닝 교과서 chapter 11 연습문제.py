#!/usr/bin/env python
# coding: utf-8

# In[157]:


import matplotlib.pyplot as plt
import numpy as np


# In[169]:


get_ipython().run_line_magic('matplotlib', 'inline')
#그림 또는 그래프를 실행한 브라우저에서 바로 볼 수 있게 해준다.


# In[170]:


x_upper=np.linspace(0,5) #linspace는 1차원 배열 만들기, 그래프 그리기에서 수평축의 간격 만들기 등에 매우 편리하게 사용할 수 있는 함수이다.
                         #Linearly Space를 줄인 것으로 np.linspace(start,stop,num) 
                         #start:배열의 시작 값, stop:배열의 끝 값 num: start와 stop 사이를 몇 개의 일정한 간격으로 요소를 만들 것인지, 만일 num이 없다면 디폴트로 50개의 1차원 배열을 만들어준다.
x_lower=np.linspace(0,2*np.pi)
x_tan=np.linspace(-np.pi/2,np.pi/2)
positions_upper=[i for i in range(5)]
positions_lower=[0,np.pi/2,np.pi,np.pi*3/2,np.pi*2]
positions_tan=[-np.pi/2,0,np.pi/2]
labels_upper=[i for i in range(5)]
labels_lower=["0",'90','180','270','360']
labels_tan=['-90','0','90']


# In[183]:


fig=plt.figure(figsize=(9,6))

plt.subplots_adjust(wspace=1,hspace=1)

for i in range(3):
    x=x_upper
    y=x_upper**(i+1)
    ax=fig.add_subplot(2,3,i+1)
    ax.grid(True)
    ax.set_title('$y=x^%d$' %(i+1))
    ax.set_xlabel('$x-axis$')
    ax.set_ylabel('$y-axis$')
    ax.set_xticks(positions_upper)
    ax.set_xticklabels(labels_upper)
    ax.plot(x,y)
title=['$y=sin(x)$','$y=cos(x)$']
y_lower_list=[np.sin(x_lower),np.cos(x_lower)]
for i in range(2):
        ax=fig.add_subplot(2,3,i+4)
        ax.set_title(title[i])
        ax.set_xlabel('$x-axis$')
        ax.set_ylabel('$y-axis$')
        ax.set_xticks(positions_lower)
        ax.set_xticklabels(labels_lower)
        ax.grid(True)
        ax.plot(x_lower,y_lower_list[i])

ax=fig.add_subplot(2,3,6)
ax.set_title('$y=tan(x)$')
ax.set_xlabel('$x-axis$')
ax.set_ylabel('$y-axis$')
ax.set_xticks(positions_tan)
ax.set_xticklabels(labels_tan)
ax.grid(True)
ax.set_ylim([-1,1])
ax.plot(x_tan,np.tan(x_tan))
plt.show()

