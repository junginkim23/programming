#ggplot2 패키지

#*base graphics system & grid graphics system
#*1)base graphics system(베이스 그래프 시스템) 
#*-전통적인 그래픽 환경을 제공
#*하나의 휼륭한 그래픽 시스템 

#*2)grid graphics system
#*base grphics system보다 좀 더 유연한 환경을 제공한다.
#*매우 낮은 수준에서 선, 점, 도형과 같은 각 개별 요소들을 위치를 직접 지정
#*기능은 매우 탁월, 사용하는데는 까다롭다.

#*ggplot2 패키지
#*-저수준의 그리드 그래픽 시스템을 기반으로 다양한 고수준 그래픽 구현 
#*-'gg'는 'grammar of graphics'
#*그래프 문법 구조를 바탕으로 통일된 규칙에 따라 일관된 방식으로 그래프를 생성

#scatter
ggplot(data=mtcars,aes(x=wt,y=mpg))+geom_point()+
  labs(title = "Fuel Consumption vs. weight",x="Weight (1,000 1bs)",y="Fuel Consumption(miles per gallon)")
  
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4,6,8),labels=c("4 cylinders","6 cylinders","8 cylinders"))
#histogram
ggplot(data=mtcars,aes(x=mpg)) + 
  geom_histogram() + 
  facet_grid(cyl ~ .) + 
  labs(title="geom_histogram()",x="Miles per Gallon")

#boxplot(상자 도표)
ggplot(data=mtcars,aes(x=mpg,y=mpg)) + 
  geom_boxplot() + 
  labs(title="geom_boxplot()",x="Number of Cylinders",y="Miles per Gallon")

#density(밀도 도표)
ggplot(data=mtcars,aes(x=mpg,fill=cyl)) + 
  geom_density() + 
  labs(title="geom_density()",x="Miles per Gallon")

#point(산점)
ggplot(data=mtcars,aes(x=wt,y=mpg,col=cyl)) + 
  geom_point() + 
  labs(title="geom_point()",x="Weight (1,000 1bs)",y="Miles per Gallon")

#smooth
ggplot(data=mtcars,aes(x=wt,y=mpg)) + 
  geom_smooth() + 
  labs(title="geom_smooth()",x="Weight (1,000 1bs)",y="Miles per Gallon")

#line
ggplot(data=economics,aes(x=date,y=unemploy)) + 
  geom_line() + 
  labs(title="geom_line()",x="Year",y="Number of Unemployed (thousands")
