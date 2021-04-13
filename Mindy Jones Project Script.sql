/* 
Mindy Jones 
J00685622 
ISC 561ERD, 
Project Script 
*/ 
CREATE DATABASE projectscript 

go 

USE projectscript -- Important to tell SQL to create in this database 

go 

/* 
Shortcut for me when I want to start over 
Drop DataBase ProjectScript 
*/ 
/* We have created a database and use it */ 
CREATE TABLE tblcustomer 
  ( 
     customerid INT IDENTITY(1, 1) PRIMARY KEY, 
     NAME       VARCHAR(100), 
     cellphone  VARCHAR(12) NOT NULL UNIQUE, 
     address    VARCHAR(250) 
  ) 

go 

ALTER TABLE tblcustomer -- this requires the phone number only have 10 digits 
  ADD CONSTRAINT ck_cellphonecustomer CHECK (cellphone LIKE 
  '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 

INSERT INTO tblcustomer 
            (NAME, 
             cellphone, 
             address) 
VALUES      ( 'Emperor Palpatine', 
              '2519876543', 
              ' 123 Tatooine Street' ) 

/*  
Test to make sure Customer information goes in. 
Select * 
From TblCustomer 
The section of code above creates the 
table for Customer and then populates the information. 

For company reasons, Cellphone number must be unique. 
*/ 
CREATE TABLE tblcashier 
  ( 
     cashierid    INT IDENTITY(1, 1) PRIMARY KEY, 
     NAME         VARCHAR(100), 
     cellphone    VARCHAR(12), 
     car          VARCHAR(50), 
     hourlypay    MONEY, 
     milleagerate MONEY 
  ) 

go 

ALTER TABLE tblcashier -- this requires the phone number only have 10 digits 
  ADD CONSTRAINT ck_cellphonecashier CHECK (cellphone LIKE 
  '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 

INSERT INTO tblcashier 
            (NAME, 
             cellphone, 
             car, 
             hourlypay, 
             milleagerate) 
VALUES      ( 'Luke Skywalker', 
              '2511234567', 
              ' Chevy Malibu', 
              7.25, 
              1.5 ) 

/*  
Test to make sure information goes in. 
Select * 
From TblCashier 
The section of code above creates the 
table for Cashier and then populates the information. 
Cashiers may also not share phones. 
*/ 
CREATE TABLE tblmanager 
  ( 
     managerid   INT IDENTITY(1, 1) PRIMARY KEY, 
     managername VARCHAR(100) 
  ) 

go 

INSERT INTO tblmanager 
            (managername) 
VALUES      ( 'Darth Vader' ) 

/*  
Test to make sure information goes in. 
Select * 
From TblManager 
The section of code above creates the 
table for Manager and then populates the information. 
*/ 
CREATE TABLE tblpizza 
  ( 
     pizzaid   INT IDENTITY(1, 1) PRIMARY KEY, 
     pizzaname NVARCHAR(100), 
     cost      MONEY 
  ) 

go 

INSERT INTO tblpizza 
            (pizzaname, 
             cost) 
VALUES      ( 'Pepperoni', 
              10 ) 

INSERT INTO tblpizza 
            (pizzaname, 
             cost) 
VALUES      ( 'Alfredo', 
              12 ) 

INSERT INTO tblpizza 
            (pizzaname, 
             cost) 
VALUES      ( 'Cheese', 
              13 ) 

/*  
Test to make sure information goes in. 
Select * 
From TblPizza 
The section of code above creates the 
table for Pizza and then populates the information. 
*/ 
CREATE TABLE tblpizzatype 
  ( 
     pizzatypeid INT IDENTITY(1, 1) PRIMARY KEY, 
     pizzatype   NVARCHAR(100), 
     pizzaid     INT 
  ) 

go 

INSERT INTO tblpizzatype 
            (pizzatype, 
             pizzaid) 
VALUES      ( 'Red Sauce', 
              1 ) 

INSERT INTO tblpizzatype 
            (pizzatype, 
             pizzaid) 
VALUES      ( 'White Sauce', 
              2 ) 

INSERT INTO tblpizzatype 
            (pizzatype, 
             pizzaid) 
VALUES      ( 'Gluten-Free', 
              3 ) 

ALTER TABLE tblpizzatype 
  ADD CONSTRAINT pizzaidtopizzatype_fk FOREIGN KEY (pizzaid) REFERENCES tblpizza 
  (pizzaid) 

ALTER TABLE tblpizzatype 
  ADD CONSTRAINT pizzatypeid_is_a_unique UNIQUE(pizzaid) 

go 

ALTER TABLE tblpizza 
  ADD CONSTRAINT pizzapizzatypeid_is_a_unique UNIQUE(pizzaid) 

go 

/*  
Test to make sure information goes in. 
Select * 
From TblPizzaType 
The section of code above creates the 
table for Pizza Type and then populates the information. 

We have also added the PK -FK to link to Pizza 

In my little restaurant, pizza and pizza types are one to one.  
cheese is only a gluten-free and Pepperoni is only red sauce.  

*/ 
CREATE TABLE tblreciept 
  ( 
     quantity  NUMERIC(10, 2), 
     charge    MONEY, 
     pizzaid   INT, 
     invoiceid INT 
  ) 

go 

INSERT INTO tblreciept 
            (quantity, 
             charge, 
             pizzaid, 
             invoiceid) 
VALUES      ( 1, 
              10, 
              1, 
              12345 ) 

INSERT INTO tblreciept 
            (quantity, 
             charge, 
             pizzaid, 
             invoiceid) 
VALUES      ( 3, 
              36, 
              2, 
              12345 ) 

INSERT INTO tblreciept 
            (quantity, 
             charge, 
             pizzaid, 
             invoiceid) 
VALUES      ( 2, 
              26, 
              3, 
              12345 ) 

/*Test to make sure information goes in. 
Select * 
From TblReciept 
The section of code above creates the 
table for Receipt and then populates the information. 
*/ 
CREATE TABLE tblinvoice 
  ( 
     invoiceid  INT NOT NULL, 
     date       NVARCHAR(20), 
     mileage    NUMERIC(10, 2), 
     total      MONEY, 
     notes      NVARCHAR(250), 
     managerid  INT, 
     customerid INT, 
     cashierid  INT 
  ) 

go 

INSERT INTO tblinvoice 
            (invoiceid, 
             date, 
             mileage, 
             total, 
             notes, 
             managerid, 
             customerid, 
             cashierid) 
VALUES      ( 12345, 
              '11/10/2015', 
              4, 
              72, 
' Emperor Palpatine did not tip. Do not deliver to him again if possible.', 
1, 
1, 
1 
/* Right here is where I realized maybe I should adjust the numbering so everything doesn't start with 1.  */
) 

ALTER TABLE tblinvoice 
  ADD PRIMARY KEY (invoiceid) 

/*  
Test to make sure information goes in. 
Select * 
From TblInvoice 
The section of code above creates the 
table for Invoice and then populates the information. 
Invoice is a prepopulated ID and must be sepretly created to be a primary key 
*/ 
/* Now that all the tables are filled we can attach them */ 
ALTER TABLE tblinvoice 
  ADD CONSTRAINT managerid_fk FOREIGN KEY (managerid) REFERENCES tblmanager( 
  managerid) 

ALTER TABLE tblmanager 
  ADD CONSTRAINT manager_is_a_unique UNIQUE(managerid) 

go 

ALTER TABLE tblinvoice 
  ADD CONSTRAINT customerid_fk FOREIGN KEY (customerid) REFERENCES tblcustomer( 
  customerid) 

ALTER TABLE tblinvoice 
  ADD CONSTRAINT cashierid_fk FOREIGN KEY (cashierid) REFERENCES tblcashier( 
  cashierid) 

ALTER TABLE tblreciept 
  ADD CONSTRAINT pizzaidtoreciept_fk FOREIGN KEY (pizzaid) REFERENCES tblpizza( 
  pizzaid) 

ALTER TABLE tblreciept 
  ADD CONSTRAINT recipttoinvoice_fk FOREIGN KEY (invoiceid) REFERENCES 
  tblinvoice(invoiceid) 

go 

/*  

Create View invoice list 
Select * 
From tblinvoice 
where invoiceId = 12345 



Select * 
from  ViewInvoiceIDsInReciept 
*/ 
CREATE VIEW viewinvoiceidsinreciept1 
AS 
  SELECT invoiceid, 
         Count (pizzaid) AS DifferentPizza 
  FROM   tblreciept 
  GROUP  BY invoiceid 
  HAVING Count (pizzaid) > 1 

go 

CREATE VIEW viewinvoiceidsinreciept3 
AS 
  SELECT invoiceid, 
         Count (pizzaid) AS DifferentPizza 
  FROM   tblreciept 
  GROUP  BY invoiceid 
  HAVING Count (pizzaid) > 3 

go 

/*  
This creates the view of the number of diffrent pizzas in an order with more than 1 and 3 diffrent types of pizza.
The restriction in having gives us or hides the only data in the database 

Select * 
from ViewInvoiceIDsInReciept1 

Select * 
from ViewInvoiceIDsInReciept3 
*/ 
CREATE VIEW viewinvoiceidsintblreciept 
AS 
  SELECT invoiceid 
  FROM   tblinvoice 
  WHERE  invoiceid IN (SELECT invoiceid 
                       FROM   tblreciept) 

go 

CREATE VIEW viewpizzaidwithquanitymorethan1 
AS 
  SELECT pizzaid 
  FROM   tblreciept 
  WHERE  pizzaid IN (SELECT pizzaid 
                     FROM   tblreciept 
                     WHERE  quantity > 1) 

go 

/* with the limited about of data in the database, it is hard make many examples with a skeleton database */
CREATE TABLE tblcashiertofire 
  ( 
     NAME VARCHAR(150) 
  ) 

go 

CREATE TRIGGER paytoohigh 
ON TblCashier 
after INSERT, UPDATE 
AS 
  BEGIN 
      SET nocount ON; 

      INSERT INTO TblCashierToFire 
                  (NAME) 
      SELECT NAME 
      FROM   TblCashier 
      WHERE  HourlyPay > 9 
  END 

go 
/*  

Management decided we can not afford to pay Cashiers more than $9.00 an hour, therefore any Cashier making more than $9.00 will be put on the audit list.

   INSERT INTO 
     tblCashier( Name, Cellphone, Car, HourlyPay, MilleageRate )  
  VALUES 
     ( 
        'Mindy Jones', '2568722710', ' Toyota Camry', 10.25, 7.5  
     ) 

	    INSERT INTO 
     tblCashier( Name, Cellphone, Car, HourlyPay, MilleageRate )  
  VALUES 
     ( 
        'David Bourrie', '1111111111', ' Toyota Camry', 1, 1 
     ) 


  Select * 
  from TblCashierToFire 
*/ 