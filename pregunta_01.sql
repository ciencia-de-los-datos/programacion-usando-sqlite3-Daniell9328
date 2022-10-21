-- 
--  La tabla `tbl1` tiene la siguiente estructura:
-- 
--    K0  CHAR(1)
--    K1  INT
--    c12 FLOAT
--    c13 INT
--    c14 DATE
--    c15 FLOAT
--    c16 CHAR(4)
--
--  Escriba una consulta en SQL que devuelva la suma del campo c12.
-- 
--  Rta/
--     SUM(c12)
--  0  15137.63
--
--  >>> Escriba su codigo a partir de este punto <<<
--

data_tbl1 = pd.read_csv(
    "https://raw.githubusercontent.com/ciencia-de-los-datos/programacion-usando-sqlite3-Daniell9328/main/tbl1.csv",
    sep = ",",
    thousands = None,
    decimal = ".",
    encoding = "latin-1"
)

new_data_tbl1 = (data_tbl1.T.reset_index().T.reset_index(drop=True)
            .set_axis(['K0', 'K1', 'c12', 'c13', 'c14', 'c15', 'c16'], axis='columns'))

new_data_tbl1.to_sql(name= "tbl1", con = conn, if_exists = "replace")

#cur.execute ("SELECT * FROM tbl1 LIMIT 1,3;").fetchall()

cur.execute(
    """SELECT sum(c12)
       FROM tbl1
    """
).fetchall()
