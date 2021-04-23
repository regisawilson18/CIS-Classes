SELECT M.ItemID, M.Description, M.ListPrice
FROM PET..Merchandise M
WHERE M.ListPrice > 50 AND M.ItemID NOT IN (SELECT SI.ItemID
FROM PET..Sale S
INNER JOIN (SELECT SI.ItemID, SI.SaleID
FROM PET..SaleItem SI
) SI ON S.SaleID = SI.SaleID
WHERE MONTH(S.SaleDate) = 7)

SELECT AK.ItemID, Description, QuantityOnHand  
FROM PET..Merchandise AK 
LEFT OUTER JOIN PET..OrderItem OI ON AK.ItemID = OI.ItemID 
LEFT OUTER JOIN PET..MerchandiseOrder MO ON OI.PONumber = MO.PONumber 
WHERE QuantityOnHand > 100 AND 
         OI.ItemID IS NULL    OR 
         YEAR(OrderDate) <> 2004 
  
SELECT M.ItemID, M.Description, M.QuantityOnHand
FROM PET..Merchandise M
WHERE M.QuantityOnHand > 100 AND M.ItemID NOT IN (SELECT OI.ItemID
FROM PET..OrderItem OI)

SELECT S.Name,'Sold Us Animals in June' AS 'Type of Sale'
FROM PET..Supplier S
INNER JOIN PET..AnimalOrder AO ON S.SupplierID = AO.SupplierID WHERE MONTH(AO.OrderDate) = 6
UNION ALL SELECT S.Name, 'Sold Us Merchandise in June' AS 'Type of Sale'
FROM PET..Supplier S
INNER JOIN PET..MerchandiseOrder MO ON S.SupplierID = MO.SupplierID WHERE MONTH(MO.OrderDate) = 6
ORDER BY S.Name
