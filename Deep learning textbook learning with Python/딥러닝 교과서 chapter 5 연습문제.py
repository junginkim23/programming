#!/usr/bin/env python
# coding: utf-8

# In[29]:


item={"지우개":[100,2],"펜":[200,3],"노트":[400,5]}
total_price=0
money=10000


# In[30]:


for name,name_list in item.items():
    print(name+"은(는) 한 개에 "+str(name_list[0])+"원이며, "+str(name_list[1])+"개 구입합니다." )
    total_price+=name_list[0]*name_list[1]
print("지불해야 할 금액은 "+str(total_price)+" 원입니다.")
if money>total_price:
    print("거스름돈은 "+str(money-total_price)+"원입니다.")
elif money==total_price:
    print("거스름돈은 없습니다.")
else: 
    print("돈이 부족합니다.")


# In[5]:




