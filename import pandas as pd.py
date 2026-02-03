import pandas as pd
import pyodbc


# EXTRACCIÓN

df = pd.read_csv("llamadas_911.csv")


# TRANSFORMACIÓN

df = df.drop_duplicates()
df = df.dropna(subset=["fecha_hora"])
df["fecha_hora"] = pd.to_datetime(df["fecha_hora"])


# CARGA

conexion = pyodbc.connect(
    "DRIVER={SQL Server};"
    "SERVER=localhost;"
    "DATABASE=Emergencias_911;"
    "Trusted_Connection=yes;"
)

cursor = conexion.cursor()

for _, fila in df.iterrows():
    cursor.execute("""
        INSERT INTO Llamadas_Emergencia (fecha_hora)
        VALUES (?)
    """, fila["fecha_hora"])

conexion.commit()
conexion.close()
