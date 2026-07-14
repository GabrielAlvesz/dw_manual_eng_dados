-- CTE "src": seleciona todas as colunas do seed (dados brutos)
    with src as (
        select
            "Row ID", "Order ID",
            "Order Date", "Ship Date", "Ship Mode",
            "Customer ID", "Customer Name", "Segment",
            "Country", "City", "State", "Postal Code", "Region",
            "Product ID", "Category", "Sub-Category", "Product Name",
            "Sales", "Quantity", "Discount", "Profit"
        from "dbt_db"."public"."sample_superstore"
    ),
        
    typed as (
        select
            cast("Row ID"   as integer) as row_id,
            cast("Order ID" as text) as order_id,

            cast("Ship Date"  as date) as ship_date,
            cast("Order Date" as date) as order_date,
            cast("Ship Mode"  as text) as ship_mode,

            cast("Customer ID"   as text) as custumer_id,
            cast("Customer Name" as text) as customer_name,
            cast("Segment"       as text) as segment,
            cast("Country"       as text) as country,
            cast("City"          as text) as city,
            cast("State"         as text) as state,
            cast("Postal Code"   as text) as postal_code,
            cast("Region"        as text) as region,

            cast("Product ID"   as text) as product_id,
            cast("Category"     as text) as category,
            cast("Sub-Category" as text) as sub_category,
            cast("Product Name" as text) as product_name,

            cast("Sales"    as numeric) as sales,  
            cast("Quantity" as integer) as quantity,
            cast("Discount" as numeric) as discount,
            cast("Profit"   as numeric) as profit
        from src
    )

    select * from typed