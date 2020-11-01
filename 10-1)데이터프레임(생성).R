#데이터 프레임 생성: 행과 열을 갖는 2차원 구조를 갖기 때문에 행렬처럼 보일 수 있다. 여러 데이터 형을 동시에 가질 수 있는 리스트의 성질도 가지고 있다.
v1 <- c("A001","A002","A003")
v2 <- c("Mouse","Keyboard","USB")
v3 <- c(30000,90000,50000)
data.frame(v1,v2,v3)
#output
v1       v2    v3
1 A001    Mouse 30000
2 A002 Keyboard 90000
3 A003      USB 50000

#행의 이름을 지정 -> row.names
data.frame(row.names=v1,v2,v3)
#output
v2    v3
A001    Mouse 30000
A002 Keyboard 90000
A003      USB 50000

#데이터 프레임을 생성할 때, 데이터의 이름을 주고 싶을 때 
product <- data.frame(id=v1,name=v2,price=v3)

#데이터 프레임의 내부 구조 확인, stringsAsFactors = FALSE: 스트링을 팩터로 취급하지 않겠다. 
product <- data.frame(id=v1,name=v2,price=v3,stringsAsFactors = FALSE)
product
str(product)
#output
'data.frame':	3 obs. of  3 variables:
  $ id   : chr  "A001" "A002" "A003"
$ name : chr  "Mouse" "Keyboard" "USB"
$ price: num  30000 90000 50000

mat <- matrix(c(1,3,5,7,9,
              2,4,6,8,10,
              2,3,5,7,11),ncol=3)
mat
#행렬 -> dataframe로 변환 
as.data.frame(mat)
#output: -> 행렬에 열의 이름이 지정되어 있으면 그대로 쓰는데, 그렇지 않으면 알아서 자동으로 열에 이름을 생성해서 지정해준다. 
  V1 V2 V3
1  1  2  2
2  3  4  3
3  5  6  5
4  7  8  7
5  9 10 11

#열의 이름 지정
number <- as.data.frame(mat)
colnames(number) <- c("odd","even","prime")
number
#output
  odd even prime
1   1    2     2
2   3    4     3
3   5    6     5
4   7    8     7
5   9   10    11

#list -> dataframe 변환
v1 <- c("A001","A002","A003")
v2 <- c("Mouse","Keyboard","USB")
v3 <- c(30000,90000,50000)
lst <-list(v1,v2,v3)
lst 
#output
[[1]]->열이름
[1] "A001" "A002" "A003"

[[2]]
[1] "Mouse"    "Keyboard" "USB"     

[[3]]
[1] 30000 90000 50000
as.data.frame(lst)
#output -> 열이름이 지정되어 있지 않아 R에서 자동으로 생성. 
c..A001....A002....A003.. c..Mouse....Keyboard....USB.. c.30000..90000..50000.
1                      A001                         Mouse                  30000
2                      A002                      Keyboard                  90000
3                      A003                           USB                  50000

#열이름 변환 
product <- as.data.frame(lst)
colnames(product) <- c("id","name","price")
product
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard 90000
3 A003      USB 50000

#dataframe의 행의 개수? or 열의 개수 
nrow(product)
#output:3
ncol(product)
#output:3

#length 함수 ->vector, matrix, list dataframe 적용 
length(product)
#output:3 -> dataframe의 열의 개수 반환 
#vector 적용 -> 벡터 내의 원소의 개수, 벡터의 길이 반환
#matrix 적용 -> 행렬 내의 셀 값의 개수 반환
#list 적용 ->리스트 내의 원소의 개수 
 