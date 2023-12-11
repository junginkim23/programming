#논리흐름 제어 

#<if>
x <- pi
y <- 3 
if (x > y) x #output:3.141593
if (x < y) y #output:조건에 성립이 되지 않아서, 아무것도 출력하지 않는다.

#<if~else>
if (x < y) x else y   
#output:3

x <- pi
y <- 1:5
if (x < y) x else y #if else 구문은 벡터 연산을 지원하지 않는다. 
#output:
1 2 3 4 5
In if (x < y) x else y :
  length > 1 이라는 조건이 있고, 첫번째 요소만이 사용될 것입니다
#*if~else 문은 벡터 연산을 하지 않기 때문에, x와 y의 첫 번째 값만이 서로 비교 대상이 된다.
#*그래서, 위의 조건문에서 x(3.14...)가 y(1)보다 크기 때문에 조건이 틀려서 
#*else문에 y(1:5)가 출력된다. 

if (x > y) x else y 
#output:
3.141593   
경고메시지(들): 
  In if (x > y) x else y :
  length > 1 이라는 조건이 있고, 첫번째 요소만이 사용될 것입니다

#<ifelse>
#위의 에러들을 ifelse()을 이용해서 해결
ifelse(x>y, x,y)
#output:3.141593 3.141593 3.141593 4.000000 5.000000

#ifelse() 함수: 조건문에서 vector 연산을 하고 싶을 때 사용하는 함수
test <- c(TRUE,FALSE,TRUE,TRUE,FALSE)
yes <- 1:5
no <- 0
ifelse(test,yes,no) #test에 있는 조건을 판단해서 true이면 yes, false이면 no를 반환
#output:1 0 3 4 0

#<switch>
center <- function(x,type){
  switch(type,
         mean=mean(x),
         median=median(x), #중앙값을 계산한다.
         trimmed=mean(x,trim = 0.1))#trim인수에 지정된 수만큼 양 끝에서 전체 데이터를 제외한 평균을 계산한다. 여기서는 0.1이니깐 양 긑에서 1개의 데이터를 삭제해서 평균을 계산한다.
}

x <- c(2,3,5,7,11,13,17,19,23,29)
center(x,"mean")
#output:12.9
center(x,"median")
#output:12
center(x,"trimmed")
#output:12.25

#type 인수에 mean,medain,trimmed를 제외한 다른 것이 삽입되면 어떤 결과를 출력할지 함수의 마지막 부분에 넣어준다.
center <- function(x,type){
  switch(type,
         mean=mean(x),
         median=median(x), #중앙값을 계산한다.
         trimmed=mean(x,trim = 0.1))#trim인수에 지정된 수만큼 양 끝에서 전체 데이터를 제외한 평균을 계산한다. 여기서는 0.1이니깐 양 긑에서 1개의 데이터를 삭제해서 평균을 계산한다.
         "choose one of mean, median, and trimmed"
  }

center(x,"other")
#output:"choose one of mean, median, and trimmed"

#반복 작업을 위한 명령어 <repeat>
repeat print("hello")

i<-5
repeat {if(i >25) break #{}는 하나의 문장이 들어갈 때는 사용하지 않고, 여러 문장이 들어갈 때는 {}를 사용한다.
  else {print(i)
    i<-i+5}
  }
#output
[1] 5
[1] 10
[1] 15
[1] 20
[1] 25

#반복문내에 사용할 수 있는 명령어 break(반복문을 빠져나간다.), next(c언어의 continue 같은 명령어) 
#반복 작업을 위한 명령어 <while> 
i <- 5 
while (i<=25){
  print(i)
  i<-i+5
}
#output
[1] 5
[1] 10
[1] 15
[1] 20
[1] 25

#반복 작업을 위한 명령어 <for>
for (var in list) statement

for (i in seq(from=5,to=25,by=5)) print(i)
#output
[1] 5
[1] 10
[1] 15
[1] 20
[1] 25

#실행 결과를 출력하는 함수 print()를 주지 않으면 출력 결과가 아무것도 나오지 않는다.
for (i in seq(from=5,to=25,by=5)) i

i<-1
for (i in seq(from=5,to=25,by=5)) i
i #output:25 ->처음에 1이 였지만 for루프를 끝마쳤을 때의 값 25가 최종값이 된다.
