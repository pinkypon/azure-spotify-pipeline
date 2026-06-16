from airflow import DAG
from datetime import datetime
from airflow.providers.databricks.operators.databricks import DatabricksNotebookOperator
from airflow.operators.bash import BashOperator

with DAG(
  dag_id = "spotify_pipeline",
  start_date = datetime(2026, 1, 1),
  schedule = None
) as dag:
    silver_task = DatabricksNotebookOperator(
      task_id = "run_silver_transformation",
      notebook_path = "/Workspace/Users/markjemdee01@gmail.com/silver_transformation",
      source = "WORKSPACE",
      existing_cluster_id = "0610-033027-a3b1ghbf" # Databricks cluster ID in spotify-databricks workspace
    )
    gold_task = DatabricksNotebookOperator(
      task_id = "run_gold_transformation",
      notebook_path = "/Workspace/Users/markjemdee01@gmail.com/spotify_gold_transformation",
      source = "WORKSPACE",
      existing_cluster_id = "0610-033027-a3b1ghbf" # Databricks cluster ID in spotify-databricks workspace
    )
    bash_task_run = BashOperator(
      task_id = "run_dbt_models",
      bash_command = "dbt run --project-dir /usr/local/airflow/dags/dbt --profiles-dir /usr/local/airflow/dags/dbt"
    )
    bash_task_test = BashOperator(
      task_id = "test_dbt_models",
      bash_command = "dbt test --project-dir /usr/local/airflow/dags/dbt --profiles-dir /usr/local/airflow/dags/dbt"
    )
    silver_task >> gold_task >> bash_task_run >> bash_task_test