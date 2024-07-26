/*
1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), 
"nombre" (texto) y "precio" (numérico).
*/

CREATE TABLE IF NOT EXISTS "Productos" (
	"id" SERIAL PRIMARY KEY,
	"nombre" VARCHAR(255),
	"precio" DECIMAL
);

/*
Inserta al menos cinco registros en la tabla "Productos".
*/
INSERT INTO "Productos"(nombre,precio)
VALUES 
	('abrigo',99.99),
	('camiseta_basica_blanca',15.05),
	('pantalon_vaquero',25.75),
	('pantalon_corto',15.00),
	('polo_manga_larga',30);
/*
Actualiza el precio de un producto en la tabla "Productos".
*/
UPDATE "Productos"
SET "precio"= 33
WHERE "nombre" = 'polo_manga_larga';

/*
4. Elimina un producto de la tabla "Productos".
*/
DELETE FROM "Productos" 
WHERE "id" = 1;

/*

5. Realiza una consulta que muestre los nombres de los usuarios 
junto con los nombres de los productos que han comprado 
(utiliza un INNER JOIN con la tabla "Productos").
Aunque el ejercicio no lo especifica entiendo que es necesario generar una tabla
de Ventas que reuna información entre los usuarios y los productos 
*/

CREATE TABLE IF NOT EXISTS "Ventas"  (
	"id" SERIAL PRIMARY KEY,
	"id_usuario" INT, 
	"id_producto" INT, 
	FOREIGN KEY ("id_usuario") REFERENCES "Usuarios"("id"),
	FOREIGN KEY ("id_producto") REFERENCES "Productos"("id")
);

INSERT INTO "Ventas"(id_usuario,id_producto)
VALUES
	(2,4),
	(2,2),
	(2,3),
	(3,3),
	(4,2);
SELECT u."nombre" AS "Nombre_Usuario", p."nombre" AS "Nombre_producto"
FROM "Usuarios" as u
INNER JOIN "Ventas" as v ON v."id_usuario"=u."id"
INNER JOIN "Productos" as p ON p."id" = v."id_producto";