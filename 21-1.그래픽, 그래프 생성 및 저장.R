#그래픽- 그래프 생성 및 저장 
plot() #generic function으로서 인수로 주어지는 데이터에 가장 적합한 형태의 그래프를 자동으로 생성

str(cars)
#output
'data.frame':	50 obs. of  2 variables:
 $ speed: num  4 4 7 7 8 9 10 10 10 11 ... #자동차의 속도
 $ dist : num  2 10 4 22 16 10 18 26 34 17 ... #해당 속도에서의 자동차의 제동거리 
#제동거리: 주행 중인 자동차가 브레이크가 작동하기 시작할 때부터 완전히 정지할 때까지 진행한 거리 

plot(cars$speed,cars$dist)
plot(cars) #if)데이터 프레임의 두 개의 변수로 이루어져 있다면, plot(Cars)해주면 df의 첫 번째 변수를 x축, 두 번째 변수를 y축으로 지정한다.

#x축에 배치되는 x의 vector가 집단을 나타내는 factor 형식이면 plot함수는 집단별 상대 도표를 제공해준다. 
str(ToothGrowth)
#output -> 기니피그의 이빨 길이와 vitamin c 보충제 이용 관계를 실험한 데이터 셋
'data.frame':	60 obs. of  3 variables:
$ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
$ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
$ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...
plot(ToothGrowth$supp,ToothGrowth$len) #상대 도표가 제공된다.

#변수가 2개 이상인 데이터 프레임을 plot 함수에 넣어주면 산점도 행렬이 만들어진다.
plot(iris[,1:4])

#시계열 데이터가 인수로 주어지면 plot함수는 관측값이 선으로 연결된 시계열 도포를 생성한다.
str(nhtemp)
plot(nhtemp)

#plot 함수는 테이블 형식의 데이터가 주어지면 모자이크 도표를 생성한다. 
str(UCBAdmissions) #버클리 대학의 입학 관련 데이터  
plot(UCBAdmissions) #output -> 성별, 합격 불합격, 6개의 학과별로 빈도수에 따라서 모자이크 조각의 크기가 표현된 모자이크 도표가 생성된다.

#모델 객체로 plot 함수의 인수로 사용할 수 있다.
#ex)선형 회귀 모델을 인수로 주게 되면 선형 회귀 모델에 대한 진단 도표를 출력한다.
str(faithful)
faithful.lm <- lm(waiting~eruptions,data=faithful)
class(faithful.lm) #class()함수를 사용해서 데이터의 구조를 확인할 수 있다.
plot(faithful.lm)

#그래프를 저장하는 방법
plot(faithful)
#1)그래프가 출력되는 오른쪽 레이아웃에서 export를 클릭하면 'save as iamge' or 'save as PDF' 형식으로 저장할 수 있다. 
#2)저장 후 확인
list.files(pattern="myplot.jpeg")
#output:"myplot.jpeg" -> 저장되어 있는 것을 확인할 수 있다.
#3)저장되어 있는 그래프 불러오기 - pander 패키지 사용 
install.packages("pander")
library(pander)
openFileInOS("myplot.jpeg") #R환경에서 파일을 읽어서 처리할 수 있다.

#만약 별도의 윈도우창을 생성해서 그래프를 생성했다면?
windows(width=12,height=8) #별도의 윈도우창 생성
plot(faithful) #별도의 윈도우창에 그래프 출력
savePlot(filename = "myplot",type="pdf") #그래프 저장 , type에 여러 가지의 저장 형식을 지정 가능
list.files(pattern = "myplot.pdf")  #myplot.pdf로 생성되어 있는지 확인
openFileInOS("myplot.pdf") #저장한 그래프가 잘 저장되어 있는지 확인 

?png
그래프 파일 오픈 함수를 이용해서 그래프를 파일로 생성할 수 있다.

png("myplot.png",width=648,height=432) 
plot(faithful)
dev.off()
list.files(pattern = "myplot.png")  
openFileInOS("myplot.png")

#png함수를 이용해서 png 형태의 파일을 생성하고 plot함수를 사용하여 그래프를 생성하고 png 형태의 파일에 저장한다. 그리고 dev.off()함수를 사용해서 파일을 닫는다.
png("myplot11.png",width=648,height=432)
png(units = "px") #units 인수에 px라고 저장해두었기에 그래프의 크기를 나타내는 weight와 height는 pixel 단위로 지정해줘야 한다.
plot(faithful)
dev.off() #파일을 닫는다. -> 그래프가 png함수에 지정된 형식대로 파일이 생성된다.
list.files(pattern = "myplot11.png")  
openFileInOS("myplot11.png")
