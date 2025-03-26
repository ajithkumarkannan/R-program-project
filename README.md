**Analyzing the Relationship Between Splicing Factors and Splicing Events**

📌 Project Overview

This project investigates the relationship between splicing factors (SF1, SF2, SF3) and splicing events using exploratory data analysis (EDA) and predictive modeling in R. We apply statistical testing, visualizations, and multiple linear regression models to quantify these relationships and evaluate model performance.

📂 Dataset

The dataset contains numerical values representing three splicing factors (SF1, SF2, SF3) and their corresponding splicing event outcomes. The objective is to analyze these relationships and develop a predictive model.

🛠️ Tools & Technologies

* R Programming

* tidyverse (ggplot2, dplyr, tidyr) for data manipulation & visualization

* caret for training/testing dataset split

* lm() function for regression modeling


📊 Key Project Components


1️⃣ Data Exploration & Normality Testing

* Used Shapiro-Wilk test to check for normality

* Visualized distributions using histograms and density plots

* Checked correlations between splicing factors and splicing events

2️⃣ Regression & Predictive Modeling

* Data Split: Divided dataset into 70% training and 30% test
  
* Trained a multiple linear regression model using lm()

* Model Evaluation Metrics:

  * SST (Total Sum of Squares)

  * SSR (Regression Sum of Squares)

  * R-Squared (R²) for model fit

  * Mean Squared Error (MSE)

  * Summary statistics of the model

3️⃣ Visualization & Interpretation

* Scatterplots with regression lines to visualize relationships

* Residual plots to check model assumptions

* Model summary to interpret coefficients and significance
