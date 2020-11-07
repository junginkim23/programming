#웹 스크레이핑과 데이터 분석 [텍스트 처리함수-base 패키지]

#*1)패턴검출 -> grep(), grepl() -> 특정 패턴이 존재하는지 여부를 알려주는 것을 말한다.
#*2)패턴위치 -> regexpr(), gregexpr() -> 문자열 내의 시작 위치, 종료 위치, 매칭된 패턴의 길이 
#*3)패턴추출 -> regmatches() -> 매칭된 패턴 추출  
#*4)패턴치환 -> sub(),gsub() -> 추출된 자리에 새로운 문자열 채워넣기 
#*5)패턴분할 -> strsplit() -> 매칭된 패턴을 구분자로써 분할 

string <- c("data analytics is useful",
            "business analycs is helpful",
            "visualization of data is interesting for data scientists")
#1)패턴검출 
#grep 함수
grep(pattern = "data",x=string)
#output: 1 3 -> 해당 패턴의 인덱스를 반환 
grep(pattern = "data",x=string,value = TRUE)
#output
[1] "data analytics is useful"                                
[2] "visualization of data is interesting for data scientists"
string[grep(pattern = "data",x=string)]
#output
[1] "data analytics is useful"                                
[2] "visualization of data is interesting for data scientists"

#역 매칭! : invert = TRUE 인수 지정
grep("useful|helpful",string,value=TRUE)
#output
[1] "data analytics is useful"   
[2] "business analycs is helpful"
grep("useful|helpful",string,value=TRUE,invert = TRUE)
#output
"visualization of data is interesting for data scientists"

#grepl 함수 -> pattern이 포함되어 있는 원소가 있다면 논리 값을 반환한다. 원소의 개수만큼 논리 값을 반환한다.    
grepl(pattern = "data",x=string) 
#output: TRUE FALSE  TRUE

#grepl 하수를 이용하여 텍스트 내에 패턴이 존재하는 원소의 개수를 반환 -> sum 함수 이용 
state.name #-> 미국의 50개 주 이름이 들어 있는 데이터 셋
grepl("new",x=state.name,ignore.case = TRUE) #ignore.case = TRUE -> 대,소문자 구분 X 
#output
[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[10] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[19] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[28] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
[37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[46] FALSE FALSE FALSE FALSE FALSE
state.name[grepl("new",x=state.name,ignore.case = TRUE)]
#output
[1] "New Hampshire" "New Jersey"    "New Mexico"   
[4] "New York" 
sum(grepl("new",x=state.name,ignore.case = TRUE))
#output: 4

#2)패턴위치
regexpr(pattern="data", text=string) #첫 번째 패턴 매칭의 시작 위치와 그 길이 제공
#output
[1]  1 -1(->매칭이 되지 않았음을 의미) 18 =>매칭의 시작 위치(인덱스) 
attr(,"match.length")
[1]  4 -1  4 =>매칭된 문자열의 길이 
attr(,"index.type")
[1] "chars"
attr(,"useBytes")
[1] TRUE

gregexpr(pattern="data", text=string) #-> 첫 번째 매칭된것뿐만 아니라 ,모든 매칭에 대해서 매칭 시작 위치와 길이를 반환 
#output
[[1]]
[1] 1 ->매칭의 시작 위치 
attr(,"match.length")
[1] 4 ->매칭된 데이터의 길이
attr(,"index.type")
[1] "chars"
attr(,"useBytes")
[1] TRUE

[[2]]
[1] -1 
attr(,"match.length")
[1] -1
attr(,"index.type")
[1] "chars"
attr(,"useBytes")
[1] TRUE

[[3]]
[1] 18 42 -> 매칭된 모든 시작 위치 
attr(,"match.length")
[1] 4 4 ->매칭된 모든 데이터의 길이 
attr(,"index.type")
[1] "chars"
attr(,"useBytes")
[1] TRUE

#3)패턴 추출
regmatches(x=string,m=regexpr(pattern="data",text=string)) #->regexpr or gregexpr들로부터 나온 매칭 정보를 이용해서 패턴 추출
#output
"data" "data"
regmatches(x=string,m=gregexpr(pattern="data",text=string))
#output
[[1]]
[1] "data"

[[2]]
character(0)

[[3]]
[1] "data" "data"

regmatches(x=string,m=gregexpr(pattern="data",text=string),invert = TRUE)
#output
[[1]]
[1] ""                     " analytics is useful"

[[2]]
[1] "business analycs is helpful"

[[3]]
[1] "visualization of "    " is interesting for "
[3] " scientists" 
#-> 매칭된 패턴의 문자열을 제외한 나머지 문자열을 제공해준다. invert=TRUE로 인해서!

#4)패턴치환
sub(pattern = "data",replacement = "text",x=string)
#output -> 첫 번째 매칭되는 데이터만 치환해준다.
[1] "text analytics is useful"                                
[2] "business analycs is helpful"                             
[3] "visualization of text is interesting for data scientists"
gsub(pattern = "data",replacement = "text",x=string)
#output -> 패턴 매칭되는 모든 데이터가 치환된다.
[1] "text analytics is useful"                                
[2] "business analycs is helpful"                             
[3] "visualization of text is interesting for text scientists"

#
5)패턴분할
strsplit(x=string,split = " ")
#output
[[1]]
[1] "data"      "analytics" "is"        "useful"   

[[2]]
[1] "business" "analycs"  "is"       "helpful" 

[[3]]
[1] "visualization" "of"            "data"         
[4] "is"            "interesting"   "for"          
[7] "data"          "scientists"   

unlist(strsplit(x=string,split = " "))
#output -> list의 결과를 vector로 전환. unlist 함수 사용 
[1] "data"          "analytics"     "is"           
[4] "useful"        "business"      "analycs"      
[7] "is"            "helpful"       "visualization"
[10] "of"            "data"          "is"           
[13] "interesting"   "for"           "data"         
[16] "scientists"   

unique(unlist(strsplit(x=string,split = " ")))
#output -> vector의 결과에서 중복되지 않은 결과만을 출력. unique함수 사용 
[1] "data"          "analytics"     "is"           
[4] "useful"        "business"      "analycs"      
[7] "helpful"       "visualization" "of"           
[10] "interesting"   "for"           "scientists"   

#unique 함수 list에 적용 결과 확인
string[1] <- "data analytics is useful useful"
unique(strsplit(x=string,split = " "))
#output -> 적용이 안되는 듯..하다다
[[1]]
[1] "data"      "analytics" "is"        "useful"   
[5] "useful"   

[[2]]
[1] "business" "analycs"  "is"       "helpful" 

[[3]]
[1] "visualization" "of"            "data"         
[4] "is"            "interesting"   "for"          
[7] "data"          "scientists"   