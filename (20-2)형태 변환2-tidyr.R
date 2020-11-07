#형태 변환2-tidyr 패키지(dataframe에만 적용할 수 있는 함수 제공)

install.packages("tidyr")
library(tidyr)

##gather(): wide -> long 
aq.long <-gather(airquality,
                 key=Factor, #long format 변수 format을 포함할 열 이름 지정 
                 value=Measurement, #각 변수에 대응되는 값이 저장되는 열의 이름
                 Ozone:Temp) #long format으로 변환한 변수 list 지정, 여기에 지정 안된 변수는 식별자 변수로 사용 

head(aq.long)
#output
  Month Day Factor Measurement
1     5   1  Ozone          41
2     5   2  Ozone          36
3     5   3  Ozone          12
4     5   4  Ozone          18
5     5   5  Ozone          NA
6     5   6  Ozone          28

#측정 변수를 -(식별자 변수)를 통해 지정 가능
aq.long <- gather(airquality,
                  key=Factor,
                  value=Measurement,
                  -Month, -Day) #측정 변수가 순서대로 있지 않을 경우, -(식별자 변수)로 지정하게 되면 식별자 변수를 제외한 나머지 변수를 측정 변수로 지정하게 된다.
head(aq.long)
#output
  Month Day Factor Measurement
1     5   1  Ozone          41
2     5   2  Ozone          36
3     5   3  Ozone          12
4     5   4  Ozone          18
5     5   5  Ozone          NA
6     5   6  Ozone          28

#측정 변수를 index를 통해 지정 가능 
aq.long <- gather(airquality,
                  key=Factor,
                  value=Measurement,
                  1:4) #측정 변수가 순서대로 있지 않을 경우, -(식별자 변수)로 지정하게 되면 식별자 변수를 제외한 나머지 변수를 측정 변수로 지정하게 된다.
#output
  Month Day Factor Measurement
1     5   1  Ozone          41
2     5   2  Ozone          36
3     5   3  Ozone          12
4     5   4  Ozone          18
5     5   5  Ozone          NA
6     5   6  Ozone          28

#변수의 목록이 원하는 순서대로 되어 있지 않거나, 원하는 변수만을 변수 list로 포함하고 싶을 경우.
aq.long <- gather(airquality,
                  key=Factor,
                  value=Measurement,
                  Ozone, Solar.R,Wind,Temp)
head(aq.long)
#output
  Month Day Factor Measurement
1     5   1  Ozone          41
2     5   2  Ozone          36
3     5   3  Ozone          12
4     5   4  Ozone          18
5     5   5  Ozone          NA
6     5   6  Ozone          28

#tidyr 패키지는 dplyr 패키지와 같은 계열의 패키지이기 때문에 pipe 연산자(%>%) 사용 가능
airquality %>% gather(Factor,Measurment,Ozone:Temp)
#위의 결과들과 동일한 결과로 출력되었다.

head(airquality) #airquality 데이터 셋의 열의 순서가 Ozone:Temp대로 차례로 되어 있어서 위에서 측정 변수를 지정할 때 Ozone:Temp로 지정해도 문제 없다.

##spread(): long -> wide
aq.wide <- spread(data=aq.long,key=Factor,value = Measurement) #key에는 측정 변수가 들어 있는 열 이름, value인수에는 측정 벼수의 값들이 지정된 열의 이름
head(aq.wide)
#output
  Month Day Ozone Solar.R Temp Wind
1     5   1    41     190   67  7.4
2     5   2    36     118   72  8.0
3     5   3    12     149   74 12.6
4     5   4    18     313   62 11.5
5     5   5    NA      NA   56 14.3
6     5   6    28      NA   66 14.9

##pipe 연산자를 이용하는 long -> wide 변환
aq.long %>% spread(key=Factor,value=Measurement)

##separate(): 하나의 열을 여러 개의 열로 분할하는 함수 
iris.long <- gather(iris, key = Element, value=Measurement,-Species)
head(iris.long)
#output
  Species      Element Measurement
1  setosa Sepal.Length         5.1
2  setosa Sepal.Length         4.9
3  setosa Sepal.Length         4.7
4  setosa Sepal.Length         4.6
5  setosa Sepal.Length         5.0
6  setosa Sepal.Length         5.4

#seperate를 함수를 이용하여 Element 열내에 Sepal.Length를 '.'을 기준으로 분할해보자.
iris.sep <- separate(data=iris.long, 
                     col=Element, #분할할 열 지정
                     into=c("Part","Measures")) #분할한 값들로 이루어질 새로운 열의 이름 지정
head(iris.sep)
#output
  Species  Part Measures Measurement
1  setosa Sepal   Length         5.1
2  setosa Sepal   Length         4.9
3  setosa Sepal   Length         4.7
4  setosa Sepal   Length         4.6
5  setosa Sepal   Length         5.0
6  setosa Sepal   Length         5.4

iris.sep <- separate(data=iris.long, 
                     col=Element, #분할할 열 지정
                     into=c("Part","Measures")) #분할한 값들로 이루어질 새로운 열의 이름 지정
#위의 코드를 보면, 우리는 무엇을 기준으로 분할할 것인지 지정x 
#default값으로 sep = "[^[:alnum:]]+"로 지정되어 있다.
#sep = "[^[:alnum:]]+" -> 문자와 숫자가 아닌 기본값으로 분할해라.
#sep에 숫자를 넣을 수 있는데, 숫자를 넣게 되면 해달 열의 데이터의 분할할 index를 가리키게 된다.

##unite(): 분할된 열을 하나로 합치는 함수 
iris.unite <- unite(data=iris.sep,
                    col=Element, #결합후 생성할 열 이름
                    Part, Measures, #결합할 열 이름
                    sep="_") #구분자로 사용할 문자 지정. 무엇으로 결합할지 지정
                    
head(iris.unite)
#output
  Species      Element Measurement
1  setosa Sepal_Length         5.1
2  setosa Sepal_Length         4.9
3  setosa Sepal_Length         4.7
4  setosa Sepal_Length         4.6
5  setosa Sepal_Length         5.0
6  setosa Sepal_Length         5.4










