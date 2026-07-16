from airflow.models import Variable
from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import PostgresUserPasswordProfileMapping
import os
from pendulum import datetime


# =========================
# 1) PERFIL DEV - Aponta para Postgress Local (No Docker)
# =========================
profile_config_dev = ProfileConfig(
    profile_name="dw_bootcamp",  # Mesmo nome do profiles.yml
    target_name="dev",  # Mesmo nome do target do dbt
    profile_mapping=PostgresUserPasswordProfileMapping(
        # Conexão cadastrada em admin -> Conecctions no airflow
        conn_id="docker_postgres_db",
        profile_args={"schema": "public"},
    ),
)


# ==========================
# 2) PERFIL PROD - Aponta para Postgress remoto (Railway)
# ==========================
profile_config_prod = ProfileConfig(
    profile_name="dw_bootcamp",
    target_name="prod",  # Outra conexão apontando para prod
    profile_mapping=PostgresUserPasswordProfileMapping(
        conn_id="railway_postgres_db",
        profile_args={"schema": "public"},
    ),
)


# ======================================
# 3) DEFINIR QUAL AMBIENTE VAI EXECUTAR
# ======================================
dbt_env = Variable.get("dbt_env", default_var="dev").lower()

if dbt_env not in ("dev", "prod"):
    raise ValueError(f"dbt_env inválido: {dbt_env!r}, use 'dev' ou 'prod'")

profile_config = profile_config_dev if dbt_env == "dev" else profile_config_prod


# ======================================
# 4) CRIAR O DAG DO DBT COM O COSMOS
# ======================================
my_cosmos_dag = DbtDag(
    # -----------------------------
    # 4.1) Configuração do projeto
    # -----------------------------
    project_config=ProjectConfig(
        # Caminho onde o projeto dbt está dentro do container do Airflow (/usr/local/airflow/dbt/dw_bootcamp)
        dbt_project_path="/usr/local/airflow/dbt/dw_bootcamp",
        project_name="dw_bootcamp",
    ),
    profile_config=profile_config,  ## Credenciais injetadas via conexão do Airflow
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",
    ),
    operator_args={
        "install_deps": True,  # DBT baixa os pacotes antes de executar (dbt deps)
        "target": profile_config.target_name,
    },
    schedule="@daily",  # Execução diária
    start_date=datetime(2026, 7, 14),
    catchup=False,  # Não executa datas retroativas
    dag_id=f"dag_dw_bootcamp_{dbt_env}",  # Nome da Dag muda conforme o ambiente
    default_args={"retries": 2},  # 2 tentativas em caso de falha
)
