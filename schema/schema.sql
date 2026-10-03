-- =============================================================================
-- schema/schema.sql
-- Sample schema + data used by every solution in this repo.
-- Compatible with PostgreSQL, MySQL 8+, SQLite 3.25+, SQL Server.
-- =============================================================================

DROP TABLE IF EXISTS project_assignments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- -----------------------------------------------------------------------------
-- departments
-- -----------------------------------------------------------------------------
CREATE TABLE departments (
    department_id   INTEGER PRIMARY KEY,
    department_name VARCHAR(80)  NOT NULL,
    location        VARCHAR(80)
);

INSERT INTO departments (department_id, department_name, location) VALUES
    (1, 'Engineering', 'San Francisco'),
    (2, 'Sales',       'New York'),
    (3, 'Marketing',   'London'),
    (4, 'Finance',     'Chicago'),
    (5, 'HR',          'Austin');

-- -----------------------------------------------------------------------------
-- employees
-- manager_id references employees.employee_id (self-referential FK).
-- -----------------------------------------------------------------------------
CREATE TABLE employees (
    employee_id   INTEGER PRIMARY KEY,
    first_name    VARCHAR(60)  NOT NULL,
    last_name     VARCHAR(60)  NOT NULL,
    hire_date     DATE         NOT NULL,
    salary        NUMERIC(12,2) NOT NULL,
    department_id INTEGER      REFERENCES departments(department_id),
    manager_id    INTEGER      REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, first_name, last_name, hire_date, salary, department_id, manager_id) VALUES
    (101, 'Alice',   'Nguyen',  '2019-03-15', 180000.00, 1, NULL),
    (102, 'Bob',     'Smith',   '2020-07-01', 140000.00, 1, 101),
    (103, 'Carol',   'Patel',   '2021-01-10', 155000.00, 1, 101),
    (104, 'David',   'Kim',     '2022-05-20', 120000.00, 1, 102),
    (105, 'Eve',     'Brown',   '2023-02-14', 130000.00, 1, 102),
    (106, 'Frank',   'Lee',     '2023-09-05', 110000.00, 1, 103),
    (107, 'Grace',   'Garcia',  '2018-11-30', 165000.00, 2, NULL),
    (108, 'Henry',   'Wilson',  '2021-06-15', 105000.00, 2, 107),
    (109, 'Ivy',     'Chen',    '2022-08-22', 115000.00, 2, 107),
    (110, 'Jack',    'Taylor',  '2023-04-11', 100000.00, 2, 108),
    (111, 'Karen',   'Martinez','2020-02-28', 145000.00, 3, NULL),
    (112, 'Leo',     'Anderson','2022-10-05', 125000.00, 3, 111),
    (113, 'Mia',     'Thomas',  '2023-06-19', 118000.00, 3, 111),
    (114, 'Noah',    'Jackson', '2019-09-09', 170000.00, 4, NULL),
    (115, 'Olivia',  'White',   '2021-12-01', 135000.00, 4, 114),
    (116, 'Paul',    'Harris',  '2023-03-27', 128000.00, 4, 114),
    (117, 'Quinn',   'Clark',   '2020-05-14', 150000.00, 5, NULL),
    (118, 'Rita',    'Lewis',   '2022-01-25', 108000.00, 5, 117),
    (119, 'Sam',     'Robinson','2023-11-02', 102000.00, 5, 117),
    (120, 'Tina',    'Walker',  '2023-08-15', 122000.00, NULL, NULL); -- no dept

-- -----------------------------------------------------------------------------
-- projects
-- -----------------------------------------------------------------------------
CREATE TABLE projects (
    project_id   INTEGER PRIMARY KEY,
    project_name VARCHAR(120) NOT NULL,
    start_date   DATE,
    end_date     DATE,
    budget       NUMERIC(14,2)
);

INSERT INTO projects (project_id, project_name, start_date, end_date, budget) VALUES
    (501, 'Atlas Search',      '2023-01-10', '2023-12-31', 500000.00),
    (502, 'Billing v2',        '2023-04-01', '2024-03-31', 300000.00),
    (503, 'Mobile Redesign',   '2023-06-15', '2024-06-30', 250000.00),
    (504, 'Data Warehouse',    '2022-11-01', '2023-10-31', 400000.00),
    (505, 'Onboarding Portal', '2024-02-01', NULL,         150000.00);

-- -----------------------------------------------------------------------------
-- project_assignments
-- -----------------------------------------------------------------------------
CREATE TABLE project_assignments (
    employee_id   INTEGER NOT NULL REFERENCES employees(employee_id),
    project_id    INTEGER NOT NULL REFERENCES projects(project_id),
    role          VARCHAR(60),
    assigned_date DATE,
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO project_assignments (employee_id, project_id, role, assigned_date) VALUES
    (101, 501, 'Tech Lead',   '2023-01-10'),
    (102, 501, 'Engineer',    '2023-01-15'),
    (103, 501, 'Engineer',    '2023-02-01'),
    (104, 502, 'Engineer',    '2023-04-05'),
    (105, 502, 'Engineer',    '2023-05-01'),
    (106, 503, 'Engineer',    '2023-06-20'),
    (107, 504, 'PM',          '2022-11-05'),
    (108, 504, 'Analyst',     '2022-12-01'),
    (109, 505, 'Analyst',     '2024-02-05'),
    (111, 503, 'Designer',    '2023-06-15'),
    (112, 503, 'Designer',    '2023-07-01'),
    (114, 502, 'Finance Lead','2023-04-01'),
    (115, 502, 'Analyst',     '2023-05-10'),
    (117, 505, 'HR Lead',     '2024-02-01'),
    (118, 505, 'Coordinator', '2024-02-10');
-- Note: employees 109, 110, 113, 116, 119, 120 have no project assignments
-- (used by problem 9).
