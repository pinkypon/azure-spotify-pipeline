# Azure Spotify Data Pipeline

An end-to-end data engineering portfolio project that ingests, transforms, 
and visualizes Spotify music data using a medallion lakehouse architecture on Azure.

## Architecture
ADF → ADLS Gen2 → Databricks → Synapse Analytics → dbt → Power BI → Airflow

## Tech Stack
| Layer | Tool |
|---|---|
| Ingestion | Azure Data Factory |
| Storage | Azure Data Lake Storage Gen2 |
| Transformation | Databricks (PySpark) |
| Serving | Azure Synapse Analytics (Serverless) |
| Modeling | dbt Core (dbt-synapse) |
| Visualization | Power BI |
| Orchestration | Apache Airflow (Astro CLI) |

## Pipeline Stages
- **Bronze** → 114 Spotify genre CSVs ingested via ADF dynamic pipeline
- **Silver** → 113,865 clean rows in Delta format via Databricks PySpark
- **Gold** → 7 analytical Parquet tables via Databricks
- **dbt** → 7 Synapse views with 13 data quality tests
- **Airflow** → Full pipeline orchestrated in a single DAG (4 tasks)

## How to Run
1. Clone the repo
2. Copy `airflow/.env.example` to `airflow/.env` and fill in Azure credentials
3. Run `astro dev start` inside `airflow/`
4. Trigger `spotify_pipeline` DAG in Airflow UI