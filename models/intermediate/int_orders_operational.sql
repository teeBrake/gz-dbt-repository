-- 3rd intermediate model

select
    orders.orders_id
,   MIN(orders.date_date) as date_date
,   ROUND((SUM(orders.margin) + SUM(ship.shipping_fee) - SUM(ship.logcost) - SUM(ship.ship_cost)),2) as operational_margin
,   SUM(quantity) as quantity
,   SUM(revenue) as revenue
,   SUM(shipping_fee) as shipping_fee
,   SUM(ship_cost)    as ship_cost
,   SUM(logcost)      as logcost
,   SUM(purchase_cost) as purchase_cost

    
from {{ ref('int_orders_margin') }} as orders
JOIN {{ ref('stg_raw__ship') }}     as ship
USING(orders_id)
Group by orders_id
order by orders_id desc