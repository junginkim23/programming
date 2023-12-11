# -*- coding: utf-8 -*-
"""python_basic8

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1OzVSL4COAac-OQxOE-lR7ERFiqPz4n-l
"""

## 알고리즘 문제 풀이 1 
## 분류 문제 
## https://www.acmicpc.net/problem/11650
'''
입력 
5
3 4
1 1
1 -1
2 2
3 3

출력 
1 -1
1 1
2 2
3 3
3 4
'''

n = int(input())
coordinate = []

for i in range(n):
  # x, y = input().split()
  # x, y = int(x),int(y)
  # list.append((x,y))
  coordinate.append(tuple(map(int,input().split())))

coordinate.sort()
print('-------answer-------')
for x,y in coordinate:
  print(x,y)

x,y = 10,2
list = [ ]
list = lambda x,y:x+y
list(x,y)

import time 
import functools
import sys 

print(sys.getrecursionlimit()) #최대 재귀 깊이가 얼마인지 알 수 있다. 
sys.setrecursionlimit(1000000) #maximum recursion depth exceeded in comparison 문제 해결 , 최대 재귀 깊이를 늘린다.
print(sys.getrecursionlimit())

#lru_cache() is one such function in functools module which helps in reducing the execution time of the function by using memoization technique.
#lru_cache(maxsize=128, typed=False) 
# Parameter-maxsize, This parameter sets the size of the cache, the cache can store upto maxsize most recent function calls. 
#if maxsize is set to None, the LRU feature will be disabled and the cache can grow without any limitations
@functools.lru_cache(None) #이전에 연산들을 기억하겠다. 그래서 연산을 더 빠르게 해준다. 
#LRU :메모리에 필요한 페이지가 있을 때는 잘 진행되지만, 없을 경우에는 문제가 생긴다. 
#프로세스가 필요로 하는 페이지가 없는 경우(page-fault) 하드 디스크에서 페이지를 찾아 빈 프레임에 로딩하는데, 여기서 또다시 ‘페이지를 올릴 빈 프레임이 없을 경우’ 란 문제에 직면할 수 있다.
#이 때 사용하는 것이 새로 올릴 페이지와 교체할 희생 프레임을 찾는 알고리즘, 페이지 교체 알고리즘이다.

def A(n):
  
  if n==1:
    return 0
  min_cost = (1000000 - 1)
  
  if n%3 == 0:
    new_cost = A(n/3) + 1 
    min_cost = min(min_cost,new_cost)
  
  elif n%2 == 0:
    new_cost = A(n/2) + 1
    min_cost = min(min_cost,new_cost)

  new_cost = A(n-1) + 1
  min_cost = min(min_cost,new_cost)

  return min_cost

times = time.time()
print(A(10))  #maximum recursion depth exceeded in comparison -> limit를 좀 크게 해줘야 한다. sys 패키지를 사용해서 해결. 
print(time.time()-times)

## 알고리즘 문제 풀이 2
## 재귀 문제
## https://www.acmicpc.net/problem/1463

'''
입력 1
2

출력 1 
1

입력 2 
10 

출력 2 
3 
'''

# n = int(input())
import functools
import time
import sys
@functools.lru_cache(None) #입력과 출력을 모두 외워 놓겠다. 

def A(n):
  if n == 1:
    return 0
  
  min_cost = 1000000 - 1

  if n % 3 == 0:
    new_cost = A(n // 3) + 1 
    min_cost = min(min_cost, new_cost)
  elif n % 2 ==0:
    new_cost = A(n // 2) + 1
    min_cost = min(min_cost, new_cost)
  new_cost = A(n - 1) + 1
  min_cost = min(min_cost,new_cost)

  return min_cost 

sys.setrecursionlimit(10000)
s = time.time()
print(A(2000))
print(time.time()-s)

n = int(input())

coordinates = [ ]
for i in range(n):
  # x, y = input().split() #input()을 쓰면 string의 형태이다. string과 관련된 함수 사용 가능 
  # x, y = int(x), int(y)
  # coordinate = tuple((x,y))
  coordinate = tuple(map(int,input().split()))
  coordinates.append(coordinate)

print(coordinates)
coordinates.sort()
# coordinates.sort(reverse=True) #내림차순으로 정렬 
# print(coordinates)
print(type(coordinates[0]))

for x, y in coordinates:
  print(x, y)
  # coordinates. #tuple로 했을 때 performance가 더 좋은 편이다.  

#rambda 사용?

#순수함수와 비순수함수 
#(1)순수함수: 함수의 실행이 외부 상태에 영향을 끼치지 않는 함수를 말한다. 
def add(x,y):
  return x+y

print(add(1,2))

#(2)비순수 함수 or 수정자 함수: 함수의 실행이 외부 상태에 영향을 끼치는 함수 
number_list = [1,2,3] #외부 상태 

def append_number(n):
  number_list.append(n)

append_number(4)
print(number_list)

#함수를 변수에 할당 
def hello(): print('hello')
hi = hello 
hi()

y = [ hello, hello]
y[0]()
y[1]()