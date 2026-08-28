-- This query shows all records from the cancer patients table
SELECT * 
FROM cancer_patients ;
-- This query shows only patient_id, age, and gender
SELECT patient_id, age, gender
FROM cancer_patients ;
-- This query shows all female patients. 
SELECT *
FROM cancer_patients
WHERE gender = "Female" ;
-- This query shows patients whose age is greater than 60.
SELECT *
FROM cancer_patients
WHERE age > 60 ; 
-- This query shows patients who are alive.
SELECT *
FROM cancer_patients
WHERE status = "Alive" ; 
-- This query shows patients diagnosed with Breast Cancer.
SELECT *
FROM cancer_patients
WHERE cancer_type = "Breast Cancer" ;
--  This query shows patients whose survival months are greater than 24.
SELECT *
FROM cancer_patients
WHERE survival_months > 24 ;
-- This query shows unique cancer types available in the dataset.
SELECT DISTINCT cancer_type
FROM cancer_patients ;
-- This query shows unique cities where patients belong.
SELECT DISTINCT city
FROM cancer_patients ;  
-- This query count total number of patients in the dataset. 
SELECT COUNT(*) AS total_patients
FROM cancer_patients ;


-- This query shows patients aged between 30 and 50.
SELECT *
FROM cancer_patients
WHERE age BETWEEN 30 AND 50 ; 
-- This query shows patients whose cancer stage is Stage III.
SELECT *
FROM cancer_patients
WHERE stage = "Stage III" ;
-- This query shows patients treated using Chemotherapy.
SELECT *
FROM cancer_patients
WHERE treatment_type = "Chemotherapy" ;
-- This query shows all patients from Mumbai.
SELECT *
FROM cancer_patients
WHERE city = "Mumbai" ; 
-- This query shows patients whose survival months are less than 12.
SELECT *
FROM cancer_patients
WHERE survival_months  < 12 ; 
-- This query shows all alive patients sorted by age descending.
SELECT *
FROM cancer_patients
WHERE status = "Alive"
ORDER BY age DESC ; 
-- This query shows patients whose age is not between 20 and 40.
SELECT *
FROM cancer_patients
WHERE age NOT BETWEEN 20 AND 40 ;
-- This query shows patients belonging to either Delhi or Bangalore.
SELECT *
FROM cancer_patients
WHERE city = "Delhi" OR city = "Bangalore" ;
-- This query shows patients diagnosed with Lung Cancer or Colon Cancer.
SELECT *
FROM cancer_patients
WHERE cancer_type = "Lung Cancer" OR  cancer_type = "Colon Cancer" ;  
-- This query shows the top 10 oldest patients.
SELECT *
FROM cancer_patients
ORDER BY age DESC
LIMIT 10 ; 
-- This query calculate the average age of all patients.
SELECT AVG(age) AS avg_age
FROM cancer_patients ;
-- This query shows maximum survival months recorded.
SELECT MAX(survival_months) AS max_survival_month
FROM cancer_patients ; 
-- This query shows minimum survival months recorded.
SELECT MIN(survival_months) AS min_survival_month 
FROM cancer_patients ;
-- This query count the number of male and female patients. 
SELECT COUNT(*) AS total_patients, gender 
FROM cancer_patients
GROUP BY gender ;
-- This query shows average survival months by gender.
SELECT AVG(survival_months) as avg_survival_months, gender
FROM cancer_patients
GROUP BY gender ; 
-- This query count patients in each cancer type.
SELECT COUNT(*) AS total_patients, cancer_type
FROM cancer_patients
GROUP BY cancer_type ;
-- This query count patients in each treatment type. 
SELECT COUNT(*) AS total_patients, treatment_type
FROM cancer_patients
GROUP BY treatment_type ;
-- This query shows total number of alive and deceased patients. 
SELECT COUNT(*) AS total_patients, status
FROM cancer_patients
GROUP BY status ;
-- This query shows average age for each cancer type.
SELECT AVG(age) AS avg_age, cancer_type 
FROM cancer_patients
GROUP BY cancer_type ;
-- This query shows highest survival months for each cancer type.
SELECT MAX(survival_months)AS max_survival_months, cancer_type
FROM cancer_patients
GROUP BY cancer_type ;
-- This query shows the number of patients in each city.
SELECT COUNT(*) AS total_patients, city
FROM cancer_patients
GROUP BY city ;
-- This query shows hospitals treating more than 50 patients.
SELECT COUNT(*) AS total_patients, hospital_name
FROM cancer_patients
GROUP BY hospital_name
HAVING total_patients > 50 ;
-- This query shows cancer types with more than 100 patients.
SELECT COUNT(*) AS total_patients, cancer_type 
FROM cancer_patients
GROUP BY cancer_type
HAVING total_patients > 100 ;
-- This query shows average survival months by treatment type.
SELECT AVG(survival_months) AS avg_survival_months, treatment_type
FROM cancer_patients
GROUP BY treatment_type ;
-- This query shows cities where average patient age is above 50.
SELECT AVG(age) AS avg_age, city
FROM cancer_patients
GROUP BY city
HAVING avg_age > 50 ;
-- This query shows stages having more than 200 patients.
SELECT stage, COUNT(*) AS total_patients
FROM cancer_patients
GROUP BY stage
HAVING total_patients > 200 ;
-- This query shows average survival months for each stage.
SELECT AVG(survival_months) AS avg_survival_months, stage
FROM cancer_patients
GROUP BY stage ;
-- This query shows hospitals with average survival months greater than 20.
SELECT hospital_name, AVG(survival_months) AS avg_survival_months
FROM cancer_patients
GROUP BY hospital_name
HAVING avg_survival_months > 20 ;
-- This query shows treatment types having average survival greater than 15 months.
SELECT  treatment_type, AVG(survival_months) AS avg_survival_months
FROM cancer_patients
GROUP BY treatment_type
HAVING avg_survival_months > 15 ;
-- This query shows cancer types with mortality count greater than 50.
SELECT  cancer_type, COUNT(*) AS  mortality_count
FROM cancer_patients
WHERE status = "Deceased"
GROUP BY cancer_type
HAVING   mortality_count > 50 ;
-- Create an age group column:
-- 0–18 → Child
-- 19–40 → Young Adult
-- 41–60 → Adult
-- Above 60 → Senior
-- Count patients in each group.
SELECT 
CASE 
    WHEN age <= 18 THEN "Child"
    WHEN age BETWEEN 19 AND 40 THEN "Young Adult"
    WHEN age BETWEEN 41 AND 60 THEN "Adult"
    ELSE "Senior"
END AS age_group, COUNT(*) AS total_patients
FROM cancer_patients 
GROUP BY age_group ;
-- Classify survival:
-- < 12 months → Low
-- 12–24 months → Medium
-- 24 months → High
-- Count patients in each category.
SELECT 
CASE
    WHEN survival_months < 12 THEN "Low"
    WHEN survival_months BETWEEN 12 AND 24 THEN "Medium"
	ELSE "High"
END AS category, COUNT(*) AS count_patients
FROM cancer_patients   
GROUP BY category ;
-- Create a mortality flag:
-- Alive → 0
-- Deceased → 1
-- Display all patients.
SELECT status,
CASE
    WHEN status = "Alive" THEN 0
    WHEN status = "Deceased" THEN 1
END AS mortality_flag
FROM cancer_patients ;
-- This query shows average survival months for Alive vs Deceased patients.
SELECT AVG(survival_months) AS survival_months, status
FROM cancer_patients
GROUP BY status ;
-- This query shows both deaths and mortality percentage by cancer type.  
SELECT cancer_type,  
SUM(CASE WHEN status = "Deceased" THEN 1 ELSE 0 END) AS death_patients,
ROUND(SUM(CASE WHEN status = "Deceased" THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS mortality_percentage
FROM cancer_patients
GROUP BY cancer_type
ORDER BY mortality_percentage DESC ;
-- Rank hospitals based on the number of patients treated using RANK().
SELECT COUNT(*) AS total_patients, hospital_name,
DENSE_RANK() OVER(ORDER BY  COUNT(*) DESC) AS rn
FROM cancer_patients
GROUP BY hospital_name ;
-- Find the top 3 hospitals with the highest average survival months using window functions.
SELECT AVG(survival_months) AS avg_survival_months, hospital_name,
ROW_NUMBER() OVER(ORDER BY AVG(survival_months) DESC) AS rn
FROM cancer_patients
GROUP BY hospital_name
LIMIT 3 ; 

 

 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




