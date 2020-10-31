#리스트 인덱싱 

product <- list("A002","Mouse",30000)

#[[]]:원소내의 데이터 값 추출
product[[3]]
#output;30000 -> 3번째 자료에 접근해서 내부의 값 추출 
product[[2]]
#output:"Mouse"

#[]:원소 추출
product[3]
#output
[[1]]
[1] 30000
product[2]
#output
[[1]]
[1] "Mouse"

#class 함수:데이터 유형 파악 
class(product[[3]])#output:"numeric"
class(product[3])#output:"list"
product[[3]]*0.9

#여러 개의 원소 선택 
product[c(1,2)]
#output
[[1]]
[1] "A002"

[[2]]
[1] "Mouse"

product[c(FALSE,TRUE,TRUE)]
#output
[[1]]
[1] "Mouse"

[[2]]
[1] 30000

product[-1]
#output -> 제품명이 삭제된 나머지 원소들을 추출한다.
[[1]]
[1] "Mouse"

[[2]]
[1] 30000

#각 원소에 이름 부여
product <- list(id="A002",
                name="Mouse",
                price=30000)
product
#output
$id
[1] "A002"

$name
[1] "Mouse"

$price
[1] 30000

#부여된 원소의 이름으로 원소 혹은 원소 내의 값 추출 
product[["name"]]
#output:"Mouse"
product$name
#output:"Mouse"
product[c("name", "price")]
#output
$name
[1] "Mouse"

$price
[1] 30000

#list 내부에 존재하지 않는 원소의 값을 추출할 때
product[["fourth"]] #output:NULL
product$fourth #output:NULL
product[[4]] #output:Error in product[[4]] : 첨자의 허용 범위를 벗어났습니다

#list 내부에 존재하지 않는 원소를 추출할 때 
product[c(4,2,5)]
#output
$<NA>
  NULL

$name
[1] "Mouse"

$<NA> #존재하지 않기 때문에, 이름으로 NA가 들어가 있다. 
  NULL
product[c("fourth","name","fifth")]
#output
$<NA>
  NULL

$name
[1] "Mouse"

$<NA>
  NULL

#list가 중첩된 복잡한 구조를 가질 수 있다.
lst <- list(one=1,two=2,
            three=list(alpha=3.1,beta=3.3))
lst
#output
$one
[1] 1

$two
[1] 2

$three
$three$alpha
[1] 3.1

$three$beta
[1] 3.3

lst[["three"]]
#output
$alpha
[1] 3.1

$beta
[1] 3.3

#lst의 세 번째 원소 내의 리스트에 있는 beta의 원소 값을 추출
#(1)
lst[["three"]][["beta"]]
#output:3.3
#(2)
lst$three$beta
#output:3.3





























