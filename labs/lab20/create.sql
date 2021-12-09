CREATE DATABASE lab_mysql;
USE lab_mysql;

CREATE TABLE Customers(ID int, `Name` varchar(50), Phone int, Mail text, Address varchar(100), City text, Country text, Zip int);
CREATE TABLE Salespersons (`Staff_ID` int, `Name` text, store text);
CREATE TABLE Invoices (`Invoice_nb` int, `Date` date, Car_vin text, Customer_ID int, Customer_name text, Salesperson_id int);
CREATE TABLE Cars (
VIN char(50), 
Manufacturer varchar(50), 
Model varchar(50), 
Year_of_prod int,
Color varchar(20));
CREATE TABLE Customers(ID int, `Name` varchar(50), Phone char(50), Mail text, Address varchar(100), City text, Country text, Zip int);
CREATE TABLE Invoices (`Invoice_nb` char(50), `Date` char(50), Car_vin char(50), Customer_ID int, Customer_name text, Salesperson_id int);
