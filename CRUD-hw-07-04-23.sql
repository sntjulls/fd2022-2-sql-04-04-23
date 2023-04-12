DROP TABLE IF EXISTS "pizza";

CREATE TABLE "pizza"(
    "id" SERIAL PRIMARY KEY, 
    "name" VARCHAR(12) NOT NULL CHECK("name"!=''), 
    "price" NUMERIC NOT NULL CHECK("price" > 0), 
    "diameter" NUMERIC NOT NULL
)

-- INSERT

INSERT INTO "pizza"("name", "price", "diameter")
VALUES ('Margherita', 50.4, 18);

INSERT INTO "pizza"("name", "price", "diameter")
VALUES ('Carbonara', 81, 28);

INSERT INTO "pizza"("name", "price", "diameter")
VALUES ('Caesar', 149, 38),
('Pepperoni', 116, 32);

-- UPDATE

UPDATE "pizza"
SET "price" = 53
WHERE "name" in ('Margherita')

UPDATE "pizza"
SET "diameter" = 30
WHERE "id" = 4
RETURNING *;

UPDATE "pizza"
SET "price" = 130
WHERE "price" > 100
RETURNING *;

UPDATE "pizza"
SET "diameter" = 22
WHERE "id" BETWEEN 2 AND 5;

UPDATE "pizza"
SET "name" = 'Four Cheese', "price" = 180
WHERE "name" = 'Caesar'

-- SELECT

SELECT "id", "name", "price", "diameter"
FROM "pizza"
WHERE "id" = 3; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "price" < 100; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "price" != 130; 

SELECT "price", "diameter"
FROM "pizza"
WHERE "name" = 'Pepperoni'; 

SELECT "name"
FROM "pizza"
WHERE "name" = 'Margherita'; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "name" != 'Carbonara'; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "diameter" = 22 AND "price" < 150; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "diameter" BETWEEN 25 AND 33;

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "diameter" BETWEEN 25 AND 33 OR "price" BETWEEN 100 AND 200; 

SELECT "name", "price", "diameter"
FROM "pizza"
WHERE "diameter" = 22 OR "price" = 180; 

-- DELETE

DELETE FROM "pizza"
WHERE "id"= 3;

DELETE FROM "pizza"
WHERE "name"= 'Pepperoni'
RETURNING *;

DELETE FROM "pizza"
WHERE "diameter" = 18
RETURNING *;