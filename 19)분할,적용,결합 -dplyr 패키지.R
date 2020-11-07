#분할-적용-결합 - dplyr 패키지 
#split-apply-combine

#dplyr -> 데이터 프레임 형식의 데이터 셋을 대상으로 일련의 데이터 처리 과정을 지원하는 다양한 함수들을 지원함. 

head(airquality)

install.packages("dplyr")
library(dplyr) 


<<dplyr pakage>> -첫 번째 인수를 모두 데이터 프레임을 받는다.
##arrange(): 행을 sorting 가능, 지정한 열을 기준으로 해서 오름차순으로 데이터를 sorting
air <- arrange(airquality,Temp,Month,Day) #Temp를 기준으로 분류하고 만약 동율이 생기면 그 뒤에 또 다른 열을 조건으로 지정해주면 동율을 다른 기준으로 sorting해준다.
head(air)
#output
  Ozone Solar.R Wind Temp Month Day
1    NA      NA 14.3   56     5   5
2     6      78 18.4   57     5  18
3    NA      66 16.6   57     5  25
4    NA      NA  8.0   57     5  27
5    18      65 13.2   58     5  15
6    NA     266 14.9   58     5  26
#Temp열을 기준으로 내림차순 정열하고 싶을 때,
air <- arrange(airquality,desc(Temp),Month,Day)
head(air)
#output
  Ozone Solar.R Wind Temp Month Day
1    76     203  9.7   97     8  28
2    84     237  6.3   96     8  30
3   118     225  2.3   94     8  29
4    85     188  6.3   94     8  31
5    NA     259 10.9   93     6  11
6    73     183  2.8   93     9   3

##filter(): 원하는 행을 추출 가능 
air <- filter(airquality, Month==6) #=airquality[airquality$Month==6,] 동일한 결과 출력 가능
                                    #=subset(airquality, subset=(Month==6))
head(air)
#output 
  Ozone Solar.R Wind Temp Month Day
1    NA     286  8.6   78     6   1
2    NA     287  9.7   74     6   2
3    NA     242 16.1   67     6   3
4    NA     186  9.2   84     6   4
5    NA     220  8.6   85     6   5
6    NA     264 14.3   79     6   6
#조건 연산자 AND(, &) , OR(|) 사용해서 filter 사용
air <- filter(airquality,Month==6, Temp>90)
air
#output
  Ozone Solar.R Wind Temp Month Day
1    NA     259 10.9   93     6  11
2    NA     250  9.2   92     6  12

#or 사용
air <- filter(airquality,Ozone> 80 | Temp > 90)
head(air)
#output
  Ozone Solar.R Wind Temp Month Day
1   115     223  5.7   79     5  30
2    NA     259 10.9   93     6  11
3    NA     250  9.2   92     6  12
4   135     269  4.1   84     7   1
5    97     267  6.3   92     7   8
6    97     272  5.7   92     7   9

##slice 함수의 사용, 원하는 행 추출 
slice(airquality,6:10)
#output
  Ozone Solar.R Wind Temp Month Day
1    28      NA 14.9   66     5   6
2    23     299  8.6   65     5   7
3    19      99 13.8   59     5   8
4     8      19 20.1   61     5   9
5    NA     194  8.6   69     5  10
slice(airquality,n()) #dplyr의 n()함수는 데이터 프레임의 행의 개수 반환
#output
  Ozone Solar.R Wind Temp Month Day
1    20     223 11.5   68     9  30

##select(): 원하는 열 추출 가능
air <- select(airquality,Month,Day,Temp) #원하는 열의 수만큼 추출해준다. 
head(air)
  Month Day Temp
1     5   1   67
2     5   2   72
3     5   3   74
4     5   4   62
5     5   5   56
6     5   6   66

air <- select(airquality,Temp:Day) #내가 추출하고 싶은 열(Temp, Month, Day)들이 붙어 있다면 왼쪽과 같이 추출해줄 수 있다.
head(air)
#output
  Month Day Temp
1     5   1   67
2     5   2   72
3     5   3   74
4     5   4   62
5     5   5   56
6     5   6   66

air <- select(airquality,-(Temp:Day)) #Temp,Month,Day를 제외한 나머지 열들을 추출하고 싶을 때 사용한다.
head(air)
#output
  Ozone Solar.R Wind
1    41     190  7.4
2    36     118  8.0
3    12     149 12.6
4    18     313 11.5
5    NA      NA 14.3
6    28      NA 14.9

air <- select(airquality,Solar=Solar.R) #추출하고 싶은 열을 변경.
head(air)
#output
  Solar
1   190
2   118
3   149
4   313
5    NA
6    NA
##rename(): 위의 경우처럼 select를 이용하여 열을 변경해서 출력하면 해당 열만 뽑아낼 수 있다. 
#         :그렇기 때문에, rename()라는 함수를 사용하게 되면 해당 열뿐만 아니라 데이터 프레임 내의 모든 열을 뽑아낼 수 있다. 
air <- rename(airquality,Solar=Solar.R)
head(air)
#output
  Ozone Solar Wind Temp Month Day
1    41   190  7.4   67     5   1
2    36   118  8.0   72     5   2
3    12   149 12.6   74     5   3
4    18   313 11.5   62     5   4
5    NA    NA 14.3   56     5   5
6    28    NA 14.9   66     5   6

##distinct 함수: select 함수와 함께 사용할 경우, 특정 열에 포함된 중복되지 않은 고유의 값들을 출력할 수 있다. 
distinct(select(airquality,Month))
#output 
  Month
1     5
2     6
3     7
4     8
5     9

#mutate(): 기존의 데이터 프레임의 열을 변수를 이용해서 새로운 변수 생성 가능(새로운 열 추가)
air <- mutate(airquality,
       Temp.C=(Temp-32)/1.8,
       Diff=Temp.C-mean(Temp.C))
head(air)
#output
  Ozone Solar.R Wind Temp Month Day   Temp.C       Diff
1    41     190  7.4   67     5   1 19.44444  -6.045752
2    36     118  8.0   72     5   2 22.22222  -3.267974
3    12     149 12.6   74     5   3 23.33333  -2.156863
4    18     313 11.5   62     5   4 16.66667  -8.823529
5    NA      NA 14.3   56     5   5 13.33333 -12.156863
6    28      NA 14.9   66     5   6 18.88889  -6.601307

##transform 함수-> 표준 패키지에 포함되어 있는 함수인데, 위의 mutate()와 동일하게 작동한다.
transform(airquality,
          Temp.C=(Temp-32)/1.8,
          Diff=Temp.C-mean(Temp.C))
#output -> 기존에 없던 Temp.C를 이용해서 Diff 함수를 다시 만들어 낼 수 없다. 그래서 Error가 발생한다.
Error in eval(substitute(list(...)), `_data`, parent.frame()) : 
  객체 'Temp.C'를 찾을 수 없습니다
air <- transform(airquality,
          Temp.C=(Temp-32)/1.8)
          
head(air)
#output
  Ozone Solar.R Wind Temp Month Day   Temp.C
1    41     190  7.4   67     5   1 19.44444
2    36     118  8.0   72     5   2 22.22222
3    12     149 12.6   74     5   3 23.33333
4    18     313 11.5   62     5   4 16.66667
5    NA      NA 14.3   56     5   5 13.33333
6    28      NA 14.9   66     5   6 18.88889

#summarise(): 요약 통계량 계산 가능 
summarise(airquality,mean(Temp)) 
#output
  mean(Temp)
1   77.88235

summarise(airquality,Mean = mean(Temp,na.rm = TRUE),
          Median = median(Temp,na.rm = TRUE),
          SD = sd(Temp,na.rm=TRUE),
          Max = max(Temp,na.rm=TRUE),
          Min = min(Temp,na.rm=TRUE)) #na.rm=TRUE -> NA값 제거  
#output
    Mean Median      SD Max Min
77.88235     79 9.46527  97  56

summarise(airquality,Mean = mean(Temp,na.rm = TRUE),
          Median = median(Temp,na.rm = TRUE),
          SD = sd(Temp,na.rm=TRUE),
          Max = max(Temp,na.rm=TRUE),
          Min = min(Temp,na.rm=TRUE),
          N = n(), #n() 행의 개수 출력 
          Distinct.Month = n_distinct(Month), #n_distinct(): 중복되지 않은 고유한 값의 개수 반환 
          Distinct.First = first(Month), #지정된 열의 첫 번째 값을 알고 싶다.
          Distinct.Last = last(Month), #지정된 열의 최종값을 알려준다.
          )

#sample_n() & sample_frac() 두 함수는 비복원 추출을 한다.
##sample_n(): 지정된 인수의 수 만큼 데이터 프레임으로부터 무작위로 행 추출 가능
sample_n(airquality,5) #머신러닝의 train or test data를 무작위로 추출하고 싶을 때 유용하게 사용할 수 있는 함수 
#output
Ozone Solar.R Wind Temp Month Day
1    14     191 14.3   75     9  28
2    12     120 11.5   73     6  19
3    20      37  9.2   65     6  18
4    45     252 14.9   81     5  29
5    NA      NA 14.3   56     5   5

##sample_frac(): 지정된 인수의 비율만큼 추출 
sample_frac(airquality,0.05)
#output
  Ozone Solar.R Wind Temp Month Day
1    24     259  9.7   73     9  10
2    NA     139  8.6   82     7  11
3    44     190 10.3   78     8  20
4    89     229 10.3   90     8   8
5    28     273 11.5   82     8  13
6    76     203  9.7   97     8  28
7    77     276  5.1   88     7   7
8    97     267  6.3   92     7   8

#만약 복원 추출을 하고 싶다면! replace = TRUE 인수 지정 
sample_frac(airquality,0.05,replace = TRUE)
#output
  Ozone Solar.R Wind Temp Month Day
1    97     272  5.7   92     7   9
2    30     193  6.9   70     9  26
3    12     120 11.5   73     6  19
4    82     213  7.4   88     7  28
5    24     238 10.3   68     9  19
6    41     190  7.4   67     5   1
7    23      13 12.0   67     5  28
8    44     236 14.9   81     9  11

##group_by() 함수: 주어진 데이터 셋으로부터 집단 변수의 카테고리별로 분할된 그룹화된 객체 생성
group.air <- group_by(airquality,Month) #Month를 집단 변수로 설정하고, 카테고리(월)별로 그룹화된 객체를 만들어서 출력
#이렇게 Month를 집단 변수로 설정하면 월별로 그룹화가 되어 월별로 평균, 표준편차 등을 계산할 수 있게 된다.

class(group.air)
#output -> grouped_df: 그룹화된 데이터 프레임
"grouped_df" "tbl_df"     "tbl"        "data.frame"

group.air
#output -> 이러한 데이터 프레임을 tibble라고 한다. 기본적으로 10개의 행을 화면에 출력한다. 
#       -> 열도 화면에 출력할 수 있는 정도만 보여주고 나머지는 밑에 글씨로 보여준다.
# A tibble: 153 x 6
# Groups:   Month [5]
  Ozone Solar.R  Wind  Temp Month   Day
  <int>   <int> <dbl> <int> <int> <int>
1    41     190   7.4    67     5     1
2    36     118   8      72     5     2
3    12     149  12.6    74     5     3
4    18     313  11.5    62     5     4
5    NA      NA  14.3    56     5     5
6    28      NA  14.9    66     5     6
7    23     299   8.6    65     5     7
8    19      99  13.8    59     5     8
9     8      19  20.1    61     5     9
10    NA     194   8.6    69     5    10
# ... with 143 more rows

#group.air가 그룹별로 연산을 하는지 확인
summarise(group.air,
          Mean.Temp=mean(Temp,na.rm=TRUE))
#output
# A tibble: 5 x 2
Month Mean.Temp
  <int>     <dbl>
1     5      65.5
2     6      79.1
3     7      83.9
4     8      84.0
5     9      76.9

summarise(group.air,
          Mean.Temp=mean(Temp,na.rm=TRUE),
          SD.Temp=sd(Temp,na.rm = TRUE),
          Days=n())
#output
# A tibble: 5 x 4
Month Mean.Temp SD.Temp  Days
   <int>     <dbl>   <dbl> <int>
1     5      65.5    6.85    31
2     6      79.1    6.60    30
3     7      83.9    4.32    31
4     8      84.0    6.59    31
5     9      76.9    8.36    30

##pipe 연산자 -> %>%: 한 함수로부터의 출력 결과나 데이터를 다음 하수의 첫 번째 인수로 전달 가능
iris %>% head #head(iris)와 동일
#output
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa

1:10 %>% mean #=mean(1:10)
#output: 5.5 

a1 <- select(airquality,Ozone,Temp,Month) 
head(a1)
#output
  Ozone Temp Month
1    41   67     5
2    36   72     5
3    12   74     5
4    18   62     5
5    NA   56     5
6    28   66     5

a2 <- group_by(a1,Month)
a2
#output
# A tibble: 153 x 3
# Groups:   Month [5]
Ozone  Temp Month
  <int> <int> <int>
1    41    67     5
2    36    72     5
3    12    74     5
4    18    62     5
5    NA    56     5
6    28    66     5
7    23    65     5
8    19    59     5
9     8    61     5
10    NA    69     5
# ... with 143 more rows
a3 <- summarise(a2,
                Mean.Ozone=mean(Ozone,na.rm=TRUE),
                Mean.Temp=mean(Temp,na.rm=TRUE))
a3
#output -> 월별로 Ozone과 Temp의 평균을 출력된 것을 볼 수 있다. 
Month Mean.Ozone Mean.Temp
  <int>      <dbl>     <dbl>
1     5       23.6      65.5
2     6       29.4      79.1
3     7       59.1      83.9
4     8       60.0      84.0
5     9       31.4      76.9

a4 <- filter(a3,Mean.Ozone > 40 | Mean.Temp > 80)
a4
#output
Month Mean.Ozone Mean.Temp
   <int>      <dbl>     <dbl>
1     7       59.1      83.9
2     8       60.0      84.0

# %>%를 사용하여 위의 과정을 진행해보기! 
air <- airquality %>% 
  select(Ozone,Temp,Month) %>%
  group_by(Month) %>% 
  summarise(Mean.Ozone=mean(Ozone,na.rm=TRUE),
            Mean.Temp=mean(Temp,na.rm=TRUE)) %>%
  filter(Mean.Ozone > 40 | Mean.Temp > 80)
air   
#output
# A tibble: 2 x 3
Month Mean.Ozone Mean.Temp
  <int>      <dbl>     <dbl>
1     7       59.1      83.9
2     8       60.0      84.0























