-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category, name, revenue from
(select category,name,revenue,
rank() over(partition by  category order by revenue desc) as rn
from
(select pizza_types.name, pizza_types.category,SUM(order_details.quantity * pizzas.price) as revenue from pizza_types
join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.name ,pizza_types.category ) as a) as b
where rn<=3;