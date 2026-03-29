USE RRHH_OLTP;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE employee_empowerment;
TRUNCATE TABLE empowerment;
TRUNCATE TABLE evaluation;
TRUNCATE TABLE absence;
TRUNCATE TABLE employee;
TRUNCATE TABLE title;
TRUNCATE TABLE department;
TRUNCATE TABLE office;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO office (city, country, postal_code, contact_number, address) VALUES
('Bogotá', 'Colombia', '110111', '+57 601 1234567', 'Calle 100 #15-20'),
('Medellín', 'Colombia', '050001', '+57 604 7654321', 'Carrera 43A #1-50'),
('Madrid', 'España', '28001', '+34 912 345 678', 'Paseo de la Castellana 100'),
('Envigado', 'Colombia', '052222', '+57 604 9998877', 'Calle 37 Sur #40-10');

INSERT INTO department (name, description, office_id) VALUES
('Recursos Humanos', 'Gestión de talento', 1),
('Tecnología', 'Desarrollo e IT', 2),
('Ventas', 'Área comercial', 1),
('Finanzas', 'Contabilidad', 3),
('Marketing', 'Publicidad', 4);

INSERT INTO title (name, level, min_salary, max_salary) VALUES
('Gerente', 'Senior', 8000000, 15000000),
('Desarrollador', 'Mid-Level', 5000000, 9000000),
('Analista', 'Junior', 2500000, 4500000),
('Arquitecto', 'Senior', 12000000, 20000000),
('Especialista', 'Mid-Level', 4500000, 7000000);

INSERT INTO empowerment (name, description, supplier, cost, start_date, end_date, total_hours) VALUES
('Liderazgo 4.0', 'Gestión de equipos remotos', 'SENA', 0, '2024-01-10', '2024-01-20', 20),
('Java Spring Boot', 'Microservicios avanzados', 'Udemy', 450000, '2023-11-01', '2023-11-30', 40),
('Power BI', 'Visualización de datos', 'Platzi', 300000, '2024-02-01', '2024-02-15', 30),
('Excel Financiero', 'Macros y modelos', 'LinkedIn Learning', 200000, '2023-09-05', '2023-09-20', 15);

INSERT INTO employee (first_name, last_name, identification, born_date, gender, email, contact_number, hire_date, department_id, title_id, salary, leader_id, office_id) VALUES
('Carlos', 'Gomez', 'CC101', '1985-05-15', 'Masculino', 'carlos.g@talent.com', '3001', '2020-01-10', 2, 4, 15000000, NULL, 2),
('Marta', 'Lucia', 'CC102', '1980-03-12', 'Femenino', 'marta.l@talent.com', '3002', '2019-05-20', 1, 1, 11000000, NULL, 1),
('Jorge', 'Velez', 'CC103', '1988-11-25', 'Masculino', 'jorge.v@talent.com', '3003', '2021-02-10', 3, 1, 9500000, NULL, 1),
('Elena', 'Sanz', 'CC104', '1983-07-08', 'Femenino', 'elena.s@talent.com', '3004', '2018-09-15', 4, 1, 10500000, NULL, 3),
('Andres', 'Perez', 'CC105', '1990-01-30', 'Masculino', 'andres.p@talent.com', '3005', '2022-10-05', 5, 1, 8800000, NULL, 4);

INSERT INTO employee (first_name, last_name, identification, born_date, gender, email, hire_date, department_id, title_id, salary, leader_id, office_id) VALUES
('Ana', 'Sosa', 'ID006', '1995-01-01', 'Femenino', 'ana.s@t.com', '2023-01-15', 2, 2, 6500000, 1, 2),
('Luis', 'Paz', 'ID007', '1994-02-02', 'Masculino', 'luis.p@t.com', '2023-02-15', 2, 2, 6000000, 1, 2),
('Sara', 'Ruiz', 'ID008', '1993-03-03', 'Femenino', 'sara.r@t.com', '2023-03-15', 1, 3, 3000000, 2, 1),
('Pedro', 'Gil', 'ID009', '1992-04-04', 'Masculino', 'pedro.g@t.com', '2023-04-15', 3, 3, 3200000, 3, 1),
('Rosa', 'Diaz', 'ID010', '1991-05-05', 'Femenino', 'rosa.d@t.com', '2023-05-15', 4, 5, 4800000, 4, 3),
('Hugo', 'Luna', 'ID011', '1990-06-06', 'Masculino', 'hugo.l@t.com', '2023-06-15', 5, 3, 2800000, 5, 4),
('Laura', 'Cano', 'ID012', '1994-07-07', 'Femenino', 'laura.c@t.com', '2023-07-01', 2, 2, 5500000, 1, 2),
('Ivan', 'Rios', 'ID013', '1992-08-08', 'Masculino', 'ivan.r@t.com', '2023-07-10', 2, 2, 5700000, 1, 2),
('Nora', 'Vega', 'ID014', '1990-09-09', 'Femenino', 'nora.v@t.com', '2023-07-20', 1, 3, 3100000, 2, 1),
('Raul', 'Mesa', 'ID015', '1988-10-10', 'Masculino', 'raul.m@t.com', '2023-08-01', 3, 3, 3300000, 3, 1),
('Ines', 'Lara', 'ID016', '1995-11-11', 'Femenino', 'ines.l@t.com', '2023-08-15', 4, 5, 4900000, 4, 3),
('Omar', 'Sol', 'ID017', '1993-12-12', 'Masculino', 'omar.s@t.com', '2023-09-01', 5, 3, 2900000, 5, 4),
('Luz', 'Mora', 'ID018', '1991-01-13', 'Femenino', 'luz.m@t.com', '2023-09-10', 2, 2, 5800000, 1, 2),
('Alex', 'Polo', 'ID019', '1989-02-14', 'Masculino', 'alex.p@t.com', '2023-09-20', 2, 2, 5900000, 1, 2),
('Eva', 'Daza', 'ID020', '1987-03-15', 'Femenino', 'eva.d@t.com', '2023-10-01', 1, 3, 3200000, 2, 1),
('Leo', 'Guerra', 'ID021', '1996-04-16', 'Masculino', 'leo.g@t.com', '2023-10-10', 3, 3, 3400000, 3, 1),
('Ada', 'Rico', 'ID022', '1994-05-17', 'Femenino', 'ada.r@t.com', '2023-10-20', 4, 5, 5000000, 4, 3),
('Marc', 'Soto', 'ID023', '1992-06-18', 'Masculino', 'marc.s@t.com', '2023-11-01', 5, 3, 3000000, 5, 4),
('Mia', 'Blanco', 'ID024', '1990-07-19', 'Femenino', 'mia.b@t.com', '2023-11-10', 2, 2, 6000000, 1, 2),
('Ian', 'Torres', 'ID025', '1988-08-20', 'Masculino', 'ian.t@t.com', '2023-11-20', 2, 2, 6100000, 1, 2),
('Zoe', 'Marin', 'ID026', '1995-09-21', 'Femenino', 'zoe.m@t.com', '2023-12-01', 1, 3, 3300000, 2, 1),
('Teo', 'Rivas', 'ID027', '1993-10-22', 'Masculino', 'teo.r@t.com', '2023-12-10', 3, 3, 3500000, 3, 1),
('Noa', 'López', 'ID028', '1991-11-23', 'Femenino', 'noa.l@t.com', '2023-12-20', 4, 5, 5100000, 4, 3),
('Eli', 'Cruz', 'ID029', '1989-12-24', 'Masculino', 'eli.c@t.com', '2024-01-01', 5, 3, 3100000, 5, 4),
('Paz', 'Bello', 'ID030', '1987-01-25', 'Femenino', 'paz.b@t.com', '2024-01-10', 2, 2, 6200000, 1, 2),
('Cid', 'Vidal', 'ID031', '1996-02-26', 'Masculino', 'cid.v@t.com', '2024-01-20', 2, 2, 6300000, 1, 2),
('Bel', 'Arias', 'ID032', '1994-03-27', 'Femenino', 'bel.a@t.com', '2024-02-01', 1, 3, 3400000, 2, 1),
('Jon', 'Caro', 'ID033', '1992-04-28', 'Masculino', 'jon.c@t.com', '2024-02-10', 3, 3, 3600000, 3, 1),
('Rut', 'Peña', 'ID034', '1990-05-29', 'Femenino', 'rut.p@t.com', '2024-02-20', 4, 5, 5200000, 4, 3),
('Dan', 'Galan', 'ID035', '1988-06-30', 'Masculino', 'dan.g@t.com', '2024-03-01', 5, 3, 3200000, 5, 4),
('Sol', 'Sierra', 'ID036', '1995-07-01', 'Femenino', 'sol.s@t.com', '2024-03-10', 2, 2, 6400000, 1, 2),
('Fey', 'Molina', 'ID037', '1993-08-02', 'Femenino', 'fey.m@t.com', '2024-03-20', 2, 2, 6500000, 1, 2),
('Pol', 'Ortiz', 'ID038', '1991-09-03', 'Masculino', 'pol.o@t.com', '2024-04-01', 1, 3, 3500000, 2, 1),
('Lis', 'Navas', 'ID039', '1989-10-04', 'Femenino', 'lis.n@t.com', '2024-04-10', 3, 3, 3700000, 3, 1),
('Roy', 'Cortes', 'ID040', '1987-11-05', 'Masculino', 'roy.c@t.com', '2024-04-20', 4, 5, 5300000, 4, 3),
('Ada', 'Toro', 'ID041', '1996-12-06', 'Femenino', 'ada.t@t.com', '2024-05-01', 5, 3, 3300000, 5, 4),
('Jan', 'Moya', 'ID042', '1994-01-07', 'Masculino', 'jan.m@t.com', '2024-05-10', 2, 2, 6600000, 1, 2),
('Luz', 'Rojas', 'ID043', '1992-02-08', 'Femenino', 'luz.r@t.com', '2024-05-20', 2, 2, 6700000, 1, 2),
('Pau', 'Leon', 'ID044', '1990-03-09', 'Masculino', 'pau.l@t.com', '2024-06-01', 1, 3, 3600000, 2, 1),
('Tea', 'Pinto', 'ID045', '1988-04-10', 'Femenino', 'tea.p@t.com', '2024-06-10', 3, 3, 3800000, 3, 1),
('Uru', 'Solis', 'ID046', '1987-05-11', 'Masculino', 'uru.s@t.com', '2024-06-20', 4, 5, 5400000, 4, 3),
('Mar', 'Vaca', 'ID047', '1996-06-12', 'Femenino', 'mar.v@t.com', '2024-07-01', 5, 3, 3400000, 5, 4),
('Nil', 'Calvo', 'ID048', '1994-07-13', 'Masculino', 'nil.c@t.com', '2024-07-10', 2, 2, 6800000, 1, 2),
('Ona', 'Ibáñez', 'ID049', '1992-08-14', 'Femenino', 'ona.i@t.com', '2024-07-20', 2, 2, 6900000, 1, 2),
('Sam', 'Duarte', 'ID050', '1990-09-15', 'Masculino', 'sam.d@t.com', '2024-08-01', 1, 3, 3700000, 2, 1);

INSERT INTO absence (employee_id, type, start_date, end_date, is_justificated, comments)
SELECT 
    (n%50)+1, 
    CASE (n%4) WHEN 0 THEN 'Vacaciones' WHEN 1 THEN 'Enfermedad' WHEN 2 THEN 'Permiso Personal' ELSE 'Licencia Médica' END,
    DATE_ADD('2023-01-01', INTERVAL n*7 DAY), 
    DATE_ADD('2023-01-01', INTERVAL (n*7)+3 DAY),
    IF(n%5=0, 0, 1), 'Registro automático de prueba'
FROM (SELECT @row2 := @row2 + 1 AS n FROM 
(SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
(SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
(SELECT @row2 := 0) t3 LIMIT 100) num;


INSERT INTO evaluation (employee_id, leader_id, rate, comments)
SELECT id, IFNULL(leader_id, 1), ROUND(3 + (RAND() * 2), 1), 'Desempeño consistente con los objetivos'
FROM employee;


INSERT INTO evaluation (employee_id, leader_id, rate, comments)
SELECT (n%50)+1, 1, ROUND(2 + (RAND() * 3), 1), 'Evaluación de seguimiento trimestral'
FROM (SELECT @row3 := @row3 + 1 AS n FROM (SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
(SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2,
(SELECT @row3 := 0) t3 LIMIT 30) num;

INSERT INTO employee_empowerment (employee_id, empowerment_id, rate, state, comments)
SELECT id, (id%4)+1, 70 + (id%30), 'Completada', 'Finalizado con éxito'
FROM employee LIMIT 60;