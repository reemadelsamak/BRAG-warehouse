#IEM 4723 - Fall 2020 Project Database
#Purpose: Running this file will create and populate the data for the IEM 4723 Fall 2020 Group Project
#Follow instructions in comments to set up database in MySQL Workbench

#First, Run ONLY the line below (line 6)
CREATE DATABASE BRAG;
USE BRAG;
#Now, reconnect to the database and select the BRAG database in the SCHEMAS window by double clicking on it

#Finally, run all the code below (Easiest way to do this is to comment out the CREATE DATABASE statement in line 6, then run the whole file)

CREATE TABLE Vendor( 
	Vendor_Num CHAR(5) PRIMARY KEY,
    Vendor_Name VARCHAR(255),
    Vendor_Address VARCHAR(255),
    Vendor_Phone CHAR(10),
    Vendor_Email VARCHAR(255),
    Vendor_City VARCHAR(255),
    Vendor_State CHAR(2),
    Vendor_ZIP CHAR(5)
);
    
CREATE TABLE Shipment(
    Shipment_Num CHAR(9) PRIMARY KEY,
    Vendor_Num CHAR(5),
    Shipment_ReceiptDate DATE,
    Shipment_NumPallets INTEGER,
    PurchaseOrder_Num VARCHAR(255),
    FOREIGN KEY(Vendor_Num) REFERENCES Vendor(Vendor_Num) ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE Cases(
    Case_ID CHAR(3) PRIMARY KEY,
    Item_Quantity INTEGER,
    Case_Weight INTEGER
);

CREATE TABLE Item(
	Item_ID VARCHAR(255) PRIMARY KEY,
    Item_Description VARCHAR(255),
    Item_Price INTEGER,
    Item_Weight INTEGER,
    Item_AnnualSales INTEGER,
    Item_StockLocation VARCHAR(255)
);

CREATE TABLE Pallet(
	Pallet_ID VARCHAR(3) PRIMARY KEY,
    Pallet_Weight INTEGER,
    Pallet_Volume INTEGER
);

CREATE TABLE Customer(
	Customer_Num VARCHAR(5) PRIMARY KEY,
    Customer_FirstName VARCHAR(255),
    Customer_LastName VARCHAR(255),
    Customer_Address VARCHAR(255),
    Customer_City VARCHAR(255),
    Customer_State CHAR(2),
    Customer_ZIP CHAR(5),
    Customer_Phone CHAR(10),
    Customer_Email VARCHAR(255)
);
    
CREATE TABLE CustomerOrder(
	Order_Num CHAR(8) PRIMARY KEY,
    Customer_Num VARCHAR(5),
    Order_Date DATE,
    Order_ReqShipDate DATE,
    Order_ActualShipDate DATE,
    Order_Carrier VARCHAR(255),
    FOREIGN KEY(Customer_Num) REFERENCES Customer(Customer_Num) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Order_Item(
	Order_Num CHAR(8),
    Item_ID VARCHAR(255),
    Item_Qty INTEGER,
    PRIMARY KEY(Order_Num, Item_ID),
    FOREIGN KEY(Order_Num) REFERENCES CustomerOrder(Order_Num) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Item_ID) REFERENCES Item(Item_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE Shipment_Info(
	Shipment_Num CHAR(9),
    Case_ID CHAR(3),
    Item_ID VARCHAR(255),
    Pallet_ID VARCHAR(3),
    Item_Qty INTEGER,
    PRIMARY KEY(Shipment_Num, Case_ID, Item_ID, Pallet_ID),
    FOREIGN KEY(Shipment_Num) REFERENCES Shipment(Shipment_Num) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Case_ID) REFERENCES Cases(Case_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Item_ID) REFERENCES Item(Item_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Pallet_ID) REFERENCES Pallet(Pallet_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Vendor(Vendor_Num, Vendor_Name, Vendor_Address, Vendor_Phone, Vendor_Email, Vendor_City, Vendor_State, Vendor_ZIP) VALUES
	('V1107','CALATLANTIC GROUP','1100 WILSON BOULEVARD','8433481214','CUKP@CALA.com','ARLINGTON','VA','22209'),
	('V1119','UNION SUPPLIERS','1400 DOUGLAS STREET','7803978503','VGBP@UNIO.com','OMAHA','NE','68179'),
	('V1320','BUILDERS FIRSTSOURCE','2001 BRYAN STREET','2857794738','RUXH@BUIL.com','DALLAS','TX','75201'),
	('V1321','KIMBERLY-KENT','351 PHELPS DRIVE','3987045942','LWST@KIMB.com','IRVING','TX','75038'),
	('V1443','NEWMONT WEARS','6363 SOUTH FIDDLERS GREEN CIRCLE','9773425160','YYZH@NEWM.com','GREENWOOD VILLAGE','CO','80111'),
	('V1444','CUMMINS','500 JACKSON STREET','2746853534','PPNB@CUMM.com','COLUMBUS','IN','47201'),
	('V1445','WALLYMART','702 SW 8TH STREET','9122776520','GUPD@WALM.com','BENTONVILLE','AR','72716'),
	('V1446','US FINE HOLDING','9399 WEST HIGGINS ROAD','2753971873','TDSD@USFH.com','ROSEMONT','IL','60018'),
	('V1448','SOUTHWEST GROUP','2702 LOVE FIELD DRIVE','7932062925','SBIR@SOUT.com','DALLAS','TX','75235'),
	('V1450','ENERGY OUTFITTERS','8111 WESTCHESTER DRIVE','8562981897','OZBB@ENER.com','DALLAS','TX','75225');

INSERT INTO Shipment(Shipment_Num, Vendor_Num, Shipment_ReceiptDate, Shipment_NumPallets, PurchaseOrder_Num) VALUES
	('S11072702','V1107','2019-10-29',2,'622702'),
	('S11190738','V1119','2019-11-15',1,'623212'),
	('S13203212','V1320','2019-11-04',1,'1610672'),
	('S14460672','V1446','2019-11-11',2,'1610738'),
	('S14503246','V1450','2019-11-18',3,'623246');
    
INSERT INTO Cases(Case_ID, Item_Quantity, Case_Weight) VALUES
	('284',4,12),
	('292',4,12),
	('297',4,12),
	('305',4,12),
	('316',4,12),
	('325',4,12),
	('331',4,12),
	('337',4,12),
	('339',4,12),
	('341',4,12),
	('344',4,12),
	('360',4,12),
	('391',4,12),
	('394',4,12),
	('397',4,12),
	('414',4,12),
	('424',4,12),
	('426',4,15),
	('434',4,15),
	('437',4,15),
	('439',4,15),
	('452',4,15),
	('457',4,15),
	('466',4,15),
	('467',4,15),
	('470',4,15),
	('489',4,15),
	('511',4,15),
	('514',4,15),
	('519',4,15),
	('535',5,20),
	('538',5,20),
	('555',5,20),
	('556',5,20),
	('572',5,20),
	('588',5,20),
	('596',5,20),
	('601',5,20),
	('608',5,20),
	('640',5,20),
	('641',5,20),
	('648',5,20),
	('660',5,20),
	('700',5,20),
	('703',5,20),
	('708',5,20),
	('711',5,20),
	('725',5,20),
	('738',5,20),
	('772',5,20),
	('788',5,20),
	('798',5,20),
	('811',5,20),
	('813',5,20),
	('863',5,20),
	('884',5,20),
	('909',4,16),
	('915',4,16),
	('935',4,16),
	('937',4,16),
	('963',4,16),
	('977',4,16),
	('992',4,16);
    
INSERT INTO Item(Item_ID, Item_Description, Item_Price, Item_Weight, Item_AnnualSales, Item_StockLocation) VALUES
	('121312-0026','Slacks',13,0,60,'J6699'),
	('121332-0036','Slacks',10,0,2704,'J6699'),
	('14','Shirts',6,0,96,'A9309'),
	('143969','Neckwear',1,0,15,'X3359'),
	('143978','Neckwear',1,0,56,'E4347'),
	('18','Shirts',7,0,140,'A9309'),
	('25','Shirts',14,0,1016,'A9309'),
	('38','Shirts',15,0,52,'A9309'),
	('699933','Slacks',12,0,506,'L3234'),
	('71','Shirts',15,0,6672,'A9309'),
	('841188','Slacks',15,0,85,'L3234'),
	('842722','Slacks',14,0,131,'L3234'),
	('PL530-JD','Footwear',4,4,748,'A1976'),
	('PL538-JD','Footwear',2,4,16,'A1976'),
	('PL638-JD','Footwear',6,4,306,'A1976'),
	('PP24006','Neckwear',3,0,2,'E4347'),
	('PP24007','Neckwear',13,0,24,'E4347'),
	('TH3H390','Outerwear',7,4,3,'D9463'),
	('TH4H580','Outerwear',7,4,1,'D9463'),
	('TH4H690','Outerwear',14,4,13,'D9463');
    
INSERT INTO Pallet(Pallet_ID, Pallet_Weight, Pallet_Volume) VALUES
	('4',40,15),
	('8',35,12),
	('14',40,15),
	('42',36,13),
	('51',42,16),
	('70',40,15),
	('97',42,16),
	('98',35,12),
	('101',38,14),
	('151',35,12),
	('178',40,15),
	('202',36,13),
	('262',38,14),
	('283',42,16);
    
INSERT INTO Customer(Customer_Num, Customer_FirstName, Customer_LastName, Customer_Address, Customer_City, Customer_State, Customer_ZIP, Customer_Phone, Customer_Email) VALUES
	('C1002','John','Grant','225 WEST STATION SQUARE DRIVE','PITTSBURGH','PA','15219','7817993378','John@grant.com'),
	('C17','Jane','Nicks','2200 PENNSYLVANIA AVENUE NW','WASHINGTON','DC','20037','5694423796','Jane@nicks.com'),
	('C20','Bob','Felton','100 CRYSTAL A DRIVE','HERSHEY','PA','17033','2482604235','Bob@Felton.com'),
	('C35','Jill','Young','500 FRANK W BURR BOULEVARD','TEANECK','NJ','7666','9035970279','Jill@Young.com'),
	('C493','Russ','Jackson','500 WEST MADISON STREET','CHICAGO','IL','60661','8788658690','Russ@Young.com'),
	('C856','Chris','George','7500 DALLAS PARKWAY','PLANO','TX','75024','9778250256','Chris@George.com'),
	('C866','Sam','Stevenson','250 PARKCENTER BOULEVARD','BOISE','ID','83706','3593635559','Sam@Stevenson.com'),
	('C885','Jane','Newell','3600 LAS VEGAS BOULEVARD SOUTH','LAS VEGAS','NV','89109','2924803403','Jane@Newell.com'),
	('C935','Rick','Mason','1 VALERO WAY','SAN ANTONIO','TX','78249','6962953646','Rick@Mason.com'),
	('C959','Lilly','Walters','1025 WEST NASA BOULEVARD','MELBOURNE','FL','32919','9132816703','Lilly@Watson.com');
	
INSERT INTO CustomerOrder(Order_Num, Customer_Num, Order_Date, Order_ReqShipDate, Order_ActualShipDate, Order_Carrier) VALUES
	('16639375','C1002','2019-11-19','2019-11-19','2019-11-19','*** Customer Pickup ***'),
	('16642826','C20','2019-10-12','2019-10-12','2019-10-13','DHL Ground'),
	('16644074','C20','2019-10-25','2019-10-25','2019-10-25','UPS Ground'),
	('16645282','C35','2019-11-07','2019-11-07','2019-11-20','DHL Ground'),
	('16656274','C493','2019-11-08','2019-11-08','2019-11-08','FedEX FFL'),
	('16658443','C17','2019-10-09','2019-10-09','2019-10-09','FedEX FFL'),
	('16660133','C493','2019-11-13','2019-11-13','2019-11-13','UPS Ground'),
	('16662968','C935','2019-11-19','2019-11-19','2019-11-19','UPS Ground'),
	('16663993','C866','2019-11-17','2019-11-17','2019-11-17','DHL Ground');
    
INSERT INTO Order_Item(Order_Num, Item_ID, Item_Qty) VALUES
	('16639375','143969',1),
	('16639375','PL638-JD',2),
	('16639375','TH4H690',1),
	('16642826','121332-0036',4),
	('16642826','14',1),
	('16642826','25',4),
	('16642826','PP24007',1),
	('16644074','PL638-JD',1),
	('16644074','PP24006',2),
	('16645282','143978',2),
	('16645282','38',2),
	('16645282','699933',2),
	('16645282','TH4H580',1),
	('16656274','71',2),
	('16656274','841188',2),
	('16658443','121332-0036',1),
	('16658443','143978',2),
	('16658443','71',3),
	('16658443','PL638-JD',1),
	('16658443','TH4H580',1),
	('16660133','121312-0026',2),
	('16660133','38',2),
	('16660133','PL530-JD',1),
	('16660133','TH4H690',1),
	('16662968','121332-0036',2),
	('16662968','18',1),
	('16663993','699933',2),
	('16663993','71',1),
	('16663993','841188',1);
    
INSERT INTO Shipment_Info(Shipment_Num, Case_ID, Item_ID, Pallet_ID, Item_Qty) VALUES
	('S11072702','284','71','4',20),
	('S11072702','292','71','4',20),
	('S11072702','297','841188','4',15),
	('S11072702','305','841188','4',15),
	('S11072702','711','PL638-JD','8',4),
	('S11072702','725','PL638-JD','8',4),
	('S11072702','738','PL638-JD','8',4),
	('S11072702','772','PL530-JD','8',4),
	('S11072702','788','PL530-JD','8',4),
	('S11190738','331','25','51',16),
	('S11190738','337','25','51',14),
	('S11190738','339','25','51',15),
	('S11190738','341','25','51',15),
	('S13203212','798','TH4H690','97',1),
	('S13203212','811','121332-0036','97',20),
	('S13203212','813','121332-0036','97',20),
	('S13203212','863','121332-0036','97',20),
	('S13203212','884','25','97',12),
	('S14460672','316','121332-0036','151',15),
	('S14460672','325','121332-0036','151',15),
	('S14460672','909','143978','101',6),
	('S14460672','915','143969','101',6),
	('S14460672','935','71','101',15),
	('S14460672','937','71','101',15),
	('S14460672','963','71','101',15),
	('S14460672','977','121332-0036','151',15),
	('S14460672','992','121332-0036','151',15),
	('S14503246','344','PL530-JD','202',4),
	('S14503246','360','PL530-JD','202',4),
	('S14503246','391','TH4H690','202',1),
	('S14503246','394','TH4H690','202',1),
	('S14503246','397','699933','262',5),
	('S14503246','414','699933','262',5),
	('S14503246','424','18','262',6),
	('S14503246','426','18','262',6),
	('S14503246','434','PP24006','262',3),
	('S14503246','437','PP24007','283',2),
	('S14503246','439','PP24007','283',2),
	('S14503246','452','PP24007','283',2),
	('S14503246','457','38','283',10),
	('S14503246','466','38','283',10);