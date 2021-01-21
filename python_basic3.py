# -*- coding: utf-8 -*-
"""python_basic3

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1fbwKPR_uD49JHEdxMv8c8dGl_HSwqOa2

1. 파이썬 제어문 - for
"""

numbers = [1, 2, 3, 4, 5]
result = []
for n in numbers:
    if n % 2 == 1:
        result.append(n*2)
print(result)

result = [n*2 for n in numbers if n % 2 == 1]
print(result)

"""2. 파이썬 자료형 - tuple"""

t1 = (1, 2, 3)
print(t1)
print(len(t1))
print(t1[0])
print(t1[:2])
del t1[0] #튜플 내에 원소 변경, 삭제, 수정 불가 
t1[0] = 4
t2 = (4,)
print(t2)
print(t1*3)
print(t1 + t2)

"""3. 파이썬 제어문 - while"""

count = 0 
while count < 10 : 
    count += 1 
    print(count)

prompt = """
1. Add 
2. Del 
3. Quit
"""
number = 0 
while number != 3 :
    print(prompt)
    number = int(input("Enter number:"))

coffee = 3
while True:
    money = int(input("돈을 넣어 주세요: "))
    if money == 300:
        print("맛있게 드세요.")
        coffee = coffee -1
    elif money > 300:
        print("거스름돈은 %d원입니다." % (money - 300))
        print("맛있게 드세요.")
        coffee = coffee -1
    else:
        print("%d 원을 더 넣어주세요." % (300 - money))
    if coffee == 0:
        print("커피가 다 떨어졌습니다. 판매를 중지 합니다.")
        break

# coffee = 3
# while coffee > 0:
#     print(f'남은 커피: {coffee}')
#     money = int(input("돈을 넣어 주세요: "))
#     if money < 300:
#         continue
#     coffee -= 1
#     print("맛있게 드세요.")

"""4. 파이썬 파일 입출력"""

f = open("./write.txt", 'w')
f.write("file write")
f.close()

f = open("./write.txt", 'w')
for i in range(1, 10):
    data = f'line {i}\n'
    f.write(data)
f.close()

with open("./write.txt", 'w') as f:
    for i in range(1, 10):
        data = f'line {i}\n'
        f.write(data)

f = open("./write.txt", 'a')
for i in range(10, 20):
    data = f'line {i}\n'
    f.write(data)
f.close()

f = open("./write.txt", 'r')
line = f.readline()
print(line)
f.close()

f = open("./write.txt", 'r')
line = f.readline()
while line:
    print(line)
    line = f.readline()
    # print(type(line))
f.close()

f = open("./write.txt", 'r')
lines = f.readlines()
print(type(lines))
for line in lines:
    print(line)
f.close()

f = open("./write.txt", 'r')
content = f.read()
print(type(content))
print(content)
f.close()

f = open("./write.txt", 'r')
content = f.read(6)
print(type(content))
print(content)
content = f.read(14)
print(content)
f.seek(0)
content = f.read(14)
print(content)
f.close()