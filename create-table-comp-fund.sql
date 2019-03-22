SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS CustomerPaymentDetails;
DROP TABLE IF EXISTS CustomerOrderItem;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS SupplierOrder;
DROP TABLE IF EXISTS SupplierOrderItem;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS BranchStockItem;
DROP TABLE IF EXISTS StockItem;

CREATE TABLE Customer(
CustomerID integer(10),
Title varchar(3),
FirstName varchar(20),
LastName varchar(20),
ContactEmail varchar(30),
ContactNumber varchar(20),
CONSTRAINT customepk primary key(CustomerID)
);

CREATE TABLE CustomerPaymentDetails (
PaymentID integer(10),
CONSTRAINT customerPaymentDetails_pk PRIMARY KEY (PaymentID),
CustomerID integer(10),
CONSTRAINT customerID_fk FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
PaymentType char(1)
);

CREATE TABLE CustomerOrderItem(
StockID integer(10),
CustomerOrderID integer(10),
CONSTRAINT customerOrderItem_pk PRIMARY KEY(StockID,CustomerOrderID),
Quantity integer(10)
);

CREATE TABLE CustomerOrder(
CustomerOrderID integer(10),
CONSTRAINT CustomerOrdercustomerorder_pk PRIMARY KEY (CustomerOrderID),
EmployeeID integer(10),
CONSTRAINT CustomerOrderemployee_id_customerorder_fk FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
PaymentID integer(10),
CONSTRAINT CustomerOrderPaymentID_fk FOREIGN KEY (PaymentID) REFERENCES CustomerPaymentDetails(PaymentID),
CustomerID integer(10),
CONSTRAINT CustomerOrderCustomerID_fk FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
BranchID integer(10),
CONSTRAINT CustomerOrderBranchID_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
OrderDate integer(10),
TotalOrderPrice integer(6)
);

CREATE TABLE Supplier(
SupplierID integer(10),
CONSTRAINT SupplierID_pk PRIMARY KEY (SupplierID),
Name varchar(20),
ContactEmail varchar(20),
ContactNumber varchar(20)
);

CREATE TABLE SupplierOrder(
SupplierOrderID integer(10),
CONSTRAINT SupplierOrderID_pk PRIMARY KEY (SupplierOrderID),
SupplierID integer(10),
CONSTRAINT SupplierID_fk FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
BranchID integer(10),
CONSTRAINT BranchID_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
OrderDate integer(10),
TotalOrderPrice integer(6)
);

CREATE TABLE SupplierOrderItem(
StockID integer(10),
SupplierOrderID integer(10),
CONSTRAINT stockid_suppierorderid_pk PRIMARY KEY (StockID,SupplierOrderID),
Quantity integer(3)
);

CREATE TABLE Employee(
EmployeeID integer(10),
CONSTRAINT employeeid_pk PRIMARY KEY (EmployeeID),
BranchID integer(10),
CONSTRAINT employee_branchid_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
Name varchar(20)
);

CREATE TABLE Branch(
BranchID integer(10),
CONSTRAINT branch_branchID_pk PRIMARY KEY (BranchID),
AddressLineOne varchar(20),
AddressLineTwo varchar(20),
PostCode varchar(8)
);

CREATE TABLE StockItem(
StockID integer(10),
CONSTRAINT stockItem_StockID_pk PRIMARY KEY (StockID),
SupplierID integer(10),
CONSTRAINT stock_item_fk FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
Price integer(5),
Name varchar(20),
Quantity integer(10)
);

CREATE TABLE BranchStockItem(
BranchID integer(10),
StockID integer(10),
CONSTRAINT branchStockItem_branchidstockid_pk PRIMARY KEY (BranchID,StockID)
);