
SELECT stocks.stockno, description,
Case WHEN COUNT (DISTINCT orderitems.stockno) = 0 THEN 'No Orders'
ELSE CAST (COUNT(DISTINCT orderitems.stockno) AS CHAR)
END AS Num_Of_Orders
FROM stocks
LEFT OUTER JOIN orderitems
ON stocks.stockno = orderitems.stockno
GROUP BY stocks.stockno, description, orderitems.stockno
/
