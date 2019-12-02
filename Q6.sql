SELECT StoreCode, COUNT(StockNo) AS Unique_items
FROM Stocks
GROUP BY StoreCode
ORDER BY Unique_items DESC
FETCH FIRST 1 ROW ONLY
/
