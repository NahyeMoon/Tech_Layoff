# Exploratory Data Analysis on Tech Layoff Data in SQL

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff2.jpg" width="700"/>
</p>

<p align="center">
  <a href="https://etedge-insights.com/featured-insights/government-and-policies/tech-layoffs-hit-indians-in-united-states-how-the-eb-5-program-offers-stability/">ET Edge Insights</a>
</p>

## Project Overview
The global tech layoff dataset, covering the period from the beginning of COVID-19 (March 11, 2020) to the present (July 20, 2024), was cleaned in <strong><em>SQL</strong></em> during the first part of the project. (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.md">Tech Layoff Cleaning.md></a>) In this second part, exploratory data analysis (EDA) was conducted on the cleaned dataset using SQL and the results were visaulized with <strong><em>PowerBI</strong></em>.
(Data Soucre: <a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a>) (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.sql">SQL code</a>)

## Exploratory Data Analysis EDA
A map in <strong>Figure 1</strong> shows the locations of companies marked as dots, visualizing their distribution, while <strong>Figure 2</strong> is a pie chart illustrating the 10 countries with the most reported layoffs. The data appears to be predominantly collected from companies in North America and Europe (<strong>Figure 1</strong>), with 67 % of the cases reported in the United States. This suggests the limit to drawing conclusions or insights that are truly global from the dataset.
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_locationmap.jpg" width="700"/>
	<br/>
	<strong>Figure 1.</strong> Map of locations</span>
</p>
<br/>
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/country_pie.jpg" width="500"/>
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
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/total_hist.jpg" width = "500"/>
	<br/><br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/percentage_hist.jpg" width = "500"/>
	<br/><br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/funds_hist.jpg"  width = "500"/>
	<br/><br/>
	<strong>Figure 3.</strong> Histograms of: <strong>a)</strong> total_laid_off, <strong>b)</strong> precentage_laid_off, and <strong>c)</strong> funds_raised_millions</span>
</p>
<br/><br/>
<p align="center">
	<strong>Table 1.</strong> Descriptive statistic of total_laid_off, percentage_laid_off and fund_raised_millions</span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_descriptive_stats.jpg"  width="700"/>
</p>
<br/>

<strong>Figure 4</strong> is a pie chart illustrating the top 9 industries with the most layoffs, with the remaining industries combined into a new category labeled 'Others.' The 'Other' category in the dataset had the third-highest number of layoffs and was also merged into 'Others' (<strong>Table 2</strong>). <strong>Table 3</strong> shows the top 10 companies with the most layoffs and their respective industries. Amazon had the highest number of layoffs, with its industry, Retail, ranking second (<strong>Figure 4</strong>). Amazon's layoffs make up 40% of the total layoffs in the Retail industry. Google and Meta had the second and third highest layoffs, with their industry, Consumer, ranking first among industries with the most layoffs. Combined, Google and Meta account for 51% of the total layoffs in their respective industries. The transparency and accessibility of the information on layoffs for bigger companies like Amazon and Google may have contributed to their large fractions of reported layoffs in the industry. The other top companies' industries—Sales, Healthcare, Transportation, Hardware, Travel, and Other from (<strong>Table 2</strong>)—are also among the top 10 industries, suggesting that all top 10 companies contribute significantly to the total layoffs within their industries. On the other hand, the layoffs in the remaining top 10 industries are likely contributed by multiple smaller companies.

<br/>
Additionally, we can delve deeper by examining the specific occupations affected in each reported layoff case. It would also be valuable to study the correlation between industries and occupations within them. For instance, software developers in the Retail industry (e.g., Amazon) may have been laid off more frequently than software developers in the Consumer industry (e.g., Google).
<br/><br/>

<p align="center">
	<strong>Table 2. Top 9 industries with the most layoffs before merging 'Other' industry into 'Others'</strong></span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/industry.jpg"  width="300"/>
</p>
<br/>

<p align="center"> 
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/industry_pie.jpg"  width = "500"/>
	<br/>
	<strong>Figure 4.</strong> Pie chart of 9 industries with the most layoffs</span>
</p>
<br/>

<p align="center">
	<strong>Table 3. Top 10 companies with the most layoffs and their industries </strong></span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/company_industry.jpg"  width="400"/>
</p>
<br/>

<strong>Table 4</strong> shows the top 5 companies with the most layoffs and the number of layoffs in each year from 2020 to 2023. Amazon ranked second with a total of 10,150 layoffs in 2022 and fourth with 8,000 total layoffs in 2023, which is consistent with its position the company with the most layoffs in retail from 2020 to 2023. Similary, all 10 companies with the most layoffs and their industries from 2020 to 2023 in <strong>Table 3</strong> are also in <strong>Table 4</strong>.
<br/>

<p align="center">
	<strong>Table 4. Top 5 companies with the most layoffs in each year from 2020 to 2023 with the number of layoffs in parantheses</strong></span>	
	<br/>
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/year_top5.jpg"  width="800"/>
</p>
<br/>

A total of approximately 240,000 layoffs were recorded from companies in the post-IPO funding stage, while around 59,000 layoffs were reported from companies in Series D or beyond, as shown in Figure 5. This indicates that most of the layoffs in the dataset are concentrated among more established companies. This trend makes sense, as companies that receive more funding typically become more stabilized, which often leads to a larger workforce. Consequently, these organizations may also have a greater number of employees to lay off during restructuring or downsizing efforts.

See <a href="https://www.indeed.com/career-advice/career-development/startup-funding-stages">Indeed</a> for details on different stages of funding
<p align="center"> 
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/stage_bar.jpg"  width = "700"/>
	<br/>
	<strong>Figure 5.</strong> total_laid_off by stage (of funding) </span>
</p>

## Conclusion and Future Work

In summary, this analysis of the global tech layoff dataset from March 11, 2020, to July 20, 2024, highlights significant trends and insights regarding layoffs across various companies and industries. The exploratory data analysis conducted using SQL and Power BI revealed that most layoffs were reported in North America, particularly in the United States, and that many layoffs occurred after January 2022. The histograms demonstrated that the distribution of layoffs and funding raised was skewed, with many cases involving fewer layoffs and lower funding amounts.
<br/><br/>
The findings also indicated that larger companies like Amazon, Google, and Meta have been significant contributors to layoffs in their respective industries. This trend emphasizes the importance of considering company size and funding stage when analyzing layoffs, as larger, well-funded organizations often have a larger workforce and more layoffs during restructuring. Future analyses could focus on the specific occupations affected by layoffs and explore potential correlations between industry sectors and job roles.
<br/><br/>
Overall, while the dataset provides valuable insights into layoffs in the tech industry, it also suggests limitations in generalizability due to its focus on larger companies and certain geographical areas.
