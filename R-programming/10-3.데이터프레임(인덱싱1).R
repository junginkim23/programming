 #데이터프레임 인덱싱1 

?state
state.abb
state.area
state.name
state.region

#state 데이터 셋을 이용해서 데이터 프레임 생성 
us.state <-data.frame(state.abb
                      ,state.name
                      ,state.region
                      ,state.area
                      ,stringsAsFactors = FALSE)
us.state
#output
state.abb     state.name  state.region state.area
1         AL        Alabama         South      51609
2         AK         Alaska          West     589757
3         AZ        Arizona          West     113909
4         AR       Arkansas         South      53104
5         CA     California          West     158693
6         CO       Colorado          West     104247
7         CT    Connecticut     Northeast       5009
8         DE       Delaware         South       2057
9         FL        Florida         South      58560
10        GA        Georgia         South      58876
11        HI         Hawaii          West       6450
12        ID          Idaho          West      83557
13        IL       Illinois North Central      56400
14        IN        Indiana North Central      36291
15        IA           Iowa North Central      56290
16        KS         Kansas North Central      82264
17        KY       Kentucky         South      40395
18        LA      Louisiana         South      48523
19        ME          Maine     Northeast      33215
20        MD       Maryland         South      10577
21        MA  Massachusetts     Northeast       8257
22        MI       Michigan North Central      58216
23        MN      Minnesota North Central      84068
24        MS    Mississippi         South      47716
25        MO       Missouri North Central      69686
26        MT        Montana          West     147138
27        NE       Nebraska North Central      77227
28        NV         Nevada          West     110540
29        NH  New Hampshire     Northeast       9304
30        NJ     New Jersey     Northeast       7836
31        NM     New Mexico          West     121666
32        NY       New York     Northeast      49576
33        NC North Carolina         South      52586
34        ND   North Dakota North Central      70665
35        OH           Ohio North Central      41222
36        OK       Oklahoma         South      69919
37        OR         Oregon          West      96981
38        PA   Pennsylvania     Northeast      45333
39        RI   Rhode Island     Northeast       1214
40        SC South Carolina         South      31055
41        SD   South Dakota North Central      77047
42        TN      Tennessee         South      42244
43        TX          Texas         South     267339
44        UT           Utah          West      84916
45        VT        Vermont     Northeast       9609
46        VA       Virginia         South      40815
47        WA     Washington          West      68192
48        WV  West Virginia         South      24181
49        WI      Wisconsin North Central      56154
50        WY        Wyoming          West      97914

str(us.state)
#output -> 4개의 열을 가지는 데이터 프레임 
'data.frame':	50 obs. of  4 variables:
  $ state.abb   : chr  "AL" "AK" "AZ" "AR" ...
$ state.name  : chr  "Alabama" "Alaska" "Arizona" "Arkansas" ...
$ state.region: Factor w/ 4 levels "Northeast","South",..: 2 4 4 2 4 4 1 2 2 2 ...
$ state.area  : num  51609 589757 113909 53104 158693 ...

#데이터 프레임 인덱싱 (리스트 인덱싱처럼 사용 가능) 
#<[[]] 사용 -> 리스트 인덱스 처럼 리스트 내에 있는 원소의 값이 출력>
us.state[[2]]
#output -> 데이터프레임의 2번째 열에 있는 원소들이 출력 
[1] "Alabama"        "Alaska"         "Arizona"       
[4] "Arkansas"       "California"     "Colorado"      
[7] "Connecticut"    "Delaware"       "Florida"       
[10] "Georgia"        "Hawaii"         "Idaho"         
[13] "Illinois"       "Indiana"        "Iowa"          
[16] "Kansas"         "Kentucky"       "Louisiana"     
[19] "Maine"          "Maryland"       "Massachusetts" 
[22] "Michigan"       "Minnesota"      "Mississippi"   
[25] "Missouri"       "Montana"        "Nebraska"      
[28] "Nevada"         "New Hampshire"  "New Jersey"    
[31] "New Mexico"     "New York"       "North Carolina"
[34] "North Dakota"   "Ohio"           "Oklahoma"
[37] "Oregon"         "Pennsylvania"   "Rhode Island"  
[40] "South Carolina" "South Dakota"   "Tennessee"     
[43] "Texas"          "Utah"           "Vermont"       
[46] "Virginia"       "Washington"     "West Virginia" 
[49] "Wisconsin"      "Wyoming"    

#<[] 사용 -> 2번째 열이 데이터 프레임의 형식으로 출력>
us.state[2]
#output 
state.name
1         Alabama
2          Alaska
3         Arizona
4        Arkansas
5      California
6        Colorado
7     Connecticut
8        Delaware
9         Florida
10        Georgia
11         Hawaii
12          Idaho
13       Illinois
14        Indiana
15           Iowa
16         Kansas
17       Kentucky
18      Louisiana
19          Maine
20       Maryland
21  Massachusetts
22       Michigan
23      Minnesota
24    Mississippi
25       Missouri
26        Montana
27       Nebraska
28         Nevada
29  New Hampshire
30     New Jersey
31     New Mexico
32       New York
33 North Carolina
34   North Dakota
35           Ohio
36       Oklahoma
37         Oregon
38   Pennsylvania
39   Rhode Island
40 South Carolina
41   South Dakota
42      Tennessee
43          Texas
44           Utah
45        Vermont
46       Virginia
47     Washington
48  West Virginia
49      Wisconsin
50        Wyoming

us.state[c(2,4)]
#output -> 2개의 열에 대한 인덱스를 하고 싶을 때 리스트 인덱스에서 한 것처럼 []안에 c(1,2)(숫자는 임의)를 넣어주면 된다.
state.name state.area
1         Alabama      51609
2          Alaska     589757
3         Arizona     113909
4        Arkansas      53104
5      California     158693
6        Colorado     104247
7     Connecticut       5009
8        Delaware       2057
9         Florida      58560
10        Georgia      58876
11         Hawaii       6450
12          Idaho      83557
13       Illinois      56400
14        Indiana      36291
15           Iowa      56290
16         Kansas      82264
17       Kentucky      40395
18      Louisiana      48523
19          Maine      33215
20       Maryland      10577
21  Massachusetts       8257
22       Michigan      58216
23      Minnesota      84068
24    Mississippi      47716
25       Missouri      69686
26        Montana     147138
27       Nebraska      77227
28         Nevada     110540
29  New Hampshire       9304
30     New Jersey       7836
31     New Mexico     121666
32       New York      49576
33 North Carolina      52586
34   North Dakota      70665
35           Ohio      41222
36       Oklahoma      69919
37         Oregon      96981
38   Pennsylvania      45333
39   Rhode Island       1214
40 South Carolina      31055
41   South Dakota      77047
42      Tennessee      42244
43          Texas     267339
44           Utah      84916
45        Vermont       9609
46       Virginia      40815
47     Washington      68192
48  West Virginia      24181
49      Wisconsin      56154
50        Wyoming      97914

us.state[["state.name"]] #=us.state$state.name
#output
[1] "Alabama"        "Alaska"         "Arizona"       
[4] "Arkansas"       "California"     "Colorado"      
[7] "Connecticut"    "Delaware"       "Florida"       
[10] "Georgia"        "Hawaii"         "Idaho"         
[13] "Illinois"       "Indiana"        "Iowa"          
[16] "Kansas"         "Kentucky"       "Louisiana"     
[19] "Maine"          "Maryland"       "Massachusetts" 
[22] "Michigan"       "Minnesota"      "Mississippi"   
[25] "Missouri"       "Montana"        "Nebraska"      
[28] "Nevada"         "New Hampshire"  "New Jersey"    
[31] "New Mexico"     "New York"       "North Carolina"
[34] "North Dakota"   "Ohio"           "Oklahoma"      
[37] "Oregon"         "Pennsylvania"   "Rhode Island"  
[40] "South Carolina" "South Dakota"   "Tennessee"     
[43] "Texas"          "Utah"           "Vermont"       
[46] "Virginia"       "Washington"     "West Virginia" 
[49] "Wisconsin"      "Wyoming"    

us.state[c("state.name","state.area")]
#output
      state.name state.area
1         Alabama      51609
2          Alaska     589757
3         Arizona     113909
4        Arkansas      53104
5      California     158693
6        Colorado     104247
7     Connecticut       5009
8        Delaware       2057
9         Florida      58560
10        Georgia      58876
11         Hawaii       6450
12          Idaho      83557
13       Illinois      56400
14        Indiana      36291
15           Iowa      56290
16         Kansas      82264
17       Kentucky      40395
18      Louisiana      48523
19          Maine      33215
20       Maryland      10577
21  Massachusetts       8257
22       Michigan      58216
23      Minnesota      84068
24    Mississippi      47716
25       Missouri      69686
26        Montana     147138
27       Nebraska      77227
28         Nevada     110540
29  New Hampshire       9304
30     New Jersey       7836
31     New Mexico     121666
32       New York      49576
33 North Carolina      52586
34   North Dakota      70665
35           Ohio      41222
36       Oklahoma      69919
37         Oregon      96981
38   Pennsylvania      45333
39   Rhode Island       1214
40 South Carolina      31055
41   South Dakota      77047
42      Tennessee      42244
43          Texas     267339
44           Utah      84916
45        Vermont       9609
46       Virginia      40815
47     Washington      68192
48  West Virginia      24181
49      Wisconsin      56154
50        Wyoming      97914


#----------------------------------------------------


#데이터 프레임 인덱싱 (행렬 인덱싱처럼 사용 가능)
us.state[,2]
#output -> 2번째 열에 대한 원소의 값이 출력 
[1] "Alabama"        "Alaska"         "Arizona"       
[4] "Arkansas"       "California"     "Colorado"      
[7] "Connecticut"    "Delaware"       "Florida"       
[10] "Georgia"        "Hawaii"         "Idaho"         
[13] "Illinois"       "Indiana"        "Iowa"          
[16] "Kansas"         "Kentucky"       "Louisiana"     
[19] "Maine"          "Maryland"       "Massachusetts" 
[22] "Michigan"       "Minnesota"      "Mississippi"   
[25] "Missouri"       "Montana"        "Nebraska"      
[28] "Nevada"         "New Hampshire"  "New Jersey"    
[31] "New Mexico"     "New York"       "North Carolina"
[34] "North Dakota"   "Ohio"           "Oklahoma"      
[37] "Oregon"         "Pennsylvania"   "Rhode Island"  
[40] "South Carolina" "South Dakota"   "Tennessee"     
[43] "Texas"          "Utah"           "Vermont"       
[46] "Virginia"       "Washington"     "West Virginia" 
[49] "Wisconsin"      "Wyoming"    

us.state[1:10,2,drop=FALSE] #행렬에서 데이터프레임의 형태를 유지한채로 인덱스하게 할 때처럼 똑같이 사용해도 원하는 결과 출력이 가능하다.
state.name
#output
    state.name
1      Alabama
2       Alaska
3      Arizona
4     Arkansas
5   California
6     Colorado
7  Connecticut
8     Delaware
9      Florida
10     Georgia 

us.state[1:10,c(2,4)]
    state.name state.area
1      Alabama      51609
2       Alaska     589757
3      Arizona     113909
4     Arkansas      53104
5   California     158693
6     Colorado     104247
7  Connecticut       5009
8     Delaware       2057
9      Florida      58560
10     Georgia      58876

#행렬 인덱싱처럼 사용 
us.state[,"state.name"]
#output
[1] "Alabama"        "Alaska"         "Arizona"       
[4] "Arkansas"       "California"     "Colorado"      
[7] "Connecticut"    "Delaware"       "Florida"       
[10] "Georgia"        "Hawaii"         "Idaho"         
[13] "Illinois"       "Indiana"        "Iowa"          
[16] "Kansas"         "Kentucky"       "Louisiana"     
[19] "Maine"          "Maryland"       "Massachusetts" 
[22] "Michigan"       "Minnesota"      "Mississippi"   
[25] "Missouri"       "Montana"        "Nebraska"      
[28] "Nevada"         "New Hampshire"  "New Jersey"    
[31] "New Mexico"     "New York"       "North Carolina"
[34] "North Dakota"   "Ohio"           "Oklahoma"      
[37] "Oregon"         "Pennsylvania"   "Rhode Island"  
[40] "South Carolina" "South Dakota"   "Tennessee"     
[43] "Texas"          "Utah"           "Vermont"       
[46] "Virginia"       "Washington"     "West Virginia" 
[49] "Wisconsin"      "Wyoming"   

us.state[,c("state.name","state.area")]
#output
       state.name state.area
1         Alabama      51609
2          Alaska     589757
3         Arizona     113909
4        Arkansas      53104
5      California     158693
6        Colorado     104247
7     Connecticut       5009
8        Delaware       2057
9         Florida      58560
10        Georgia      58876
11         Hawaii       6450
12          Idaho      83557
13       Illinois      56400
14        Indiana      36291
15           Iowa      56290
16         Kansas      82264
17       Kentucky      40395
18      Louisiana      48523
19          Maine      33215
20       Maryland      10577
21  Massachusetts       8257
22       Michigan      58216
23      Minnesota      84068
24    Mississippi      47716
25       Missouri      69686
26        Montana     147138
27       Nebraska      77227
28         Nevada     110540
29  New Hampshire       9304
30     New Jersey       7836
31     New Mexico     121666
32       New York      49576
33 North Carolina      52586
34   North Dakota      70665
35           Ohio      41222
36       Oklahoma      69919
37         Oregon      96981
38   Pennsylvania      45333
39   Rhode Island       1214
40 South Carolina      31055
41   South Dakota      77047
42      Tennessee      42244
43          Texas     267339
44           Utah      84916
45        Vermont       9609
46       Virginia      40815
47     Washington      68192
48  West Virginia      24181
49      Wisconsin      56154
50        Wyoming      97914

#논리 연산을 이용한 조건을 충족하는 행 추출 
state.x77 #미국에 주에 대한 정보 
str(state.x77)
#output
num [1:50, 1:8] 3615 365 2212 2110 21198 ...
- attr(*, "dimnames")=List of 2
..$ : chr [1:50] "Alabama" "Alaska" "Arizona" "Arkansas" ...
..$ : chr [1:8] "Population" "Income" "Illiteracy" "Life Exp" ...
head(state.x77)
#output -> head 함수는 위에서부터 5개의 행을 출력 
           Population Income Illiteracy Life Exp Murder
Alabama          3615   3624        2.1    69.05   15.1
Alaska            365   6315        1.5    69.31   11.3
Arizona          2212   4530        1.8    70.55    7.8
Arkansas         2110   3378        1.9    70.66   10.1
California      21198   5114        1.1    71.71   10.3
Colorado         2541   4884        0.7    72.06    6.8
           HS Grad Frost   Area
Alabama       41.3    20  50708
Alaska        66.7   152 566432
Arizona       58.1    15 113417
Arkansas      39.9    65  51945
California    62.6    20 156361
Colorado      63.9   166 103766

#데이터 전처리: (1)행렬 state.x77 -> 데이터 프레임 변환, 
#             : (2)행의 이름으로 되어 있는 주의 이름을 새로운 열로 추가 
#             : (3)행의 이름 제거 
states <- data.frame(state.x77)
states
#row.names(): 행의 이름을 알 수 있다.
row.names(states)
#주의 이름을 데이터프레임에 새로운 열로 추가
states$name <- row.names(states)
#행의 이름 삭제 -> 행의 이름(주 이름)이 새로운 열로 추가 되었기 때문 
row.names(states) <-NULL
head(states)
#output
  Population Income Illiteracy Life.Exp Murder HS.Grad Frost
1       3615   3624        2.1    69.05   15.1    41.3    20
2        365   6315        1.5    69.31   11.3    66.7   152
3       2212   4530        1.8    70.55    7.8    58.1    15
4       2110   3378        1.9    70.66   10.1    39.9    65
5      21198   5114        1.1    71.71   10.3    62.6    20
6       2541   4884        0.7    72.06    6.8    63.9   166
    Area       name
1  50708    Alabama
2 566432     Alaska
3 113417    Arizona
4  51945   Arkansas
5 156361 California
6 103766   Colorado

#조건으로 행 선택 
#부자 주를 선택 
rich.states <- states[states$Income > 5000, c("name","Income")]#states데이터프레임에서 income > 5000인 행의 name과 Income 열을 추출 
rich.states
#output
           name Income
2        Alaska   6315
5    California   5114
7   Connecticut   5348
13     Illinois   5107
20     Maryland   5299
28       Nevada   5149
30   New Jersey   5237
34 North Dakota   5087

#땅이 넓은 주 선택
large.states <- states[states$Area > 100000,c("name","Area")]
large.states
#output
        name   Area
2      Alaska 566432
3     Arizona 113417
5  California 156361
6    Colorado 103766
26    Montana 145587
28     Nevada 109889
31 New Mexico 121412
43      Texas 262134

#부자이면서 땅이 넓은 주 생성 
#-> merge 함수 이용(두 데이터 프레임 결합), 공통의 열을 기준으로 서로 일치하는 행만을 추출
merge(rich.states,large.states)  
#output
        name Income   Area
1     Alaska   6315 566432
2 California   5114 156361
3     Nevada   5149 109889
#merge내에 all인수의 디폴트 값 FALSE는 두 데이터 프레임 간에 교집합을 선택
#all.x=TRUE: 첫 번째 df 중심으로 결합, all.y=TRUE: 두 번째 DF 중심으로 결합

merge(rich.states,large.states,all=TRUE)
#output -> name 열을 기준으로 두 df 결합, 값이 없는 부분은 NA로 채워진다. 
           name Income   Area
1        Alaska   6315 566432
2       Arizona     NA 113417
3    California   5114 156361
4      Colorado     NA 103766
5   Connecticut   5348     NA
6      Illinois   5107     NA
7      Maryland   5299     NA
8       Montana     NA 145587
9        Nevada   5149 109889
10   New Jersey   5237     NA
11   New Mexico     NA 121412
12 North Dakota   5087     NA
13        Texas     NA 262134