# BigDataSpark

Схема снежинки формируется в ./sql/ddl.sql и заполняется в etl_star_schema. Создается 6 отчетов в clickhouse и заполняется в clickhouse_reports.

Инструкция:
1) Запустить Docker: `docker-compose up` 
2) Подключиться к Jupyter Notebook'у через `localhost:8888`
3) Открыть файл `./work/etl_star_schema.ipynb` и запустить все ячейки
4) Открыть файл `./work/clickhouse_reports.ipynb` и запустить все ячейки 
5) Запустить DBeaver и подключиться к PostgreSQL (порт `55432`) и ClickHouse (порт `8123`) по логинам и паролям: `postgres:POSTGRES_PASSWORD` и `default:clickhouse123` соответственно. Для ClickHouse необходимо подключиться к базе данных default