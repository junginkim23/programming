#데이터 프레임 확장 

#rbind(), cbind() -> 행, 열 방향으로 확장, 여러 개의 데이터프레임 인수로 주면 행 or 열 방향으로 확장 가능 

id <- c("A001","A002","A003")
name <- c("Mouse","Keyboard","USB")
price <- c(30000,90000,50000)
product <-data.frame(id,name,price,stringsAsFactors = FALSE)
product
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard 90000
3 A003      USB 50000

#행 방향으로 확장
product <- rbind(product,c("A004","Monitor",2500000))
product
#output
    id     name   price
1 A001    Mouse   30000
2 A002 Keyboard   90000
3 A003      USB   50000
4 A004  Monitor 2500000

#추가할 행에 데이터 프레임 형식의 데이터를 추가, 여러 개의 행을 추가할 때 데이터 프레임으로 추가 
new.rows <- data.frame(id=c("A005","A006"),name=c("Memory","CPU"),price=c(35000,320000))   
new.rows
#output
    id   name  price
1 A005 Memory  35000
2 A006    CPU 320000

product <- rbind(product,new.rows)
product
#output
    id     name   price
1 A001    Mouse   30000
2 A002 Keyboard   90000
3 A003      USB   50000
4 A004  Monitor 2500000
5 A005   Memory   35000
6 A006      CPU  320000
#주의사항: 기존의 데이터 프레임의 열 이름이 동일하고 열에 해당하는 데이터 형식이 동일해야 한다.

#열의 방향으로 확장 방법1
product <- cbind(product,madein=c("Korea","China","China","Korea","Korea","USA"))
product
#output
    id     name   price madein
1 A001    Mouse   30000  Korea
2 A002 Keyboard   90000  China
3 A003      USB   50000  China
4 A004  Monitor 2500000  Korea
5 A005   Memory   35000  Korea
6 A006      CPU  320000    USA

#열방향으로 확장 방법2 
product$madein <-c("Korea","China","China","Korea","Korea","USA")
product
#output
    id     name   price madein
1 A001    Mouse   30000  Korea
2 A002 Keyboard   90000  China
3 A003      USB   50000  China
4 A004  Monitor 2500000  Korea
5 A005   Memory   35000  Korea
6 A006      CPU  320000    USA

#열방향으로 확장 방법 3 -> 열의 방향으로 생성된 데이터프레임을 추가한다.
new.cols <- data.frame(manufacturer=c("Logitech"
                                      ,"Logitech"
                                      ,"Samsung"
                                      ,"Samsung"
                                      ,"Samsung"
                                      ,"Intel"),
                       quantity=c(20,15,50,30,40,10))
new.cols
#output
   manufacturer quantity
1     Logitech       20
2     Logitech       15
3      Samsung       50
4      Samsung       30
5      Samsung       40
6        Intel       10

product <- cbind(product,new.cols)
product
#output
    id     name   price madein manufacturer quantity
1 A001    Mouse   30000  Korea     Logitech       20
2 A002 Keyboard   90000  China     Logitech       15
3 A003      USB   50000  China      Samsung       50
4 A004  Monitor 2500000  Korea      Samsung       30
5 A005   Memory   35000  Korea      Samsung       40
6 A006      CPU  320000    USA        Intel       10

#cbind 주의 사항 -> 열을 추가할 때 열이름 중복을 확인하지 않는다. 
cols1 <- data.frame(x=c("a","b","c")
                    ,y=c(1,2,3))
cols1
#output
  x y
1 a 1
2 b 2
3 c 3

cols2 <- data.frame(x=c("alpha","beta","gamma"),
                    y=c(100,200,300))
cols2
#output
      x   y
1 alpha 100
2  beta 200
3 gamma 300

cbind(cols1,cols2) 
#output -> 열 이름 중복 허용, 따라서 사용자가 주의해서 결합해야 한다.  
  x y     x   y
1 a 1 alpha 100
2 b 2  beta 200
3 c 3 gamma 300

#rbind -> 결합되는 데이터프레임의 폭 동일, 열이름 동일, 하지만 열순서가 동일할 필요는 없다. 
#cbind -> 동일한 행의 개수(높이)의 데이터 프레임을 가져야하는데, 굳이 동일할 필요는 없고 부족한 만큼 R자체에서 재사용 규칙을 사용해서 원소를 재사용해서 붙인다. 

#각 list내에 존재하는 데이터 중에서 원하는 데이터를 추출해서 데이터프레임 생성 
df1 <- data.frame(sex="female",months=1,weight=3.5)
df2 <- data.frame(sex="male",months=3,weight=4.8)
df3 <- data.frame(sex="male",months=4,weight=5.3)
df4 <- data.frame(sex="female",months=9,weight=9.4)
df5 <- data.frame(sex="female",months=7,weight=8.3)

lst <- list(df1,df2,df3,df4,df5)
lst
#output -> 5개의 병원이 있고 각 병원 마다 한 명의 신생아 정보 존재  
[[1]]
sex months weight
1 female      1    3.5

[[2]]
sex months weight
1 male      3    4.8

[[3]]
sex months weight
1 male      4    5.3

[[4]]
sex months weight
1 female      9    9.4

[[5]]
sex months weight
1 female      7    8.3

#생성한 리스트 내의 각 병원에서 추출하고 싶은 신생아의 정보를 추출하여 데이터프레임으로 생성
rbind(lst[[1]],lst[[2]])
#output -> 두 개의 병원에 존재하는 신생아의 정보를 추출하여 합침, 만일 여러 개의 병원에 많은 데이터가 존재할 시에 이러한 방법으로 데이터 프레임을 생성하는데 무리가 있다. 
     sex months weight
1 female      1    3.5
2   male      3    4.8

#do.call 함수: 여러 개의 병원에 존재하는 많은 데이터를 추출하여 데이터 프레임을 생성할 때 사용
do.call(rbind,lst) #데이터에 적용하고자 하는 함수가 첫 번째 인수, 데이터 셋이 두 번째 인수로 들어간다. 
#output -> list 내의 각 원소들을 추출해서 rbind함수로 데이터 프레임을 생성 
     sex months weight
1 female      1    3.5
2   male      3    4.8
3   male      4    5.3
4 female      9    9.4
5 female      7    8.3

lst1 <- list(sex="female",months=1,weight=3.5)
lst2 <- list(sex="male",months=3,weight=4.8)
lst3 <- list(sex="male",months=4,weight=5.3)
lst4 <- list(sex="female",months=9,weight=9.4)
lst5 <- list(sex="female",months=7,weight=8.3)
lst <- list(lst1,lst2,lst3,lst4,lst5)
lst
#output
[[1]]
[[1]]$sex
[1] "female"

[[1]]$months
[1] 1

[[1]]$weight
[1] 3.5


[[2]]
[[2]]$sex
[1] "male"

[[2]]$months
[1] 3

[[2]]$weight
[1] 4.8


[[3]]
[[3]]$sex
[1] "male"

[[3]]$months
[1] 4

[[3]]$weight
[1] 5.3


[[4]]
[[4]]$sex
[1] "female"

[[4]]$months
[1] 9

[[4]]$weight
[1] 9.4


[[5]]
[[5]]$sex
[1] "female"

[[5]]$months
[1] 7

[[5]]$weight
[1] 8.3

#do.call함수를 이용하여 list내에 있는 데이터(list)를 데이터 프레임으로 만들기 
#그 전에 리스트 내에 원소들의 형태는 리스트이다. 그래서 그 리스트를 데이터 프레임으로 만들어 줘야 한다. 
as.data.frame((lst[[1]])) 
#output -> 하지만, 일일이 다 할수 없으니깐 이 때 쓰는 함수가 lapply 함수  
     sex months weight
1 female      1    3.5

do.call(rbind,lapply(lst,as.data.frame)) #첫 번째 인수 list 형식의 데이터 셋, 두 번째 첫 번째 인수의 값을 넘겨 받는 함수 
#output 
#리스트 구조의 데이터 셋에 있는 데이터를 데이터 프레임으로 생성할 때 순서
#(1)리스트 내에 원소들도 리스트이기 때문에, 리스트를 데이터프레임의 형태로 변환(lapply(lst,as.data.frame) 사용)
#(2)do.call함수를 사용하여 리스트 -> 데이터 프레임한 데이터를 rbind 함수를 이용하여 행 방향으로 합친다. 
     sex months weight
1 female      1    3.5
2   male      3    4.8
3   male      4    5.3
4 female      9    9.4
5 female      7    8.3