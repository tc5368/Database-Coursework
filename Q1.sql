SELECT STOCKNO, DESCRIPTION, QUANTITY
FROM Stocks WHERE QUANTITY > 20
AND STOCKS.StoreCode = 'CENT'
ORDER BY Quantity DESC
/
