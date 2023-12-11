#입력 

#*R의 파일 읽기 함수 
#*1)read.csv() -csv 형식
facebook.csv <- read.csv(file='C:/Users/USER/Desktop/AI_School/facebook.csv')
facebook5 <- facebook.csv[1:5,]
facebook5
#output
    Type Weekday Impressions Comments Like Share
1  Photo       4        5091        4   79    17
2 Status       3       19057        5  130    29
3  Photo       3        4373        0   66    14
4  Photo       2       87991       58 1572   147
5  Photo       2       13594       19  325    49

read.csv(file='C:/Users/USER/Desktop/AI_School/facebook.csv',header=FALSE)[1:5,]
#output
      V1      V2          V3       V4     V5    V6
1   Type Weekday Impressions Comments   Like Share
2  Photo       4        5091        4   79.0  17.0
3 Status       3       19057        5  130.0  29.0
4  Photo       3        4373        0   66.0  14.0
5  Photo       2       87991       58 1572.0 147.0

#*2)read.table() - 테이블 형식
#*#특성: 각 라인은 하나의 레코드로 구성되어 있고, 각 레코드 안에는 필드들이 공백 또는 콜론 쉼표와 같은 구분자로 구분된다. 
#*     : 각 레코드는 동일한 개수의 필드를 가진다. 
read.table(file="C:/Users/USER/Desktop/AI_School/product.txt")
#output -> header=FALSE로 디폴트되어 있어 아래처럼 출력된다.
    V1       V2    V3
1   id     name price
2 A001    Mouse 30000
3 A002 Keyboard 90000
4 A003      USB 50000
read.table(file="C:/Users/USER/Desktop/AI_School/product.txt",header=TRUE)
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard 90000
3 A003      USB 50000

read.table(file="C:/Users/USER/Desktop/AI_School/product1.txt",header=TRUE,sep = ":")
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard 90000
3 A003      USB 50000

#불러들일 파일에 결측값을 '.'으로 표현한 경우, na.strings="."로 하지 않으면 그냥 .이 출력된다.
read.table(file="C:/Users/USER/Desktop/AI_School/product2.txt",header=TRUE,na.strings = ".")
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard    NA
3 A003      USB 50000

#*3)read.fwf() -고정 길이 형식, 고정 길이를 갖는 필드를 가진 파일 불러올 때 사용 
read.fwf(file="C:/Users/USER/Desktop/AI_School/product3.txt",widths = c(4,-1,10,8)) #width = c(4,-1,10,8)에서 -1은 결측값을 뜻한다. 그리고 나머지는 고정 길이 문자열의 길이를 뜻한다. 
#output
    V1         V2    V3
1 A002 Mouse      30000
2 A003 Keyboard   50000
3 A004 Usb        60000

#데이터를 읽어들일 때 열의 이름 지정 
read.fwf(file="C:/Users/USER/Desktop/AI_School/product3.txt",widths = c(4,-1,10,8),
         col.names=c("id", "name", "price"))   #col.names = c("id", "name", "price")를 보면 열의 이름을 지정해줄 수 있다.
#output
    id       name price
1 A002 Mouse      30000
2 A003 Keyboard   50000
3 A004 Usb        60000
#입력하고자 하는 데이터가 테이블이면, 위의 함수를 사용해서 읽어들이면 된다. 


#*4)readLines() - 라인 단위 읽기 
readLines(con="C:/Users/USER/Desktop/AI_School/won.dollar.txt")
#output
[1] "2014-12-01 1130.70 1078.30 2014-11-28 1127.89 1089.11"                           
[2] "2014-12-01 1130.13 1091.27 2014-12-.2 1130.13 1091.27 2014-12-03 1131.86 1092.94"
[3] "2014-12-04 1134.51 1095.49"                                                      
[4] "2014-12-05 1134.51 1095.49 2014-12-08 1139.60 1100.40"                           
[5] "2014-12-09 1134.51 1095.49 2014-12-10 1121.79 1083.21d" 

readLines(con="C:/Users/USER/Desktop/AI_School/won.dollar.txt",n=2) #n=2, 읽어들일 라인의 수 지정 
#output
[1] "2014-12-01 1130.70 1078.30 2014-11-28 1127.89 1089.11"                           
[2] "2014-12-01 1130.13 1091.27 2014-12-.2 1130.13 1091.27 2014-12-03 1131.86 1092.94"

#*5)scan() - 항목 단위 읽기
scan(file="C:/Users/USER/Desktop/AI_School/won.dollar.txt",what=character()) #what에는 데이터의 유형을 지정 가능. what인수에 지정된 패턴을 모든 데이터 항목에 대해서 반복적으로 적용한다.
#output
[1] "2014-12-01" "1130.70"    "1078.30"    "2014-11-28"
[5] "1127.89"    "1089.11"    "2014-12-01" "1130.13"   
[9] "1091.27"    "2014-12-01" "1130.13"    "1091.27"   
[13] "2014-12-03" "1131.86"    "1092.94"    "2014-12-04"
[17] "1134.51"    "1095.49"    "2014-12-05" "1134.51"   
[21] "1095.49"    "2014-12-08" "1139.60"    "1100.40"   
[25] "2014-12-09" "1134.51"    "1095.49"    "2014-12-10"
[29] "1121.79"    "1083.21"  

#what 인수에 list 형식으로 읽어들일 데이터의 유형을 지정할 수 있다.
scan(file="C:/Users/USER/Desktop/AI_School/won.dollar.txt",what=list(character(),numeric(),numeric())) 
#output
[[1]]
[1] "2014-12-01" "2014-11-28" "2014-12-01" "2014-12-01"
[5] "2014-12-03" "2014-12-04" "2014-12-05" "2014-12-08"
[9] "2014-12-09" "2014-12-10"

[[2]]
[1] 1130.70 1127.89 1130.13 1130.13 1131.86 1134.51 1134.51
[8] 1139.60 1134.51 1121.79

[[3]]
[1] 1078.30 1089.11 1091.27 1091.27 1092.94 1095.49 1095.49
[8] 1100.40 1095.49 1083.21

#읽어들일 데이터의 이름을 지정할 수 있다.
scan(file="C:/Users/USER/Desktop/AI_School/won.dollar.txt",what=list(date=character()
                                                                     ,buy=numeric()
                                                                     ,sell=numeric()))
#output
$date
[1] "2014-12-01" "2014-11-28" "2014-12-01" "2014-12-01"
[5] "2014-12-03" "2014-12-04" "2014-12-05" "2014-12-08"
[9] "2014-12-09" "2014-12-10"

$buy
[1] 1130.70 1127.89 1130.13 1130.13 1131.86 1134.51 1134.51
[8] 1139.60 1134.51 1121.79

$sell
[1] 1078.30 1089.11 1091.27 1091.27 1092.94 1095.49 1095.49
[8] 1100.40 1095.49 1083.21

#nline=x, nline인수에 x를 지정하면 데이터 파일 내에서 x만큼 라인의 수를 읽어 들어온다. 
scan(file="C:/Users/USER/Desktop/AI_School/won.dollar.txt",what=list(date=character()
                                                                     ,buy=numeric()
                                                                     ,sell=numeric()),nline=2)
#output
$date
[1] "2014-12-01" "2014-11-28" "2014-12-01" "2014-12-01"
[5] "2014-12-03"

$buy
[1] 1130.70 1127.89 1130.13 1130.13 1131.86

$sell
[1] 1078.30 1089.11 1091.27 1091.27 1092.94


#skip=x, skip인수에 x를 지정하면 데이터 파일 내에서 x라인까지 무시하고 x+1부터 라인을 읽어 들어온다.
scan(file="C:/Users/USER/Desktop/AI_School/won.dollar.txt",what=list(date=character()
                                                                     ,buy=numeric()
                                                                     ,sell=numeric()),skip=3)
#output
$date
[1] "2014-12-05" "2014-12-08" "2014-12-09" "2014-12-10"

$buy
[1] 1134.51 1139.60 1134.51 1121.79

$sell
[1] 1095.49 1100.40 1095.49 1083.21

#*6)read.xlsx() - 엑셀 형식 
install.packages("openxlsx")
library(openxlsx)
read.xlsx("C:/Users/USER/Desktop/AI_School/Product.xlsx",sheet=2)
#output
    id     name price
1 A001    Mouse 30000
2 A002 Keyboard 50000
3 A003      USB 90000

#R의 파일 읽기 함수에 파일이 위치한 URL을 인수로 지정하면 웹사이트에 링크된 파일을 읽어올 수 있다. 
