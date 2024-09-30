# Exploratory Data Analysis on Tech Layoff Data in SQL

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff2.jpg" width="700"/>
</p>

<p align="center">
  <a href="https://etedge-insights.com/featured-insights/government-and-policies/tech-layoffs-hit-indians-in-united-states-how-the-eb-5-program-offers-stability/">ET Edge Insights</a>
</p>

The global tech layoff dataset, covering the period from the beginning of COVID-19 (March 11, 2020) to the present (July 20, 2024), was cleaned in <strong><em>SQL</strong></em> during the first part of the project. (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.md">Tech Layoff Cleaning.md></a>) In this second part, exploratory data analysis (EDA) was conducted on the cleaned dataset using SQL and the results were visaulized with <strong><em>PowerBI</strong></em>.
(Data Soucre: <a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a>) (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.sql">SQL code</a>)

A map in <strong>Figure 1</strong> shows the locations of companies marked as dots, visualizing their distribution, while <strong>Figure 2</strong> is a pie chart illustrating the 10 countries with the most reported layoffs. The data appears to be predominantly collected from companies in North America and Europe (<strong>Figure 1</strong>), with 67 % of the cases reported in the United States. This suggests the limit to drawing conclusions or insights that are truly global from the dataset.
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_locationmap.jpg" width="700"/>
	<br/>
	<strong>Figure 1.</strong> Map of locations</span>
</p>
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/country_pie.jpg" width="700"/>
	<br/>
	<strong>Figure 2.</strong>Pie chart of top 10 countries with the most rerpoted layoff cases</span>
</p>
<br/>

The filled line chart in <strong>Figure 3</strong> illustrates the number of reported layoff cases per month over the period during which the data was collected, and it shows that the most cases in the data were reported after January 2022.
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/monthly_total.jpg" width="1000"/>
	<br/>
	<strong>Figure 3.</strong> Layoff cases per month</span>
</p>
<br/>

The histograms for total_laid_off, percentage_laid_off and funds_raised_millions were created using <strong><em>PowerBI</strong></em> (<strong>Figure 3a-c</strong>) and calculated descriptive statistic using Python for each to study the distribution of the value in each (<strong>Table 1</strong>). The histograms show that most reported layoffs had a total_laid_off between 0 and 250(<strong>Figure 3a</strong>), a percentage_laid_off between 0-20% (<strong>Figure 3b</strong>), or the company raised 0-250 million dollars (<strong>Figure 3c</strong>), with each variable considered separately. This suggests that the distributions of those variables are skewed to the left. As expected, the difference between the mean and the maximum in each variable is significantly large compared to the difference between mean and the minimum (<strong>Table 1</strong>), and this also contributes to the large standard deviation.
<br/><br/>

<p align="center"> 
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/total_hist.jpg" height = "320"/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/percentage_hist.jpg" height = "320"/>
</p>
<p align="center"> 
	<span style="font-size: 9 px;"><strong>Figure 3.</strong> Histogram of total_laid_off</span> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
	<strong>Figure 4.</strong> Histogram of percentage_laid_off</span>
</p>

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/funds_hist.jpg"  height = "320"/>
	<br/>
	<strong>Figure 5.</strong> Histograms of: a)total_laid_off, b)precentage_laid_off, and c)funds_raised_millions</span>
</p>
<br/>

<p align="center">
	<strong>Table 1.</strong> Descriptive statistic of total_laid_off, percentage_laid_off and fund_raised_millions</span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_descriptive_stats.jpg"  width="700"/>
</p>
<br/>

<strong>Figure 6</strong> is a pie chart illustrating the top 9 industries with the most layoffs, with the remaining industries combined into a new category labeled 'Others.' The 'Other' category in the dataset had the third-highest number of layoffs and was also merged into 'Others' (<strong>Table 2</strong>). <strong>Table 3</strong> shows the top 10 companies with the most layoffs and their respective industries. Amazon had the highest number of layoffs, with its industry, Retail, ranking second (<strong>Figure 6</strong>). Amazon's layoffs make up 40% of the total layoffs in the Retail industry. Google and Meta had the second and third highest layoffs, with their industry, Consumer, ranking first among industries with the most layoffs. Combined, Google and Meta account for 51% of the total layoffs in their respective industries. The other top companies' industries—Sales, Healthcare, Transportation, Hardware, Travel, and Other from (<strong>Table 2</strong>)—are also among the top 10 industries, suggesting that all top 10 companies contribute significantly to the total layoffs within their industries. On the other hand, the layoffs in the remaining top 10 industries are likely contributed by multiple smaller companies.

<br/>

<p align="center"> 
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/total_hist.jpg" height = "320"/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/percentage_hist.jpg" height = "320"/>
</p>
<p align="center"> 
	<span style="font-size: 9 px;"><strong>a.</strong>industry</span> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
	<strong>b.</strong>country</span>
</p>



and (<strong>Table 3</strong>) shows the top 10 companies and their industries.

by industry pie chart --> compare with the top 10 companies and their industries

is the table reliable?: possible biase
- companies that are easy to collect data from (big companies with transparency)
- we can look more into what occupations have been laid off in each reported layoff case. we can also study the correlation of the industry and the occupation within it. for example, software developers in retail (amazon) may have been layed off more than software developers in consumer (google).
