# My Portfolio
This repository contains my personal portofolio for the past few months.
All of these are written in python and used existing dataset.


## [Project 1: Global Covid Case Dashboard Using SQL and PowerBI](https://github.com/agung67/MyPortfolio/tree/main/Covid%20Case%20SQL)
  This project was created to plot the global Covid-19 data using Microsoft SQL to extract the specific data that will be visualized with PowerBI. This data was obtained from [ourworldindata.org's Covid-19 Data](https://ourworldindata.org/covid-deaths). I downloaded Global Vaccinated and Global Covid Death and combined them to see the death rate, vaccinated rate, and positive case rate.
  
![](pict/covid case_Page_1.jpg)


## [Project 2: MacBook Recommendation Dashboard Using Python and PowerBI](https://github.com/agung67/MyPortfolio/tree/main/Twitter%20Classification)
  This project was made to make a recommendation for a new MacBook laptop. The data was obtained from Kaggle by [ekibee](  https://www.kaggle.com/datasets/ekibee/macbooks-dataset). The base price is the same price as the brand new MacBook Air M2 and with this data we can see all the available MacBook in stock below MacBook Air M2's MSRP price.
  
![](pict/power bi report.jpg)



## [Project 3: Twitter Classifier Using Naive-Bayes Model.](https://github.com/agung67/MyPortfolio/tree/main/Twitter%20Classification)
  This project was created for predicting a tweet popularity with user-based feature which contains information such as user account age, number of retweets, number of likes, etc. The dataset was obtained for 3 weeks with total of 7500 tweets. Given a dataset from Twitter which going to be processed with Naive-Bayes model to predict which tweet will be popular. 
  Best features was selected with Extra Tree Classifier and later processed with Naive Bayes Model. The accuracy of the model is 77% and the over-sampling and under-sampling method didn't give any significant change with the accuracy.
  
![](pict/twitter_confmatrix.png)

![](pict/best_feature.png)

## [Project 4: Used Car Classification using Support Vector Machine Model.](https://github.com/agung67/MyPortfolio/tree/main/Used%20car)
This project predicts the type of car commonly used in a state of Virginia. The data was obtained from craigslist with total of over 20.000 car listings. This project will process the raw data first with feature engineering and later will be predicted with Support Vector Machine machine learning model. The accuracy of the model is 97% with the processed data and 55% with unprocessed data.
 
Here's the confusion matrix of the model with processed data

![](/pict/usedcar_processed.png)

and here's the confusion matrix of the model with unprocessed data

![](/pict/usedcar_unprocessed.png)

## [Project 5: Early 2020 Covid-19 Data Visualisation.](https://github.com/agung67/MyPortfolio/tree/main/Data%20Covid)
  This project is a simple data visualisation of Covid-19 data obtained from 22nd January 2020 to 26th April 2020. This project uses seaborn and pyproj to create a plotting of confirmed case, recovered case, and confirmed death in each countries and also plot which countries that has a confirmed Covid case.
  
![](pict/bokeh_plot%20(1).png)
![](pict/bokeh_plot%20(2).png)
![](pict/bokeh_plot%20(3).png)
![](pict/bokeh_plot%20(4).png)
![](pict/bokeh_plot%20(4).png)
![](pict/bokeh_plot_map.png)
