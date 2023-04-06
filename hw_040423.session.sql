DROP TABLE IF EXISTS "fruits";
CREATE TABLE "fruits"(
    "name" VARCHAR(256) NOT NULL CHECK("name" != ''),
    "price" INTEGER NOT NULL CHECK(
        "price" > 0
        AND "price" < 1000000
    ),
    "currency" VARCHAR(2) NOT NULL,
    "stock quantity" NUMERIC NOT NULL CHECK(
        "stock quantity" >= 0
        AND "stock quantity" < 1000
    ),
    "manufacture date" DATE NOT NULL CHECK("manufacture date" < CURRENT_DATE),
    "expiration date" DATE
);
INSERT INTO "fruits"
VALUES (
        'bananas',
        13.76,
        '$',
        778,
        '2023-02-02',
        '2023-03-02'
    ),
    ('apples', 0.76, '$', 42, '2023-03-23', NULL);