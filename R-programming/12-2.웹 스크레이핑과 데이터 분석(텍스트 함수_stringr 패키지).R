#웹 스크레이핑과 데이터분석(텍스트함수_stringr 패키지)
#첫 번째 인수: 텍스트 벡터, 두 번째 인수: 문자열 패턴 모든 함수에서 동일

string <- c("data analytics is useful",
              "business analytics is helpful",
              "visualization of data is interesting for data scientists")
install.packages("stringr")
library(stringr)

#<<1)패턴검출>> -> str_detect() =base 패키지내의 grepl 함수의 결과와 동일 
str_detect(string=string,pattern = "data")
#output 
[1]  TRUE FALSE  TRUE
str_detect(string=string,pattern = "DATA")
#output -> 대,소문자를 구별하기에 DATA라는 패턴은 존재하지 않는다.
[1] FALSE FALSE FALSE
str_detect(string=string,fixed(pattern = "DATA",ignore_case = TRUE))
#output -> 대,소 문자를 구별하게 하기 위해서 fixed라는 함수를 사용하고, ignore_case=TRUE로 지정해주면 된다.
TRUE FALSE  TRUE

str_detect(c("abz","ayz","a.z"),"a.z")
#output:[1] TRUE TRUE TRUE -> "a.z와 일치하는 원소를 검출하기 원했다. 그럼 결과는 'FALSE FALSE TRUE' 가 나와야 하지만 결과는 예상과 달랐다.
#그 이유는 정규표현식 내에 메타문자로 '.'(임의의 문자 표현)을 인식했기 때문이다.

#위의 문제를 해결하기 위해서 fixed 함수를 사용하면, 'a.z'라는 값을 있는 그대로 인식하게 해준다.
str_detect(c("abz","ayz","a.z"),fixed("a.z")) #=str_detect(c("abz","ayz","a.z"),"a\\.z") , escape 문자를 써도 동일한 결과를 출력한다.
#output:[1] FALSE FALSE  TRUE

#<<2)패턴위치>> -> str_locate(), str_locate_all() =base 패키지내의 regexpr() & gregexpr()와 동일하다. 출력 결과는 조금 다르다. 
str_locate(string,"data")
#output -> 시작과 종료 위치 index를 출력한다.
     start end
[1,]     1   4
[2,]    NA  NA
[3,]    18  21
     
str_locate_all(string,"data") #-> 매칭되는 모든 문자의 시작과 종료 위치 제공   
#output 
[[1]]
start end
[1,]     1   4

[[2]]
start end

[[3]]
start end
[1,]    18  21
[2,]    42  45

#3)패턴추출 -> str_extract(), str_extract_all(),str_match(), str_match_all()
#매칭되는 문자열 추출, base 패키지 내의 regmatches()와 동일하다. 
str_extract(string,"data")   
#output:"data" NA     "data"
str_extract_all(string,"data")
[[1]]
[1] "data"

[[2]]
character(0)

[[3]]
[1] "data" "data"
str_extract_all(string,"data",simplify = TRUE) #출력 결과를 행렬 형식으로 얻고 싶은 경우, simplify=TRUE 인수를 지정해준다.
#output
       [,1]   [,2]  
[1,] "data" ""    
[2,] ""     ""    
[3,] "data" "data"

unlist(str_extract_all(string,"data")) #출력 결과를 리스트->벡터로 변환 
#output:[1] "data" "data" "data"

sentences5 <- sentences[1:5]
#매칭 결과와 그룹별 매칭 결과를 함께 제공, 패턴을 정규표현식으로 제공
str_extract(sentences5,"(a|A|the|The) (\\w+)")
#output -> sentences5의 각 원소에서 첫 번째로 matching 되는 결과가 나온다. 
[1] "The birch" "the sheet" "the depth" "a chicken"
[5] NA    

str_match(sentences5,"(a|A|the|The) (\\w+)") #정규표현식:(a|A|the|The) (\\w+) -> 관사 a/the가 나오고 공백 그리고 단어가 출현하는 패턴 의미    
#output ->1번째 열: 전체 매칭 결과, 2번째 열: 각 그룹별 매칭 결과, 3번째 열: 또 다른 그룹별 매칭 결과 
      [,1]        [,2]  [,3]      
[1,] "The birch" "The" "birch"  
[2,] "the sheet" "the" "sheet"  
[3,] "the depth" "the" "depth"  
[4,] "a chicken" "a"   "chicken"
[5,] NA          NA    NA    

str_match_all(sentences5,"(a|A|the|The) (\\w+)")
#output -> list 형태로 결과 출력
[[1]]
[,1]         [,2]  [,3]    
[1,] "The birch"  "The" "birch" 
[2,] "the smooth" "the" "smooth"

[[2]]
[,1]        [,2]  [,3]   
[1,] "the sheet" "the" "sheet"
[2,] "the dark"  "the" "dark" 

[[3]]
[,1]        [,2]  [,3]   
[1,] "the depth" "the" "depth"
[2,] "a well"    "a"   "well" 

[[4]]
[,1]        [,2] [,3]     
[1,] "a chicken" "a"  "chicken"
[2,] "a rare"    "a"  "rare"   

[[5]]
[,1] [,2] [,3]

unlist(str_match_all(sentences5,"(a|A|the|The) (\\w+)"))
#output -> list -> vector로 변환
[1] "The birch"  "the smooth" "The"        "the"       
[5] "birch"      "smooth"     "the sheet"  "the dark"  
[9] "the"        "the"        "sheet"      "dark"      
[13] "the depth"  "a well"     "the"        "a"         
[17] "depth"      "well"       "a chicken"  "a rare"    
[21] "a"          "a"          "chicken"    "rare"  

#4)패턴치환 -> str_replace(), str_replace_all()
str_replace(string=string,pattern = "data",replacement = "text") #base패키지 내의 sub()와 동일
#output
[1] "text analytics is useful"                                
[2] "business analytics is helpful"                           
[3] "visualization of text is interesting for data scientists"
str_replace_all(string=string,pattern = "data",replacement = "text") #base패키지 내의 gsub()와 동일
#output
[1] "text analytics is useful"                                
[2] "business analytics is helpful"                           

#5)패턴분할 -> str_split() 
str_split() #base패키지 내의 strsplit() 함수와 동일 
str_split(string," ")
#output
[[1]]
[1] "data"      "analytics" "is"        "useful"   

[[2]]
[1] "business"  "analytics" "is"        "helpful"  

[[3]]
[1] "visualization" "of"            "data"         
[4] "is"            "interesting"   "for"          
[7] "data"          "scientists"   

unlist(str_split(string," "))
#output -> list->vector로 변환
[1] "data"          "analytics"     "is"           
[4] "useful"        "business"      "analytics"    
[7] "is"            "helpful"       "visualization"
[10] "of"            "data"          "is"           
[13] "interesting"   "for"           "data"         
[16] "scientists"   

unique(unlist(str_split(string," ")))
#output -> 중복 제거 
[1] "data"          "analytics"     "is"           
[4] "useful"        "business"      "helpful"      
[7] "visualization" "of"            "interesting"  
[10] "for"           "scientists"   

#분할되는 문자열의 개수를 n이라는 인수를 사용하여 지정할 수 있다. 
str_split(string," ",n=3) #n=3, 분할 후의 문자열의 개수를 3개로 지정 
#output
[[1]]
[1] "data"      "analytics" "is useful"

[[2]]
[1] "business"   "analytics"  "is helpful"

[[3]]
[1] "visualization"                          
[2] "of"                                     
[3] "data is interesting for data scientists"

#복잡한 list -> matrix 형태로 변환
str_split(string," ",n=3,simplify = TRUE)
#output
       [,1]            [,2]       
[1,] "data"          "analytics"
[2,] "business"      "analytics"
[3,] "visualization" "of"       
       [,3]                                     
[1,] "is useful"                              
[2,] "is helpful"                             
[3,] "data is interesting for data scientists"

#stringr 패키지에는 텍스트 내의 문자의 개수 출력
str_length(string)
#output -> 공백을 포함하는 문자의 개수를 출력 
[1] 24 29 56

#특정 문자열이 몇 번 출력했는지를 출력
str_count(string,"data")
#output
[1] 1 0 2

str_count(string,"\\w+") -> 정규표현식("\\w+")을 사용해서 각 원소에 포함되어 있는 단어의 수 출력
#output
[1] 4 4 8

#주어진 문자열에 양쪽 끝에 공백이나 여타 다른 문자를 채워서 문자열을 크기를 모두 동일하게 맞춰준다.
str_pad(string=c("a","abc","abcde"),
        width = 6,
        side = "left", 
        pad=" ") 
#width: 최종적으로 가지게 될 text 길이 지정
#side: 채워넣을 문자를 어느 방향으로 넣을 것인지를 지정,left,right,both 존재
#pad: 채워넣을 문자를 지정해주는 인수
#output
"     a" "   abc" " abcde"

#예)str_pad 함수를 사용해서, 1월~12월을 나타내는데 1~9앞에 01~09로 표현되게 변경해라.
mon <- 1:12 
mon
str_pad(string=mon,width=2,side="left",pad="0")
#output
"01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"

#text의 양쪽 공백을 제거, str_pad 함수를 이용해서, string 내의 텍스트의 길이를 모두 도일하게 한다.(조건: string text내에서 가장 긴 길이에 맞춘다.)
#first step: str_pad 사용해서 동일한 길이로 맞추기
str_trim()
str.pad <- str_pad(string = string
                   ,width=max(str_length(string))
                   ,side="both"
                   ,pad=" ")
str.pad
#output
[1] "                data analytics is useful                "
[2] "             business analytics is helpful              "
[3] "visualization of data is interesting for data scientists"

#second step: str_trim 함수 이용 
str_trim(str.pad,side="both")
#output
[1] "data analytics is useful"                                
[2] "business analytics is helpful"                           
[3] "visualization of data is interesting for data scientists"

#text 결합 함수 -> base 패키지 내의 paste() 함수와 동일 
str_c("data","mining",sep=" ")
#output
"data mining"
str.mining <- str_c(c("data mining","text mining"), 
                    "is useful",sep=" ")
str.mining
#output -> 첫 번째 text내에는 2개의 원소, 두 번째 text에는 1개의 원소, 그래서 1개의 원소가 재사용 규칙이 적용되어 출력된다.
[1] "data mining is useful" "text mining is useful"

#결합으로 생성된 문자열 벡터의 원소를 모두 연결해서 하나의 단일 텍스트 벡터로 변환할 때 collapse 인수를 지정
str_c(str.mining,collapse = "; ")
#output
"data mining is useful; text mining is useful"

#collapse 예)
str_c(str.mining,collapse = "\n")
#output
"data mining is useful\ntext mining is useful"

#escape sequence 적용 결과 조회 -> cat 함수 사용 
cat(str_c(str.mining,collapse = "\n"))
#output
data mining is useful
text mining is useful

#문자열의 일부 추출 
str_sub(string = str.mining,start=1,end=4)
#output:"data" "text"

#문자열의 일부 추출 후 다른 문자로 대체
str_sub(string = str.mining,start=5,end=5) <- "-"
str.mining
#output
"data-mining is useful" "text-mining is useful"

str_sub("abcdefg",start=-2)
#output: "fg"

str_sub("abcdefg",end=-3) -> 끝나는 문자는 e 그래서 e까지 출력
#output: "abcde