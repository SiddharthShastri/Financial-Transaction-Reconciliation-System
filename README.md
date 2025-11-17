📊 Financial Transaction Reconciliation System (dbt + Snowflake)

A complete end-to-end Financial Transaction Reconciliation project built using dbt, Snowflake, and SQL.
This project transforms raw financial data into reliable, analytics-ready datasets by following a multi-layered data architecture:

* Staging Layer

* Sanitized Layer

* Conformed Layer

* Curated Layer

Each environment (dev, internal, uat) automatically generates its own databases using dbt macros.
This ensures clean separation, easier QA, and smooth promotion across environments.
