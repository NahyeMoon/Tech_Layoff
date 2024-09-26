# Exploratory Data Analysis on Tech Layoff Data in SQL

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff2.jpg" width="700"/>
</p>

<p align="center">
  <a href="https://etedge-insights.com/featured-insights/government-and-policies/tech-layoffs-hit-indians-in-united-states-how-the-eb-5-program-offers-stability/">ET Edge Insights</a>
</p>

The global tech layoff dataset, covering the period from the beginning of COVID-19 (March 11, 2020) to the present (July 20, 2024), was cleaned in SQL during the first part of the project. (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.md">Tech Layoff Cleaning.md></a>) In this second part, I conducted exploratory data analysis (EDA) on the cleaned dataset using SQL and visualized the results with Power BI.
(Data Soucre: <a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a>) (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.sql">SQL code</a>)

I created a map with the companies' locations marked as dots to visualize their distribution (Figure 1). It appears that most of the data was collected from companies in North America and Europe, suggesting that there is a limit to drawing conclusions or insights that are truly global from the analysis on this data.
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_locationmap.jpg" width="700"/>
	<br/>
	Figure 1. Map of location
</p>
<br/>

I created histograms in PowerBI for total_laid_off, percentage_laid_off and funds_raised_millions (Figures 2-4) and calculated descriptive statistic using Python for each to study the distribution of the value in each (Table 1). The histograms show that most reported layoffs had a total_laid_off between 0 and 250 (Figure 2), a percentage_laid_off between 0-20% (Figure 3), or the company raised 0-250 million dollars (Figure 4), with each variable considered separately. This suggests that the distributions of those variables are skewed to the left.
<br/>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/total_hist.jpg" width="535">
	<br/>
	Figure 2. Histogram of total_laid_off
</p>
<br/>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/percentage_hist.jpg"  width="535"/>
	<br/>
	Figure 3. Histogram of percentage_laid_off
</p>
<br/>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/funds_hist.jpg"  width="535"/>
	<br/>
	Figure 4. Histogram of funds_raised_millions
</p>


