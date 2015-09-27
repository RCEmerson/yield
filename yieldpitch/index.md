---
title       : Estimating Bermuda Grass Yield with Shiny
subtitle    : 
author      : Ryan Emerson
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About the Data

The data used for this excercise comes from the agridat library.

It includes three years of harvest data on fields of Bermuda Grass that received different schedules of fertilizer applications.

Here is a sample view of the data.


```r
library(agridat)
data(welch.bermudagrass)
head(welch.bermudagrass)
```

```
##     n  p k yield
## 1   0  0 0  1.98
## 2   0 22 0  2.38
## 3   0 44 0  2.18
## 4   0 88 0  2.22
## 5 100  0 0  3.88
## 6 100 22 0  4.35
```

--- .class #id 

## About the App

This app allows the user to explore the relationship between the input variables (fertilzers) with the output variable (yield) in a linear regression model.

For instanance, if you select the checkbox on variable n then you will be instructing the app to run a linear regression in the form of:


```r
lm(yield ~ m, data=welch.bermudagrass)
```

---

## Getting Outputs

Regardless of the input variables the user selects, they will see various outputs from the result of the linear regression including:

### 1. The formula of the linear regression.
### 2. A coefficient table that includes coefficient estimates, the standard error, the t value, and the p value.
### 3. Diagnostic plots for the linear regression.

---

## Results

As a result of our shiny app we can see that all three fertilizer inputs have a significant impact on the yield of Bermuda Grass.

We can use this information to better inform our planting decisions in future years.

A linear regression may not be the best approach to take, since we would expect the affect of fertilizer to decrease as the level of fertilizer increases. Therefore, this relationship is not linear as there are diminishing returns to fertilizer application.

---
