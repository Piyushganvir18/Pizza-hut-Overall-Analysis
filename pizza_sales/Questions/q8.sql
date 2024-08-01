-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS pizza_name
FROM
    pizza_types
GROUP BY category
ORDER BY pizza_name;