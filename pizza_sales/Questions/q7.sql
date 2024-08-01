-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS orders_by_hours,
    COUNT(order_id) AS order_counts
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY COUNT(order_id) DESC;