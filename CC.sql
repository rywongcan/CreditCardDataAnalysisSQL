SET SQL_SAFE_UPDATES = 0;

-- Import our dataset into SQL
SELECT *
FROM cc.crecarddataset
ORDER BY Customer_Age;

-- Check if there's any null value
SELECT *
FROM cc.crecarddataset
WHERE Customer_Age IS NULL
	OR Attrition_Flag IS NULL
    OR ClientID IS NULL
	OR Gender IS NULL
	OR Dependent_count IS NULL
	OR Education_Level IS NULL
	OR Marital_Status IS NULL
	OR Income_Category IS NULL
	OR Card_Category IS NULL
	OR Months_on_book IS NULL
	OR Total_Relationship_Count IS NULL
	OR Months_Inactive_12_mon IS NULL
	OR Contacts_Count_12_mon IS NULL
	OR Credit_Limit IS NULL
	OR Total_Revolving_Bal IS NULL
	OR Avg_Open_To_Buy IS NULL
	OR Total_Amt_Chng_Q4_Q1 IS NULL
	OR Total_Trans_Amt IS NULL
	OR Total_Trans_Ct IS NULL
	OR Total_Ct_Chng_Q4_Q1 IS NULL
	OR Avg_Utilization_Ratio IS NULL;
    
-- Check the data type of table columns.
DESCRIBE cc.crecarddataset;

-- Data Cleaning Process, Rename the column make it easier to understand
ALTER TABLE cc.crecarddataset
RENAME COLUMN CLIENTNUM to ClientID;

-- Rename the value from Income_Category
UPDATE cc.crecarddataset
SET Income_Category = "<$40k"
WHERE Income_Category = "Less than $40k";

-- We can check the distribution of customers by age
SELECT Customer_Age, COUNT(*)
FROM cc.crecarddataset
GROUP BY Customer_Age
HAVING COUNT(*) > 1;






