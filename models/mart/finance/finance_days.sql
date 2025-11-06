/* 
The finance team has communicated that they want the following data at a daily granularity:

    Date
    Total number of transactions
    Total revenue
    Average Basket
    Operational Margin
    Total purchase cost
    Total shipping fees
    Total log costs
    Total quantity of products sold.
*/

-- {{ config(materialized='table')}}

select

        date_date
    ,   COUNT(distinct orders_id)                           as Total_number_transactions
    ,   ROUND(SUM(revenue),2)                               as Total_revenue
    ,   ROUND(SUM(revenue)/(COUNT(distinct orders_id)),2)   as Average_Basket
    ,   ROUND(SUM(operational_margin),2)                             as total_operational_margin
    ,   ROUND(SUM(purchase_cost),2)                                  as total_purchase_cost
    ,   ROUND(SUM(shipping_fee),2)                                   as total_shipping_fee
    ,   ROUND(SUM(logcost),2)                                        as total_log_cost
    ,   ROUND(SUM(ship_cost),2)                                      as ship_cost
    ,   SUM(quantity)                                      as total_quantity_of_products_sold

from {{ ref('int_orders_operational') }}

GROUP by date_date
Order by date_date 