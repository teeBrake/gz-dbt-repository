-- second intermediate table

select

        orders_id
    ,   MIN(date_date) as date_date
    ,   ROUND(SUM(revenue),2)   as revenue
    ,   SUM(quantity)  as quantity
    ,   Round(SUM(purchase_cost),2) as purchase_cost
    ,   Round(SUM(margin),2)        as margin

        
from {{ ref('int_sales_margin') }}
GROUP by orders_id
Order by orders_id DESC
