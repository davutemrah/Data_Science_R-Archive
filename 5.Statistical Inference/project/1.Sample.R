#calculate mean of 40 random samples, randomly selected from exponential distribution for 50,000 rounds
reps <- 50000
nexps <- 40
rate <- 0.2
set.seed(0)
system.time(
    x1 <- replicate(reps, mean(rexp(n=nexps, rate=rate)))
)
#histogram of sample mean distribution
hist(x1,
     main="Distribution of 50,000 Sample Avarages",
     xlab = "Value")
#compare sample mean and theoretical mean
histDenNorm <- function (x, main = "") {
    hist(x1, prob = TRUE, main = main) # Histogram
    legend("topright", c("Sample Mean", "Theoretical Mean"), box.lty = 0,lty = 1, col = c("blue", "red"), lwd = c(1, 2, 2))
}
mx<-mean(x1)
histDenNorm(x1,main="Sample Mean-Theoretical Mean Comparison")
abline(v = mx, col = "blue", lwd = 3)
abline(v = 5, col = "red", lwd = 1)
#compare sample variance and theoretical variance
var(x1)
var(rexp(n=50000*40, rate=0.2))
boxplot(x1,rexp(n=50000*40, rate=0.2),horizontal = TRUE,main="Boxplots Comparison",names=c("sample","original"),col=c("blue","green"),notch=TRUE)
#compare sample distribution with normal distribution
histNorm <- function (x, main = "") {
    hist(x, prob = TRUE, main = main) # Histogram
    x2 <- seq(min(x), max(x), length = 40)
    f <- dnorm(x2, 5.003, sqrt(0.623881))
    lines(x2, f, col = "green", lwd = 2) # Normal
    legend("topright", c("Normal Distribution","Sample Mean","Theoretical Mean"), box.lty = 0,lty = 1, col = c( "green","blue","red"), lwd = c(1, 2))
}
histNorm(x1,main="Sample Average-Normal Distribution")
abline(v = mx, col = "blue", lwd = 3)
abline(v = 5, col = "red", lwd = 1)






#print first few rows and dimension
head(ToothGrowth)
dim(ToothGrowth)
#summary
ToothGrowth$dose <- cut(ToothGrowth$dose,breaks=c(0,0.5,1,2))
summary(ToothGrowth)
sd(ToothGrowth$len)
#len histogram
len_list <- list(ToothGrowth$len)
lst1 <- unlist(len_list, use.names = FALSE)
hist(lst1,breaks=c(0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38),main="The Distribution of Odontoblast length",xlab="len")
library(ggplot2)
library(dplyr)
library(gtsummary)
tablesum <- ToothGrowth %>%
    group_by(supp,dose) %>%
    summarize(lenmean=mean(len), lensd=sd(len), count = n())
print(tablesum)
d <- ggplot(ToothGrowth, aes(x=dose, y=len,fill=dose)) +
    geom_boxplot()+ggtitle("Boxplot Comparison of Vitamin C Dose")

# Box plot with dot plot
d + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
s <- ggplot(ToothGrowth, aes(x=supp, y=len,fill=supp) ) +
    geom_boxplot()+ggtitle("Boxplot Comparison of Supplement Type")
s + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
tg1 <- ToothGrowth %>% select(len,dose)
tg1 %>% tbl_summary(by = dose,statistic = list(all_continuous()~"{mean} ({sd})"))
tg2 <- ToothGrowth %>% select(len,supp)
tg2 %>% tbl_summary(by = supp,statistic = list(all_continuous()~"{mean} ({sd})"))
# Compare OJ to VC at all dosage levels
t.test(len ~ supp, paired=FALSE, var.equal=FALSE, data=ToothGrowth)
# Compare high dosage OJ and VC
lowdose <- ToothGrowth[ToothGrowth$dose=="(1,2]", ]
t.test(len ~ supp, paired=FALSE, var.equal=FALSE, data=lowdose)
# Compare low dosage OJ and VC
lowdose <- ToothGrowth[ToothGrowth$dose=="(0,0.5]", ]
t.test(len ~ supp, paired=FALSE, var.equal=FALSE, data=lowdose)
# Compare mid dosage OJ and VC
middose <- ToothGrowth[ToothGrowth$dose=="(0.5,1]", ]
t.test(len ~ supp, paired=FALSE, var.equal=FALSE, data=middose)


