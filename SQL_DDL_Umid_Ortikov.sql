CREATE DATABASE MyDomainDB;

CREATE SCHEMA myschema;

CREATE TABLE myschema.Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    HireDate DATE CHECK (HireDate > '2000-01-01'),
    DepartmentID INT REFERENCES myschema.Departments(DepartmentID)
);

CREATE TABLE myschema.Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE myschema.Projects (
    ProjectID SERIAL PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL UNIQUE,
    StartDate DATE CHECK (StartDate > '2000-01-01')
);


INSERT INTO myschema.Departments (DepartmentName) VALUES
    ('HR'), ('IT'), ('Marketing');

INSERT INTO myschema.Projects (ProjectName, StartDate) VALUES
    ('ProjectA', '2022-01-01'), ('ProjectB', '2023-02-01');

INSERT INTO myschema.Employees (FirstName, LastName, Gender, HireDate, DepartmentID) VALUES
    ('Umid', 'Ortikov', 'M', '2024-01-15', 1),
    ('Jane', 'Smith', 'F', '2024-01-22', 2);
	
	
ALTER TABLE myschema.Employees
ADD COLUMN record_ts TIMESTAMP DEFAULT current_timestamp;

ALTER TABLE myschema.Departments
ADD COLUMN record_ts TIMESTAMP DEFAULT current_timestamp;

ALTER TABLE myschema.Projects
ADD COLUMN record_ts TIMESTAMP DEFAULT current_timestamp;

-- Finally we can check our tables
SELECT * FROM myschema.Employees;
SELECT * FROM myschema.Departments;
SELECT * FROM myschema.Projects;

