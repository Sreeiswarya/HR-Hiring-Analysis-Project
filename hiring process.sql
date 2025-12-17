create database hiring_process;
use hiring_process;

CREATE TABLE employees_staging (
    application_id VARCHAR(50),
    interview_taken_on VARCHAR(50),
    Status VARCHAR(255),
    event_name VARCHAR(255),
    Department VARCHAR(255),
    Post_Name VARCHAR(255),
    Offered_Salary VARCHAR(50)
) CHARACTER SET utf8mb4;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hiring process.csv'
INTO TABLE employees_staging
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from employees_staging;
