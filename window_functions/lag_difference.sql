--Find the difference between each order amount and the previous order amount.

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount,
    amount - LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS amount_difference
FROM Orders;
