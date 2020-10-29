#벡터 연산: 원소 대 원소로 연산이 수행된다.  

#R에서는 연산자도 함수 취급
#""를 이용해서 함수처럼 사용할 수 있다. 
"+"(1,2) #output: 3 

#사칙연산
c(1,2,3) + c(4,5,6) #output:5 7 9 
c(1,2,3) * c(4,5,6) #output:4 10 18 
c(10,20,30) / c(2,4,6) #output:5 5 5
c(10,20,30) - c(1,2,3) #output:9 18 27

#나머지 
c(10,20,30) %% c(3,5,7) #output:1 0 2 

#몫 
c(10,20,30) %/% c(3,5,7) #output:3 4 4

#연산 성질: 길이가 다를 때는 길이가 짧은 벡터를 반복 사용해서 연산을 수행한다. 
c(10,20,30) + c(4,5,6,7,8) #output:14 25 36 17 28, 경고메시지 발생: 두 객체가 서로 배수관계에 있지 않습니다. 
c(1,2,3) + c(4,5,6,7,8,9) #output:5 7 9 8 10 12 

c(1,3,5) + 10 #output:11 13 15 

#논리 연산자 
#==, !=, <, >, <=, >=, !x, x | y, x & y, isTRUE()
v <-pi
w <-10/3
v == w #output:FALSE
v != w #output:TRUE
v > w #output:FALSE
!(v > w) #output:TRUE
(v == w) | (v < w) #output:TRUE
(v == w) & (v < w) #output:FALSE
isTRUE(v==w) #output:FALSE

y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)

y == z #output:FALSE FALSE  TRUE FALSE FALSE
y != z #output:TRUE  TRUE FALSE  TRUE  TRUE
y == 50 #output:FALSE FALSE  TRUE FALSE FALSE

#as.numeric(x): x로 주어지는 인수를 숫자로 변환하는 함수 
as.numeric(TRUE) #output:1 
as.numeric(FALSE) #output:0

TRUE * TRUE #output:1
TRUE * FALSE #output:0
TRUE + TRUE #output:2

#sum: 벡터 y가 50보다 큰 원소의 수를 출력해주는 함수 
sum(y>50)

#any 함수: -3~3에서 0보다 큰게 하나라도 있으면 TRUE를 반환 
any(-3:3>0) #output:TRUE

#all 함수: 반환된 모든 값이 TURE일때만 TRUE 반환
all(-3:3>0) #output:FALSE

#sqrt 함수: 인수의 루트 값을 출력해준다. 
sqrt(2)^2 #output:2 
sqrt(2)^2 == 2 #output:FALSE
sqrt(2)^2-2 #output:4.440892e-16

#identical 함수: 매개변수로 받은 인자가 두 개가 같은 값인지를 확인해주는 함수 
identical(sqrt(2)^2,2) #output:FALSE   ->아주 미세한 차이 떄문에 두 개의 값이 다르다고 나온다.

#all.equal 함수: 아주 작은 미세한 차이를 무시하고 싶을 떄 사용하고 싶은 함수 
all.equal(sqrt(2)^2,2) #output:TRUE
all.equal(3,2) #output:"Mean relative difference: 0.3333333" ->같지 않은 이유를 나타낸다.
isTRUE(all.equal(3,2)) #output:FALSE

#문자에 연산자 적용 
fruit <- c("Apple","Banana","Strawberry")
food <- c("Pie","Juice","Cake")

#paste 함수
paste(fruit,food) #output:"Apple Pie"       "Banana Juice"    "Strawberry Cake"
paste(fruit,"Juice") #output:"Apple Juice"      "Banana Juice"    "Strawberry Juice"

















 



