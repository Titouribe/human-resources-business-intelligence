USE RRHH_DWH;

SELECT 'dim_employee Nulls' AS Validation, COUNT(*) FROM dim_employee WHERE sk_employee IS NULL;

SELECT 'Employee Count Match' AS Validation, 
       (SELECT COUNT(*) FROM RRHH_OLTP.employee) AS OLTP_Total,
       (SELECT COUNT(*) FROM dim_employee) AS DWH_Total;

SELECT 'absence Orphans' AS Validation, COUNT(*) FROM fact_absences WHERE sk_employee NOT IN (SELECT sk_employee FROM dim_employee);

SELECT 'Invalid performance Rates' AS Validation, COUNT(*) FROM fact_performance WHERE performance_rate < 1.0 OR performance_rate > 5.0;

SELECT 'payroll Date Nulls' AS Validation, COUNT(*) FROM fact_payroll WHERE sk_time_hired IS NULL;

SELECT 'Total Salary Match' AS Validation,
       (SELECT SUM(salary) FROM RRHH_OLTP.employee) AS OLTP_Sum,
       (SELECT SUM(monthly_salary) FROM fact_payroll) AS DWH_Sum;

SELECT 'Missing absence Types' AS Validation, COUNT(*) 
FROM (SELECT DISTINCT type FROM RRHH_OLTP.absence) a 
LEFT JOIN dim_absence_type d ON a.type = d.description WHERE d.description IS NULL;

SELECT 'Successful ETL Processes' AS Validation, COUNT(*) FROM ETL_control WHERE state = 'Success';

SELECT 'Time Dim Completeness' AS Validation, COUNT(*) FROM dim_time WHERE year = 2024;

SELECT 'Negative training Costs' AS Validation, COUNT(*) FROM fact_training WHERE training_cost < 0;