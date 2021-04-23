SELECT M.ItemID, M.Description, AVG(O.Cost) as AvgOfCost, AVG(SalePrice) AS AvgOfSalePrice
FROM PET..Merchandise M
INNER JOIN PET..OrderItem O ON M.ItemID = O.ItemID
INNER JOIN PET..SaleItem  S ON M.ItemID = S.ItemID
GROUP BY M.ItemID, M.Description
HAVING AVG(SalePrice) > AVG(Cost) * 1.5
ORDER BY M.ItemID

SELECT TOP 1 MO.SupplierID, S.Name, ROUND(AVG(MO.ShippingCost/O.OrderTotal), 2) AS PctShipCost
FROM PET..MerchandiseOrder MO
INNER JOIN PET..Supplier S ON MO.SupplierID = S.SupplierID
INNER JOIN (SELECT O.PONumber, SUM(O.Quantity * O.Cost) AS OrderTotal
FROM PET..OrderItem O
WHERE O.PONumber IN (SELECT MO.PONumber
FROM PET..MerchandiseOrder MO)
GROUP BY O.PONumber) O ON MO.PONumber = O.PONumber
GROUP BY MO.SupplierID, S.Name
ORDER BY PctShipCost DESC

SELECT TOP 1 C.CustomerID, C.LastName, C.FirstName, SUM(ISNULL(SI.MerchTotal, 0)) AS MerchTotal, SUM(ISNULL(SA.SumOfSalePrice, 0)) AS SumOfSalePrice, SUM(ISNULL(SI.MerchTotal, 0)) + SUM(ISNULL(SA.SumOfSalePrice, 0)) AS GrandTotal
FROM PET..Sale S
INNER JOIN PET..Customer C ON S.CustomerID = C.CustomerID
LEFT JOIN (SELECT SI.SaleID, SUM(SI.Quantity * SI.SalePrice) AS MerchTotal
FROM PET..SaleItem SI
GROUP BY SI.SaleID) SI ON S.SaleID = SI.SaleID
LEFT JOIN (SELECT SA.SaleID, SUM(ISNULL(SA.SalePrice, 0)) AS SumOfSalePrice
FROM PET..SaleAnimal SA
GROUP BY SA.SaleID) SA ON S.SaleID = SA.SaleID
GROUP BY C.CustomerID, C.LastName, C.FirstName
ORDER BY GrandTotal DESC
