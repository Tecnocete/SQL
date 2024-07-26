/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" 
(entero, clave primaria), "id_usuario" 
(entero, clave foránea de la tabla "Usuarios") y 
"id_producto" (entero, clave foránea de la tabla "Productos").
Como había hecho una tabla así que era " Ventas la borro y vuelvo
a crear una llamada Pedidos"
*/
--DROP TABLE "Ventas";
CREATE TABLE IF NOT EXISTS "Pedidos"  (
	"id" SERIAL PRIMARY KEY,
	"id_usuario" INT, 
	"id_producto" INT, 
	FOREIGN KEY ("id_usuario") REFERENCES "Usuarios"("id"),
	FOREIGN KEY ("id_producto") REFERENCES "Productos"("id")
);
/*
2. Inserta al menos tres registros en la tabla "Pedidos" 
que relacionen usuarios con productos.
*/
INSERT INTO "Pedidos"(id_usuario,id_producto)
VALUES
	(2,4),
	(2,2),
	(2,3),
	(3,3),
	(4,2);
/*
3. Realiza una consulta que muestre los nombres de los usuarios 
y los nombres de los productos que han comprado, 
incluidos aquellos que no han realizado 
ningún pedido (utiliza LEFT JOIN y COALESCE).
*/

SELECT u."nombre" AS "Nombre_Usuario", p."nombre" AS "Nombre_producto"
FROM "Usuarios" as u
LEFT JOIN "Pedidos" as pe ON pe."id_usuario"=u."id"
INNER JOIN "Productos" as p ON p."id" = pe."id_producto";
/*
Realiza una consulta que muestre los nombres de los usuarios 
que han realizado un pedido, 
pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).
*/
SELECT u."nombre" AS "Nombre_Usuario", pe."id" AS "numero_pedido"
FROM "Usuarios" as u
LEFT JOIN "Pedidos" as pe ON pe."id_usuario"=u."id";
/*
Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y 
actualiza 
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
*/
ALTER TABLE "Pedidos"
ADD COLUMN 
"cantidad" INT ;
UPDATE "Pedidos"
SET "cantidad"= 3
WHERE "cantidad" IS NULL;




