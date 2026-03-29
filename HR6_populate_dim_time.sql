USE RRHH_DWH;

DELIMITER $$

CREATE PROCEDURE populate_dim_time(IN start_date DATE, IN end_date DATE)
BEGIN
    DECLARE current_date_var DATE;
    SET current_date_var = start_date;
    
    WHILE current_date_var <= end_date DO
        INSERT INTO dim_time (
            sk_time,
            full_date,
            year,
            month,
            month_name,
            day,
            quarter,
            day_of_week
        ) VALUES (
            REPLACE(current_date_var, '-', ''), -- ID format YYYYMMDD
            current_date_var,
            YEAR(current_date_var),
            MONTH(current_date_var),
            MONTHNAME(current_date_var),
            DAY(current_date_var),
            QUARTER(current_date_var),
            DAYNAME(current_date_var)
        );
        SET current_date_var = DATE_ADD(current_date_var, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

CALL populate_dim_time('2010-01-01', '2030-12-31');

SELECT * FROM dim_time LIMIT 10;