/*
1. Crea una base de datos llamada "MiBaseDeDatos".
2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), 
"nombre" (texto) y "edad" (entero).
*/

CREATE TABLE IF NOT EXISTS "Usuarios"(
"id" SERIAL PRIMARY KEY,
"nombre" VARCHAR(250),
"edad" INT
);

/*
3. Inserta dos registros en la tabla "Usuarios".
*/
INSERT INTO "Usuarios"(nombre,edad)
VALUES 
	('Juan',25),
	('Maria',28);
/*
4. Actualiza la edad de un usuario en la tabla "Usuarios".
*/
UPDATE "Usuarios"
SET "edad" = 29
WHERE "id"=1;

/*
5. Elimina un usuario de la tabla "Usuarios".
*/
DELETE FROM "Usuarios" 
WHERE "id"=1;

/*

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria),
"nombre" (texto) y "pais" (texto).
*/
CREATE TABLE IF NOT EXISTS "Ciudades"(
	"id" SERIAL PRIMARY KEY,
	"nombre" VARCHAR (250),
	"pais" VARCHAR(250)
);
/*
2. Inserta al menos tres registros en la tabla "Ciudades".
*/
INSERT INTO "Ciudades"(id, nombre, pais)
VALUES
	(1,'Madrid','España'),
	(2,'Barcelona','España'),
	(3,'Michigan','USA'),
	(4,'Lisboa','Portugal'),
	(5,'Roma','Italia');

/*

3. Crea una foreign key en la tabla "Usuarios" que se relacione 
con la columna "id" de la tabla "Ciudades".
*/
ALTER TABLE "Usuarios"
ADD COLUMN "ciudades_id" INT;
ALTER TABLE "Usuarios"
ADD CONSTRAINT fk_ciudades_id
FOREIGN KEY ("ciudades_id") REFERENCES "Ciudades"("id");


/*
4. Realiza una consulta que muestre los nombres de los usuarios junto 
con el nombre de su ciudad y país (utiliza un LEFT JOIN).
*/
UPDATE "Usuarios"
SET "ciudades_id"=1
WHERE "id"=2;

SELECT u."nombre" AS "Nombre_usuario",c."nombre" AS "Nombre_ciudad",c."pais" AS "País"
FROM "Usuarios" as u 
LEFT JOIN "Ciudades" as c ON c."id" = u."ciudades_id";
/*
Realiza una consulta que muestre solo los usuarios 
que tienen una ciudad asociada (utiliza un INNER JOIN).


*/

INSERT INTO "Usuarios"(nombre,edad,ciudades_id)
VALUES 
	('Juan',25,3),
	('Ramona',28,1);

SELECT u."nombre" AS "Nombre_usuario",c."nombre"
FROM "Usuarios" AS u
INNER JOIN "Ciudades" as c ON c."id"=u."ciudades_id";