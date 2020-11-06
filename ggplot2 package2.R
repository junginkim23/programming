 #무게-연비간의 관계 geom_point() & geom_smooth 함수 사용해서 표현
ggplot(data=mtcars,aes(x=wt,y=mpg))+
  geom_point()+ #geom_point의 ()안에 아무것도 넣지 않은 이유는 이미 위에 aes인수 안에 x,y의 값이 지정되어 있기 때문이다. 
  geom_smooth() +
  labs(title = "Fuel Consumption vs. weight"
       ,x="Weight (1,000 1bs)"
       ,y="Fuel Consumption(miles per gallon)")
#geom_point의 Aesthetics는 geom함수의 외형을 변경시킬 수 있는 인수 -> ?geom_point를 통해 알 수 있다. 
  
#symbol의 모양(shape), 색깔(color), 크기(size) 변화 주기
ggplot(data=mtcars,aes(x=wt,y=mpg))+
  geom_point(shape=17,color="blue") +
  geom_smooth() +
  labs(title = "Fuel Consumption vs. weight"
       ,x="Weight (1,000 1bs)"
       ,y="Fuel Consumption(miles per gallon)")
  
#geom_point의 ()안에 아무것도 넣지 않은 이유는 이미 위에 aes인수 안에 x,y의 값이 지정되어 있기 때문이다.  
#par라는 도움말에서 그래프 parameter와 관련된 도움말을 포함하고 있다. 
#shape 인수:symbol을 지정하는 graph parameter -> pch 을 찾아서(?par에서 찾는다.) shape에 지정할 모양을 알아낼 수 있다. 

#color의 종류 확인
colors() #엄청나게 많은 색상을 직접 확인하고 싶을 때 google에 colors in R이라고 치면 pdf파일로 확인할 수 있다. 


  
  
  
  
  
  
  
  
  