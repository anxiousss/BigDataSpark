FROM jupyter/pyspark-notebook:latest

USER root

RUN pip install psycopg2-binary sqlalchemy && \
    apt-get update && apt-get install -y postgresql-client && \
    apt-get clean

COPY ./jars/postgresql-42.7.4.jar /home/jovyan/jars/postgresql-42.7.4.jar
COPY ./notebooks/etl_star_schema.ipynb /home/jovyan/work/etl_star_schema.ipynb

USER jovyan

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--ServerApp.allow_password_change=False"]