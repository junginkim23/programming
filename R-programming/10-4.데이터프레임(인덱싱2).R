#dataframe 인덱싱2

r <- iris$Sepal.Length / iris$Sepal.Width
head(r)

#with 함수: iris$Sepal.Length 이렇게 쓰는 번거로움을 없애기 위해 사용하는 함수
r <- with(iris, Sepal.Length / Sepal.Width)
head(r)

#with 함수 내에 여러 개의 명령어를 한번에 사용
with(iris,{
  print(summary(Sepal.Length))
  plot(Sepal.Length,Sepal.Width)
  plot(Petal.Length,Petal.Width)      
  })
#output
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
4.300   5.100   5.800   5.843   6.400   7.900 

#with 함수 단점: 함수 내에서 이루어진 변수 할당은 함수 밖에서는 사용할 수 없다.
with(iris, {
  stats <- summary(Sepal.Length)
  stats
})
#output
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
4.300   5.100   5.800   5.843   6.400   7.900 

stats
#output: 에러: 객체 'stats'를 찾을 수 없습니다 
#함수 내부에서 할당된 변수를 외부에서 사용하기 위한 방법
with(iris,{
  stats.nokeep <- summary(Sepal.Length)
  stats.keep <<- summary(Sepal.Length)
})
stats.nokeep #output: 에러: 객체 'stats.nokeep'를 찾을 수 없습니다
stats.keep 
#output
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
4.300   5.100   5.800   5.843   6.400   7.900 

#within 함수: with 함수와 유사한 작업을 하고 추가적인 작업도 가능 
#데이터 프레임 내에 새로운 변수 생성 & 값 할당 or 기존 변수의 값 변경 기능 추가 

#데이터 프레임에 새로운 열 추가 
iris$Sepal.Ratio <-iris$Sepal.Length / iris$Sepal.Width
head(iris)
#output
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
  Sepal.Ratio 
1    1.457143     
2    1.633333     
3    1.468750     
4    1.483871     
5    1.388889     
6    1.384615   

#위와 같은 작업을 하고 싶은데, iris$~사용을 줄이기 위해 within 함수 사용
iris <- within(iris,Sepal.Ratio1 <- Sepal.Length / Sepal.Width)
head(iris)
#output
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
  Sepal.Ratio Sepal.Ratio1
1    1.457143     1.457143
2    1.633333     1.633333
3    1.468750     1.468750
4    1.483871     1.483871
5    1.388889     1.388889
6    1.384615     1.384615

#attach 함수: 메모리에 그냥 데이터 프레임을 적재시킨다. (데이터 프레임 내에 있는 열에 접근을 자주할 경우에 메모리에 적재한다. )
attach(iris)
search() 
#output
[1] ".GlobalEnv"        "iris" -> 탐색 경로 상에서 확인 가능              
[3] "tools:rstudio"     "package:stats"    
[5] "package:graphics"  "package:grDevices"
[7] "package:utils"     "package:datasets" 
[9] "package:methods"   "Autoloads"        
[11] "package:base"  

#iris를 메모리에 적재해두었기 때문에 iris$ or with 함수를 사용하지 않고 아래처럼 사용 가능
r <- Sepal.Length / Sepal.Width #R에서는 두 변수를 탐색 경로에서 차례로 찾는다. 처음에는 GlobalEnv에서 찾고 없으면 iris에서 찾아서 사용하게 해준다.
head(r)

#메모리에 아래처럼 데이터 셋(iris)을 적재하기 위해 attach 함수를 적용해도 데이터 원본 값이 적재되는 것이 아니라
#복사된 값이 적재된다. 그래서 원래의 데이터 프레임 내의 데이터가 변경하더라도 attach 함수를 통해 메모리에 적재된 
#변경되지 않는다. 
#예1)
attach(iris)
iris$Sepal.Length <- 0
head(iris$Sepal.Length)
#output:0 0 0 0 0 0
head(Sepal.Length)
#output:5.1 4.9 4.7 4.6 5.0 5.4  

#예2)
attach(iris)
Sepal.Width <- Sepal.Width * 10 
head(Sepal.Width)#output: 35 30 32 31 36 39
head(iris$Sepal.Width)#output: 3.5 3.0 3.2 3.1 3.6 3.9
ls()#작업 공간 확인 함수 
#output:"iris"        "r"           "Sepal.Width" "stats.keep" 
rm(Sepal.Width)#메모리에서 삭제 

#예3)
Sepal.Length <- c(4.5,5.3,6.7)
attach(iris)
#output->현재 나의 작업 공간에 Sepal.Length가 있는데 너는 지금 iris(Sepal.Length 변수를 갖고 있다.)를 메모리에 저장하려고 한다라고 경고 출력
The following object is masked _by_ .GlobalEnv: 
  
  Sepal.Length

plot(Sepal.Length,Sepal.Width)
#output -> Sepal.Length가 기존의 데이터 프레임있는 데이터가 아닌 내가 위에서 생성한 새로운 Sepal.Length로 인식. 
#       -> 그래서 내가 생성한 Sepal.Length와 iris 데이터 셋에 있는 Sepal.Width와 크기가 맞지 않아 아래처럼 에러 발생 
Error in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' and 'y' lengths differ

#R에서 똑같은 변수명과 같이 이름으로 에러가 발생할 때, R에서는 먼저 생성된 객체가 우선권을 가진다. 

#detach 함수: 탐색 경로 상에서 해당 인수를 삭제
detach(iris)
search()
#output
[1] ".GlobalEnv"        "tools:rstudio"    
[3] "package:stats"     "package:graphics" 
[5] "package:grDevices" "package:utils"    
[7] "package:datasets"  "package:methods"  
[9] "Autoloads"         "package:base"  









