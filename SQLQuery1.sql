USE master
GO
CREATE DATABASE PhoneStore
GO
USE PhoneStore
GO
CREATE TABLE Accounts (
	AccId int primary key identity(1,1),
	Email varchar(50) not null,
	Password varchar(30) not null,
	FullName varchar(50) not null,
	Status int not null,
	Role bit not null
)
GO
INSERT INTO Accounts
VALUES('admin@gmail.com','admin','Administrator','1','1')
INSERT INTO Accounts
VALUES('user1@gmail.com','user1','UserNo1','1','0')
INSERT INTO Accounts
VALUES('user2@gmail.com','user2','UserNo2','1','0')
GO

CREATE TABLE Categories (
	CateId int primary key identity(1,1),
	CateName varchar(50) not null
)
GO

INSERT INTO Categories VALUES('Apple')
INSERT INTO Categories VALUES('Samsung')
INSERT INTO Categories VALUES('Oppo')
GO

CREATE TABLE Products(
	ProductId int primary key identity(1,1),
	ProductName varchar(50) not null,
	Price float not null,
	CateId int FOREIGN KEY REFERENCES Categories(CateId),
	Status int not null,
	imgPath varchar(50) not null,
	description varchar(200) not null
)
GO

INSERT INTO Products
VALUES('Iphone 11',12.790,1,1,'images/iphone11.jpg','OS: IOS, RAM: 4GB, ROM: 64GB, Battery: 3110 mAh')
INSERT INTO Products
VALUES('Oppo Find X5 Pro 5G',32.990,3,1,'images/oppoFindX5Pro5G.jpg','OS: Android, RAM: 12GB, ROM: 256GB, Battery: 5000 mAh')
INSERT INTO Products
VALUES('Oppo Reno 7',10.490,3,1,'images/oppoReno7.jpg','OS: Android, RAM: 8GB, ROM: 128GB, Battery: 4500 mAh')
INSERT INTO Products
VALUES('Samsung Z Fold3 5G',32.990,2,1,'images/ssZFold.jpg','OS: Android, RAM: 12GB, ROM: 256GB, Battery: 4400 mAh')
INSERT INTO Products
VALUES('Iphone 12 Pro',18.490,1,1,'images/iphone12Pro.jpg','OS: IOS, RAM: 6GB, ROM: 128GB, Battery: 2815 mAh')
INSERT INTO Products
VALUES('Samsung Z Flip3 5G',12.790,2,1,'images/ssZFlip.jpg','OS: Android, RAM: 8GB, ROM: 128GB, Battery: 3300 mAh')
INSERT INTO Products
VALUES('Iphone 13 Pro Max',29.290,1,1,'images/iphone13ProMax.jpg','OS: IOS, RAM: 6GB, ROM: 128GB, Battery: 4352 mAh')
INSERT INTO Products
VALUES('Oppo A55',4.990,3,1,'images/oppoA55.jpg','OS: Android, RAM: 4GB, ROM: 64GB, Battery: 3110 mAh')
INSERT INTO Products
VALUES('Samsung Galaxy S22 Ultra 5G',27.990,2,1,'images/ssGalaxyS22Ultra5G.jpg','OS: Android, RAM: 8GB, ROM: 128GB, Battery: 5000 mAh')
GO

CREATE TABLE Orders(
	OrderId int primary key identity(1,1),
	AccId int FOREIGN KEY REFERENCES Accounts(AccId),
	Address varchar(50) not null,
	Status int not null,
	Total float not null,
	Date date not null
)
GO

CREATE TABLE OrderDetails(
	OrderId int FOREIGN KEY REFERENCES Orders(OrderId),
	ProductId int FOREIGN KEY REFERENCES Products(ProductId),
	Quantity int not null,
	Total float not null
)
GO




