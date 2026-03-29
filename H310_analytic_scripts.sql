USE RRHH_DWH;

SELECT department_name, ROUND(AVG(performance_rate), 2) as Avg_Performance
FROM fact_performance fp JOIN dim_employee de ON fp.sk_employee = de.sk_employee
GROUP BY department_name;

SELECT o.city, SUM(a.total_days) as Total_Absence_Days
FROM fact_absences a JOIN dim_office o ON a.sk_office = o.sk_office
GROUP BY o.city;

SELECT de.full_name, ft.final_rate
FROM fact_training ft JOIN dim_employee de ON ft.sk_employee = de.sk_employee
ORDER BY final_rate DESC LIMIT 5;

SELECT d.supplier, SUM(ft.training_cost) as Total_Investment
FROM fact_training ft JOIN dim_empowerment d ON ft.sk_empowerment = d.sk_empowerment
GROUP BY d.supplier;

SELECT t.year, COUNT(*) as New_Hires
FROM fact_payroll fp JOIN dim_time t ON fp.sk_time_hired = t.sk_time
GROUP BY t.year;

SELECT is_justified, COUNT(*) * 100 / (SELECT COUNT(*) FROM fact_absences) as Percentage
FROM fact_absences GROUP BY is_justified;

SELECT de.salary_level, ROUND(AVG(fp.monthly_salary), 0) as Avg_Salary
FROM fact_payroll fp JOIN dim_employee de ON fp.sk_employee = de.sk_employee
GROUP BY de.salary_level;

SELECT de.department_name, SUM(fa.total_days) as Days_Lost
FROM fact_absences fa JOIN dim_employee de ON fa.sk_employee = de.sk_employee
GROUP BY de.department_name ORDER BY Days_Lost DESC;

SELECT de.gender, AVG(fp.performance_rate) as Avg_Rate
FROM fact_performance fp JOIN dim_employee de ON fp.sk_employee = de.sk_employee
GROUP BY de.gender;

SELECT t.year, t.month_name, SUM(fp.monthly_salary) as Total_Payroll
FROM fact_payroll fp JOIN dim_time t ON fp.sk_time_hired = t.sk_time
GROUP BY t.year, t.month_name, t.month ORDER BY t.year, t.month;

SELECT full_name FROM dim_employee 
WHERE sk_employee NOT IN (SELECT sk_employee FROM fact_absences);

SELECT do.city, AVG(fp.performance_rate) as Office_Score
FROM fact_performance fp 
JOIN dim_employee de ON fp.sk_employee = de.sk_employee
JOIN fact_payroll pay ON de.sk_employee = pay.sk_employee
JOIN dim_office do ON pay.sk_office = do.sk_office
GROUP BY do.city ORDER BY Office_Score DESC;

SELECT t.year, t.quarter, COUNT(*) as Trainings_Done
FROM fact_training ft JOIN dim_time t ON ft.sk_time = t.sk_time
GROUP BY t.year, t.quarter;

SELECT de.full_name, pay.monthly_salary, AVG(perf.performance_rate) as Avg_Perf
FROM dim_employee de
JOIN fact_payroll pay ON de.sk_employee = pay.sk_employee
JOIN fact_performance perf ON de.sk_employee = perf.sk_employee
GROUP BY de.full_name, pay.monthly_salary;

SELECT * FROM ETL_control ORDER BY ejecution_date DESC;