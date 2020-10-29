library()
Sys.setlocale("LC_ALL","English")
library()
Sys.setlocale()
library()

installed.packages()
#행에는 설치된 이름, 열에는 해당 패키지들의 추가 정보

colnames(installed.packages())
installed.packages()[,c("Package","Version")]

search()#어떠한 패키지들이 지금 당장 사용할 수 있는지 확인할 수 있는 명령어, 지금 메모리에 적재된 메모리의 리스트
#.GlobalEnv: 패키지는 아니고, 사용자가 생성한 변수나 함수가 저장된 작업공간을 의미한다. 

#search() 함수가 반환하는 패키지의 문자열 벡터를 탐색 경로라고 한다. 
#탐색 경로라고 하는 이유는 함수를 탐색할 때 search함수에서 반환딘 순서에 따라서 탐색을 하기 때문이다. 있으면 실행하고 없으면 실행하지 않는다. 

library()

m <-matrix(1:6,3,2)#1~6까지의 숫자를 이용해서 행이 3개이고 열이 3개인 행렬을 만들어보자. 

t(m) #base 패키지 내에 있는 t라는 함수는 전치 행렬을 만드는 함수, 행->열, 열->행으로 바꾼다. 
#매개변수는 행렬을 갖는다. 

t <- function(x) x+100 
t(m)
 
#Global Environment: 작업 환경 

base::t(m)#내가 만든 함수 t가 아닌 전치행렬을 만들어주는 base 패키지 내의 함수 t를 사용하고 싶을 때
#저렇게 패키지명을 쓰고 ::뒤에 t()라는 함수를 사용하면 전치행렬을 사용할 수 있다. 

#설치된 패키지를 사용하기 위해서는 먼저 사용하려는 패키지를 라이브러리에적재해야 한다. 
xyplot(dist ~ speed, data=cars)#산점도 출력 함수 

#lattice패키지 라이브러리에 적재
library(lattice)
search()

#라이브러리에서 패키지를 제거하고 싶을 때 사용하는 함수
detach(package:lattice)
#탐색 경로를 살펴보는 함수 
search()

#새로운 패키지를 설치하기 위해 사용하는 명령어
install.packages("ggplot2")#ggplot2: 고급 그래픽을 생성할 때 많이 사용하는 패키지지
#설치된 패키지의 경로 확인 명령어
.libPaths()

"C:/Program Files/R/R-4.0.3/library"#표준 패키지 설치 경로
"C:/Users/USER/Documents/R/win-library/4.0"#추가로 패키지를 설치할 때 저장되는 곳 

#패키지의 자세한 사용방법, 포함된 데이터 셋, 함수를 알기 위해 help or library함수를 사용하면 된다. 
help(package="ggplot2")
library(help=ggplot2)
#일단 라이브러리에 적재 후에 ls함수를 사용해서 패키지 내의 함수를 알아보는 방법도 있다.
library(ggplot2)
ls("package:ggplot2")#함수리스트를 볼 수 있다. 
search()

#datasets()내에 어떤게 들어있는지 확인
data()
#Airpassengers라는 데이터셋이 어떤지 보고 싶을 때 사용하는 함수
head(AirPassengers)
head(cars)#처음부터 총 6개의 데이터를 보여준다.
tail(cars)#마지막부터 총 6개의 데이터를 보여준다.
head(cars, 10)#저렇게 숫자를 줘서 숫자 수 만큼 데이터를 확인하 수 있다. 
help(cars)#cars라는 데이터셋이 어떻게 되어 있고 사용하는 example 무엇이고, 형식은 어떻게 되어 있는지 알 수 있다. 

data(package="MASS")#내가 쓰고자 하는 패키지 안에 어떤 데이터셋이 들어 있는지 확인하게 해준다. 
#어떤 특정 패키지내에 있는 데이터 셋을 이용하기 위해서 data함수내에 첫 번째 인수로 내가 보고자 하는 데이터 셋의 이름을 주고, 그 데이터가 폼하되어 있는 패키지 이름을두 번째 인자로 제공
data(Animals,package="MASS")
head(Animals)
head(UScrime)
save.image()
q()
y
load("hero.rda")
here
rm(here)
load("hero.rda")
