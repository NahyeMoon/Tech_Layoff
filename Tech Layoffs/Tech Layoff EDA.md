# Exploratory Data Analysis on Tech Layoff Data in SQL

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff2.jpg" width="700"/>
</p>

<p align="center">
  <a href="https://etedge-insights.com/featured-insights/government-and-policies/tech-layoffs-hit-indians-in-united-states-how-the-eb-5-program-offers-stability/">ET Edge Insights</a>
</p>

The global tech layoff dataset, covering the period from the beginning of COVID-19 (March 11, 2020) to the present (July 20, 2024), was cleaned in SQL during the first part of the project. (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.md">Tech Layoff Cleaning.md></a>) In this second part, I conducted exploratory data analysis (EDA) on the cleaned dataset using SQL and visualized the results with Power BI.
(Data Soucre: <a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a>) (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.sql">SQL code</a>)

I created a map with the companies' locations marked as dots to visualize their distribution (<strong>Figure 1</strong>). It appears that most of the data was collected from companies in North America and Europe, suggesting that there is a limit to drawing conclusions or insights that are truly global from the analysis on this data.
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_locationmap.jpg" width="700"/>
	<br/>
	<strong>Figure 1.</strong> Map of location</span>
</p>
<br/>

I created histograms in PowerBI for total_laid_off, percentage_laid_off and funds_raised_millions (<strong>Figures 2-4</strong>) and calculated descriptive statistic using Python for each to study the distribution of the value in each (<strong>Table 1</strong>). The histograms show that most reported layoffs had a total_laid_off between 0 and 250 (<strong>Figure 2</strong>), a percentage_laid_off between 0-20% (<strong>Figure 3</strong>), or the company raised 0-250 million dollars (<strong>Figure 4</strong>), with each variable considered separately. This suggests that the distributions of those variables are skewed to the left.
<br/>

<p align="center"> 
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/total_hist.jpg" width="535">
	<br/>
	<span style="font-size: 9 px;"><strong>Figure 2.</strong> Histogram of total_laid_off</span>
</p>
<br/>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/percentage_hist.jpg" width="535"/>
	<br/>
	<strong>Figure 3.</strong> Histogram of percentage_laid_off</span>
</p>
<br/>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/funds_hist.jpg"  width="535"/>
	<br/>
	<strong>Figure 4.</strong> Histogram of funds_raised_millions</span>
</p>
<br/>

<p align="center">
	<strong>Table 1.</strong> Descriptive statistic of total_laid_off, percentage_laid_off and fund_raised_millions</span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_descriptive_stats.jpg"  width="700"/>
</p>


