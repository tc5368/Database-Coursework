SELECT StoreCode, count(StockNo)
FROM Stocks
Where Price > (SELECT AVG(Price) FROM Stocks)
GROUP BY StoreCode
/
