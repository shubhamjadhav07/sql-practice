SELECT
    customer_id,
    MIN(order_date) AS first_order_date
FROM Orders
GROUP BY customer_id
ORDER BY customer_id;
