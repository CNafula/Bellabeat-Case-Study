# Load Libraries
library(tidyverse)
library(ggplot2)
library(dplyr)

# Load Data
activity_data <- read.csv("dailyActivity_merged.csv")
sleep_data <- read.csv("sleepDay_merged.csv")

# Data Cleaning
activity_data <- activity_data[!duplicated(activity_data), ]
activity_data$ActivityDate <- as.Date(activity_data$ActivityDate, format="%m/%d/%Y")

# Analysis
summary(activity_data$TotalSteps)
summary(activity_data$Calories)

# Visualization
ggplot(activity_data, aes(x = TotalSteps, y = Calories)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Steps vs Calories", x = "Steps", y = "Calories Burned")
