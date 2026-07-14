
  
    

  create  table "dbt_db"."public"."int_dim_cliente__dbt_tmp"
  
  
    as
  
  (
    select 
	cliente_id,
from public.stg_vendas

group by cliente_id
  );
  