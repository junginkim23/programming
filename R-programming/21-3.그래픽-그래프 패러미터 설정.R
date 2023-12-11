#그래프 패러미터 설정 

plot(faithful)
#제목과 축

plot(faithful,
     main="Old Faithful Geyser",
     sub="YeFlowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waithing time (minutes")

?par #par 함수의 도움말을 참조하면 여러 가지 다양한 그래프 파라미터를 확인할 수 있다. 

#그래프의 테두리 -> bty파라미터에 값을 달리하여 그래프의 유형을 선택할 수 있다. 
plot(faithful,bty="o") #기본값 - 사각형
plot(faithful,bty="n") #n - 사각 테두리를 없애준다.
plot(faithful,bty="l") #l -L모양으로 생성
plot(faithful,bty="]") #] - 이 symbol과 유사한 모양으로 생성

#축 label의 스타일 변경 -> las = {0,1,2,3} 지정에 따라
plot(faithful,las =0)
plot(faithful,las =1)
plot(faithful,las =2)
plot(faithful,las =3)

#심볼과 선  -> pch 파라미터의 값을 {1~25} 지정함에 따라 심볼이 달라진다.
plot(faithful,pch=3)
plot(faithful,pch=8)
plot(faithful,pch=19,col="green3") #col인수를 사용하여 색상을 지정할 수 있다. 
plot(faithful,pch=21) #pch의 값 중 21은 겉의 색상과 속의 색상을 다르게 지정할 수 있다.
plot(faithful,pch=21,col="dimgray",bg="red") #col->겉의 색상, bg->속의 색상

#lty 파라미터를 사용해서 선의 유형을 결정 
plot(LakeHuron, lty="solid") #기본값으로 solid 사용 
plot(LakeHuron, lty="dashed")
plot(LakeHuron, lty="dotted")
plot(LakeHuron, lty="dotdash")
plot(LakeHuron, lty="longdash")
plot(LakeHuron, lty="twodash")
plot(LakeHuron, lty=1) # 1 - solid
plot(LakeHuron, lty=6) # 6 - twodash
plot(LakeHuron, lty=6, col="red")

#그래프 유형 -> type 파라미터 이용 
plot(pressure)  #두 개의 벡터나 두 개의 벡터로 이루어진 데이터프레임이 주어지면 산점도를 출력한다.
plot(pressure,type="p") #p - 산점도 
plot(pressure,type="l") #l - 선도표
?plot #type의 값을 확인하기 위해 plot 함수의 도움말을 참조한다.
plot(pressure,type="b")
plot(pressure,type="o")
plot(pressure,type="h") #h - histogram
plot(pressure,type="s") #s - 계단형
plot(pressure,type="n") #n - 축과 눈금으로 구성된 그래프의 틀만 구성됨. -> 구성한 후 저수준 그래프 함수를 사용해서 내가 원하는 것들로 구축 
plot(pressure,type="p")

x <- 1:10
y1 <- exp(1:10)
y2 <- exp(10:1)

#저수준 그래프 함수 lines 사용
plot(x,y1,xlab="x",ylab="y",type="n")
lines(x,y1,type="o",pch=21,col="red")
lines(x,y2,type="o",pch=22,col="blue")

#격자선 생성1 , 저수준 그래프 함수 grid(), points() 사용
plot(faithful,type="n")
grid() #격자선 생성
points(faithful,pch=19,col="blue") #그래프 생성 

#격자선 생성2 
plot(faithful,pch=19,col="blue")
grid()
#격자선 생성1이 격자선 생성2보다 더 깔끔한 그래프를 생성해준다. 격자선이 점 아래에 있기 때문에.

#색상
colors() #col파라미터에 지정할 수 있는 색깔을 확인할 수 있는 함수 
#colors in R을 구글에 쳐보면 pdf 파일이 뜨는데 이것을 이용하여 colors함수에 있는 여러 가지 색깔의 직접 확인할 수 있다.
palette() # col에 1~8까지를 지정하면 palette함수에 있는 해당 인덱스의 색깔로 지정된다.
#색상 palette 변경 방법 
palette(rainbow(6)) #변경하고자 하는 색상 palette의 이름과 색상의 개수를 palette함수의 인수로 제공 
palette()
#output
[1] "red"     "yellow"  "green"   "cyan"    "blue"   
[6] "magenta"
#원래의 palette로 돌아가는 방법
palette("default")
palette()
#output
[1] "black"   "#DF536B" "#61D04F" "#2297E6" "#28E2E5"
[6] "#CD0BBC" "#F5C710" "gray62" 

#색상 지정 방법(white)
# col ="white", col="#FFFFFF",col= rgb(1,1,1),col = hsv(0,0,1) hsv(색도, 채도, 명도)

n <- 12
#pie 함수 사용, 온도표 생성 
pie(rep(1,n),col=1:n)
 
#여러 가지 색상 팔레트 
rainbow()
hear.colors() #빨간색과 노란색 중심의 따뜻한 색상의 팔레트 생성
terrain.colors() #초록색, 파란색, 노란색 중심 
topo.colors() #초록색, 파란색, 노란색 중심 
cm.colors() 
gray()

#여러 가지 색상 팔레트를 이용해서 온도표 생성 -> 그라데이션 적용 
pie(rep(1,n),col=rainbow(n))
pie(rep(1,n),col=heat.colors(n))
pie(rep(1,n),col=terrain.colors(n))
pie(rep(1,n),col=topo.colors(n))
pie(rep(1,n),col=cm.colors(n))
pie(rep(1,n),col=gray(level=seq(0,1,length=n))) #0-검은색, 1-흰색 0->1 검은색에서 흰색으로 점점가면서 회색으로 이루어진 팔레트 온도표 생성 

#색상의 투명도 -> 알파 인수로 투명도 지정 가능 0-> 완전 투명(흰색), 1-> 투명도 x 이 때는 알파 인수를 지정하지 않은 원래의 색과 동일한 색상 
pie(rep(1,n),col=rainbow(n,alpha=seq(0,1,length=n))) #알파 채널 0이 지정된 '1'은 흰색으로, 마지막 1이 지정된 '12'은 원래 색상이 출력 
pie(rep(1,n),col=rainbow(n))
pie(rep(1,n),col=gray(level=seq(0,1,length=n),
                      alpha=seq(0,1,length=n)))

install.packages("RColorBrewer")
library(RColorBrewer)
?RColorBrewerr
#display.brewer.all(): RColorBrewerr 패키지가 제공하는 색상 팔레트와 색상 확인을 위한 함수 
display.brewer.all()
#특정 색상 팔레트로부터 색상을 추출하기 위한 함수
display.brewer.pal(3,"Dark2") #Dark2 팔레트로부터 3개의 색상 추출 
display.brewer.pal(9,"Blues")
#RColorBrewer 패키지를 사용해서 온도표 생성
n <- 9
pie(rep(1,n),col=brewer.pal(n,"Blues"))
pie(rep(1,n),col=brewer.pal(n,"Greens"))
pie(rep(1,n),col=brewer.pal(n,"BuGn"))
pie(rep(1,n),col=brewer.pal(n,"GnBu"))

#산점도 symbol, 제목, 부제목, x축, y축 색지정, pch-> symbol 모양 지정 
plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="YeFlowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waithing time (minutes)",
     col.main="navy",col.sub="purple",
     col.lab="royalblue",col.axis="brown")

#크기 cex 인수 사용, symbol이나 text를 줄이려면 1보다 작은 값을 지정, 크게 하려면 1보다 큰 값을 지정
#if 0.5 지정 -> 50% 작아진다. 1.5 지정 -> 50% 커진다. 1을 기준으로 상대적 크기를 말한다.
x <- seq(0.5,1.5,0.25)
y <- rep(1, length(x))
plot(x,y,pch=19,cex=x,
     main="Effects of cex on symbol and text size")
#text함수: 그래프 위에 text 생성 
text(x,y+0.2,labels=x,cex=x)

#글의 제목, 부제목 크기 변경
plot(x,y,pch=19,cex=x,main="Effects of cex on symbol and text size",
     cex.main=1.5,cex.lab=1.0,cex.axis=0.75) #축 이름 크기 변경(cex.lab), 축 label의 크기 변경(cex.axis)

#선의 굵기 -> lwd파라미터 사용  
plot(LakeHuron, lwd=1)
plot(LakeHuron, lwd=2) #선의 굵기가 2배가 됨.

#글꼴과 글씨체 -> family 인수 사용
#1)글꼴
windowsFonts() #windows 운영체제에서 사용하는 글꼴 3가지 
#output
$serif
[1] "TT Times New Roman"

$sans
[1] "TT Arial"

$mono
[1] "TT Courier New"

plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="YeFlowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waithing time (minutes)",
     family="sans")

#기존의 정의된 글꼴의 대응 관계 추가?
windowsFonts(A=windowsFont("Arial Black"),
             B=windowsFont("Book Antiqua"),
             C=windowsFont("Calisto MT"))

plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="YeFlowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waithing time (minutes)",
     family="C")

#2)글씨체
plot(faithful, pch=19, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="YeFlowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waithing time (minutes)",
     family="serif",
     font.main=4,font.sub=1,
     font.lab=3,fond.axis=2) #font.main, font.sub 등등 제목, 부제목 등의 글씨체 변경 

