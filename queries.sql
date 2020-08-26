-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT c.CategoryName, p.ProductName
FROM Product as p
JOIN Category as c on c.Id = p.CategoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
	o.Id,
	s.CompanyName
FROM
	"shipper" AS s
	JOIN "order" AS o ON o.shipVia = s.Id
WHERE
	o.OrderDate < "2012-08-09"
ORDER BY
	o.OrderDate DESC

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
	o.Quantity,
	p.ProductName
FROM
	"OrderDetail" AS o
	JOIN "Product" AS p ON p.Id = o.ProductId
WHERE
	o.OrderId = "10251"
ORDER BY
	p.ProductName ASC

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT
	o.Id,
	c.CompanyName,
	e.LastName
FROM
	"Order" AS o
	JOIN "Customer " AS c ON c.Id = o.CustomerId
	JOIN "Employee" AS e ON e.Id = o.EmployeeId