#Multiple Linear Regression Models

#Loading libraries
library(ggplot2)
library(GGally)
library(dplyr)
library(gridExtra)
library(ggrepel)
library(stargazer)

#Libraries ##Assumption verification
library(strucchange)
library(lmtest) 
library(car)

#Loading data
base <- read.csv2("C:/Users/Carolina/Desktop/modelotesis/data.csv")

base[sapply(base, is.character)] <- 
  lapply(base[sapply(base, is.character)], as.numeric) 
                
#Correlation 
base_m <- data.frame(base$occ_ratem, base$avg_edum, base$income_amm)
names(base_m) = c ("Occupancy_rate", "Avg_educationlevel", "Avg_income")

round(cor(base_m, method = "pearson"), 3)


base_f <- data.frame(base$occ_ratef, base$avg_eduf, base$income_amf)
names(base_f) = c ("Occupancy_rate", "Avg_educationlevel", "Avg_income")

round(cor(base_f, method = "pearson"), 3)

#Correlation and scatter plot
ggpairs(base_m, lower = list(continuous = wrap("smooth", size = 2 )), 
        diag = list(continuous = wrap("barDiag", colour = "black", fill ="#3399CC")), 
        axisLabels = "none") + labs(title = "Model 1") + 
        theme(plot.title = element_text(hjust = 0.5))


ggpairs(base_f, lower = list(continuous = wrap("smooth", size = 2 )), 
        diag = list(continuous = wrap("barDiag", colour = "black", fill ="#3399CC")), 
        axisLabels = "none")  + labs(title = "Model 2") + 
        theme(plot.title = element_text(hjust = 0.5))

#Structural change
cusum_model_m <- efp(occ_ratem ~ avg_edum + income_amm, data = base)
plot(cusum_model_m, main = "Model 1")

cusum_model_f <- efp(occ_ratef ~ avg_eduf + income_amf, data = base)
plot(cusum_model_f, main = "Model 2")

#Multiple linear regression
 #Male Model

model_m <- lm(occ_ratem ~ avg_edum + income_amm, data = base)
summary(model_m)

 #Female Model

model_f <- lm(occ_ratef ~ avg_eduf + income_amf, data = base)
summary(model_f)

#Confidence intervals
confint(lm(occ_ratem ~ avg_edum + income_amm, data = base))
confint(lm(occ_ratef ~ avg_eduf + income_amf, data = base))

#Assumptions

#Linearity
 #Male Model

linea_incomm <- ggplot(data = base_m, aes(x = Avg_income, y = model_m$residuals)) +
  geom_point(aes(colour = model_m$residuals)) +
  scale_color_gradient2(low = "blue3", mid = "grey", high = "red") +
  scale_x_continuous(labels = scales::comma) +
  geom_hline( yintercept = 0) +
  geom_segment(aes(xend = Avg_income, yend = 0), alpha = 0.2) +
  labs(x = "Average Income", y = "Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

linea_edum <- ggplot(data = base_m, aes(x = Avg_educationlevel, y = model_m$residuals)) +
  geom_point(aes(colour = model_m$residuals)) +
  scale_color_gradient2(low = "blue3", mid = "grey", high = "red") +
  geom_hline( yintercept = 0) +
  geom_segment(aes(xend = Avg_educationlevel, yend = 0), alpha = 0.2) +
    labs(title = "Distribution of Residuals Male Model", 
         x = "Average Education Level", y = "Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

grid.arrange(linea_edum, linea_incomm)

#Female Model

linea_incomf <- ggplot(data = base_f, aes(x = Avg_income, y = model_f$residuals)) +
  geom_point(aes(colour = model_f$residuals)) +
  scale_color_gradient2(low = "blue3", mid = "grey", high = "red") +
  scale_x_continuous(labels = scales::comma) +
  geom_hline( yintercept = 0) +
  geom_segment(aes(xend = Avg_income, yend = 0), alpha = 0.2) +
  labs(x = "Average Income", y = "Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

linea_eduf <- ggplot(data = base_f, aes(x = Avg_educationlevel, y = model_f$residuals)) +
  geom_point(aes(colour = model_f$residuals)) +
  scale_color_gradient2(low = "blue3", mid = "grey", high = "red") +
  geom_hline( yintercept = 0) +
  geom_segment(aes(xend = Avg_educationlevel, yend = 0), alpha = 0.2) +
  labs(title = "Distribution of Residuals Female Model", x = "Average Education Level",
               y = "Residuals") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

grid.arrange(linea_eduf, linea_incomf)

#Outlier identification
base$studentized_residual <- rstudent(model_m)

  ggplot(data = base, aes(x = avg_edum, y = abs(studentized_residual))) +
    geom_point(aes(color = ifelse(abs(avg_edum) < 9, 'red', 'grey'))) +
    scale_color_identity() +
    geom_text_repel(data = filter(base, abs(studentized_residual) < 9),
                    aes(label = periodicity)) +
    labs(title = "Distribution of Studentized Residuals", x ="Average Education") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

#Normality 
par(bg="grey98", mfcol=c(2, 1))

qqnorm(model_m$residuals, main = "Model 1 Distribution")
qqline(model_m$residuals, col = "red3")

qqnorm(model_f$residuals, main = "Model 2 Distribution")
qqline(model_f$residuals, col = "red3")


shapiro.test(model_m$residuals)
shapiro.test(model_f$residuals)

#Homoscedasticity
homosc_m <- ggplot(base, aes(model_m$fitted.values, model_m$residuals)) +
  geom_point() + 
  geom_smooth(color = "firebrick", se = FALSE) +
  geom_hline(yintercept = 0) +
  labs( x = "Fitted values", y = "Residuals", title = "Male Model") +
  theme_bw()

homosc_f <-ggplot(base, aes(model_f$fitted.values, model_f$residuals)) +
  geom_point() +
  geom_smooth(color = "firebrick", se = FALSE) +
  geom_hline(yintercept = 0) +
  labs( x = "Fitted values", y = "Residuals", title = "Female Model") +
  theme_bw()

grid.arrange(homosc_m, homosc_f)

bptest(model_m)
bptest(model_f)

#No Multicollinearity
vif(model_m)
vif(model_f)

#Autocorrelation
##1st order

dwt(model_m, alternative = "two.sided")
dwt(model_f, alternative = "two.sided")

##2nd order
bgtest(model_m, order = 2)
bgtest(model_f, order = 2)

#Comparing the models
stargazer(model_m, model_f, type="text", df=FALSE)
