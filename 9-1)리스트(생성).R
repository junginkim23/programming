#리스트: 여러 다른 유형의 데이터를 수용할 수 있다. 

#list 함수: list 생성
list(0.6826,0.9544,0.9974)
#output
[[1]]#자료의 index 
[1] 0.6826

[[2]]
[1] 0.954

[[3]]
[1] 0.9974

list(1.23, "Apple",c(2,3,5,7),
     matrix(1:6,ncol=3),mean)
#output
[[1]]
[1] 1.23

[[2]]
[1] "Apple"

[[3]]
[1] 2 3 5 7

[[4]]
[,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

[[5]]
function (x, ...) 
  UseMethod("mean")
<bytecode: 0x000002643d572460>
  <environment: namespace:base>
  
lst <- list()
lst[[1]] <- 1.23
lst[[2]] <- "Apple"
lst[[3]] <- c(2,3,5,7)
lst[[4]] <- matrix(1:6,ncol = 3)
lst[[5]] <- mean 
lst
#output
[[1]]
[1] 1.23

[[2]]
[1] "Apple"

[[3]]
[1] 2 3 5 7

[[4]]
[,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

[[5]]
function (x, ...) 
  UseMethod("mean")
<bytecode: 0x000002643d572460>
<environment: namespace:base>
  
#list 내의 각 데이터의 이름을 변경할 수 있다. 
lst <- list(0.6826,0.9544,0.9974)
names(lst) <- c("sigma1","sigma2","sigma3")
lst
#output
$sigma1
[1] 0.6826

$sigma2
[1] 0.9544

$sigma3
[1] 0.9974

#list내에 데이터의 이름만 추출 
names(lst)
#output:"sigma1" "sigma2" "sigma3"

length(lst) 
#output:3 -> list 객체 내에 포함된 원소의 개수를 출력

#list 결합
worldcup1 <- list("Brazil","South Africa","Germany")
worldcup2 <- list("Korea-Japan","France","USA")
c(worldcup1,worldcup2)
#output
[[1]]
[1] "Brazil"

[[2]]
[1] "South Africa"

[[3]]
[1] "Germany"

[[4]]
[1] "Korea-Japan"

[[5]]
[1] "France"

[[6]]
[1] "USA"

#list -> vector 변환
a <- list(1,2,3,4,5,6,7)
mean(a) #출력 불가능, mean이라는 함수는 vector 데이터 구조를 필요로 하기 떄문이다. 

#mean함수 사용하기 위해 list 데이터 구조를 벡터 구조로 변환
mean(unlist(a)) #output:4 
min(unlist(a)) #output:1