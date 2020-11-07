#집단 요약

#범주별로 데이터 분할
#mtcars내의 am(변속의 유형) 변수를 factor의 데이터 구조로 바꿔서 1->manual(수동 변속기) 0->automatic(자동 변속기) 집단을 구분하는 변수로 이용
mtcars <- within(mtcars,am <- factor(am,
                                     levels=c(0,1),
                                     labels=c("Automatic","Manual")))
mtcars$am
#output -> 범주형 변수로 변경됨.
[1] Manual    Manual    Manual    Automatic Automatic
[6] Automatic Automatic Automatic Automatic Automatic
[11] Automatic Automatic Automatic Automatic Automatic
[16] Automatic Automatic Manual    Manual    Manual   
[21] Automatic Automatic Automatic Automatic Automatic
[26] Manual    Manual    Manual    Manual    Manual   
[31] Manual    Manual   
Levels: Automatic Manual

#split를 이용해서 데이터를 분할 
g <- split(x=mtcars$mpg,f=mtcars$am) #x에는 분할할 데이터가 들어간다.f에는 집단을 구분하는 변수인 범주형 변수를 넣어준다.
g
#output
$Automatic
[1] 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
[12] 10.4 10.4 14.7 21.5 15.5 15.2 13.3 19.2

$Manual
[1] 21.0 21.0 22.8 32.4 30.4 33.9 27.3 26.0 30.4 15.8 19.7
[12] 15.0 21.4

#자동 변속기 수동 변속기의 mpg 평균
mean(g[[1]]) #output: 17.14737
mean(g[[2]]) #output: 24.39231
sapply(g,mean) 
#output
Automatic    Manual 
17.14737  24.39231

#unstack()
unstack(data.frame(mtcars$mpg,mtcars$am)) #split과 수행 결과는 동일하지만, 분할하고자 하는 데이터와 집단을 구분하는 범주형 변수가 데이터 프레임의 혈태로 들어가야 한다.
#output ->만약 출력되는 집단의 데이터의 수가 동일하다면 list의 구조가 아닌 dataframe의 형태로 출력된다.
$Automatic
[1] 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
[12] 10.4 10.4 14.7 21.5 15.5 15.2 13.3 19.2

$Manual
[1] 21.0 21.0 22.8 32.4 30.4 33.9 27.3 26.0 30.4 15.8 19.7
[12] 15.0 21.4

head(iris)
gg <- unstack(data.frame(iris$Sepal.Length,iris$Species))
#output
    setosa versicolor virginica
1     5.1        7.0       6.3
2     4.9        6.4       5.8
3     4.7        6.9       7.1
4     4.6        5.5       6.3
5     5.0        6.5       6.5
6     5.4        5.7       7.6
7     4.6        6.3       4.9
8     5.0        4.9       7.3
9     4.4        6.6       6.7
10    4.9        5.2       7.2
11    5.4        5.0       6.5
12    4.8        5.9       6.4
13    4.8        6.0       6.8
14    4.3        6.1       5.7
15    5.8        5.6       5.8
16    5.7        6.7       6.4
17    5.4        5.6       6.5
18    5.1        5.8       7.7
19    5.7        6.2       7.7
20    5.1        5.6       6.0
21    5.4        5.9       6.9
22    5.1        6.1       5.6
23    4.6        6.3       7.7
24    5.1        6.1       6.3
25    4.8        6.4       6.7
26    5.0        6.6       7.2
27    5.0        6.8       6.2
28    5.2        6.7       6.1
29    5.2        6.0       6.4
30    4.7        5.7       7.2
31    4.8        5.5       7.4
32    5.4        5.5       7.9
33    5.2        5.8       6.4
34    5.5        6.0       6.3
35    4.9        5.4       6.1
36    5.0        6.0       7.7
37    5.5        6.7       6.3
38    4.9        6.3       6.4
39    4.4        5.6       6.0
40    5.1        5.5       6.9
41    5.0        5.5       6.7
42    4.5        6.1       6.9
43    4.4        5.8       5.8
44    5.0        5.0       6.8
45    5.1        5.6       6.7
46    4.8        5.7       6.7
47    5.1        5.7       6.3
48    4.6        6.2       6.5
49    5.3        5.1       6.2
50    5.0        5.7       5.9

str(gg)
#output -> 데이터 프레임의 결과가 list가 아닌 dataframe의 결과로 나왔다. 그 이유는 각 분할 데이터의 길이가 동일하기 때문이다.
'data.frame':	50 obs. of  3 variables:
  $ setosa    : num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
$ versicolor: num  7 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 ...
$ virginica : num  6.3 5.8 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 ...

summary(gg)
#output
   setosa        versicolor      virginica    
Min.   :4.300   Min.   :4.900   Min.   :4.900  
1st Qu.:4.800   1st Qu.:5.600   1st Qu.:6.225  
Median :5.000   Median :5.900   Median :6.500  
Mean   :5.006   Mean   :5.936   Mean   :6.588  
3rd Qu.:5.200   3rd Qu.:6.300   3rd Qu.:6.900  
Max.   :5.800   Max.   :7.000   Max.   :7.900 


#범주별로 데이터를 분할하고 분할된 범주별 데이터에 대한 통계 계산을 동시에 수행하는 함수
#tapply() 
tapply(X=iris$Sepal.Length,INDEX = iris$Species, #INDEX에는 범주형 변수가 들어간다. 
       FUN = mean) #x에는 계산할 데이터 벡터가 들어간다.
#output
setosa versicolor  virginica 
5.006      5.936      6.588 

tapply(X=iris$Sepal.Length,INDEX = iris$Species,FUN = length)
#output
setosa versicolor  virginica 
50         50         50 

with(mtcars, tapply(mpg,list(cyl,am),mean)) #tapply에 집단을 구분하는 변수를 두 개를 줄 때에는 list 데이터 구조로 줘야 한다. 
#output -> 2차원 테이블로 출력 
  Automatic   Manual
4    22.900 28.07500
6    19.125 20.56667
8    15.050 15.40000

#2차원 테이블 내에 두 개의 범주형 변수의 이름 지정
with(mtcars, tapply(mpg,list(Cylinder=cyl,Transmission=am),mean))
#output
        Transmission
Cylinder Automatic   Manual
       4    22.900 28.07500
       6    19.125 20.56667
       8    15.050 15.40000

#aggregate()
with(mtcars,
     aggregate(x=mpg, 
               by=list(Cylinder=cyl,Transmission=am),FUN=mean))      
#output
  Cylinder Transmission        x
1        4    Automatic 22.90000
2        6    Automatic 19.12500
3        8    Automatic 15.05000
4        4       Manual 28.07500
5        6       Manual 20.56667
6        8       Manual 15.40000

aggregate(mtcars[c(1:6)],
          list(Group.cyl=mtcars$cyl,Group.am=mtcars$am),
          mean)

#output -> cyl과 am에 대한 모든 조합별로 데이터 프레임의 모든 열의 변수 값의 평균이출력으로 나온다.
  Group.cyl  Group.am      mpg cyl     disp        hp
1         4 Automatic 22.90000   4 135.8667  84.66667
2         6 Automatic 19.12500   6 204.5500 115.25000
3         8 Automatic 15.05000   8 357.6167 194.16667
4         4    Manual 28.07500   4  93.6125  81.87500
5         6    Manual 20.56667   6 155.0000 131.66667
6         8    Manual 15.40000   8 326.0000 299.50000
       drat       wt
1 3.770000 2.935000
2 3.420000 3.388750
3 3.120833 4.104083
4 4.183750 2.042250
5 3.806667 2.755000
6 3.880000 3.370000

aggregate(iris[c(1:4)],
          list(Species=iris$Species),mean)
#output ->4개 열의 변수 값들이 범주형 변수(Species)별로 분할되고 그 분할된 값들에 대한 평균을 출력해준다.  
     Species Sepal.Length Sepal.Width Petal.Length
1     setosa        5.006       3.428        1.462
2 versicolor        5.936       2.770        4.260
3  virginica        6.588       2.974        5.552
  Petal.Width
1       0.246
2       1.326
3       2.026

#by()
by(data=iris,INDICES = iris$Species,FUN = summary) #summary는 dataframe을 인수로 받는다.
#FUN함수에는 데이터 프레임을 처리하는 어떠한 함수도 가능하다.
#output
iris$Species: setosa
Sepal.Length    Sepal.Width     Petal.Length  
Min.   :4.300   Min.   :2.300   Min.   :1.000  
1st Qu.:4.800   1st Qu.:3.200   1st Qu.:1.400  
Median :5.000   Median :3.400   Median :1.500  
Mean   :5.006   Mean   :3.428   Mean   :1.462  
3rd Qu.:5.200   3rd Qu.:3.675   3rd Qu.:1.575  
Max.   :5.800   Max.   :4.400   Max.   :1.900  
Petal.Width          Species  
Min.   :0.100   setosa    :50  
1st Qu.:0.200   versicolor: 0  
Median :0.200   virginica : 0  
Mean   :0.246                  
3rd Qu.:0.300                  
Max.   :0.600                  
--------------------------------------------- 
  iris$Species: versicolor
Sepal.Length    Sepal.Width     Petal.Length 
Min.   :4.900   Min.   :2.000   Min.   :3.00  
1st Qu.:5.600   1st Qu.:2.525   1st Qu.:4.00  
Median :5.900   Median :2.800   Median :4.35  
Mean   :5.936   Mean   :2.770   Mean   :4.26  
3rd Qu.:6.300   3rd Qu.:3.000   3rd Qu.:4.60  
Max.   :7.000   Max.   :3.400   Max.   :5.10  
Petal.Width          Species  
Min.   :1.000   setosa    : 0  
1st Qu.:1.200   versicolor:50  
Median :1.300   virginica : 0  
Mean   :1.326                  
3rd Qu.:1.500                  
Max.   :1.800                  
--------------------------------------------- 
  iris$Species: virginica
Sepal.Length    Sepal.Width     Petal.Length  
Min.   :4.900   Min.   :2.200   Min.   :4.500  
1st Qu.:6.225   1st Qu.:2.800   1st Qu.:5.100  
Median :6.500   Median :3.000   Median :5.550  
Mean   :6.588   Mean   :2.974   Mean   :5.552  
3rd Qu.:6.900   3rd Qu.:3.175   3rd Qu.:5.875  
Max.   :7.900   Max.   :3.800   Max.   :6.900  
Petal.Width          Species  
Min.   :1.400   setosa    : 0  
1st Qu.:1.800   versicolor: 0  
Median :2.000   virginica :50  
Mean   :2.026                  
3rd Qu.:2.300  
Max.   :2.500 

by(iris,iris$Species,function(x) mean(x$Sepal.Length))#iris라는 데이터 프레임이 사용자 정의 함수의 x에 들어가서, 범주형 변수 별로 평균을 출력해준다.
#output
iris$Species: setosa
[1] 5.006
--------------------------------------------- 
  iris$Species: versicolor
[1] 5.936
--------------------------------------------- 
  iris$Species: virginica
[1] 6.588

#table 함수는 연속형 변수에 대해서는 처리할 수 없고 factor or factor로 만들어 낼 수 있는 변수에 대해서만 적용할 수 있다.
#범주형 변수가 가질 수 있는 가능한 범주값에 대해서 각각의 범주별 관측값이 몇개인가?
table(mtcars$gear)
#output -> 범주형 변수 gear에 있는 3,4,5 범주값 각각에 대해서 범주별 관측값이 몇개인지 보여준다.
3  4  5 
15 12  5 
table(iris$Species)
#output -> 범주형 변수 Species 내에 범주값(setosa,versicolor,virginica)들의 관측값이 각각 몇개인지 보여준다.
setosa versicolor  virginica 
    50         50         50 
table(mtcars$am,mtcars$gear)
#output
           3  4  5
Automatic 15  4  0
Manual     0  8  5

#연속형 변수에 대해서 처리하기 위해서는 구간을 만들고 그 구간에 대해서 table함수를 적용할 수는 있다.
mpg.cut <- cut(mtcars$mpg,breaks=5)
#output -> 연속형 변수(그냥 수치값)을 5개의 구간으로 범주 처리된 결과가 나온다.
[1] (19.8,24.5] (19.8,24.5] (19.8,24.5] (19.8,24.5]
[5] (15.1,19.8] (15.1,19.8] (10.4,15.1] (19.8,24.5]
[9] (19.8,24.5] (15.1,19.8] (15.1,19.8] (15.1,19.8]
[13] (15.1,19.8] (15.1,19.8] (10.4,15.1] (10.4,15.1]
[17] (10.4,15.1] (29.2,33.9] (29.2,33.9] (29.2,33.9]
[21] (19.8,24.5] (15.1,19.8] (15.1,19.8] (10.4,15.1]
[25] (15.1,19.8] (24.5,29.2] (24.5,29.2] (29.2,33.9]
[29] (15.1,19.8] (15.1,19.8] (10.4,15.1] (19.8,24.5]
5 Levels: (10.4,15.1] (15.1,19.8] ... (29.2,33.9]

table(mpg.cut)
#output
(10.4,15.1] (15.1,19.8] (19.8,24.5] (24.5,29.2] (29.2,33.9] 
         6          12           8           2           4 