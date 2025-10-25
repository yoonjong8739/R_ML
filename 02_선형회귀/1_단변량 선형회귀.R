# 데이터 탐색과 가정 체크를 건너뛰고 통계량만 확인하면 위험하다.
data("anscombe")
attach(anscombe)
anscombe

cor(x1, y1) # 상관계수
cor(x2, y2)

par(mfrow = c(2,2))
plot(x1, y1, main = "plot 1")
plot(x2, y2, main = "plot 2")
plot(x3, y3, main = "plot 3")
plot(x4, y4, main = "plot 4")

# 비즈니스 이해하기
# 스네이크 강 유역의 용출량을 해당 연도 눈의 물당량(강우량)을 사용한 함수로 예측
library(alr4)
data("snake")
snake

names(snake) <- c("content", "yield")
attach(snake) # 데이터와 새 이름을 연결
snake

#dev.off()
par(mfrow = c(1,1))
plot(content, yield, xlab = "water content of snow", ylab = "water yield")

# 귀무가설: content 변수는 yield를 예측하는데 유의한 기여를 하지 않는다.
# 대립가설: content 변수는 yield를 예측하는데 유의한 기여를 한다. content 변수의 계수가 0이다 (채택).
yield.fit <- lm(yield ~ content)
summary(yield.fit)

plot(content, yield)
abline(yield.fit, lwd = 3, col = "red")

# 선형회귀 모형의 가정
# 1. 선형성: 종속변수와 독립변수 간의 관계는 선형
# 2. (잔차의)독립성: 모든 관측값은 서로 독립
# 3. (잔차의)등분산성: 종속변수 값의 분포는 모두 동일한 분산을 갖는다.
# 4. (잔차의)정규성: 종속변수 값들의 분포는 정규분포이다.

par(mfrow = c(2,2))
plot(yield.fit)

par(mfrow = c(1,1))
qqPlot(yield.fit) # 정규분포를 가짐
