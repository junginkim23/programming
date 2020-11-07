#반복 작용
#일련의 데이터 원소들의 반복적인 작업을 위해 사용하는 함수?

x <- matrix(1:20, 4,5)
x
#output
      [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    2    6   10   14   18
[3,]    3    7   11   15   19
[4,]    4    8   12   16   20
y <- array(1:24,c(4,3,2))
y
#output
, , 1

      [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12

, , 2

      [,1] [,2] [,3]
[1,]   13   17   21
[2,]   14   18   22
[3,]   15   19   23
[4,]   16   20   24
#apply()
apply(X=x, MARGIN = 1, FUN=max)#Margin-> 1:행, 2:열
#output:17 18 19 20
apply(X=x, MARGIN = 2, FUN=min)
#output:1  5  9 13 17

apply(y,1,paste,collapse=".")
#output -> 4개의 원소를 갖는 문자 벡터
[1] "1.5.9.13.17.21"  "2.6.10.14.18.22" "3.7.11.15.19.23"
[4] "4.8.12.16.20.24"

apply(y,2,paste,collapse=".")
#output
[1] "1.2.3.4.13.14.15.16"    "5.6.7.8.17.18.19.20"   
[3] "9.10.11.12.21.22.23.24"

apply(y,3,paste,collapse=".")
#output
[1] "1.2.3.4.5.6.7.8.9.10.11.12"         
[2] "13.14.15.16.17.18.19.20.21.22.23.24"

apply(y,c(1,2),paste,collapse=".") #c(1,2) -> 1차원과 2차원이 교차하는 지점 
#output
      [,1]   [,2]   [,3]   
[1,] "1.13" "5.17" "9.21" 
[2,] "2.14" "6.18" "10.22"
[3,] "3.15" "7.19" "11.23"
[4,] "4.16" "8.20" "12.24"

str(Titanic)
#output
'table' num [1:4, 1:2, 1:2, 1:2] 0 0 35 0 0 0 17 0 118 154 ...
- attr(*, "dimnames")=List of 4
..$ Class   : chr [1:4] "1st" "2nd" "3rd" "Crew"
..$ Sex     : chr [1:2] "Male" "Female"
..$ Age     : chr [1:2] "Child" "Adult"
..$ Survived: chr [1:2] "No" "Yes"

apply(Titanic,1,sum) #=apply(Titanic,"Class",sum)
#output
1st  2nd  3rd Crew 
325  285  706  885 

apply(Titanic,c(1,4),sum)
#output
      Survived
Class   No Yes
  1st  122 203
  2nd  167 118
  3rd  528 178
  Crew 673 212

  
exams <- list(s20=c(78,89,91,85,95,98),s21=c(85,86,97,99,90),s22=c(98,96,89,90,93,85,92),s23=c(98,96,91,88,93,99))  
exams
#lapply() -> 리스트 or 데이터 프레임에 적용할 때 사용
#리스트 적용 -> 각 리스트 내의 원소가 함수에 적용된다.
lapply() #출력된 결과를 리스트 형태로 반환
lapply(exams, length)
#output
$s20
[1] 6

$s21
[1] 5

$s22
[1] 7

$s23
[1] 6

#데이터 프레임 적용 ->데이터프레임의 각 열이 class 함수의 인수로 넘어간다.
lapply(iris,class)     
#output 
$Sepal.Length
[1] "numeric"

$Sepal.Width
[1] "numeric"

$Petal.Length
[1] "numeric"

$Petal.Width
[1] "numeric"

$Species
[1] "factor"

#sapply() ->리스트를 인수로 받는다.
#리스트 적용 
sapply(exams,length) #단순화시킬 수 있으면 벡터나 행렬 형태로 반환, 출력된 결과가 여러 개이면 리스트로 반환. 
#output
s20 s21 s22 s23 
6   5   7   6 

sapply(exams,mean)
sapply(exams,sd) #표준편차가 출력 결과로 나온다.
#output
s20      s21      s22      s23 
7.174027 6.348228 4.375255 4.262237 

sapply(exams,range) #각 원소의 최소와 최대를 출력해준다.
#output
     s20 s21 s22 s23
[1,]  78  85  85  88
[2,]  98  99  98  99

#데이터 프레임 적용
sapply(iris,class)     
#output
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
"numeric"    "numeric"    "numeric"    "numeric" 
Species 
"factor"

sapply(iris,mean)
#output
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
5.843333     3.057333     3.758000     1.199333 
Species 
NA 
경고메시지(들): 
  In mean.default(X[[i]], ...) :
  인자가 수치형 또는 논리형이 아니므로 NA를 반환합니다

#위의 에러가 뜬 것을 안나오게 하기 위해 사용자 정의 함수 즉, 새로 함수를 만들어서 원하던 출력 결과를 뽑아냈다.
sapply(iris,function(x) ifelse(is.numeric(x),mean(x),NA)) #iris 데이터의 각 열들이 x로 들어간다.
#output
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
5.843333     3.057333     3.758000     1.199333 
Species 
NA 

#mapply() -> 데이터 셋을 여러 개 받아서 값들의 쌍을 추출해서 함수에 적용해 반복 작업을 수행한다.
mapply(rep,1:4,4:1) #두 번째 인수는 첫 번째 인수의 함수가 적용되는 데이터이고, 세 번째 인수는 두 번째 데이터가 설정한 함수에 몇 번 적용될지를 결정하는 인수이다.
#rep(1,4),rep(2,3),rep(3,2),rep(4,1) 이 모든 결과를 출력해서 리스트로 만들어 준다.
#output
[[1]]
[1] 1 1 1 1

[[2]]
[1] 2 2 2

[[3]]
[1] 3 3

[[4]]
[1] 4