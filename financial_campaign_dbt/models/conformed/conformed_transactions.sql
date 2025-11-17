{{ config(materialized="table") }}

-- CONFORMED LAYER
-- Standard unified s tructure for all transactions

with bank as (
    select
        transaction_id,
        transaction_date,
        merchant,
        amount,
        currency,
        'BANK' as source_system
    from {{ ref('sanitized_bank_transactions') }}
),

ledger as (
    select
        transaction_id,
        entry_date as transaction_date,
        merchant,
        amount,
        currency,
        'INTERNAL_LEDGER' as source_system
    from {{ ref('sanitized_internal_ledger') }}
)

select * from bank
union all
select * from ledger


