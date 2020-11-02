#dataframe 인덱싱3

#subset 함수: 데이터프레임 인덱싱을 사용하는게 복잡할 때 사용하는 함수 
#행과 열을 추출하는 함수 
head(mtcars)
subset(mtcars,subset=(mpg>30),select=mpg) #인수1: 데이터 셋, 인수2: 조건, 인수3: 추출할 열이름
#output
mpg
Fiat 128       32.4
Honda Civic    30.4
Toyota Corolla 33.9
Lotus Europa   30.4

subset(mtcars, subset=(cyl==4 & am==0),select = c(mpg,hp,wt))
#output
               mpg hp    wt
Merc 240D     24.4 62 3.190
Merc 230      22.8 95 3.150
Toyota Corona 21.5 97 2.465

subset(mtcars,subset = (mpg > mean(mpg)),select = c(mpg,cyl,wt))
#output
                mpg cyl    wt
Mazda RX4      21.0   6 2.620
Mazda RX4 Wag  21.0   6 2.875
Datsun 710     22.8   4 2.320
Hornet 4 Drive 21.4   6 3.215
Merc 240D      24.4   4 3.190
Merc 230       22.8   4 3.150
Fiat 128       32.4   4 2.200
Honda Civic    30.4   4 1.615
Toyota Corolla 33.9   4 1.835
Toyota Corona  21.5   4 2.465
Fiat X1-9      27.3   4 1.935
Porsche 914-2  26.0   4 2.140
Lotus Europa   30.4   4 1.513
Volvo 142E     21.4   4 2.780

#Cor 함수: 데이터 간의 상관계수를 추출 
cor(USArrests)
#output
Murder   Assault   UrbanPop      Rape
Murder   1.00000000 0.8018733 0.06957262 0.5635788
Assault  0.80187331 1.0000000 0.25887170 0.6652412
UrbanPop 0.06957262 0.2588717 1.00000000 0.4113412
Rape     0.56357883 0.6652412 0.41134124 1.0000000

#UrbanPop에 대한 상관계수는 궁금하지 않을 때, 데이터를 UrbanPop을 제거한 데이터 셋을 주어준다. 그 방법?
a <- subset(USArrests,select = -UrbanPop)
head(a)
#output
Murder Assault Rape
Alabama      13.2     236 21.2
Alaska       10.0     263 44.5
Arizona       8.1     294 31.0
Arkansas      8.8     190 19.5
California    9.0     276 40.6
Colorado      7.9     204 38.7

cor(a)
#output
Murder   Assault      Rape
Murder  1.0000000 0.8018733 0.5635788
Assault 0.8018733 1.0000000 0.6652412
Rape    0.5635788 0.6652412 1.0000000

#여러 개의 열을 지운 데이터 셋의 상관계수 추출
cor(subset(USArrests,select = -c(UrbanPop,Rape)))
#output
Murder   Assault
Murder  1.0000000 0.8018733
Assault 0.8018733 1.0000000

#SQL 문을 이용한 데이터 처리 방법 제공 
install.packages("sqldf") #패키지 설치 
library(sqldf) #메모리 적재
data("mtcars")
sqldf("select * from mtcars where mpg > 30",row.names=TRUE)#row.names=TRUE->행 이름 표시
#output
                mpg cyl disp  hp drat    wt  qsec vs am gear
Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4
Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4
Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4
Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5
               carb
Fiat 128          1
Honda Civic       2
Toyota Corolla    1
Lotus Europa      2

sqldf("select * from mtcars where cyl=6 order by mpg",row.names=TRUE) #->order by mpg , mpg를 기준으로 오름차순으로 출력
#output
                mpg cyl  disp  hp drat    wt  qsec vs am
Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0
Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0
Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0
Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.50  0  1
Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1
Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1
Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0
               gear carb
Merc 280C         4    4
Valiant           3    1
Merc 280          4    4
Ferrari Dino      5    6
Mazda RX4         4    4
Mazda RX4 Wag     4    4
Hornet 4 Drive    3    1

sqldf("select avg(mpg) as avg_mpg, avg(wt) as avg_wt, gear from mtcars where cyl in (4,6) group by gear")#cyl in (4,6) cyl의 갯수가 4개 또는 6개인 자동차 모델을 선택해서 gear 단수별로 집계해서 얻고자 하는 열을 출력
#output  
     avg_mpg   avg_wt gear
1 20.33333 3.046667    3
2 24.53333 2.616667    4
3 25.36667 2.141000    5

data(iris) #iris 데이터 메모리에 적재
sqldf("select distinct Species from iris")
#output
     Species
1     setosa
2 versicolor
3  virginica
sqldf("select * from iris limit 3")
#output -> limit 3: 3개의 행 만을 추출 
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa

#SQL에서는 변수 이름에 '.' 을 사용하지 않는다. [] OR ""를 사용해서 사용 가능
sqldf("select avg([Sepal.Length]) from iris where Species='setosa'")
#output
   avg([Sepal.Length])
1               5.006

sqldf('select avg("Sepal.Length") from iris where Species="setosa"')
#output
   avg("Sepal.Length")
1               5.006





















