splicing_data <- read.csv("D:/MS Rutgers/Fall 2024/R program/Project/splicing_data.csv", header = TRUE)

# 1. Data Exploration

# Summary statistics
summary(splicing_data)

# Checking for missing values
colSums(is.na(splicing_data))

# Correlation matrix
cor_matrix <- cor(splicing_data[, c("SplicingFactor1", "SplicingFactor2", "SplicingFactor3", "SplicingEvent")])
print(cor_matrix)

# Boxplots to check for outliers in each Splicing Factor
boxplot(splicing_data$SplicingFactor1, main = "Boxplot for SplicingFactor1", col = "lightblue")
boxplot(splicing_data$SplicingFactor2, main = "Boxplot for SplicingFactor2", col = "lightgreen")
boxplot(splicing_data$SplicingFactor3, main = "Boxplot for SplicingFactor3", col = "yellow")

# 2. Data Visualization

# Histograms for each splicing factor
hist(splicing_data$SplicingFactor1, main = "Distribution of SplicingFactor1", xlab = "SplicingFactor1", col = "skyblue", border = "white")
hist(splicing_data$SplicingFactor2, main = "Distribution of SplicingFactor2", xlab = "SplicingFactor2", col = "lightgreen", border = "white")
hist(splicing_data$SplicingFactor3, main = "Distribution of SplicingFactor3", xlab = "SplicingFactor3", col = "salmon", border = "white")
hist(splicing_data$SplicingEvent, main = "Distribution of SplicingEvent", xlab = "SplicingEvent", col = "lightgrey", border = "white")

shapiro.test(splicing_data$SplicingFactor1)
shapiro.test(splicing_data$SplicingFactor2)
shapiro.test(splicing_data$SplicingFactor3)
shapiro.test(splicing_data$SplicingEvent)

# Load ggplot2
library(ggplot2)

# Scatter plot for SplicingFactor1 vs. Splicing Event
ggplot(splicing_data, aes(x = SplicingFactor1, y = SplicingEvent)) +
  geom_point() +
  geom_smooth(method = "lm", colour = "blue") +
  labs(x = "Splicing Factor 1", y = "Splicing Event", title = "Splicing Factor 1 vs Splicing Event")

# Scatter plot for SplicingFactor2 vs. Splicing Event
ggplot(splicing_data, aes(x = SplicingFactor2, y = SplicingEvent)) +
  geom_point() +
  geom_smooth(method = "lm", colour = "green") +
  labs(x = "Splicing Factor 2", y = "Splicing Event", title = "Splicing Factor 2 vs Splicing Event")

# Scatter plot for SplicingFactor3 vs. Splicing Event
ggplot(splicing_data, aes(x = SplicingFactor3, y = SplicingEvent)) +
  geom_point() +
  geom_smooth(method = "lm", colour = "red") +
  labs(x = "Splicing Factor 3", y = "Splicing Event", title = "Splicing Factor 3 vs Splicing Event")

# 3. Predictive Modeling
set.seed(555)
sample_size <- floor(0.7 * nrow(splicing_data))
train_index <- sample(seq_len(nrow(splicing_data)), size = sample_size)

train_data <- splicing_data[train_index, ]
test_data <- splicing_data[-train_index, ]

model <- lm(SplicingEvent ~ SplicingFactor1 + SplicingFactor2 + SplicingFactor3, data = train_data)

test_predictions <- predict(model, newdata = test_data)

SST <- sum((test_data$SplicingEvent - mean(test_data$SplicingEvent))^2) 
SSR <- sum((test_predictions - mean(test_data$SplicingEvent))^2) 
R_squared <- SSR / SST
MSE <- mean((test_data$SplicingEvent - test_predictions)^2)

summary(model)
print(MSE)
print(R_squared)

