USE RRHH_DWH;

DELIMITER $$

CREATE PROCEDURE load_HR_dimensions()
BEGIN

    INSERT INTO dim_office (oltp_office_id, city, country, address)
    SELECT id, city, country, address FROM RRHH_OLTP.office;

    INSERT INTO dim_absence_type (description)
    VALUES ('Vacaciones'), ('Enfermedad'), ('Permiso Personal'), ('Licencia Médica');

    INSERT INTO dim_empowerment (oltp_empowerment_id, course_name, supplier)
    SELECT id, name, supplier FROM RRHH_OLTP.empowerment;

    INSERT INTO dim_employee (oltp_employee_id, full_name, gender, position_name, salary_level, department_name)
    SELECT 
        e.id, 
        CONCAT(e.first_name, ' ', e.last_name), 
        e.gender, 
        p.name, 
        p.level, 
        d.name
    FROM RRHH_OLTP.employee e
    JOIN RRHH_OLTP.title p ON e.title_id = p.id
    JOIN RRHH_OLTP.department d ON e.department_id = d.id;

    INSERT INTO ETL_control (process_name, uploaded_records, state)
    VALUES ('Load_Dimensions', (SELECT COUNT(*) FROM dim_employee), 'Success');
    
END$$

DELIMITER ;

CALL load_HR_dimensions();