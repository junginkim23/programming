#텍스트 = 스트링
x <- "We have a dream"
#nchar 함수: 문자의 개수 추출(공백 포함)
nchar(x) #output: 15

#length 함수: 문자 벡터에 포함되어 있는 원소의 개수 
length(x) #output: 1

y <- c("we", "have", "a", "dream")
nchar(y) #output:2 4 1 5
length(y) #output: 4
nchar(y[4]) #output: 5

#sort 함수: 텍스트를 정렬
sort(letters,decreasing=TRUE)
#output -> 알파벳의 역순으로 출력(decreasing=TRUE)
"z" "y" "x" "w" "v" "u" "t" "s" "r" "q" "p" "o" "n" "m" "l" "k" "j" "i" "h" "g" "f" "e" "d" "c" "b" "a"

#tolower & toupper -> 모두 소문자로 변경 & 모두 대문자로 변경 
fox.says <- "It is only with the HEART that one can see Rightly"
tolower(fox.says) #output:"it is only with the heart that one can see rightly"
toupper(fox.says) #output:"IT IS ONLY WITH THE HEART THAT ONE CAN SEE RIGHTLY"

#strsplit -> 텍스트 분할(리스트 형식으로 출력) 
fox.said <- "what is essential is invisible to the eye"
strsplit(fox.said,split=" ")
#output -> 리스트 형식으로 출력
[[1]]
[1] "what"      "is"        "essential" "is"       
[5] "invisible" "to"        "the"       "eye" 
strsplit(fox.said,split="")
#output 
"w" "h" "a" "t" " " "i" "s" " " "e" "s" "s" "e" "n" "t"
"i" "a" "l" " " "i" "s" " " "i" "n" "v" "i" "s" "i" "b"
"l" "e" " " "t" "o" " " "t" "h" "e" " " "e" "y" "e"

#출력된 리스트 구조를 벡터 구조로 변환
unlist(strsplit(fox.said,split=" "))
#output -> 벡터 형식으로 변환 
[1] "what"      "is"        "essential" "is"       
[5] "invisible" "to"        "the"       "eye"  

fox.said.words <- unlist(strsplit(fox.said,split=" "))
fox.said.words[3] #output: "essential"
strsplit(fox.said,split=" ")[[1]][[3]] #output: "essential"
unlist(strsplit(fox.said,split=" "))[3] #output: "essential"

p1 <- "You come at four in the afternoon, then at three I Shall begin to be happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "what makes the desert beautiful is that somewhere it hides a well"
littleprice <- c(p1,p2,p3)
littleprice #-> 위의 3개의 벡터를 가지는 텍스트 벡터 
strsplit(littleprice," ")
#output
[[1]]
[1] "You"        "come"       "at"         "four"      
[5] "in"         "the"        "afternoon," "then"      
[9] "at"         "three"      "I"          "Shall"     
[13] "begin"      "to"         "be"         "happy"     

[[2]]
[1] "One"     "runs"    "the"     "risk"    "of"     
[6] "weeping" "a"       "little," "if"      "one"    
[11] "lets"    "himself" "be"      "tamed"  

[[3]]
[1] "what"      "makes"     "the"       "desert"   
[5] "beartiful" "is"        "that"      "somewhere"
[9] "it"        "hides"     "a"         "well"   

strsplit(littleprice,split=" ")[[3]][5]

#unique 함수: 추출한 텍스트로부터 중복되지 않은 단어만 추출. 대,소문자 구분한다.
fox.said <- "WHAT IS ESSENTIAL is invisible to the Eye"
fox.said.words <- strsplit(fox.said,split=" ")[[1]]
unique(fox.said.words)
#output -> "IS" or "is" 단어를 구분해서 중복으로 처리하지 않는다.
"WHAT"      "IS"        "ESSENTIAL" "is"       
"invisible" "to"        "the"       "Eye"  

#소문자로 만들어서, 중복된 is중 하나만 출력 
unique(tolower(fox.said.words))
#output
[1] "what"      "is"        "essential" "invisible"
[5] "to"        "the"       "eye" 

#paste -> 텍스트 결합 
paste("Everybody","wants","to","fly") #-> 4개의 텍스트 벡터를 인수로 제공 
#output: "Everybody wants to fly"

#주의할 점: 인수들이 올바른 형태로 제공되었는지 확인이 필요하다. 
paste(c("Everybody","wants","to","fly")) #-> 4개의 텍스트 벡터를 하나의 벡터로 만들어서 인수로 제공
#output: "Everybody" "wants"     "to"        "fly"  -> 1개의 텍스트 벡터가 인수로 주어졌기 때문에 합쳐진 형태로 출력되지 않는다. 

paste(fox.said.words)
#output -> 출력된 값이 하나의 벡터이기 때문에 합쳐지지 않은 형태로 나온다. 
[1] "WHAT"      "IS"        "ESSENTIAL" "is"       
[5] "invisible" "to"        "the"       "Eye"  

#sep 인수: 텍스트 결합할 때 다른 구분자를 이용해서 지정하고 싶을 때 사용, 하위 수준의 연결
paste("Everybody","wants","to","fly",sep = "-")
#output: "Everybody-wants-to-fly"
paste("Everybody","wants","to","fly",sep = "") #=paste0("Everybody","wants","to","fly")
#output: "Everybodywantstofly"

#paste함수 내에 주어진 인수들이 문자가 아닌 다른 형태여도 문자로 취급해서 하나의 텍스트로 결합시켜준다.
paste(pi,sqrt(pi)) #output: "3.14159265358979 1.77245385090552"
paste("25 dgrees Celsius is",25*.8 + 32, "degree Fahrenheit") #output: "25 dgrees Celsius is 52 degree Fahrenheit"

#변수들도 paste 함수를 이용해서 결합가능하다.
heroes <- c("Batman","Captain America","Hulk")
colors <- c("Black","Blue","Green")
paste(heroes,colors) 
#output
[1] "Batman Black"         "Captain America Blue"
[3] "Hulk Green"  

#한 쪽이 더 길면, 작은 쪽이 재사용 규칙 적용된다.
paste("Type",1:5)
#output: "Type 1" "Type 2" "Type 3" "Type 4" "Type 5"

paste(heroes, "wants","to","fly")
#output
[1] "Batman wants to fly"         
[2] "Captain America wants to fly"
[3] "Hulk wants to fly"   

#collapse 인수: 텍스트 결합을 통해 생성된 텍스트들을 다시 하나로 연결, 상위 수준의 연결 정의  
paste(c("Everybody","wants","to","fly"),collapse = " ")
#output: "Everybody wants to fly" ->하나의 벡터 내의 문자들 사이를 공백으로 연결해서 출력 

paste(heroes,"wants","to","fly",collapse = ", and ")
#output: "Batman wants to fly, andCaptain America wants to fly, andHulk wants to fly"

#(1)sep추가 
paste(heroes,"wants","to","fly",sep="-")
#output
[1] "Batman-wants-to-fly"         
[2] "Captain America-wants-to-fly"
[3] "Hulk-wants-to-fly" 

#(2)collapse 추가 
paste(heroes,"wants","to","fly",sep="-",collapse = ";")
#output: "Batman-wants-to-fly;Captain America-wants-to-fly;Hulk-wants-to-fly"

paste(month.abb,1:12)
#output
[1] "Jan 1"  "Feb 2"  "Mar 3"  "Apr 4"  "May 5"  "Jun 6" 
[7] "Jul 7"  "Aug 8"  "Sep 9"  "Oct 10" "Nov 11" "Dec 12"

paste(month.abb,1:12,sep="_")
#output
[1] "Jan_1"  "Feb_2"  "Mar_3"  "Apr_4"  "May_5"  "Jun_6" 
[7] "Jul_7"  "Aug_8"  "Sep_9"  "Oct_10" "Nov_11" "Dec_12"

paste(month.abb,1:12,sep="_",collapse = "-")
#output: "Jan_1-Feb_2-Mar_3-Apr_4-May_5-Jun_6-Jul_7-Aug_8-Sep_9-Oct_10-Nov_11-Dec_12"

#outer 함수: 두 개의 텍스트 집합으로부터 가능한 모든 쌍을 구할 수 있다.
outer(c(1,2,3),c(1,2,3))
#output
      [,1] [,2] [,3]
[1,]    1    2    3
[2,]    2    4    6
[3,]    3    6    9

#outer 함수 ->인수 FUN에 텍스트에 적용하고 싶은 함수 지정 
asian.countries <- c("Korea","Japan","China")
info <- c("GDP","Population","Area")
outer(asian.countries,info,FUN = paste,sep="-")
#output -> 행렬로 출력
             [,1]        [,2]               [,3]        
[1,] "Korea-GDP" "Korea-Population" "Korea-Area"
[2,] "Japan-GDP" "Japan-Population" "Japan-Area"
[3,] "China-GDP" "China-Population" "China-Area"

#outer 함수의 출력 결과(행렬->벡터 변환)
out <- outer(asian.countries,info,FUN = paste,sep="-")
as.vector(out)
#output
[1] "Korea-GDP"        "Japan-GDP"        "China-GDP"       
[4] "Korea-Population" "Japan-Population" "China-Population"
[7] "Korea-Area"       "Japan-Area"       "China-Area"  

outer(asian.countries,asian.countries,FUN= paste,sep="-")
#output
              [,1]          [,2]          [,3]         
[1,] "Korea-Korea" "Korea-Japan" "Korea-China"
[2,] "Japan-Korea" "Japan-Japan" "Japan-China"
[3,] "China-Korea" "China-Japan" "China-China"

x <- outer(asian.countries,asian.countries,FUN= paste,sep="-")
x
x[!lower.tri(x)] #모든 가능한 조합을 중복되지 않게 구하기
#output
[1] "Korea-Korea" "Korea-Japan" "Japan-Japan" "Korea-China"
[5] "Japan-China" "China-China"

#sprinf 함수: 아래와 같은 번거로움을 해결해주는 함수 
customer <- "Jobs"
buysize <- 10
deliveryday <- 3
paste("Hello ",customer,", your order of", buysize," product(s) will be dilivered within ", deliveryday
      ," day(s).",sep="")
#output
"Hello Jobs, your order of10 product(s) will be dilivered within 3 day(s)."

sprintf("Hello %s your order of %s product(s) will be dilivered within  %s day(s).",customer,buysize,deliveryday,sep="")
#output: "Hello Jobs your order of 10 product(s) will be dilivered within  3 day(s)."

customer <- c("Jobs","Gates","Bezos")
buysize <- c(10,7,12)
deliveryday <- c(3,2,7.5)

sprintf("Hello %s your order of %s product(s) will be dilivered within  %s day(s).",customer,buysize,deliveryday,sep="")
#output 
[1] "Hello Jobs your order of 10 product(s) will be dilivered within  3 day(s)."   
[2] "Hello Gates your order of 7 product(s) will be dilivered within  2 day(s)."   
[3] "Hello Bezos your order of 12 product(s) will be dilivered within  7.5 day(s)."

sprintf("Hello %s your order of %s product(s) will be dilivered within  %.1f day(s).",customer,buysize,deliveryday,sep="")
#output
[1] "Hello Jobs your order of 10 product(s) will be dilivered within  3.0 day(s)." 
[2] "Hello Gates your order of 7 product(s) will be dilivered within  2.0 day(s)." 
[3] "Hello Bezos your order of 12 product(s) will be dilivered within  7.5 day(s)."

#텍스트로부터 특정 위치에 있는 문자열을 추출
substr("Data Analytics",start=1,stop=4)
#output: "Data"
substr("Data Analytics",start=6,stop=14)
#output: "Analytics"
substring("Data Analytics", 6) #substr 확장 함수 
#output: "Analytics" -> 시작하는 부분만 정해지면, 그 시작점부터 끝까지 쭈욱 출력한다.

class <- c("Data Analytics","Data Mining","Data Visualization")
substr(class,1,4)
#output: "Data" "Data" "Data" -> class vector 내의 각 원소의 1~4자리에 해당하는 값 출력 

countries <- c("Korea, KR","Unites states, US", "china, CN")
substr(countries, nchar(countries)-1,nchar(countries))
#output: "KR" "US" "CN"

#특정 문자열을 포함하고 있는 텍스트 찾기 -> grep 함수 사용
#예1)
islands
landmasses <- names(islands)
landmasses #섬이름이 들어가 있다.
  
grep(pattern = "New",x=landmasses)
#output:30 31 32 33 34 -> New라는 문자열을 포함하고 있는 텍스트의 위치 추출

#해당 인덱스의 값 추출  
index <- grep(pattern = "New",x=landmasses)
landmasses[index] #or grep(pattern = "New", x = landmasses,value=TRUE)
#output
[1] "New Britain"     "New Guinea"      "New Zealand (N)"
[4] "New Zealand (S)" "Newfoundland" 

#예2)두 개의 문자열로 이루어진 텍스트 추출  
grep(pattern=" ",x=landmasses,value=TRUE) #or landmasses[grep=" ",landmasses]
#output
[1] "Axel Heiberg"     "New Britain"      "New Guinea"      
[4] "New Zealand (N)"  "New Zealand (S)"  "North America"   
[7] "Novaya Zemlya"    "Prince of Wales"  "South America"   
[10] "Tierra del Fuego"

#sub or gsub 함수: 특정 문자열을 찾아서 다른 문자열로 변환할 때 사용
#sub: 일치하는 처음 함수만 변환
txt <- "Data Analytics is useful, Data Analytics is also interesting"
sub(pattern = "Data", replacement = "Business", x=txt)
#output
"Business Analytics is useful, Data Analytics is also interesting"

#gsub: 일치하는 모든 함수를 변환 
gsub(pattern = "Data", replacement = "Business", x=txt)
#output
"Business Analytics is useful, Business Analytics is also interesting"

x <- c("product.csv","customer.csv","supplier.csv")
gsub(pattern = ".csv",replacement = "",x)
#output: "product"  "customer" "supplier"

#정규표현식(Regular expression)->다양한 텍스트 패턴을 지정 가능, 다양한 텍스트 패턴을 변형하거나 일치하는 것 탐색 or 대체 가능 
정규표현식은 특정한 규칙을 갖는 문자열 패턴을 표현하는 방법
ex)ABC,ABBA,ACE -> 'A로 시작하는 문자열' ->이러한 규칙을 정의하는 것을 정규표현식이라고 한다.

정규표현식은 연속된 문자열로 정의
->알파벳 문자 및 숫자와 특수 문자의 조합으로 구성

메타문자
->정규표현식에 사용되는 특수 문자 
ex). \ | () [] {} ^ $ * + ?
  
#정규표현식 사용 -> 정규표현식에 적용하면 오른쪽에 설명을 찾아서 작업을 시작한다.
<문자 클래스> 
[:digit:] -> 숫자:0 1 2 3 4 5 6 7 8 9 [0-9]
[:lower:] -> 알파벳 소문자: [a-z]
[:upper:] -> 알파벳 대문자: [A-Z]
[:alpha:] -> 알파벳 문자: [[:lower:][:upper:]] or [A-Z]
[:alnum:] -> 알파벳 문자 + 숫자: [[:alpha:][:digit:]] or [A-Z0-9]
[:punct:] -> 문장부호: ! # $ % & ' ( ) * + . - 등등
[:blank:] -> 블랭크 문자: 스페이스(space), 탭(tab)
[:space:] -> 스페이스 문자: 스페이스(space), 탭(tab), 새라인(newline), 폼피드(form feed), 캐리지리턴(carriage return)
[:print:] -> 프린트 가능 문자: [[:alnum:][:punct:][:space:]]
[:graph:] -> 그래프 문자(사람이 읽을 수 있는 문자): [[:alnum:][:punct:]]

#수량자->문자의 반복되는 패턴 적용 가능 
1)?: 앞 문자는 없거나(0회)또는 1회 출현함(최대 1회)
2)*: 앞 문자는 0회 이상 반복됨(최소 0회)
3)+: 앞 문자는 1회 이상 반복됨(최소 1회)
4){n}: 앞 문자는 정확히 n회 반복됨
5){n,}:  앞 문자는 n회 이상 반복됨
6){n,m}: 앞 문자는 n회 이상, m회 이하 반복됨(n~m회)

#정규표현식 살펴보기 
words <- c("at","bat","cat","chaenomeles","chase","chasse"
           ,"cheap","check","cheese","chick","hat")
#기본적으로 모든 문자열은 그 자체로 정규표현식이 된다.
grep("che", words, value=TRUE)
#output: "cheap"  "check"  "cheese"
grep("at",words,value=TRUE)
#output: "at"  "bat" "cat" "hat"

#[]내에 문자열을 쓰면, []내에 있는 문자가 하나라도 들어 있는 문자열을 출력한다.
grep("[at]",words,value=TRUE) 
#output
[1] "at"          "bat"         "cat"         "chaenomeles"
[5] "chase"       "cheap"       "hat"  

#|사용 -> "a|b", a or b가 들어있는 문자열을 출력 
grep("at|ch",words,value=TRUE)
#output
[1] "at"          "bat"         "cat"         "chaenomeles"
[5] "chase"       "cheap"       "check"       "cheese"     
[9] "chick"       "hat" 

#()사용 -> 어떤 패턴을 그룹할 때 사용
grep("ch(e|i)ck",words,value=TRUE)
#output: "check" "chick"

#수량자 사용 
grep("chas?e",words,value=TRUE) #s=> 앞에 있는 문자가 0 or 1회 나타나는 패턴을 갖고 있는 문자열 찾기
#output: "chaenomeles" "chase"

grep("chas*e",words,value=TRUE) #*=> 앞에 문자가 0 or 1회 이상 나타나는 패턴을 갖고 있는 문자열 찾기
#output: "chaenomeles" "chase"       "chasse"   

grep("chas+e",words,value=TRUE) #+=> 앞에 문자가 1회 이상 나타나는 패턴을 갖고 있는 문자열 추출 
#output: "chase"  "chasse"

#()그릅화 + 수량화 동시 사용
grep("ch(a*|e*)se",words,value=TRUE)
#output: "chase"  "cheese"

#메타 문자 ^(문자열 시작), $(문자열 끝)
grep("^c",words,value=TRUE)
#output
[1] "cat"         "chaenomeles" "chase"       "chasse"     
[5] "cheap"       "check"       "cheese"      "chick" 

grep("t$",words,value=TRUE)
#output
[1] "at"  "bat" "cat" "hat"

#'.' -> 임의의 문자, 아무 문자나 매칭 가능 
grep("^c.*t$",words,value=TRUE)
#output: "cat"

grep("^[hc]?at",words,value=TRUE)
#output: "at"  "cat" "hat"

words <- c("12 Dec","OK","http://","<TITLE>Time?</TITLE>","12345","Hi there")
grep("[[:alnum:]]",words,value=TRUE) 
#output -> 알파벳 or 숫자 조합 출력
[1] "12 Dec"               "OK"                  
[3] "http://"              "<TITLE>Time?</TITLE>"
[5] "12345"                "Hi there" 

grep("[[:alpha:]]",words,value=TRUE)
#output -> 문자 조합 출력
[1] "12 Dec"               "OK"                  
[3] "http://"              "<TITLE>Time?</TITLE>"
[5] "Hi there"    

grep("[[:digit:]]",words,value=TRUE)
#output -> 숫자 조합 출력
"12 Dec" "12345" 

grep("[[:punct:]]",words,value=TRUE)
#output -> 문장 부호가 포함되어 있는 조합 출력
"http://"              "<TITLE>Time?</TITLE>"

grep("[[:space:]]",words,value=TRUE)
#output -> 공백이 포함되어 있는 조합 출력
"12 Dec"   "Hi there"

grep("[[:space:]]",words,value=TRUE)

grep("\\w+",words,value=TRUE) #\->escape code(특별한 코드로 사용) 그래서 '\w'이렇게 사용하고 싶으면 '\\w' 이런식으로 사용해야 한다.
#output
[1] "12 Dec"               "OK"                  
[3] "http://"              "<TITLE>Time?</TITLE>"
[5] "12345"                "Hi there"    

grep("\\d+",words,value=TRUE)
#output
"12 Dec" "12345"

grep("\\s+",words,value=TRUE)
output
"12 Dec"   "Hi there"

#정규표현식이 R에서 어떻게 사용되는지 확인하기 위한 방법 
?regex


? + / -> 이런게 다 정규표현식인가봄. 