select * from [dbo].[Ecommerce_Project]

----who are our top 10 customers, what is their purchase frequency and how much have they spent?

SELECT TOP 10
Ecommerce_Project.Customer_ID, 
Ecommerce_Project.Frequency_of_Purchase,
Sum(Purchase_Amount) as Total_Spent
from Ecommerce_Project
Group by Ecommerce_Project.Customer_ID, 
Ecommerce_Project.Frequency_of_Purchase
Order by Total_Spent DESC;

-----What is the average purchase amount by gender?

SELECT Gender,  
AVG(Purchase_Amount) as AVGAmount_Spent
From Ecommerce_Project
Group BY Gender
Order By AVGAmount_Spent DESC;


---- What are the top 10 best purchase catergory by gender?

select Top 10
Ecommerce_Project.Gender, 
Ecommerce_Project.Purchase_Category, 
Count(Purchase_category) as Count_of_Category
from Ecommerce_Project
Group By Ecommerce_Project.Gender, Ecommerce_Project.Purchase_Category
Order By Count_of_Category DESC;

----Which device and Payment method is more used by customers?

SELECT Device_Used_for_Shopping, Payment_Method,
Count(*) AS Count_of_Payment_Frequency,
Sum(Purchase_Amount) as Total_Revenue
From Ecommerce_Project
Group BY Device_Used_for_Shopping, Payment_Method
order by Total_Revenue DESC;

----what is the top 10 months that has the highest Ads engagemnt, how much was spent by customer and what category was bought more

SELECT Top 10
Ecommerce_Project.Months, Purchase_Category, Engagement_with_Ads,
SUM(Purchase_Amount) as Total_Revenue
From Ecommerce_Project
Where Engagement_with_Ads = 'High'
Group by Ecommerce_Project.Months,
Purchase_Category, Engagement_with_Ads
Order by Total_Revenue DESC;

----How does Purchase intent affect purchase frequnecy and amount spent?

Select Purchase_Category, Frequency_of_Purchase, Purchase_Intent, 
SUM(Purchase_Amount) as Total_Revenue
From Ecommerce_Project
Group BY Frequency_of_Purchase, Purchase_Intent,Purchase_Category
Order by Total_Revenue desc;

-----what is the average amount spent by differnt age brackets?

SELECT
	CASE
      WHEN Age Between 18 and 25 THEN '18-25'
      WHEN Age Between 26 and 35 THEN '26-35'
	  WHEN Age Between 36 and 45 THEN '36-45'
	  ELSE '46+' END AS Age_Bracket,
  AVG(Purchase_Amount) as AVG_Total_Spent
From Ecommerce_Project
Group BY
	CASE
      WHEN Age Between 18 and 25 THEN '18-25'
	  WHEN Age Between 26 and 35 THEN '26-35'
	  WHEN Age Between 36 and 45 THEN '36-45'
	  ELSE '46+'
	  END
ORDER BY AVG_Total_Spent DESC;

---What are the top 10 purchase categories and how does customer satisfaction vary across high-spending categories?

SELECT Top 10
Purchase_Category, Customer_Satisfaction, 
Count(Frequency_of_Purchase) as Purchase_Frequency,
SUM(Purchase_Amount) AS Total_Spent
From Ecommerce_Project
Group By Purchase_Category,Customer_Satisfaction
Order By Total_Spent DESC;

