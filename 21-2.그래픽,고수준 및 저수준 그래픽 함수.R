#그래픽 - 개요 
#graphics 패키지의 베이스 그래픽(base graphics)

#1)고수준 그래픽 함수(high-level graphics function)
#*완전한 하나의 그래프를 생성 
#*그래프 창을 초기화하고, 축 눈금을 설정하고, 그래프 요소(e.g.,제목, 축 이름)를 추가하고, 그 밖에 다양한 요소들을 결합하여 
#*최종적으로 하나의 완성된 그래프를 생성 
#*ex)
#*plot():제너릭 그래프 생성(generic plotting) -> 인수로 주어지는 데이터 모델이나 유형에 따라서 그에 적합한 그래프를 자동으로 생성
#*boxplot():상자도표(box plot) 생성 
#*hist():히스토그램(histogram) 생성
#*qqnorm():Q-Q도표(quantile-quantile plot) 생성 -> 데이터 셋의 정규성을 평가할 때 사용하는 Q-Q 도표
#*curve():사용자 정의 함수로부터 그래프 생성

#2)저수준 그래픽 함수(low-level graphics function)
#*독자적으로 새로운 그래프를 생성할 수 없음
#*기존의 완성된 그래프에 부가적인 요소를 추가하는 역할
#*이미 생성된 그래프상에 점, 선, 텍스트 등을 추가할 때 사용 
#*ex)
#*points():점 추가
#*lines():선 추가
#*abline():직선 추가
#*segments():꺾은선 추가
#*polygon():다각형 추가
#*text():텍스트 추가 

#저수준 그래픽 함수를 호출하기 전에는 반드시 고수준 그래픽 함수를 먼저 호출해야 함 

str(faithful)
#output
'data.frame':	272 obs. of  2 variables:
 $ eruptions: num  3.6 1.8 3.33 2.28 4.53 ... #간헐천의 분출 지속 시간
 $ waiting  : num  79 54 74 62 85 55 88 85 51 85 ... #분출간의 간격 

plot(faithful) #산점도 생성 

eruptions.long <- faithful[faithful$eruptions > 3,]

points(eruptions.long,col="red",pch=19) #col -> symbol의 컬러 지정, pch -> 산점도 상의 점으로 사용하고자 하는 symbol
#points를 사용하기 전에 plot함수를 사용하여 그래프를 먼저 만들어줘야 한다. 그렇지 않고 points를 함수를 사용하게 되면 error가 발생한다.

#<<plot을 사용하지 않고 points 함수를 사용했을 경우, 오류 발생>> 
#Error in plot.xy(xy.coords(x, y), type = type, ...) : 
#plot.new has not been called yet

#기존의 그래프를 삭제 
dev.off()

#x축과 y축간의 관계를 나타내는 선형 회귀선 생성 
#1)선형 회귀 모델 추정 먼저!
faithful.lm <- lm(waiting ~ eruptions,data=faithful) #첫 번째 인수에 formula 지정
#종속변수 ~ 독립변수 -> formula 형태

#2)line & abline함수와 선형 회귀 모델을 이용해서 회귀선을 구한다.
plot(faithful)     
points(eruptions.long,col="red",pch=19)
lines(x=faithful$eruptions, y=fitted(faithful.lm),col="blue") #x(독립 변수)에는 분출 시간을 넣어주었고, y에는 회귀 모델에 의해서 예측되는 대기 시간의 예측값을 넣어준다.
#회귀 모델을 생성하면 fitted 모델을 이용해서 예측값을 만들어 낼 수 있고 이 값을 이용해서 회귀선을 그릴 수 있다.   

#그래프 상에 수평선, 기울기, 수직선 등의 회귀선을 그릴 수 있다. 
abline(v=3,col="purple") #v에 수직선이 그려질 x축의 값을 지정, col에는 수직선의 색깔 지정 
abline(h=mean(faithful$waiting),col="green") #h에는 수평선이 그려질 y의 값을 지정
abline(faithful.lm,col="blue") #회귀 모델 객체를 인수로 지정하면 회귀선을 그릴 수 있다.
