USE RRHH_DWH;

DELIMITER $$

DROP PROCEDURE IF EXISTS load_facts; $$

CREATE PROCEDURE load_facts()
BEGIN

    INSERT INTO fact_absences (sk_employee, sk_office, sk_time_start, sk_absence_type, total_days, is_justified)
    SELECT 
        de.sk_employee, do.sk_office, REPLACE(a.start_date, '-', ''), 
        dat.sk_absence_type, a.total_days, a.is_justificated
    FROM RRHH_OLTP.absence a
    JOIN dim_employee de ON a.employee_id = de.oltp_employee_id
    JOIN RRHH_OLTP.employee e ON e.id = a.employee_id
    JOIN dim_office do ON e.office_id = do.oltp_office_id
    JOIN dim_absence_type dat ON a.type = dat.description;

    INSERT INTO fact_performance (sk_employee, sk_time, performance_rate)
    SELECT 
        de.sk_employee, REPLACE(DATE(ev.creation_date), '-', ''), ev.rate
    FROM RRHH_OLTP.evaluation ev
    JOIN dim_employee de ON ev.employee_id = de.oltp_employee_id;

    INSERT INTO fact_training (sk_employee, sk_empowerment, sk_time, final_rate, training_cost)
    SELECT 
        de.sk_employee, dp.sk_empowerment, REPLACE(DATE(ee.creation_date), '-', ''), 
        ee.rate, p.cost
    FROM RRHH_OLTP.employee_empowerment ee
    JOIN dim_employee de ON ee.employee_id = de.oltp_employee_id
    JOIN dim_empowerment dp ON ee.empowerment_id = dp.oltp_empowerment_id
    JOIN RRHH_OLTP.empowerment p ON ee.empowerment_id = p.id;

    INSERT INTO fact_payroll (sk_employee, sk_office, sk_time_hired, monthly_salary)
    SELECT 
        de.sk_employee, do.sk_office, REPLACE(e.hire_date, '-', ''), e.salary
    FROM RRHH_OLTP.employee e
    JOIN dim_employee de ON e.id = de.oltp_employee_id
    JOIN dim_office do ON e.office_id = do.oltp_office_id;

    INSERT INTO ETL_control (process_name, uploaded_records, state)
    VALUES ('load_facts', (SELECT COUNT(*) FROM fact_absences), 'Success');
END$$

DELIMITER ;

CALL load_facts();