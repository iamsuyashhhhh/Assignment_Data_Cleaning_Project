import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv("Sample - Superstore.csv", encoding="latin1")

engine = create_engine(
    "postgresql+psycopg2://postgres:241004@localhost:5432/superstore_db"
)

df.to_sql(
    name="superstore_sales",
    con=engine,
    if_exists="replace",
    index=False
)
print("Loaded into PostgreSQL successfully")