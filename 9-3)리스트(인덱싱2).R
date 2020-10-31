#리스트 인덱싱

product <- list(id="A001"
                ,name="Mouse"
                ,price=30000)

#list내의 원소의 값 변경
product[[3]] <- 40000
product[["price"]] <-40000
product$price <- 40000

#list내의 원소의 값을 변경할 때, 만약 원소내에 값이 하나만 있다면 [[]], [] 둘 중에 아무거나 써도 상관없다. 
product[3] <- 40000
product["price"] <- 40000

#여러 개의 값을 할당
#(1)[[]]사용
product[["price"]] <- c(30000,40000)
product
#output
$id
[1] "A002"

$name
[1] "Mouse"

$price
[1] 30000 40000

#(2)[] 사용
product[3] <- list(c(30000,40000))
product
#output
$id
[1] "A002"

$name
[1] "Mouse"

$price
[1] 30000 40000

#list내부의 원소 전체를 바꿀 때
product[1:3] <-list("Apple","Keyboard",90000)
product
$id
[1] "Apple"

$name
[1] "Keyboard"

$price
[1] 90000

#list내에 원소 추가 
product[[4]] <- c("Domestic","Export")
product
#output
$id
[1] "Apple"

$name
[1] "Keyboard"

$price
[1] 90000

[[4]]
[1] "Domestic" "Export"

#list내에 원소 추가하면서 이름 변경
product$madein <- c("korea","China")
product[["madein"]] <- c("Korea","China") #위의 코드와 동일 결과 출력
product["madein"] <- list(c("Korea","China"))#위의 코드와 동일 결과 출력
product
#output
$id
[1] "Apple"

$name
[1] "Keyboard"

$price
[1] 90000

[[4]]
[1] "Domestic" "Export"  

$madein
[1] "korea" "China"
 
#여러 개의 원소를 추가 
product[6:9] <- list(0.12,0.15,0.22,0.27) 
product
#output
$id
[1] "Apple"

$name
[1] "Keyboard"

$price
[1] 90000

[[4]]
[1] "Domestic" "Export"  

$madein
[1] "korea" "China"

[[6]]
[1] 0.12

[[7]]
[1] 0.15

[[8]]
[1] 0.22

[[9]]
[1] 0.27

#외부에 저장된 벡터로 리스트를 생성 
names <- c("Mon","Tue","Wed","Thu",
           "Fri","Sat","Sun")
values <- c(842,729,786,751,844,851,702) #각 요일의 교통사고 사망자 수 
traffic.death <- list()
traffic.death[names] <- values
traffic.death
#output
$Mon
[1] 842

$Tue
[1] 729

$Wed
[1] 786

$Thu
[1] 751

$Fri
[1] 844

$Sat
[1] 851

$Sun
[1] 702

#리스트 내의 특정 원소 제거 
traffic.death[["Fri"]] <- NULL #or traffic.death["Fri] <- NULL
traffic.death
#output
$Mon
[1] 842

$Tue
[1] 729

$Wed
[1] 786

$Thu
[1] 751

$Sat
[1] 851

$Sun
[1] 702

#한 꺼번에 여러 개의 원소를 삭제
traffic.death[[c("Sat","Sun")]] <- NULL #여러 개를 선택해서 삭제할 때 [] 사용
traffic.death[c("Sat","Sun")] <- NULL
traffic.death
#output
$Mon
[1] 842

$Tue
[1] 729

$Wed
[1] 786

$Thu
[1] 751

#어떤 조건을 만족하는 원소를 삭제
traffic.death[traffic.death < 750] #[[]]를 두 개 사용할 때는 해당 인덱스의 수를 입력해야 하는데, TRUE, FALSE가 들어가서 오류가 뜬다.
#output -> 사망잣가 750이하인 원소를 출력 
$Tue
[1] 729

#조건에 해당되는 원소 삭제 
traffic.death[traffic.death<750] <- NULL
traffic.death
#output
$Mon
[1] 842

$Wed
[1] 786

$Thu
[1] 751













