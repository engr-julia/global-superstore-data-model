CREATE SCHEMA IF NOT EXISTS global_super_store_dw;
USE global_super_store_dw;

CREATE TABLE DimTime (
  TimeKey  INT NOT NULL AUTO_INCREMENT,
  FullDate DATE NOT NULL,
  Year     INT NULL,
  Quarter  VARCHAR(45) NULL,
  Month    INT NULL,
  Day      INT NULL,
  PRIMARY KEY (TimeKey)
);

CREATE TABLE DimLocation (
  LocationKey INT NOT NULL AUTO_INCREMENT,
  Continent   VARCHAR(45) NULL,
  Country     VARCHAR(45) NULL,
  State       VARCHAR(45) NULL,
  City        VARCHAR(45) NULL,
  PRIMARY KEY (LocationKey)
);

CREATE TABLE DimProducts (
  ProductKey  INT NOT NULL AUTO_INCREMENT,
  ProductName VARCHAR(255) NULL,
  Category    VARCHAR(45) NULL,
  Subcategory VARCHAR(45) NULL,
  Description VARCHAR(255) NULL,
  PRIMARY KEY (ProductKey)
);

CREATE TABLE FactSales (
  SalesKey    INT NOT NULL AUTO_INCREMENT,
  Price       DECIMAL(10,2) NULL,
  Cost        DECIMAL(10,2) NULL,
  Shipping    DECIMAL(10,2) NULL,
  Quantity    INT NULL,
  LocationKey INT NOT NULL,
  ProductKey  INT NOT NULL,
  TimeKey     INT NOT NULL,
  PRIMARY KEY (SalesKey),
  CONSTRAINT fk_fact_location FOREIGN KEY (LocationKey) REFERENCES DimLocation (LocationKey),
  CONSTRAINT fk_fact_product  FOREIGN KEY (ProductKey)  REFERENCES DimProducts (ProductKey),
  CONSTRAINT fk_fact_time     FOREIGN KEY (TimeKey)     REFERENCES DimTime (TimeKey)
);
