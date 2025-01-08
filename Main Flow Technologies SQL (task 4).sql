-- Constraints in SQL
-- PRIMARY KEY: Ensures each row is uniquely identifiable. AUTO_INCREMENT generates unique values automatically.
-- NOT NULL: Ensures that this column cannot have NULL values.
-- UNIQUE: Ensures all values in this column are distinct (no duplicates allowed).
-- CHECK: Enforces a condition that the 'DateOfBirth' must be before January 1, 2005.
-- FOREIGN KEY Column: Used to create a relationship with another table.
-- DEFAULT: Assigns a default value of 30,000.00 if no value is provided.

create database task4;
use task4;

-- Create a table named 'Employees' with various SQL constraints
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,          -- PRIMARY KEY Constraint
    FirstName VARCHAR(50) NOT NULL,                     -- NOT NULL Constraint
    LastName VARCHAR(50) NOT NULL,                      -- NOT NULL Constraint
    Email VARCHAR(100) UNIQUE,                          -- UNIQUE Constraint
    DateOfBirth DATE CHECK (DateOfBirth < '2005-01-01'), -- CHECK Constraint (e.g., Employee must be older than 18 years)
    DepartmentID INT,                                   -- FOREIGN KEY Column
    Salary DECIMAL(10, 2) DEFAULT 30000.00,             -- DEFAULT Constraint (e.g., Default Salary)
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) -- FOREIGN KEY Constraint
);

-- Create a table named 'Departments' with constraints for the FOREIGN KEY relationship
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,        -- PRIMARY KEY: Ensures each department is uniquely identifiable.
    DepartmentName VARCHAR(100) UNIQUE NOT NULL         -- UNIQUE: No two departments can have the same name. NOT NULL: DepartmentName must be provided for every row.
);

-- Insert sample records into the Departments table
-- These records will be used for establishing a FOREIGN KEY relationship in the Employees table.
INSERT INTO Departments (DepartmentName)
VALUES 
    ('HR'),         -- Example department: Human Resources
    ('IT'),         -- Example department: Information Technology
    ('Finance'),    -- Example department: Finance Department
    ('Marketing');  -- Example department: Marketing Team

-- Insert sample records into the Employees table
-- These demonstrate the use of constraints while adding data.
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1990-05-15', 1, 45000.00),  -- A valid entry with all constraints satisfied.
    ('Jane', 'Smith', 'jane.smith@example.com', '1988-11-20', 2, 55000.00), -- Another valid entry.
    ('Emily', 'Johnson', 'emily.johnson@example.com', '1995-02-10', 3, DEFAULT), -- Uses the DEFAULT value for salary.
    ('Michael', 'Brown', NULL, '1992-07-25', 4, DEFAULT); -- Demonstrates NULL allowed for Email.
    
Select * from Employees;


-- 1. NOT NULL Constraint
-- Scenario: The FirstName column in the Employees table cannot accept NULL values.
-- Valid Insertion (FirstName is NOT NULL)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Alice', 'Green', 'alice.green@example.com', '1993-06-10', 1, 40000.00);

-- Invalid Insertion (FirstName is NULL)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES (NULL, 'Black', 'null.first@example.com', '1994-08-15', 2, 45000.00);
-- Error: Column 'FirstName' cannot be null

-- 2. UNIQUE Constraint
-- Scenario: The Email column must have unique values.
-- Valid Insertion (Unique Email)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Bob', 'White', 'bob.white@example.com', '1990-03-12', 3, 50000.00);

-- Invalid Insertion (Duplicate Email)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Charlie', 'Gray', 'bob.white@example.com', '1992-07-20', 4, 55000.00);
-- Error: Duplicate entry 'bob.white@example.com' for key 'Employees.Email'

-- 3. PRIMARY KEY Constraint
-- Scenario: The EmployeeID column must have unique and non-NULL values.
-- Valid Insertion (Auto-incremented Primary Key)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Diana', 'King', 'diana.king@example.com', '1991-02-28', 1, 60000.00);

-- Invalid Insertion (Manually setting duplicate Primary Key)
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES (1, 'Eve', 'Queen', 'eve.queen@example.com', '1993-11-11', 2, 65000.00);
-- Error: Duplicate entry '1' for key 'PRIMARY'

-- 4. FOREIGN KEY Constraint
-- Scenario: The DepartmentID in Employees must exist in the Departments table.
-- Valid Insertion (DepartmentID exists in Departments table)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Frank', 'Hall', 'frank.hall@example.com', '1995-04-05', 2, 70000.00);

-- Invalid Insertion (DepartmentID does not exist in Departments table)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Grace', 'Hill', 'grace.hill@example.com', '1994-09-14', 999, 75000.00);
-- Error: Cannot add or update a child row: a foreign key constraint fails

-- 5. CHECK Constraint
-- Scenario: The DateOfBirth must be before January 1, 2005.
-- Valid Insertion (DateOfBirth satisfies the CHECK constraint)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Hank', 'Miller', 'hank.miller@example.com', '1999-12-31', 3, 80000.00);

-- Invalid Insertion (DateOfBirth does not satisfy the CHECK constraint)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Ivy', 'Moore', 'ivy.moore@example.com', '2010-05-20', 4, 85000.00);
-- Error: Check constraint 'Employees_chk_1' is violated

-- 6. DEFAULT Constraint
-- Scenario: The Salary column uses a default value of 30,000.00 if no value is provided.
-- Valid Insertion (No value provided for Salary, uses DEFAULT value)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID)
VALUES ('Jack', 'Nelson', 'jack.nelson@example.com', '1989-08-22', 1);

-- Valid Insertion (Explicit value for Salary)
INSERT INTO Employees (FirstName, LastName, Email, DateOfBirth, DepartmentID, Salary)
VALUES ('Kelly', 'Parker', 'kelly.parker@example.com', '1990-10-10', 2, 90000.00);


