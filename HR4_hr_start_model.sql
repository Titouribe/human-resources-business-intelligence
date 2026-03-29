USe RRHH_DWH;

CREATE TABLE dim_time (
    sk_time INT PRIMARY KEY,
    full_date Date NOT NULL,
    year INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    quarter INT,
    day_of_week VARCHAR(20)
);

CREATE TABLE dim_employee (
    sk_employee INT AUTO_INCREMENT PRIMARY KEY,
    oltp_employee_id INT, 
    full_name VARCHAR(255),
    gender VARCHAR(20),
    position_name VARCHAR(100),
    salary_level VARCHAR(50),
    department_name VARCHAR(100)
);

CREATE TABLE dim_office (
    sk_office INT AUTO_INCREMENT PRIMARY KEY,
    oltp_office_id INT,
    city VARCHAR(100),
    country VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE dim_absence_type (
    sk_absence_type INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100)
);

CREATE TABLE dim_empowerment (
    sk_empowerment INT AUTO_INCREMENT PRIMARY KEY,
    oltp_empowerment_id INT,
    course_name VARCHAR(150),
    supplier VARCHAR(100)
);