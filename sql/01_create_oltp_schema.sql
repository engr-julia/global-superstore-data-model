CREATE SCHEMA IF NOT EXISTS global_super_store;
USE global_super_store;

CREATE TABLE Customers (
  CustomerID    INT NOT NULL AUTO_INCREMENT,
  FullName      VARCHAR(255) NOT NULL,
  ContactNumber VARCHAR(45) NULL,
  Email         VARCHAR(255) NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Products (
  ProductID     INT NOT NULL AUTO_INCREMENT,
  ProductName   VARCHAR(255) NOT NULL,
  AmountInStock INT NULL,
  Price         DECIMAL(10,2) NULL,
  Category      VARCHAR(45) NULL,
  Subcategory   VARCHAR(45) NULL,
  PRIMARY KEY (ProductID)
);

CREATE TABLE DeliveryAddress (
  AddressID INT NOT NULL AUTO_INCREMENT,
  Street    VARCHAR(255) NULL,
  PostCode  VARCHAR(45) NULL,
  City      VARCHAR(45) NULL,
  State     VARCHAR(45) NULL,
  Country   VARCHAR(45) NULL,
  PRIMARY KEY (AddressID)
);

CREATE TABLE Shipping (
  ShipID    INT NOT NULL AUTO_INCREMENT,
  ShipDate  DATE NULL,
  ShipMode  VARCHAR(45) NULL,
  ShipCost  DECIMAL(10,2) NULL,
  AddressID INT NOT NULL,
  PRIMARY KEY (ShipID),
  CONSTRAINT fk_shipping_address
    FOREIGN KEY (AddressID) REFERENCES DeliveryAddress (AddressID)
);

CREATE TABLE Orders (
  OrderID       INT NOT NULL AUTO_INCREMENT,
  OrderDate     DATE NULL,
  CustomerID    INT NOT NULL,
  ProductID     INT NOT NULL,
  ShipID        INT NOT NULL,
  Quantity      INT NULL,
  Sales         DECIMAL(10,2) NULL,
  Discount      DECIMAL(5,2) NULL,
  Profit        DECIMAL(10,2) NULL,
  TotalCost     DECIMAL(10,2) NULL,
  OrderPriority VARCHAR(45) NULL,
  PRIMARY KEY (OrderID),
  CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
  CONSTRAINT fk_orders_product  FOREIGN KEY (ProductID)  REFERENCES Products (ProductID),
  CONSTRAINT fk_orders_shipping FOREIGN KEY (ShipID)     REFERENCES Shipping (ShipID)
);
