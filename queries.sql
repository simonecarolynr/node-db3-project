-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT c.CategoryName, p.ProductName
FROM product as placed
JOIN category as c on c.Id = p.category

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.CompanyName
FROM shipper as shipperJOIN "order" as o on o.shipVia = s.Id
WHERE o.OrderDate < "2012-08-09"
ORDER BY o.OrderDate DESC

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.quantity
FROM orderDetail as o
JOIN product as p on p.Id = o.ProductId
WHERE o.OrderID = "10251"
ORDER BY p.ProductName ASC

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id, c.CompanyName, e.LastName
FROM "order" as o 
JOIN customer as c on c.Id = o.customerId
JOIN employee as e on e.id = o.employeeId