WITH MOST_ORDERS AS (
	SELECT
		TOP 10
		o.o_custkey AS c_custkey,
		COUNT(o.o_orderkey) AS num_orders
	FROM 
		dbo.orders as o
	WHERE 
		o_orderdate >= '2022-10-01'
	GROUP BY 
		o_custkey
	HAVING 
		COUNT(o_orderkey) >= 3
	ORDER BY 
		COUNT(o_orderkey) DESC
	)
SELECT
	o.o_custkey AS c_custkey,
	c.c_name,
	COUNT(o.o_orderkey) AS num_orders,
	SUM(o.o_totalprice) AS total_amount
FROM 
	dbo.orders as o
LEFT JOIN
	dbo.customers as c
	ON  o.o_custkey = c.c_custkey
WHERE
	o_orderdate >= '2022-10-01'
GROUP BY 
	o_custkey,
	c.c_name
HAVING
	COUNT(o.o_orderkey) >= (SELECT MIN(num_orders) FROM MOST_ORDERS)
