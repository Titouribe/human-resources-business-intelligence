CREATE DATABASE IF NOT EXISTS RRHH_OLTP;
USE RRHH_OLTP;

CREATE TABLE office (
    id INT NOT NULL AUTO_INCREMENT,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    contact_number VARCHAR(20),
    address VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES office(id),
    PRIMARY KEY (id)
);

CREATE TABLE title (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    level ENUM('Junior', 'Mid-Level', 'Senior') NOT NULL,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    PRIMARY KEY (id)
);

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    identification VARCHAR(20) UNIQUE NOT NULL,
    born_date DATE,
    gender VARCHAR(20),
    email VARCHAR(150),
    contact_number VARCHAR(20),
    hire_date DATE NOT NULL,
    department_id INT,
    title_id INT,
    salary DECIMAL(10,2),
    leader_id INT,
    office_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (title_id) REFERENCES title(id),
    FOREIGN KEY (leader_id) REFERENCES employee(id),
    FOREIGN KEY (office_id) REFERENCES office(id),
    PRIMARY KEY (id)
);

CREATE TABLE absence (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT,
    type ENUM('Vacaciones', 'Enfermedad', 'Permiso Personal', 'Licencia Médica'),
    start_date DATE NOT NULL,
    end_Date DATE NOT NULL,
    total_days INT AS (DATEDIFF(end_Date, start_date) + 1),
    is_justificated BOOLEAN,
    comments VARCHAR(500),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    PRIMARY KEY (id)
);

CREATE TABLE evaluation (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT,
    leader_id INT,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rate DECIMAL(3,2) CHECK (rate BETWEEN 1.0 AND 5.0),
    comments VARCHAR(500),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (leader_id) REFERENCES employee(id),
    PRIMARY KEY (id)
);

CREATE TABLE empowerment (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    supplier VARCHAR(100),
    cost DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    total_hours INT,
    PRIMARY KEY (id)
);

CREATE TABLE employee_empowerment (
    employee_id INT,
    empowerment_id INT,
    rate INT CHECK (rate BETWEEN 0 AND 100),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    state ENUM('Completada', 'En Curso'),
    comments VARCHAR(500),
    PRIMARY KEY (employee_id, empowerment_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (empowerment_id) REFERENCES empowerment(id)
);