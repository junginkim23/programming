#함수

transLength <- function(x) { 
  tlength <- round(x*0.9144, digits=1) #소수점 첫 째자리로 반올림한다.
  result <- paste(tlength, "m", sep="") 
  return(result)
}

ls() #output:"ptbl"        "transLength" "z" -> 작업 공간에 저장된 것을 확인할 수 있다.

y <- c(100, 150, 200)
transLength(y)
#output:"91.4m"  "137.2m" "182.9m"

#R에서는 함수도 객체이기 때문에 다른 객체처럼 동일하게 취급된다.
trans <- transLength 
#trans <- transLength() 이처럼, ()를 함수 뒤에 넣으면 안된다. 그러면 호출된 함수의 return 값이 변수 trans2에 들어가게 되서 의도한 바와 다르게 된다. 
trans(y)
#output: "91.4m"  "137.2m" "182.9m"

#return() 삭제하고 결과 확인
transLength <- function(x) { 
  tlength <- round(x*0.9144, digits=1) #소수점 첫 째자리로 반올림한다.
  result <- paste(tlength, "m", sep="") 
}

transLength(y) #output: 아무것도 보이지 않음을 알 수 있다.
print(transLength(y)) 
#output -> R은 함수의 결과 값으로 마지막 명령어의 실행 결과를 반환한다. 하지만, 화면에 출력 결과가 반환되지 않은 이유는 함수의 마지막 줄이 값을 할당하는 것으로 끝났기 때문이다. 
"91.4m"  "137.2m" "182.9m"

transLength <- function(x) { 
  tlength <- round(x*0.9144, digits=1) #소수점 첫 째자리로 반올림한다.
  paste(tlength, "m", sep="") 
}

transLength(y)
#output: "91.4m"  "137.2m" "182.9m"


#함수의 인수로 숫자가 아닌 문자가 들어 왔을 때, return 명령어로 함수를 종료할 수 있다. 
#그 때, return 명령어를 사용할 수 있다. 
transLength <- function(x) { 
  if((!is.numeric((x)))) return("Not a Number") #is.numeric(x) -> x가 숫자이면 TRUE, 숫자가 아니면 FALSE 반환
  tlength <- round(x*0.9144, digits=1) #소수점 첫 째자리로 반올림한다.
  paste(tlength, "m", sep="") 
}

transLength("ABC")
#output: "Not a Number"

#하나의 표현식으로 함수가 표현되면 {}가 필요없다.
f1 <- function(x,y) {x+y}  
f2 <- function(x,y) x+y
f1(1,3) #output:4 
f2(1,3) #output:4

#중괄호 없이 transLength 함수 생성 
transLength <- function(x) paste(round(x*0.9144,digits=1),"m",sep="")
transLength(y)
#output:"91.4m"  "137.2m" "182.9m"

#중괄호 없이 생성할 때 불편한 점: 가독성이 떨어질 수 있다. 
#중괄호를 사용하고, 함수의 parameter를 더 주었다. 
transLength <- function(x,mult,unit) { 
  tlength <- round(x*mult, digits=1) #소수점 첫 째자리로 반올림한다.
  paste(tlength, unit, sep="") 
}

transLength(y,mult=3,unit="ft")
#output:"300ft" "450ft" "600ft"

transLength(y,mult=3,unit="in")
#output:"300in" "450in" "600in"

transLength(y)
#output
Error in transLength(y) : 기본값이 없는 인수 "mult"가 누락되어 있습니다

#함수의 parameter에 초깃값을 주었다. 
transLength <- function(x,mult=0.9144,unit="m") { 
  tlength <- round(x*mult, digits=1) #소수점 첫 째자리로 반올림한다.
  paste(tlength, unit, sep="") 
}

transLength(y)
#output:[1] "91.4m"  "137.2m" "182.9m"

#인수의 초깃값이 지정되있더라도 함수를 실행할 때 다른 값을 넣을 수 있다. 
transLength(y,mult=3,unit="ft") #=transLength(y,3,"ft")
#output:"300ft" "450ft" "600ft"

#함수(a)를 생성할 때, 함수 내부의 함수에 인수를 모두 지정하게 되면 함수(a)는 너무 많은 인수 리스트를 갖게 된다. 
#이럴 때 내부 함수에 사용될 인수를 총칭해서 '...'으로 설정해서 부담을 줄여줄 수 있다. 
transLength <- function(x,mult=0.9144,unit="m", ...) { 
  tlength <- round(x*mult, ...) #소수점 첫 째자리로 반올림한다.
  paste(tlength, unit, sep="") 
}

transLength(y,digits=2)
#output
"91.44m"  "137.16m" "182.88m"
transLength(y) #digits인수를 지정해주지 않고 출력하게 되면, 현재는 digits=0으로 되어 있으니깐 출력이 정수값이 나온다.

#내부 함수의 digits에 새로운 초깃값을 지정하고 싶다면,
transLength <- function(x,mult=0.9144,unit="m", digits=1) { 
  tlength <- round(x*mult, digits) #=tlength <- round(x*mult, digits=digits)
  paste(tlength, unit, sep="") 
}

transLength(y)
#output
"91.4m"  "137.2m" "182.9m"

#R에서는 함수 자체를 인수 취급할 수 있다. -> 아래에는 round라는 함수를 인수로 지정해주었다. 
transLength <- function(x,mult=0.9144,unit="m", FUN=round,...) { 
  tlength <- FUN(x*mult, ...) #=tlength <- round(x*mult, digits=digits)
  paste(tlength, unit, sep="") 
}

transLength(y,FUN=signif,digits=3) #signif함수:반올림 함수 
#output:"91.4m" "137m"  "183m"

transLength(y,FUN=floor)
#output:"91m"  "137m" "182m"

transLength(y)
#output; "91m"  "137m" "183m"

ls()

x<- 11:15
scopetest <- function(x) {
  cat("This is x:", x,"\n")
  rm(x)
  cat("This is x after removing x",x,"\n")
}

scopetest(x=15:11)
#output
This is x: 15 14 13 12 11  #local 환경(함수 내의 환경)에서 생성된 객체
This is x after removing x 11 12 13 14 15 #함수내에서 x를 찾아볼 수 없다.(rm함수의 사용 때문에),그래서 global 환경에서 생성된 객체를 출력한다.



























