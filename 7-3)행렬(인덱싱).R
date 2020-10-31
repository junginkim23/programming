#행렬 인덱싱

v <- 1:12
mat <- matrix(v,3,4)
str(mat) #output:int [1:3, 1:4] 1 2 3 4 5 6 7 8 9 10 ...

#행 추출 
mat[1,] #output:[1]  1  4  7 10

#열 추출
mat[,3] #output:[1] 7 8 9

#->추출된 결과는 벡터로 표현된다. 그 이유는 최대한 차원의 수를 줄여 객체를 단순화시키길 원하기 때문이다. 

#행렬의 형태를 유지하면서 행 또는 열을 추출
mat[1,,drop=FALSE]
#output
      [,1] [,2] [,3] [,4]
[1,]    1    4    7   10

mat[,3,drop=FALSE]
#output
      [,1]
[1,]    7
[2,]    8
[3,]    9

#2,3행만을 추출 
mat[2:3,]  
#output
      [,1] [,2] [,3] [,4]
[1,]    2    5    8   11
[2,]    3    6    9   12

#3,4열만을 추출
mat[,3:4]
#output
      [,1] [,2]
[1,]    7   10
[2,]    8   11
[3,]    9   12

#행 또는 열을 추출
mat[1:2,2:3]
#output
      [,1] [,2]
[1,]    4    7
[2,]    5    8

#첫 번째 행과 3번째 행만을 추출 
mat[c(1,3),]
#output
      [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    3    6    9   12

#인덱스에 (-)를 주게 되면?
mat[,-c(2,3)]
#output -> 해당 열이 삭제된 값이 추출되는 것을 볼 수 있다.
      [,1] [,2]
[1,]    1   10
[2,]    2   11
[3,]    3   12

#행렬에 변경하고 싶은 셀의 값 변경 
mat[1,3] <-77
mat
#output
      [,1] [,2] [,3] [,4]
[1,]    1    4   77   10
[2,]    2    5    8   11
[3,]    3    6    9   12

#행의 중복 값을 변경 
mat[2,] <- c(22,55)
mat
#output
      [,1] [,2] [,3] [,4]
[1,]    1    4   77   10
[2,]   22   55   22   55
[3,]    3    6    9   12

#해당 행과 열의 셀 값 변경 
mat[2:3,3:4] <- c(1,2,3,4)
mat
#output
      [,1] [,2] [,3] [,4]
[1,]    1    4   77   10
[2,]   22   55    1    3
[3,]    3    6    2    4

city.distance <- c(0,331,238,269,195,
                   331,0,95,194,189,
                   238,95,0,171,130,
                   269,194,171,0,77,
                   195,189,130,77,0)
city.distance.mat <- matrix(city.distance,5,5,
                            ,byrow=TRUE)
#byrow-> 행에 따라 값이 입력되게 한다. 원래는 열의 순서에 따라 값이 입력되었다. 

#행렬의 행과 열의 이름을 변경 
colnames(city.distance.mat) <- c("Seoul","Busan","Daegu","Gwangju"
                                 ,"Jeonju")
colnames(city.distance.mat)
#output:[1] "Seoul"   "Busan"   "Daegu"   "Gwangju" "Jeonju"

rownames(city.distance.mat) <- c("Seoul","Busan","Daegu","Gwangju"
                                 ,"Jeonju")
rownames(city.distance.mat)
#output:[1] "Seoul"   "Busan"   "Daegu"   "Gwangju" "Jeonju"

city.distance.mat
#output
        Seoul Busan Daegu Gwangju Jeonju
Seoul       0   331   238     269    195
Busan     331     0    95     194    189
Daegu     238    95     0     171    130
Gwangju   269   194   171       0     77
Jeonju    195   189   130      77      0

#indexing
city.distance.mat["Seoul","Busan"] #output: 331
city.distance.mat[,"Seoul"]
#output
Seoul   Busan   Daegu Gwangju  Jeonju 
0     331     238     269     195 
city.distance.mat[c("Seoul","Gwangju"),]
#output
        Seoul Busan Daegu Gwangju Jeonju
Seoul       0   331   238     269    195
Gwangju   269   194   171       0     77

































