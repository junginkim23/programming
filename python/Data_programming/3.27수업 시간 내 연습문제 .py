#!/usr/bin/env python
# coding: utf-8

# In[1]:


hours = input('몇 시간 동안 일했나요?')
salary = input('시간당 급여는 얼마인가요?')
pay = int(hours)*int(salary)
print('총 급여:',pay)


# In[2]:


hours = input('몇 시간 동안 일했나요?')
salary = input('시간당 급여는 얼마인가요?')

if int(hours)<=40:
    pay = int(hours)*int(salary)
else : 
    pay = 40*int(salary) + (int(hours)-40)*1.5*int(salary)
print('총 급여: ', pay)


# In[4]:


#최소값을 찾는 코드를 만들자
set_num=[9,41,12,3,74,15]
smallest_so_far = 10000000
print('Before',smallest_so_far)
for the_num in set_num : 
    if the_num < smallest_so_far:
        smallest_so_far = the_num
    print(smallest_so_far,the_num)# 다 입력해주시 위해서 if 문 밖에다가 선언해줘야 한다. 
print('After',smallest_so_far)

