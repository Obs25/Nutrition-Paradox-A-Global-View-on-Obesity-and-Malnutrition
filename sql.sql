-- OBESITY QUERIES

-- 1. Top 5 regions with highest average obesity levels in 2022
SELECT Region, AVG(Mean_Estimate) AS Avg_Obesity
FROM obesity
WHERE Year = 2022
GROUP BY Region
ORDER BY Avg_Obesity DESC
LIMIT 5;

-- 2. Top 5 countries with highest obesity estimates
SELECT Country, MAX(Mean_Estimate) AS Max_Obesity
FROM obesity
GROUP BY Country
ORDER BY Max_Obesity DESC
LIMIT 5;

-- 3. Obesity trend in India over the years
SELECT Year, AVG(Mean_Estimate) AS Avg_Obesity
FROM obesity
WHERE Country = 'India'
GROUP BY Year
ORDER BY Year;

-- 4. Average obesity by gender
SELECT Gender, AVG(Mean_Estimate) AS Avg_Obesity
FROM obesity
GROUP BY Gender;

-- 5. Country count by obesity level category and age group
SELECT Obesity_Level, Age_Group, COUNT(DISTINCT Country) AS Country_Count
FROM obesity
GROUP BY Obesity_Level, Age_Group;

-- 6. Top 5 least reliable countries (highest CI_Width)
SELECT Country, AVG(CI_Width) AS Avg_CI
FROM obesity
GROUP BY Country
ORDER BY Avg_CI DESC
LIMIT 5;

-- 7. Top 5 most consistent countries (lowest CI_Width)
SELECT Country, AVG(CI_Width) AS Avg_CI
FROM obesity
GROUP BY Country
ORDER BY Avg_CI ASC
LIMIT 5;

-- 8. Average obesity by age group
SELECT Age_Group, AVG(Mean_Estimate) AS Avg_Obesity
FROM obesity
GROUP BY Age_Group;

-- 9. Top 10 countries with consistently low obesity
SELECT Country, AVG(Mean_Estimate) AS Avg_Obesity, AVG(CI_Width) AS Avg_CI
FROM obesity
GROUP BY Country
HAVING Avg_Obesity < 25 AND Avg_CI < 3
ORDER BY Avg_Obesity
LIMIT 10;

-- 10. Countries where female obesity exceeds male by large margin
SELECT a.Country, a.Year, (a.Mean_Estimate - b.Mean_Estimate) AS Gender_Gap
FROM obesity a
JOIN obesity b ON a.Country = b.Country AND a.Year = b.Year
WHERE a.Gender = 'Female' AND b.Gender = 'Male'
HAVING Gender_Gap > 5
ORDER BY Gender_Gap DESC;


-- MALNUTRITION QUERIES

-- 1. Average malnutrition by age group
SELECT Age_Group, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM malnutrition
GROUP BY Age_Group;

-- 2. Top 5 countries with highest malnutrition
SELECT Country, MAX(Mean_Estimate) AS Max_Malnutrition
FROM malnutrition
GROUP BY Country
ORDER BY Max_Malnutrition DESC
LIMIT 5;

-- 3. Malnutrition trend in Africa region
SELECT Year, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM malnutrition
WHERE Region = 'Africa'
GROUP BY Year
ORDER BY Year;

-- 4. Gender-based average malnutrition
SELECT Gender, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM malnutrition
GROUP BY Gender;

-- 5. Average CI_Width by malnutrition level and age group
SELECT Malnutrition_Level, Age_Group, AVG(CI_Width) AS Avg_CI
FROM malnutrition
GROUP BY Malnutrition_Level, Age_Group;

-- 6. Yearly malnutrition change for India, Nigeria, Brazil
SELECT Country, Year, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM malnutrition
WHERE Country IN ('India', 'Nigeria', 'Brazil')
GROUP BY Country, Year
ORDER BY Country, Year;

-- 7. Regions with lowest average malnutrition
SELECT Region, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM malnutrition
GROUP BY Region
ORDER BY Avg_Malnutrition
LIMIT 5;

-- 8. Countries with increasing malnutrition
SELECT Country, MAX(Mean_Estimate) - MIN(Mean_Estimate) AS Increase
FROM malnutrition
GROUP BY Country
HAVING Increase > 0
ORDER BY Increase DESC;

-- 9. Year-wise min/max malnutrition levels
SELECT Year, MIN(Mean_Estimate) AS Min_Level, MAX(Mean_Estimate) AS Max_Level
FROM malnutrition
GROUP BY Year
ORDER BY Year;

-- 10. Countries with high CI_Width (monitoring required)
SELECT Country, Year, CI_Width
FROM malnutrition
WHERE CI_Width > 5
ORDER BY CI_Width DESC;


-- COMBINED QUERIES

-- 1. Obesity vs Malnutrition comparison (5 countries)
SELECT o.Country, AVG(o.Mean_Estimate) AS Obesity, AVG(m.Mean_Estimate) AS Malnutrition
FROM obesity o
JOIN malnutrition m ON o.Country = m.Country AND o.Year = m.Year
WHERE o.Country IN ('India', 'USA', 'Brazil', 'Nigeria', 'Bangladesh')
GROUP BY o.Country;

-- 2. Gender-based disparity in both datasets
SELECT o.Gender, AVG(o.Mean_Estimate) AS Obesity, AVG(m.Mean_Estimate) AS Malnutrition
FROM obesity o
JOIN malnutrition m ON o.Gender = m.Gender AND o.Year = m.Year
GROUP BY o.Gender;

-- 3. Region-wise avg estimates (Africa and Americas)
SELECT o.Region, AVG(o.Mean_Estimate) AS Obesity, AVG(m.Mean_Estimate) AS Malnutrition
FROM obesity o
JOIN malnutrition m ON o.Region = m.Region AND o.Year = m.Year
WHERE o.Region IN ('Africa', 'Americas Region')
GROUP BY o.Region;

-- 4. Countries with obesity up & malnutrition down
SELECT o.Country, MAX(o.Mean_Estimate) - MIN(o.Mean_Estimate) AS Obesity_Change,
       MIN(m.Mean_Estimate) - MAX(m.Mean_Estimate) AS Malnutrition_Change
FROM obesity o
JOIN malnutrition m ON o.Country = m.Country AND o.Year = m.Year
GROUP BY o.Country
HAVING Obesity_Change > 0 AND Malnutrition_Change > 0;

-- 5. Age-wise trend comparison
SELECT o.Age_Group, AVG(o.Mean_Estimate) AS Avg_Obesity, AVG(m.Mean_Estimate) AS Avg_Malnutrition
FROM obesity o
JOIN malnutrition m ON o.Age_Group = m.Age_Group AND o.Year = m.Year
GROUP BY o.Age_Group;
