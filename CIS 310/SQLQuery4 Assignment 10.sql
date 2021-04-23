SELECT ItemID, Description, ListPrice FROM PET..Merchandise WHERE ListPrice > (SELECT AVG(ListPrice) FROM PET..Merchandise);

SELECT E.EmployeeID, E.FirstName, E.LastName, S.TotalSales, (S.TotalSales/(SELECT SUM(SI.SalePrice)
FROM PET..Sale S
INNER JOIN (SELECT SI.SaleID, SUM(SI.Quantity * SI.SalePrice) AS SalePrice
FROM PET..SaleItem SI
GROUP BY SI.SaleID) SI ON S.SaleID = SI.SaleID)) AS PctSales
FROM PET..Employee E
INNER JOIN (
SELECT S.EmployeeID, SUM(SI.SalePrice) AS TotalSales
FROM PET..Sale S
INNER JOIN (SELECT SI.SaleID, SUM(SI.Quantity * SI.SalePrice) AS SalePrice
FROM PET..SaleItem SI
GROUP BY SI.SaleID) SI ON S.SaleID = SI.SaleID
GROUP BY S.EmployeeID) S ON E.EmployeeID = S.EmployeeID
ORDER BY S.TotalSales DESC;

SELECT C.CustomerID, C.LastName, C.FirstName, MayTotal
FROM PET..Customer C
INNER JOIN (
SELECT S.CustomerID, S.SaleID, MONTH(S.SaleDate) AS SaleMonth
FROM PET..Sale S
WHERE MONTH(S.SaleDate) = 5) S ON C.CustomerID = S.CustomerID
INNER JOIN (
SELECT SI.SaleID, SUM(SI.Quantity * SI.SalePrice) AS MayTotal
FROM PET..SaleItem SI
GROUP BY SI.SaleID
HAVING SUM(SI.Quantity * SI.SalePrice) > 100) SI ON S.SaleID = SI.SaleID
INNER JOIN (
SELECT S2.CustomerID, S2.SaleID
FROM PET..Sale S2
WHERE MONTH(S2.SaleDate) = 10) S2 ON C.CustomerID = S2.CustomerID
INNER JOIN (
SELECT SI2.SaleID
FROM PET..SaleItem SI2
GROUP BY SI2.SaleID
HAVING SUM(SI2.Quantity * SI2.SalePrice) > 50) SI2 ON S2.SaleID = SI2.SaleID;
