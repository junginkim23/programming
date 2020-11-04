#출력

#print 함수 -> 내부의 데이터 형식에 맞는 함수를 불러서 출력해준다. 
#단점: print 함수 내에 하나의 객체만을 넣어서 출력해줄 수 있다. 
print(pi)
#output: 3.141593

print(matrix(c(1,2,3,4),ncol=2))
#output
      [,1] [,2]
[1,]    1    3
[2,]    2    4

print(list("Batman","Spiderman","Ironman"))   
#output
[[1]]
[1] "Batman"

[[2]]
[1] "Spiderman"

[[3]]
[1] "Ironman"

print("The square root of 3 is", sqrt(3), ".")
#output
Error in print.default("The square root of 3 is", sqrt(3), ".") : 
  'quote' 인자가 잘못되었습니다

#print함수의 위의 에러가 발생하면 아래처럼 cat함수를 사용하면 된다.
cat("The square root of 3 is", sqrt(3),".")
#output ->출력된 각각의 객체는 공백으로 구분된다.
The square root of 3 is 1.732051 .

cat("The square root of 3 is", sqrt(3),"\b.") #escape sequence를 함수내 인수로 줄 수 있다. 
#output
The square root of 3 is 1.732051.

cat("The square root of 3 is", sqrt(3),"\b.","\n") #"\n"을 Rstudio에서는 지정해줄 필요가 없지만, R console에서는 지정해줘야 한다. 커서가 다음라인으로 이동하지 않고 출력 뒤이어서 나오기 때문이다. 

name <-"Jenny"
cat("Hello", name, "\b.\n", "Isn\'t","\t","A LOVELY DAY")
#output
#Hello Jenny.
#Isn't 	 ALOVELY DAY

#cat 함수 
#장점: 여러 객체를 하나로 연결해서 출력 가능
#단점: print 함수와 달리, 행렬, 리스트, 데이터 프레임와 같은 복합 구조의 데이터는 출력 할 수 없다.
hero <- list("Batman","Spiderman","Ironman")
cat(hero)
#output
Error in cat(hero) : 
  타입 'list'인 인자 1는 'cat'에 의하여 다루어 질 수 없습니다

#행렬,리스트,데이터 프레임과 같은 복잡한 구조를 출력할 수 없기 때문에 벡터로 변환해서 출력한다.
cat(unlist(hero))
#output
Batman Spiderman Ironman

#R은 기본적으로 수치 데이터를 유효슛자 7개 출력한다.
print(pi,digits = 2 )#print 함수 내에 digits에 출력하고 싶은 숫자를 지정하면 그 값만큼 출력 가능
#output:3.1
print(pi*100,digits = 3 )
#output:314

#cat 함수에서는 유효숫자 지정이 되지 않는다. 그래서 format 함수를 사용한다.
cat(format(pi,digits=3),"\n") 
#output:3.14

pnorm(-3:3)
#output -> 표준 점수의 누적확률
[1] 0.001349898 0.022750132 0.158655254 0.500000000
[5] 0.841344746 0.977249868 0.998650102

#누적확률의 유효 자리수를 3자리로 일치 
print(pnorm(-3:3),digits = 3)
#output -> 벡터내 원소 중에서 가장 작은 수치를 지정된 유효 숫자에 따라 유효 수를 결정한다. 그리고 이에 맞춰서 나머지 수치가 정해진다. 
[1] 0.00135 0.02275 0.15866 0.50000 0.84134 0.97725 0.99865
 
#유효 자리수 지정은 테이블 형식의 수치 데이터를 자릿수에 맞춰 사용하고 싶을 때 유용하게 사용될 수 있따. 
z <- c(0,1.64,1.96,2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ptbl
     Z       Lower     Upper
1 0.00 0.500000000 0.5000000
2 1.64 0.050502583 0.9494974
3 1.96 0.024997895 0.9750021
4 2.58 0.004940016 0.9950600
print(ptbl,digits=3)
#output
    Z   Lower Upper
1 0.00 0.50000 0.500
2 1.64 0.05050 0.949
3 1.96 0.02500 0.975
4 2.58 0.00494 0.995

#cat함수는 print 함수처럼 화면에 출력할 수도 있지만, 파일에 저장할 수도 있다.
prime <- c(2,3,5,7,11,13,18,19)
cat(prime,file='prime.txt',sep="\t","\n") #sep: 데이터 항목간의 구분자 지정 
#tab키로 파일이 구분되어 있음을 알 수 있다.

#cat함수를 사용하여 파일을 생성하고 생성된 파일에 데이터를 추가 
id <- c("A001","A002","A003")
name <- c("Mouse","Keyboard","USB")
price <- c(30000,90000,50000)
cat(id, file='product-cat.txt',sep="\t","\n")
#output:A001	A002	A003	
cat(name, file='product-cat.txt',sep="\t",append=TRUE,"\n")
#output
A001	A002	A003	
Mouse	Keyboard	USB
cat(price, file='product-cat.txt',sep="\t",append=TRUE,"\n")
#output
A001	A002	A003	
Mouse	Keyboard	USB	
30000	90000	50000

#file함수를 이용하여 연결 객체를 생성하고 cat 함수의 file 인수에 지정해서 데이터를 추가할 수도 있다.
#1)file 연결 객체 생성
con <- file("product-cat2.txt",open="w")#open인수에 파일을 통해 하고자 하는 작업을 지정
#2)cat함수를 사용하여 생성된 파일에 데이터 삽입
cat(id,file=con,sep='\t','\n')
cat(name,file=con,sep='\t','n')
cat(price,file=con,sep='\t','n')
#연결 객체를 사용해서 데이터를 추가할 때는 append=TRUE를 사용할 필요가 없다. 
#3)파일과의 연결 종료
close(con)

#print() -> cat() 함수처럼 처리 결과를 파일로 직접 저장할 수 없다.
#하지만, sink 함수를 사용해서 처리 결과를 화면이 아닌 파일로 전달할 수 있다.

#<<<화면에 출력>>>
#readline함수를 사용해서 입력을 받는다. 그러면, fah 변수에 입력값이 들어간다.
fah <- readline("Fahrenheit? ") #입력 값은 문자 값의 형태로 저장되어 있다.
fah <- as.numeric(fah) #수치 데이터로 변경 
print(paste("Fahrenheit = ",fah)) #output: "Fahrenheit =  32"
cel <- (fah-32)/1.8 #화씨 -> 섭씨로 변환
print(paste("Celsius =",cel))#output: "Celsius = 0"

#<<<파일에 저장>>>
#위의 print함수로 화면에 출력된 결과들을 파일로 저장해보기 위해! sink함수를 이용해서 저장할 파일명 지정
sink("Fahrenheit-output.txt")
fah <- readline("Fahrenheit? ") #입력 값은 문자 값의 형태로 저장되어 있다.
fah <- as.numeric(fah) #수치 데이터로 변경 
print(paste("Fahrenheit = ",fah)) #output: "Fahrenheit =  32"
cel <- (fah-32)/1.8 #화씨 -> 섭씨로 변환
print(paste("Celsius =",cel))#output: "Celsius = 0"
sink() #sink함수 종료 

#R은 입력할 때와 마찬가지로 출력할 때도 csv 형식 지원
#csv는 가장 보편적으로 사용되는 파일 형식이기 때문에, R에서 처리하는 작업 결과를 CSV 형식으로 출력하면 다른 응용 프로그램에서 쉽게 이용 가능
#csv 파일 생성 -> Orange 데이터 셋을 csv 파일 형식으로 저장
head(Orange)
write.csv(x=Orange,file="orange.csv") #디렉토리에 csv 파일이 생성된 것을 확인할 수 있다. 기본적으로, 행 이름이 있다면 같이 저장해주고 없다면 일련번호를 행이름으로 저장해준다.
write.csv(x=Orange,file="orange.csv",row.names = FALSE) #row.names = FALSE로 인수를 지정해주면, 생성된 파일에 행 이름(OR 일련 번호)이 생성되지 않는다.
#write.csv는 데이터 항목을 ','로 구분한다. ','로 구분하기 싫을 때 write.table 함수를 사용하면 된다.
write.table(x=Orange,file="orange1.csv",sep=";",row.names = FALSE) #sep를 지정하지 않으면 공백으로 데이터 항목을 자동으로 구분한다.

#작업 중에 생성된 객체역시 파일로 저장하면 유용할 때가 있다. 후에 다시 사용하고 싶을 때 파일에 저장하는 방법 
#기존의 작업 공간 비우기
rm(list=ls()) #Global Environment에 있던 데이터들을 모두 삭제

#파일에 저장할 객체 생성
z <- c(0,1.64,1.96,2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ptbl 

#save -> 객체를 파일로 저장
save(ptbl, file="ptbl.RData")
rm(ptbl) #저장된 객체를 load 함수를 이용해서 메모리에 적재 확인을 위해 삭제

#load -> 파일에 저장된 객체를 메모리에 적재하기 위해 사용 
load("ptbl.RData")
ls() #메모리에 내재된 변수 확인 함수 
#output:"ptbl" "z"

#파일을 탐색하는 방법
list.files()
#output -> 현재 작업 디렉터리 내에 있는 파일 목록 출력 
[1] "Fahrenheit-output.txt" "hero.rda"             
[3] "orange.csv"            "orange1.csv"          
[5] "prime.txt"             "product-cat.txt"      
[7] "product-cat2.txt"      "ptbl.RData"           
[9] "두 번째 시간.R"     

#하위 디렉터리에 포함되어 있는 파일 목록 출력 -> recursive=TRUE 인수 지정 
list.files(recursive=TRUE)
#output
[1] "hero.rda"                  "orange.csv"               
[3] "orange1.csv"               "prime.txt"                
[5] "product-cat.txt"           "product-cat2.txt"         
[7] "ptbl.RData"                "wdw/Fahrenheit-output.txt"
[9] "두 번째 시간.R" 

#hidden 파일 확인을 위해 all.files=TRUE 인수 지정
list.files(all.files=TRUE)

#특정 패턴을 갖는 이름의 파일을 찾기 위해 pattern = "특정 패턴"
list.files(pattern="txt")
#output
[1] "prime.txt"        "product-cat.txt"  "product-cat2.txt"

#하위 디렉터리 목록 출력
list.dirs() 
#output -> 작업 디렉터리 내에 있는 또 다른 파일(디렉터리)을 출력
"."     "./wdw"

#특정 하위 디렉터리 내의 파일을 확인하기 위해 path = "디렉터리 이름"
list.files(path = "./wdw")
#output: "Fahrenheit-output.txt"

#파일 생성 함수 
file.create("temp.txt") #output:TRUE

#파일이 존재하는 확인하는 함수
file.exists("temp.txt") #output:TRUE -> 파일이 존재함을 의미

#파일 삭제 
file.remove("temp.txt") #output:TRUE
file.exists("temp.txt") #output:FALSE -> 삭제가 됐음을 확인인
