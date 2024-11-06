
-----Hw11--------

-----Query1-------
SELECT Name,Price
FROM dbo.Products
WHERE Price>500

-----Query2-------
SELECT YEAR(OrderDate),SUM(TotalAmount) AS totalprice
FROM dbo.Orders
GROUP BY YEAR(OrderDate)

-----Query3-------
SELECT c.Name,SUM(TotalAmount) AS totalprice 
FROM dbo.Orders AS o INNER JOIN dbo.Products AS p ON p.Id = o.ProductId 
INNER JOIN dbo.Categories AS c ON c.Id = p.CategoryId
GROUP BY c.Name

-----Query4-------
SELECT Name,Price FROM dbo.Products ORDER BY  Price DESC
 
 -----Query5-------
 SELECT cu.Name,COUNT(o.CustomerId) AS countOrder
FROM dbo.Orders AS o INNER JOIN dbo.Products AS p ON p.Id = o.ProductId 
INNER JOIN dbo.Customers AS cu ON cu.Id = o.CustomerId
GROUP BY cu.Name

 -----Query6-------
 SELECT c.Name,AVG(p.Price) AS Avgprice 
FROM dbo.Products AS p 
INNER JOIN dbo.Categories AS c ON c.Id = p.CategoryId
GROUP BY c.Name

-----Query7-------
SELECT  p.Name ,c.Name
FROM dbo.Products AS p 
INNER JOIN dbo.Categories AS c ON c.Id = p.CategoryId
ORDER BY p.Name ,c.Name

-----Query8-------
SELECT YEAR(OrderDate) AS date , c.Name,SUM(TotalAmount) AS totalprice
FROM dbo.Orders AS o INNER JOIN dbo.Products AS p ON p.Id = o.ProductId 
INNER JOIN dbo.Categories AS c ON c.Id = p.CategoryId
WHERE DATEPART(year,OrderDate) = 2023 
GROUP BY YEAR(OrderDate),c.Name

-----Query9-------
SELECT YEAR(OrderDate) AS Year,MONTH(OrderDate) AS Month ,Count(o.Id) AS CountOrder
FROM dbo.Orders AS o 
GROUP BY YEAR(OrderDate),MONTH(OrderDate)
ORDER BY YEAR(OrderDate) DESC

-----Query10-------
SELECT cu.Name,SUM(TotalAmount) AS totalprice 
FROM dbo.Orders AS o INNER JOIN  dbo.Customers AS cu ON cu.Id = o.CustomerId
GROUP BY cu.Name

-----Query11-------
SELECT c.Name,COUNT(o.Id) AS count
FROM dbo.Orders AS o INNER JOIN dbo.Products AS p ON p.Id = o.ProductId 
INNER JOIN dbo.Categories AS c ON c.Id = p.CategoryId
GROUP BY c.Name

-----Query12-------
SELECT cu.Name,COUNT(o.CustomerId) AS countOrder
FROM dbo.Orders AS o INNER JOIN dbo.Products AS p ON p.Id = o.ProductId 
INNER JOIN dbo.Customers AS cu ON cu.Id = o.CustomerId
GROUP BY cu.Name
ORDER BY COUNT(o.CustomerId) DESC

-----Query13-------
SELECT YEAR(OrderDate),COUNT(dbo.Orders.Id) AS countOrder
FROM dbo.Orders
GROUP BY YEAR(OrderDate)

-----Query14-------
SELECT  p.Name , COUNT(DISTINCT(o.CustomerId)) AS CountCustomer
FROM dbo.Products AS p 
INNER JOIN dbo.Orders AS o ON p.Id = o.ProductId
GROUP BY p.Name 
ORDER BY COUNT(o.CustomerId) DESC
