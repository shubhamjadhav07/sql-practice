WITH CustomerSpending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM Orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_spending
FROM CustomerSpending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM CustomerSpending
);
