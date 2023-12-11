#!/usr/bin/env python
# coding: utf-8

# In[63]:


#리스트.append() 
#리스트 변수에 원소를 추가하는 함수 
stuff=list() # 리스트를 지금 하나 만듬
stuff.append('book') #stuff라는 list의 맨 뒤의 위치에 'book'이라는 원소 생성
stuff.append(99)
print(stuff)
stuff1=['s','d','x']
stuff1.append('book')
print(stuff1)

#----------------------------------------------
#in, not in 
#리스트 변수가 특정 값을 가지고 있는 지를 확인하기 위해 사용하는 것
some = [1,9,21,10,16]
9 in some #Result: True
15 in some #Result: False
20 not in some #20이 some 안에 없기 때문에 true가 된다. not이 붙었기에! 

#----------------------------------------------
#리스트.sort()
#리스트 변수가 가지고 있는 값들을 정렬
#알파벳 순으로 오름차순 정렬이 된다. 숫자면 순서대로! 오름차순! 
#내림차순으로 정렬하고 싶다면, 리스트.sort(reverse=True) 이렇게 되면 내림차순이 가능하다. 
friends=['b','c','a']
print(friends)
friends.sort()
print(friends)
lotto=[1,4,10,2,7]
lotto.sort()
print(lotto)
lotto.sort(reverse=True)
print(lotto) 

#max(),min(),sum()
#-리스트 변수를 인수로 받아 계산됨. 
#max():최댓값, min():최솟값, sum(): 총합
print(len(lotto))
print(max(lotto))
print(min(lotto))
print(max(friends))
print(min(friends))# 문자도 max, min이 가능하다
print(sum(lotto))
print(sum(lotto)/len(lotto)) # lotto안의 값들의 평균 

#split()
#문자열을 처리하는 데에 리스트 변수가 유용하게 사용됨. 
#split()은 공백을 기준으로 문자열을 잘라주는데 잘라진 한 부분이 리스트의 원소로 입력됨
abc='May the Force be with you'
list1=abc.split()
print(list1)
print(len(list1))
print(list1[2])

lind='first;second;third'
lind1=lind.split(';') #공백의 역할을 지금 ;가 해주고 있다. 
print(lind1)
#문자열을 list로 처리하면 텍스트를 처리하는데 유용하다. 

#<딕셔너리>
#리스트 변수: 원소를 차곡차곡 순서대로 넣은 형태, 순서에 기반한 위치를 이용하여 원하는 원소를 호출
#딕셔너리 변수: 넣는 정보가 무엇에 대한 것인지 함께 입력, 저장된 정보를 순서가 아니라 함께 입력된 정보의 내용에 기반하여 호출
#=> 즉,딕셔너리 변수를 선언할 시에는 넣는 정보가 무엇인지 'key'값을 같이 넣어준다.
score= dict()
score['Math']=92 #score에 Math라는 key 값에 92를 넣어줘라!
score['English']=73
score['korean']=91
#위의 dic에 저장되는 순서는 넣는 순서에 따라 차례로 먼저 들어간다. 
print(score)
print(score['Math']) #print(score[key값])
score1=dict()
score1['a']=1
score2=score['Math']+score1['a']
score2=dict()
#score2=score+score1 dict과 dict사이에는 +가 성립 되지 않는다.
print(score2)
#딕셔너리는 리스트와 비슷하지만! 리스트에서는 인덱스(lotto[index])를 기반으로 값을 찾지마 딕셔너리에서는 항목이름인 key(score['Math'])를 기준으로 값을 찾음
#리스트는 인덱스가 딕셔너리의 key와 비슷한 의미
#score[0] //이런식으로 선언하게 되면 오류 발생, 키 값이 아니라 위치로 호출하는 것은 없는 key를 호출하는 것이기 때문에 
#딕셔너리는 한번에 모든 항목과 값을 딕셔너리 변수에 입력이 가능하다
score2={'Math':50,'korean':90,'English':92}
print(score2)
#score3=dict()와 동일하게! score3={}이렇게만 해도 딕셔너리가 만들어 진다. 
#<keys(),values(),items()>
print(score2.keys())
print(score2.values())
print(score2.items()) #Result: ('Key',Value) -->이런 형태를 tuple이라고 한다. 


# In[ ]:




