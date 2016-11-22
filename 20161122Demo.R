
## Regression Analysis
X <- c(17, 21,35, 39, 50, 65)
Y <- c(132, 150, 160, 162, 149, 170)
plot(X, Y, xlim=c(0,70), ylim=c(0,200))

X_avg <- mean(X)
Y_avg <- mean(Y)

B1 <- (sum(X*Y)-6*X_avg*Y_avg)/(sum(X^2)-6*X_avg^2)
B1

B0 <- Y_avg- B1 * X_avg
B0

# y = 0.5529606 * x + 132.913
x <- 1:70
y <- 0.5529606 * x + 132.913
lines(x,y, col="red")

# use lm => linear model
X <- c(17,   21,  35,  39,  50,  65)
Y <- c(132, 150, 160, 162, 149, 170)
fit <- lm(Y ~ X)
fit
?lm


## 使用Quartet 資料集
library(car)
data(Quartet)
View(Quartet)
plot(y1 ~ x, data = Quartet)

## 使用lm 做一項式迴歸分析
fit <- lm(y1 ~ x, data = Quartet)
fit

## 將迴歸模型繪製在圖上
abline(fit, col="red")

## 產生預測結果
predict(fit, data.frame(x=c(16, 18)))
16 * 0.5001 + 3.0001
18 * 0.5001 + 3.0001


plot(y2 ~ x, data = Quartet)
fit1 <- lm(y2 ~ x, data = Quartet)
fit1
abline(fit1, col="red")


## 使用lm 做二項式迴歸分析
fit2 <- lm(y2 ~ poly(x,2), data = Quartet)
fit2
# Y = -3.712 * x ^ 2 + 5.244 * x + 7.501

Quartet$x
fit2$fit

## 使用lines 繪製模型線
lines(Quartet$x, fit2$fit, col="blue")
sort(Quartet$x)
fit2$fit[order(Quartet$x)]

plot(y2 ~ x, data = Quartet)
lines(sort(Quartet$x), fit2$fit[order(Quartet$x)], col="blue")
predict(fit2, data.frame(x=c(16, 18)))

## 可容錯的回歸(rlm)
plot(y3 ~ x, data = Quartet)
fit3 <- lm(y3 ~ x, data = Quartet)
abline(fit3, col="red")

library(MASS)
?rlm
fit4 <- rlm(y3 ~ x, data = Quartet)
abline(fit4, col="blue")

## 分析台北市大安區 591租屋網的租金資訊
house <- read.csv('/tmp/591.csv', header = TRUE)
plot(Price ~ Area, data= house)
fit <- lm(Price ~ Area, data= house)
fit
abline(fit, col="red")
predict(fit, data.frame(Area = c(32)))
