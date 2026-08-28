# Indian_cancer_patients_2022_2025-_data

## Project Overview

This project analyzes an India Cancer Patients Dataset (2022–2025) using SQL to uncover patterns in cancer diagnosis, patient demographics, treatment effectiveness, survival outcomes, mortality rates, and hospital performance.

The objective of this project is to demonstrate practical SQL skills while generating meaningful healthcare insights from real-world patient data.

---

## Objectives

* Analyze cancer patient demographics across India.
* Identify the most common cancer types.
* Evaluate treatment effectiveness based on survival outcomes.

---

## Tools & Technologies

* SQL
* MySQL Workbench
* GitHub
* Kaggle Dataset

---

## Dataset Information

The dataset contains information about cancer patients treated between 2022 and 2025.

### Key Attributes

* Patient ID
* Age
* Gender
* Cancer Type
* Cancer Stage
* Treatment Type
* Hospital Name
* City
* Survival Months
* Patient Status (Alive/Deceased)

---

## Database Structure

### Table: india_cancer_patients_2022_2025

| Column Name     | Description                               |
| --------------- | ----------------------------------------- |
| patient_id      | Unique identifier for each patient        |
| age             | Patient age                               |
| gender          | Male/Female                               |
| cancer_type     | Type of cancer diagnosed                  |
| stage           | Cancer stage                              |
| treatment_type  | Treatment received                        |
| hospital_name   | Hospital providing treatment              |
| city            | Patient location                          |
| survival_months | Number of months survived after diagnosis |
| status          | Alive or Deceased                         |

---

## SQL Concepts Used

This project demonstrates:

* SELECT Statements
* WHERE Clause
* ORDER BY
* GROUP BY
* HAVING Clause
* Aggregate Functions

  * COUNT()
  * AVG()
  * MIN()
  * MAX()
* CASE Statements
* Window Functions
* Ranking Functions
* Business Analysis Queries

---

## Business Questions Solved

### 1. Which cancer types have the highest number of patients?

### 2. What is the gender distribution among cancer patients?

### 3. Which age group is most affected by cancer?

### 4. Which treatment type provides the highest average survival months?

---

## Key Insights

* Certain cancer types account for a significant portion of total cases.
* Mortality rates vary considerably across different cancer types.
* Early-stage cancer patients generally demonstrate longer survival periods.
* Treatment effectiveness differs based on cancer type and stage.
* Some hospitals consistently achieve better patient outcomes.
* Senior citizens represent a substantial share of cancer patients.
* Survival duration is strongly influenced by treatment choice and cancer stage.

---

## Sample Queries

### Calculate Mortality Percentage by Cancer Type

```sql
SELECT cancer_type,
       ROUND(
       SUM(CASE WHEN status = 'Deceased' THEN 1 ELSE 0 END)
       * 100.0 / COUNT(*), 2) AS mortality_percentage
FROM india_cancer_patients_2022_2025
GROUP BY cancer_type;
```

### Rank Hospitals by Number of Patients Treated

```sql
SELECT hospital_name,
       COUNT(*) AS total_patients,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS hospital_rank
FROM india_cancer_patients_2022_2025
GROUP BY hospital_name;
```

---

## Skills Demonstrated

* Data Cleaning
* Data Exploration
* SQL Query Writing
* Healthcare Data Analysis
* Business Problem Solving
* Analytical Thinking

---

## Project Outcome

This project strengthened practical SQL skills by solving real-world healthcare analytics problems and transforming patient data into meaningful insights that can support data-driven decision-making.

---

## Author

**Divyanshi Sagal**

---

⭐ If you found this project useful, consider giving it a star on GitHub!
