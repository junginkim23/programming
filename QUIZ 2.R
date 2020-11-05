#<QUIZ 2>

#(1)(R) read.table 함수를 이용해서 Expr.txt 파일과 Patient.txt 파일을 불러오는 코드를 작성하세요.
expr <- read.table(file="Expr.txt",header = TRUE,row.names = 1)
patient <- read.table(file="Patient.txt",header = TRUE,fill=TRUE,row.names = 1)

#(2)correlation이라는 이름의 벡터를 하나 생성해서 유전자의 발현량과 환자의 생존기간과의 상관관계 (Pearson correlation)를 저장하고, 벡터의 각 요소에 해당 유전자 이름을 할당하는 코드를 작성하세요.
survival <- as.numeric(patient$Survival)
correlation <- c()
for (i in 1:nrow(expr)) correlation[i] <- cor(as.numeric(expr[i,]),survival)
names(correlation) <- row.names(expr)

#(3)correlation 벡터에 저장된 정보를 통해 상관관계가 가장 낮은 (환자의 예후에 가장 나쁜 영향을 끼칠 것으로 예상되는) 유전자를 찾아낸 후, target이라는 이름의 데이터프레임을 생성하여 해당 유전자의 환자별 발현량과 생존기간 정보를 저장하는 코드를 작성하세요.
min.i <- which.min(correlation)
rarp1 <- as.numeric(expr[min.i,])
survival1 <- patient[["Survival"]]

target <- data.frame(rarp1,survival1)
colnames(target) <- c("RARP1","Survival")
rownames(target) <- rownames(patient)