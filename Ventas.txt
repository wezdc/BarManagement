CREATE TABLE IF NOT EXIST VENTAS
(
  id_venta int PRIMARY KEY IDENTITY NOT NULL,
  status bit DEFAULT 0,
--Foreign Key
  id_orden int NOT NULL,
  id_cajero int NOT NULL,
  id_mesero int NOT NULL,
  id_cliente int NOT NULL,
  id_producto int NOT NULL,
--Atributos de la tabla
  
  total_Venta float(2); 
)
