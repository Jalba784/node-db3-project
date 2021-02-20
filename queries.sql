-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT P.CategoryId, P.ProductName, C.CategoryName
FROM Product AS P
INNER JOIN Category AS C
ON P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id , S.CompanyName
FROM "Order" AS O
JOIN Shipper AS S ON S.Id = O.ShipVia
WHERE OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT  P.ProductName, O.Quantity
FROM Product AS P
INNER JOIN OrderDetail AS O
ON O.ProductId = P.Id
WHERE O.OrderId = 10251
ORDER BY P.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id AS "Order Id",
C.CompanyName AS "Customers Company Name",
E.LastName AS "Employee's Last Name"
FROM "Order" AS O
INNER JOIN Customer AS C ON C.Id = O.CustomerId
INNER JOIN Employee AS E ON E.Id = O.EmployeeId;