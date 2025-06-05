import mysql.connector
import os

DB_HOST=os.environ['DB_HOST']
DB_USER=os.environ['DB_USER']
DB_PASSWORD=os.environ['DB_PASSWORD']
DB_DATABASE_NAME=os.environ['DB_DATABASE_NAME']


def get_db_connection():
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_DATABASE_NAME
    )