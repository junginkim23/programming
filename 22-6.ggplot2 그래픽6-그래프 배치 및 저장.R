#ggplot2 그래픽 6 - 그래프 배치 및 저장 
#여러 개의 그래프 생성 후 결합, 하나의 창에 배치하는 방법과 생성된 그래프를 별도의 파일로 저장하는 방법 
library(ggplot2)

#1.여러 개의 그래프 생성 
install.packages("car")
library(car)
str(Salaries)

p1<-ggplot(Salaries,aes(x=rank)) +
  geom_bar(fill="steelblue") #막대 도표 생성 

p2<-ggplot(Salaries,aes(x=salary)) +
  geom_histogram(fill="maroon") #히스토그램 생성 

p3<-ggplot(Salaries,aes(x=yrs.since.phd,y=salary)) +
  geom_point(color="orange") #산점도 생성 

p4<-ggplot(Salaries, aes(x=rank,y=salary)) +
  geom_boxplot(fill="mistyrose") #박스 플랏 생성

#2.여러 개의 그래프 결합 -> grid.arrange()함수 사용 
install.packages("gridExtra")
library(gridExtra)
myggplot <- grid.arrange(p1,p2,p3,p4,nrow=2,ncol=2) #nrow-행의 개수, ncol-열의 개수


#결합한 그래프를 파일로 저장
ggsave(file="myplot.png",plot=myggplot, #plot인수에 내가 생성한 객체를 지정, file 인수에 우리가 알고 있는 파일 포맷을 지정해서 적으면 그 포맷으로 지정된다.
       width=7.0, height=5.5, #width&height(저장할 그래프 파일의 폭과 높이)-inch단위
       units) #units-단위 변경 가능, 단위("in","cm" or "mm")

#바로 직전에 생성한 그래프를 저장할 경우 
ggplot(Salaries,aes(x=rank,y=salary)) +
  geom_boxplot()
ggsave(file="myplot2.png") #직전에 만들어진 그래프가 생성됨. 