#벡터 인덱싱

num <- 0:30 
prime <- c(2,3,5,7,11,13,17,19) 

#인덱싱
prime[1] #output:2 
prime[2] #output:3
prime[1:3] #output:2 3 5 
prime[4:6] #output:7 11 13 
prime[c(1,1,5,5)] #output:2 2 11 11
prime[c(1,3,5,7)] #output:2 5 11 17

#변수를 이용해서 해당 인덱스의 값 추출 
indices <-c(1,3,5,7)
prime[indices] #output:2 5 11 17 

#-를 붙인 인덱싱 
prime[-1] #output:3 5 7 11 13 17 19 ->첫 번째 원소를 제외한 나머지 원소를 추출
prime[-1:-3] #output:7 11 13 17 19
prime[-(1:3)] #output:7 11 13 17 19 

#length를 이용한 인덱싱
length(prime) #output:8
prime[-length(prime)] #output:2 3 5 7 11 13 17
prime[1:length(prime)-1] #output:2 3 5 7 11 13 17 

#벡터의 해당 인덱스에 값을 변경하고 싶을 때
prime <- c(2,4,5,7,11,14,17,18)
prime[2] <-3 
prime #output:2 3 5 7 11 14 17 18
prime[c(6,8)] <-c(13,19)
prime #output:2 3 5 7 11 13 17 19

#벡터에 원소 추가 
prime[9] #output: NA
prime[9] <-23 #9번째 인덱스에 값 23 추가
prime[c(10,11)] <-c(29,31) #10,11번째 인덱스에 값 동시 추가 
prime[15] <-0 #해당 벡터에는 11이 마지막 인덱스인데, 15에 해당하는 인덱스에 값을 넣게되면 그 사이의 값은 NA 값으로 채워진다.
prime #output:2  3  5  7 11 13 17 19 23 29 31 NA NA NA  0

#논리연산을 이용하여 해당 조건을 충족하는 원소를 추출 
prime <- c(2,3,5,7,11,13,17,19)
prime <10 #output:TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
prime[(prime<10)] #output:2 3 5 7 
prime[prime %% 2==0] #output:2

#set_along 함수: 인수로 들어온 벡터의 원소의 수만큼 숫자를 나열한다.
#매 2번째 인덱스에 해당하는 값 추출 
seq_along(prime) #output:1 2 3 4 5 6 7 8 
seq_along(prime) %% 2 == 0 #output:FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
prime[seq_along(prime) %% 2 == 0] #output:3 7 13 19

#재사용 규칙을 이용해서 짝수에 해당하는 인덱스의 값 추출 
prime[c(FALSE,TRUE)] #output:3 7 13 19

#각 달마다 내린 강수량을 나타내는 벡터에서 원하는 달을 추출하고 싶을 때 
rainfall <-c(21.6,23.6,45.8,77.0,102.2,133.3,327.9,348.0,137.6,49.3,53.0,24.9)

which(rainfall>100) #논리값을 인수로 받음, output:5 6 7 8 9 
month.name[which(rainfall>100)] #output:"May"       "June"      "July"      "August"   "September"
month.abb[which(rainfall>100)] #output:"May" "Jun" "Jul" "Aug" "Sep"
#주어진 벡터에서 최댓값과 최솟값의 위치를 반환하는 함수
which.max(rainfall) #output:8
#강수량이 가장 큰 월 추출
month.name[which.max(rainfall)] #output:"August"
which.min(rainfall) #output:1 
#강수량이 작은 큰 월 추출 
month.name[which.min(rainfall)] #output:"January"

#which 함수를 통해 나온 해당 인덱스로 벡터 내의 해당하는 값을 추출 
rainfall[which.min(rainfall)] #output:21.6
rainfall[which.max(rainfall)] #output:34.8

#벡터의 각 원소의 값에 이름 지정 -> names 함수 이용
traffic.death <- c(842,729,786,751,844,851,702)
names(traffic.death) <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")
traffic.death 
#output:Mon Tue Wed Thu Fri Sat Sun 
#      :842 729 786 751 844 851 702 
#지정한 이름으로 인덱싱을 할수 있다.
traffic.death["Sat"] 
#output:Sat 
#      :851
traffic.death[c("Tue","Thu","Sun")] #여러 개도 지정해서 출력 가능

#예제:사망자수가 800명이 넘는 요일을 추출 
traffic.death[traffic.death>800]
names(traffic.death[traffic.death>800])