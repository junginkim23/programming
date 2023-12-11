#팩터 

#factor 함수: factor 데이터 구조를 만드는 함수 
review <- c("Good","Good","Indifferent","Bad","Good","Bad")
review.factor <-factor(review)
review.factor #output:Levels: Bad Good Indifferent

#str 함수: factor 데이터 구조 내부 확인 함수 
str(review.factor) #output:Factor w/ 3 levels "Bad","Good","Indifferent": 2 2 3 1 2 1
as.numeric(review.factor) #output:2 2 3 1 2 1

#factor 데이터 구조의 level 지정 
eventday <- c("Mon","Mon","Tue","Wed",
                 "Mon","Wed","Thu","Fri","Tue")
eventday.factor <-factor(eventday)
eventday.factor #output:Levels: Fri Mon Thu Tue Wed ->알파벳 순으로 레벨 순서가 지정된다. 
eventday.factor <-factor(eventday,levels = c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))
eventday.factor #output:Levels: Mon Tue Wed Thu Fri Sat Sun

#levels 함수: level의 값들만 보여주는 함수 
levels(review.factor) #output:"Bad"         "Good"        "Indifferent"
levels(review.factor) <- c("B","G","i")
levels(review.factor) #output:"B" "G" "i"

#nlevels 함수: level의 개수를 출력
nlevels(review.factor) #output:3 
#동일하게,
length(levels(review.factor)) #output:3

#ordered factor(서열 팩터): factor로 표현되는 데이터 구조의 level이 순서가 중요한 factor
#->부등호를 통해 레벨의 순서를 나타낸다. 
eval <- c("Medium","Low","High","Medium","High")
eval.factor <-factor(eval)
eval.factor
#*output:Medium Low    High   Medium High  
#*      :Levels: High Low Medium(알파벳 순서)

#위의 팩터를 서열 팩터로 만들기
eval.ordered <- factor(eval,levels = c("Low","Medium","High"),ordered = TRUE)
eval.ordered
#*output:Medium Low    High   Medium High  
#*      :Levels: Low < Medium < High

#ordered factor vs basic factor
#table 함수: 각 범주별 빈도를 보여주는 함수 
table(eval.factor)
#*output:High    Low Medium
#*      :2      1      2 
table(eval.ordered)
#*output:Low Medium   High 
#*      :1      2      2

#숫자 벡터를 팩터로 변환
sex <-c(2,1,2,2,1,0) #1-남자, 2-여자 
sex.factor <- factor(sex,levels = c(1,2),
       labels = c("Male","Female"))
sex.factor
#*output:Female Male   Female Female Male   <NA>  
#*      :Levels: Male Female

table(sex.factor)
#*output: Male Female 
#*      :    2      3 
























