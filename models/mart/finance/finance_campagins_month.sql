-- aggregating the days to monthly


SELECT

        EXTRACT(MONTH from date_date) as datemonth
    ,   ROUND(SUM(average_basket * quantity) / SUM(quantity),2) as average_basket
    ,   ROUND(SUM(operational_margin),2) AS operational_margin
    ,   SUM(ads_cost) AS ads_cost
    ,   SUM(ads_impression) AS ads_impression
    ,   SUM(ads_clicks) AS ads_clicks
    ,   SUM(quantity) AS quantity
    ,   ROUND(SUM(revenue),2) AS revenue
    ,   ROUND(SUM(purchase_cost),2) AS purchase_cost
    ,   ROUND(SUM(margin),2) AS margin
    ,   ROUND(SUM(shipping_fee),2) AS shipping_fee
    ,   ROUND(SUM(log_cost),2) AS log_cost
    ,   SUM(ship_cost) AS ship_cost

FROM  {{ ref('finance_campaigns_day') }}
Group by datemonth
order by datemonth