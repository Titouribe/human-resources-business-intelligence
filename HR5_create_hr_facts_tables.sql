USE RRHH_DWH;

CREATE TABLE fact_absences (
    sk_employee INT,
    sk_office INT,
    sk_time_start INT,
    sk_absence_type INT,
    total_days INT,
    is_justified TINYINT(1),
    FOREIGN KEY (sk_employee) REFERENCES dim_employee(sk_employee),
    FOREIGN KEY (sk_office) REFERENCES dim_office(sk_office),
    FOREIGN KEY (sk_time_start) REFERENCES dim_time(sk_time),
    FOREIGN KEY (sk_absence_type) REFERENCES dim_absence_type(sk_absence_type)
);

CREATE TABLE fact_performance (
    sk_employee INT,
    sk_time INT,
    performance_rate DECIMAL(3,2),
    FOREIGN KEY (sk_employee) REFERENCES dim_employee(sk_employee),
    FOREIGN KEY (sk_time) REFERENCES dim_time(sk_time)
);

CREATE TABLE fact_training (
    sk_employee INT,
    sk_empowerment INT,
    sk_time INT,
    final_rate INT,
    training_cost DECIMAL(10,2),
    FOREIGN KEY (sk_employee) REFERENCES dim_employee(sk_employee),
    FOREIGN KEY (sk_empowerment) REFERENCES dim_empowerment(sk_empowerment),
    FOREIGN KEY (sk_time) REFERENCES dim_time(sk_time)
);

CREATE TABLE fact_payroll (
    sk_employee INT,
    sk_office INT,
    sk_time_hired INT,
    monthly_salary DECIMAL(10,2),
    FOREIGN KEY (sk_employee) REFERENCES dim_employee(sk_employee),
    FOREIGN KEY (sk_office) REFERENCES dim_office(sk_office),
    FOREIGN KEY (sk_time_hired) REFERENCES dim_time(sk_time)
);