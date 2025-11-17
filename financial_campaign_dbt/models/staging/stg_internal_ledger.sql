{{ config(materialized='view') }}

select *
from {{ source('raw', 'internal_ledger') }}

-- working for dev