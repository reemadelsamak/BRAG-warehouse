/*Execute Line 2 First the the rest of the code*/
USE BRAG;

/*1*/
/*Items ordered by a customer*/
SELECT c.Customer_FirstName, c.Customer_LastName, i.Item_Description, Sum(oi.Item_Qty) as Total_Qty
FROM item as i
INNER JOIN order_item as oi
ON oi.Item_ID = i.Item_ID
Inner Join customerorder as co
ON co.Order_Num = oi.Order_Num
Inner Join customer as c 
ON c.Customer_Num = co.Customer_Num
WHERE c.Customer_FirstName ='Bob'
GROUP BY(i.Item_Description);

/*2*/
/*Customers who ordered a particular item*/
SELECT c.Customer_Num, c.Customer_FirstName, c.Customer_LastName, i.Item_Description, Sum(oi.Item_Qty) as Total_Qty
FROM customer as c
Inner Join customerorder as co
ON c.Customer_Num = co.Customer_Num
INNER JOIN order_item as oi
ON co.Order_Num = oi.Order_Num
Inner Join item as i 
ON oi.Item_ID = i.Item_ID
WHERE i.Item_Description='shirts'
GROUP BY c.Customer_Num;

/*3*/
/*Orders that were shipped late*/
SELECT Order_Num, Customer_Num, Order_ReqShipDate, Order_ActualShipDate
FROM customerorder 
WHERE Order_ActualShipDate > Order_ReqShipDate;

/*4*/
/*Items ordered in a particular time period*/
SELECT co.Order_Num, co.Customer_Num, co.Order_Date
FROM customerorder as co
Where co.Order_Date > '2019-10-24' AND co.Order_Date < '2019-11-14';

/*5*/
/*Items supplied by a vendor*/
SELECT v.Vendor_Name, i.Item_Description, i.Item_Price
FROM item as i
INNER JOIN shipment_info as si
ON i.Item_ID = si.Item_ID
Inner Join shipment as s
ON si.Shipment_Num = s.Shipment_Num
Inner Join vendor as v
ON s.Vendor_Num = v.Vendor_Num
WHERE v.Vendor_Name ='BUILDERS FIRSTSOURCE'
GROUP BY i.Item_Description;

/*6*/
/*Vendors who supplied a particular item*/
SELECT v.Vendor_Name, i.Item_Description
FROM vendor as v
INNER JOIN shipment as s
ON s.Vendor_Num = v.Vendor_Num
INNER JOIN shipment_info as si
ON si.Shipment_Num = s.Shipment_Num
INNER JOIN item as i
ON i.Item_ID = si.Item_ID
WHERE i.Item_Description ='slacks'
GROUP BY v.Vendor_Name;

/*7*/
/*Items received in a particular time period*/
SELECT s.Shipment_ReceiptDate, i.Item_Description, si.Item_Qty
FROM item as i
INNER JOIN shipment_info as si
ON i.Item_ID = si.Item_ID
Inner Join shipment as s
ON si.Shipment_Num = s.Shipment_Num
Where s.Shipment_ReceiptDate > '2019-10-30' AND s.Shipment_ReceiptDate < '2019-11-16';

/*8*/
/*Items in inventory during a particular time period*/
SELECT i.Item_StockLocation, i.Item_Description, Sum(si.Item_Qty) 
FROM item as i
INNER JOIN shipment_info as si
ON i.Item_ID = si.Item_ID
Inner Join shipment as s
ON si.Shipment_Num = s.Shipment_Num
Where s.Shipment_ReceiptDate > '2019-11-01'
GROUP BY i.Item_StockLocation
ORDER BY i.Item_Description;