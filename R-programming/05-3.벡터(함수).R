#벡터 함수 

#abs 함수: 주어진 값들의 절댓값을 출력하는 함수 
abs(-3:3) #output:3 2 1 0 1 2 3

#log 함수: 주어진 값들의 로그 계산을 출력한다. 
log(1:5) #output:0.0000000 0.6931472 1.0986123 1.3862944 1.6094379 
log(1:5,base=exp(1)) #output:0.0000000 0.6931472 1.0986123 1.3862944 1.6094379

#밑수가 2 or 10인 log 함수
log2(1:5) #=log(1:5,base=2), output:0.000000 1.000000 1.584963 2.000000 2.321928
log10(10) #output:1
log10(1:5) #output:0.0000000 0.3010300 0.4771213 0.6020600 0.6989700

#밑수가 e인 log 함수 사용
exp(1:4) #output:2.718282  7.389056 20.085537 54.598150

y <- exp(1:5)
log(y) #output:1 2 3 4 5 

#factorial 함수
factorial(1:5) #1~5 각 값의 팩토리얼 값을 출력한다. output:1 2 6 24 120

#choose 함수: combination 값을 출력해준다.
choose(5, 2) #output:10, 5개에서 2개를 뽑는 경우의 수를 출력한다.

#sqrt 함수: 주어진 값을 루트처리 해서 출력한다.
sqrt(1:5) #output:1.000000 1.414214 1.732051 2.000000 2.236068
#->R에서 수치 계산을 할 때는 기본적으로 유효숫자 7자리까지 표현한다. 

#options 함수: default로 되어 있는 유효숫자를 확인하기 위한 함수
options("digits")
pi
pi*100
 
#signif 함수: 내가 원하는 유효 숫자까지만 출력하게 해주는 함수
signif(456.789,digits = 2) #output:460, 456에서 3번째 수에서 반올림되서 유효숫자 2개까지만 출력된다.
signif(456.789,digits = 3) #output:457
signif(456.789,digits = 4) #output:456.8

#round 함수: 반올림하는 함수
round(456.789,digits=2) #output:456.79
round(456.789) #output:457
round(sqrt(1:5),digits=2) #output:1.00 1.41 1.73 2.00 2.24
round(456.789, digits=-2) #output:500
round(456.789, digits=-1) #output:460
round(456.789, digits=-3) #output:0
round(500.123,digits =-3) #output:1000
#R에서 round 함수는 가장 가까운 짝수를 출력한다. 
round(12.5) #output:12
round(-4.5) #output:-4
round(-5.5) #output:-6

#floor 함수: 내림 함수, 가장 가까운 정수로 내린다.  
floor(14.9) #output:14
floor(-5.1) #output:-6

#ceiling 함수: 올림 함수,주어진 수보다 큰 가까운 정수로 반올림한다. 
ceiling(-1.7) #output:-1
ceiling(455.38) #output:456

#trucn 함수: 0에 가장 가까운 정수로   내린다.
trunc(14.2) #output:14 
trunc(-100.8) #output:-100

#양의 무한대
Inf

#음의 무한대 
-Inf

3/0 #output:Inf
5-Inf #output:-Inf
Inf * (-Inf) #output:-Inf

#is.infinite 함수: 입력되는 값이 무한대인지 확인해서, 무한대이면 TRUE 아니면 FALSE 반환 
is.infinite(0) #output:FALSE
is.infinite(Inf) #output:TRUE

#10^308 -> 대부분의 컴퓨터가 수용하는 가장 큰 수
is.infinite(10^(305:310)) #output:FALSE FALSE FALSE FALSE  TRUE  TRUE

#NaN 출력
Inf/Inf #output:NaN(Not a Number)
Inf*0 #output:NaN

#is.nan 함수: NaN인지 확인하는 함수 
is.nan(NaN+3) #output:TRUE

#NA(Not Availabe): 결측값 
k <-NA
k + 5 #output:NA
k == NA #output:NA

#is.na 함수: NA값이 들어가 있는지 확인
is.na(k) #output:TRUE
is.na(NaN) #output:TRUE
is.nan(k) #output:FALSE

#통계처리 함수 
z <- (1:6)
#sum 함수
sum(z) #output:21

#prod 함수: 주어진 벡터들 내의 원소의 곱 
prod(z) #output:720

#max or min 함수
max(z) #output:6
min(z) #output:1

#mean 함수 
mean(z) #output:3.5 

#median 함수: 중위수(중간값)를 계산해준다. 
median(z) #output:3.5

#range 함수: 범위 구해주는 함수 
range(z) #output:1 6

#var 함수: 분산
var(z) #output:3.5

#sd 함수: 표준편차 
sd(z) #output:1.870829

w <- c(1,2,3,4,5,NA) 
sum(w) #output:NA
sum(w,na.rm = TRUE) #output:15, NA는 제거하고 계산해주세요. 
sum(na.omit(w)) #na.omit(w):NA의 값이 빠진 나머지 벡터를 출력한다. 

#벡터내의 값이 모두 NA일 경우 
v <- c(NA,NA,NA,NA,NA)      
sum(v,na.rm = TRUE) #output:0, v안의 원소를 들여다보지 않는 한 그냥 벡터내의 합이 0이라고 생각한다. 
prod(v,na.rm = TRUE) #output:1
max(v,na.rm = TRUE) #output:-Inf
min(v,na.rm=TRUE) #output:Inf 

#cussum & sumprod & cummax & cummin -> 결측값을 제거하는 기능을 포함하지 않는다. 
traffic.death <-c(842,729,786,751,844,851,702) 
#cumsum():누적으로 합을 구해주는 함수 
cumsum(traffic.death) #output:842 1571 2357 3108 3952 4803 5505
#cumprod():누적으로 곱을 구해주는 함수 
cumprod(traffic.death) #output: 8.420000e+02 6.138180e+05 4.824609e+08 3.623282e+11 3.058050e+14 2.602400e+17 1.826885e+20
#cummax():누적으로 최대값을 구해주는 함수 
cummax(traffic.death) #output:842 842 842 842 844 851 851
#cummin():누적으로 최솟값을 구해주는 함수 
cummin(traffic.death) #output:842 729 729 729 729 729 702

traffic <- c(102,543,NA,245,1235)
cumsum(traffic) #output:102 645  NA  NA  NA ->NA가 나오는 부분부터 NA값이 출력된다. 

#diff 함수: 두 개씩의 차이를 출력해준다.(index가 높은 거에서 낮은 것을 뺀다.) 
diff(traffic.death) #output:-113   57  -35   93    7 -149
diff(traffic) #output:441  NA  NA 990
diff(1:5,lag = 2) #lag라는 인수에 지정된 값만큼 떨어진 거리의 값들의 차이를 출력한다.
#output: 2 2 2

#union(합칩합) & intersect(교집합) & setdiff(차집합) 
p <- 1:10
q <- 6:15
union(p,q) #output:1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
intersect(p,q) #output: 6 7 8 9 10
setdiff(p,q) #output:1 2 3 4 5->p의 원소에서 q를 뺀 집합
setdiff(q,p) #output:11 12 13 14 15

#setequal 함수: 어떤 두 개의 집합이 동일한지 테스트하는 함수
setequal(p,q) #output:FALSE

#is.element 함수: 첫 번째로 인수로 주어진 벡터의 각 원소가 두 번째 인수로 주어진 벡터의 원소인지 테스트하게 된다. 
is.element(setdiff(p,q),p) #output:TRUE TRUE TRUE TRUE TRUE
is.element(setdiff(p,q),q) #output:FALSE FALSE FALSE FALSE FALSE