#벡터
#하나의 원소도 벡터로 취급
#숫자 벡터 
c(1,2,3,4,5,6,7,8,9,10)

#문자 벡터
c("we","love","data","analytics")

#논리 벡터 
c(TRUE,FALSE,TRUE,FALSE)

odd <- c(1,3,5,7,9)
even <- c(2,4,6,8)
#두 변수를 인자로 주어 연결된 벡터를 만들수 있다. 
c(odd, even)

#':' :순차적으로 증가, 감소하는 숫자로 이루어진 수열을 만들기 위해 사용한다.
3:9 #output:3 4 5 6 7 8 9
9:3 #output:9 8 7 6 5 4 3
5:-3 #output:5  4  3  2  1  0 -1 -2 -3

#seq 함수 
seq(from=3,to=9,by=2) #output:3 5 7 9
seq(from=3,to=-1,by=-0.5) #output:3.0  2.5  2.0  1.5  1.0  0.5  0.0 -0.5 -1.0
seq(from=3,to=10,length.out = 4) #output:3.000000  5.333333  7.666667 10.000000
#length.out-> 최종적으로 얻게 되는 수열의 수를 정해준다. 
seq(from=-1,to=1,length.out = 5) #output:-1.0 -0.5  0.0  0.5  1.0

#rep 함수
rep(1,times=3) #output:1 1 1
rep(c(1,2,3),times=4) #output:1 2 3 1 2 3 1 2 3 1 2 3
rep(c(1,2,3),each=3) #output:1 1 1 2 2 2 3 3 3
rep(c(1,2,3),times=c(4,2,3)) #output:1 1 1 1 2 2 3 3 3
rep(c(1,2,3),length.out=8) #output:1 2 3 1 2 3 1 2 

#벡터의 성질 파악, 서로 다른 데이터가 섞일 수가 없다. 그래서 숫자->문자로 바껴서 합쳐진다.
num <-c(1,2,3)
cha <-c("x","y","z")
c(num,cha) #output:"1" "2" "3" "x" "y" "z"

#str 함수: 어떤 벡터의 데이터 유형 또는 구조 확인 함수
str(num) #output:num [1:3] 1 2 3
str(cha) #output:chr [1:3] "x" "y" "z"

#length 함수: 벡터의 길이(원소의 개수)를 알려주는 함수 
length(num) #output: 3 
length(c(1:10)) #output: 10 

#상수 벡터: R에 미리 값이 정해진 벡터

LETTERS
#*output:"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M"
#*output:"N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"

letters
#*output:"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m"
#*      :"n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"

month.name
#*output:"January"   "February"  "March"     "April"    
#*       :"May"       "June"      "July"      "August"   
#*       :"September" "October"   "November"  "December" 

month.abb
#*output:"Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug"
#*      :"Sep" "Oct" "Nov" "Dec"

pi #output:3.141593

#month에 해당된 벡터의 값을 이용해서 상수 벡터의 각 index에 해당하는 원소를 출력. 
month <- c(12,9,3,5)
month #output:12 9 3 5
month.name[month] #output:"December"  "September" "March"     "May"  
















