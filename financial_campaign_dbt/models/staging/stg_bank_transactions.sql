{{ config(materialized='view') }}

select *
from {{ source('raw', 'bank_transactions') }}

-- working for internal