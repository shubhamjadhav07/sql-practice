WITH CustomerRevenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM Orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM CustomerRevenue;
