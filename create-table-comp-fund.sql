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
CustomerID integer(10) NOT NULL,
Title varchar(3) NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
ContactEmail varchar(40) NOT NULL,
ContactNumber varchar(20) NOT NULL,
CONSTRAINT customepk primary key(CustomerID)
);

CREATE TABLE CustomerPaymentDetails (
PaymentID integer(10) NOT NULL,
CONSTRAINT customerPaymentDetails_pk PRIMARY KEY (PaymentID),
CustomerID integer(10) NOT NULL,
CONSTRAINT customerID_fk FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
PaymentType char(1) NOT NULL
);

CREATE TABLE CustomerOrderItem(
StockID integer(10) NOT NULL,
CustomerOrderID integer(10) NOT NULL,
CONSTRAINT customerOrderItem_pk PRIMARY KEY(StockID,CustomerOrderID),
Quantity integer(10) NOT NULL
);

CREATE TABLE CustomerOrder(
CustomerOrderID integer(10) NOT NULL,
CONSTRAINT CustomerOrdercustomerorder_pk PRIMARY KEY (CustomerOrderID),
EmployeeID integer(10) NOT NULL,
CONSTRAINT CustomerOrderemployee_id_customerorder_fk FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
PaymentID integer(10) NOT NULL,
CONSTRAINT CustomerOrderPaymentID_fk FOREIGN KEY (PaymentID) REFERENCES CustomerPaymentDetails(PaymentID),
CustomerID integer(10) NOT NULL,
CONSTRAINT CustomerOrderCustomerID_fk FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
BranchID integer(10) NOT NULL,
CONSTRAINT CustomerOrderBranchID_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
OrderDate DATE NOT NULL,
TotalOrderPrice integer(6) NOT NULL
);

CREATE TABLE Supplier(
SupplierID integer(10) NOT NULL,
CONSTRAINT SupplierID_pk PRIMARY KEY (SupplierID),
Name varchar(20) NOT NULL,
ContactEmail varchar(40) NOT NULL,
ContactTelephone varchar(20) NOT NULL
);

CREATE TABLE SupplierOrder(
SupplierOrderID integer(10) NOT NULL,
CONSTRAINT SupplierOrderID_pk PRIMARY KEY (SupplierOrderID),
SupplierID integer(10) NOT NULL,
CONSTRAINT SupplierID_fk FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
BranchID integer(10) NOT NULL,
CONSTRAINT BranchID_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
OrderDate DATE NOT NULL,
TotalOrderPrice integer(6) NOT NULL
);

CREATE TABLE SupplierOrderItem(
StockID integer(10) NOT NULL,
SupplierOrderID integer(10) NOT NULL,
CONSTRAINT stockid_suppierorderid_pk PRIMARY KEY (StockID,SupplierOrderID),
Quantity integer(3) NOT NULL
);

CREATE TABLE Employee(
EmployeeID integer(10) NOT NULL,
CONSTRAINT employeeid_pk PRIMARY KEY (EmployeeID),
BranchID integer(10) NOT NULL,
CONSTRAINT employee_branchid_fk FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
Name varchar(20) NOT NULL
);

CREATE TABLE Branch(
BranchID integer(10) NOT NULL,
CONSTRAINT branch_branchID_pk PRIMARY KEY (BranchID),
AddressLineOne varchar(20) NOT NULL,
AddressLineTwo varchar(40) NOT NULL,
PostCode varchar(8) NOT NULL
);

CREATE TABLE StockItem(
StockID integer(10) NOT NULL,
CONSTRAINT stockItem_StockID_pk PRIMARY KEY (StockID),
SupplierID integer(10) NOT NULL,
CONSTRAINT stock_item_fk FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
Price integer(5) NOT NULL,
Name varchar(20) NOT NULL,
Quantity integer(10) NOT NULL
);

CREATE TABLE BranchStockItem(
BranchID integer(10) NOT NULL,
StockID integer(10) NOT NULL,
CONSTRAINT branchStockItem_branchidstockid_pk PRIMARY KEY (BranchID,StockID)
);
