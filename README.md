# SQL Constraints Demonstration

This repository contains SQL scripts to demonstrate the use of various SQL constraints such as `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, and `DEFAULT`.

## **Description**
This project is designed to:
1. Create tables with constraints to ensure data integrity and validity.
2. Insert records to demonstrate how constraints enforce rules on the data.

## **SQL Constraints Covered**
1. **NOT NULL**: Ensures that a column cannot have NULL values.
2. **UNIQUE**: Guarantees that all values in a column are distinct.
3. **PRIMARY KEY**: Combines `NOT NULL` and `UNIQUE`. Uniquely identifies each record in a table.
4. **FOREIGN KEY**: Ensures referential integrity by linking columns in one table to another.
5. **CHECK**: Validates that a column meets a specific condition.
6. **DEFAULT**: Assigns a default value to a column if no value is specified.

---

## **Table Creation**
### 1. Employees Table
- Contains columns such as `EmployeeID`, `FirstName`, `LastName`, `Email`, `DateOfBirth`, `DepartmentID`, and `Salary`.
- Includes constraints like `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `CHECK`, and `DEFAULT`.

### 2. Departments Table
- Contains `DepartmentID` and `DepartmentName`.
- Includes `PRIMARY KEY` and `UNIQUE` constraints.
