#형태 변환1 - reshape2 패키지 

install.packages("reshape2")
library(reshape2)


#Wide format vs Long format -> 변수와 값을 어떻게 배열하는지에 따라 분류
#wide format: 너비는 넓고 길이는 짧게 배열, 한 대상의 모든 측정값들이 하나의 행에 나온다.
#Long format: 길이는 길게 너비는 좁게 배열, ggplot2가 선호하는 데이터 형태

smiths #전형적인 wide format 형태 

##데이터 셋의 형태 변환 함수 
##melt(): wide -> long
melt(data=smiths)
#output
Using subject as id variables #wide format data에 Subject 변수를 long format data로 만들 때 식별자 변수로 사용했다.
     subject variable value
1 John Smith     time  1.00
2 Mary Smith     time  1.00
3 John Smith      age 33.00
4 Mary Smith      age    NA
5 John Smith   weight 90.00
6 Mary Smith   weight    NA
7 John Smith   height  1.87
8 Mary Smith   height  1.54
#melt 함수 내에 식별자 변수를 지정하지 않으면 factor, 문자형을 식별자 변수로 자동으로 지정한다. 

melt(data=smiths,
     id.vars="subject", #id.vars에는 식별자 변수를 지정한다.
     ) #measure.vars에는 id.vars를 제외한 나머지 변수들이 들어간다. 또는 measure.vars인수를 지정하게 되면 이 변수에 지정된 변수외에 변수가 id.vars에 들어간다. 
#output
     subject variable value
1 John Smith     time  1.00
2 Mary Smith     time  1.00
3 John Smith      age 33.00
4 Mary Smith      age    NA
5 John Smith   weight 90.00
6 Mary Smith   weight    NA
7 John Smith   height  1.87
8 Mary Smith   height  1.54

 melt(data=smiths,
     measure.vars = c(2:5)) #time~height를 인수로 지정한다.
#=melt(data=smiths,measure.vars = c("time","age","weight","height"))
#output
     subject variable value
1 John Smith     time  1.00
2 Mary Smith     time  1.00
3 John Smith      age 33.00
4 Mary Smith      age    NA
5 John Smith   weight 90.00
6 Mary Smith   weight    NA
7 John Smith   height  1.87
8 Mary Smith   height  1.54

#melt함수의 표준 사용
smiths.long <- melt(data=smiths,
     measure.vars = c(2:5),
     variable.name = "var",
     value.name = "val")
#output
     subject    var   val
1 John Smith   time  1.00
2 Mary Smith   time  1.00
3 John Smith    age 33.00
4 Mary Smith    age    NA
5 John Smith weight 90.00
6 Mary Smith weight    NA
7 John Smith height  1.87
8 Mary Smith height  1.54

?melt
#Details -> 데이터에 따른 melt 함수 호출 형식 
melt.data.frame for data.frames

melt.array for arrays, matrices and tables

melt.list for lists

##dcast(): long -> wide
?dcast
dcast(data = smiths.long,formula=subject ~ var) #formula 인수에 '~'를 중심으로 왼쪽에는 식별자 변수 오른쪽에는 측정 변수 지정 
#output
Using val as value column: use value.var to override. #-> dcast인수로 값이 들어가 있는 열은 지정하지 않았다. 그래서 dcast자체에서 마지막 열을 값이 들어가 있는 열로 판단한다.
     subject time age weight height
1 John Smith    1  33     90   1.87
2 Mary Smith    1  NA     NA   1.5  4

#dcast내에 값이 들어가 있는 열을 지정 
dcast(data=smiths.long,formula = subject ~ var, value.var = "val") #value.var 인수에 값이 들어가 있는 열 지정
#output.
     subject time age weight height
1 John Smith    1  33     90   1.87
2 Mary Smith    1  NA     NA   1.54

head(airquality) #미국의 뉴욕 주의 대기 상태를 5개월 동안 기록한 데이터 셋 
airquality #전형적인 wide format 
aq.long <- melt(airquality,
                id.vars = c("Month","Day"))
head(aq.long)
#output -> Month Day 식별자 변수를 기준으로 variable이라는 열에 측정 변수들이 모두 들어가 있고 해당 값들이 value열에 들어가 있다.
  Month Day variable value
1     5   1    Ozone    41
2     5   2    Ozone    36
3     5   3    Ozone    12
4     5   4    Ozone    18
5     5   5    Ozone    NA
6     5   6    Ozone    28

tail(aq.long)
#output
    Month Day variable value
607     9  25     Temp    63
608     9  26     Temp    70
609     9  27     Temp    77
610     9  28     Temp    75
611     9  29     Temp    76
612     9  30     Temp    68

aq.wide <- dcast(aq.long,formula=Month + Day ~ variable,
                 value.var = "value") #식별자 변수가 Month와 Day이기 때문에 두 개를 써줄 때 '+'를 이용해서 써준다.
head(aq.wide)
#output
  Month Day Ozone Solar.R Wind Temp
1     5   1    41     190  7.4   67
2     5   2    36     118  8.0   72
3     5   3    12     149 12.6   74
4     5   4    18     313 11.5   62
5     5   5    NA      NA 14.3   56
6     5   6    28      NA 14.9   66

dcast(aq.long,Month ~ variable)
#output -> month하나만을 가지고 variable의 측정 변수의 모든 값을 수용하도록 wide format으로 만든 것. 
#하지만, 각 달은 각각의 측정 변수가 31 or 30 개의 값이 있다. 이러한 모아진 값들로 무엇을 해야 하는지를 
#지정하지 않았기 때문에 오류를 내보내기는 싫고 그래서 그 값들에 'length' 함수를 지정하였다. 이 말이 아래의 에러의 의미이다.
Aggregation function missing: defaulting to length
  Month Ozone Solar.R Wind Temp
1     5    31      31   31   31
2     6    30      30   30   30
3     7    31      31   31   31
4     8    31      31   31   31
5     9    30      30   30   30

#위의 에러를 해결하기 위한 방법
dcast(aq.long,Month ~ variable,
      fun.aggregate = mean,na.rm=TRUE) 
#output -> 위에서 집계된 31개 30개의 각각의 데이터를 fun.aggregate인수에 지정된 mean 함수에 할당하여 출력한다.
          Month    Ozone  Solar.R      Wind     Temp
1     5 23.61538 181.2963 11.622581 65.54839
2     6 29.44444 190.1667 10.266667 79.10000
3     7 59.11538 216.4839  8.941935 83.90323
4     8 59.96154 171.8571  8.793548 83.96774
5     9 31.44828 167.4333 10.180000 76.90000


