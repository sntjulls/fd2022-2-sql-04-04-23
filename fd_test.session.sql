-- CREATE EXTENSION "uuid-ossp";

DROP TABLE IF EXISTS "messages";
DROP TABLE IF EXISTS "users_to_groups";
DROP TABLE IF EXISTS "products_to_orders";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "products";
DROP TABLE IF EXISTS "groups";
DROP TABLE IF EXISTS "users";

CREATE TABLE "users"(
    -- "id" UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
        "id" SERIAL PRIMARY KEY,
    "firstName" VARCHAR(64) NOT NULL CHECK("firstName"!=''),
    "lastName" VARCHAR(128) NOT NULL CHECK("lastName"!=''),
    "email" VARCHAR(256) NOT NULL CHECK("email"!='') UNIQUE,
    "isMale" BOOLEAN NOT NULL,
    "birthday" DATE NOT NULL CHECK("birthday"<CURRENT_DATE),
    "height" NUMERIC(3, 2) NOT NULL CHECK("height">1.10 AND "height"<2.55)
);

INSERT INTO "users"("lastName", "firstName", "email", "isMale",  "birthday", "height")
VALUES ('Asd', 'Pitt', 'pitt@gmail.com', FALSE, '1963-12-18', 1.87),
('Tom', 'Rot', 'rot@gmail.com', TRUE, '1963-12-18', 1.85),
('Fred', 'NULL', 'qwerty@gmail.com', TRUE, '1961-12-18', 2.44);


INSERT INTO users (
    id,
    firstName,
    lastName,
    email,
    isMale,
    birthday,
    height
  )
VALUES (
    id:integer,
    'firstName:character varying',
    'lastName:character varying',
    'email:character varying',
    isMale:boolean,
    'birthday:date',
    height:numeric
  );


ALTER TABLE "users"
ADD CONSTRAINT "checkEmailLength" CHECK(LENGTH("email")>=7)

ALTER TABLE "users"
DROP CONSTRAINT "checkEmailLength"


DROP TABLE IF EXISTS "products";
CREATE TABLE "products"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL UNIQUE CHECK("name" != ''),
    "price" NUMERIC(8, 2) CHECK(
        "price" > 0
        AND "price" < 1000000
    ),
    "currency" VARCHAR(3) NOT NULL CHECK(LENGTH("currency")>=2) DEFAULT 'uah',
    "amount" INTEGER NOT NULL CHECK("amount" > 0 AND "amount" <= 1000) DEFAULT 10,
    "productionDate" TIMESTAMP CHECK("productionDate" < CURRENT_TIMESTAMP),
    "expireDate" TIMESTAMP
);

INSERT INTO "products"("name", "price")
VALUES ('milk', 32.56), ('egg', 6.45), ('rice', 78.00);

CREATE TABLE "orders"(
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "orders"("userId") VALUES (1),(1),(1),(2),(3);

CREATE TABLE "products_to_orders"(
"productId" INT REFERENCES "products"("id"),
"orderId" INT REFERENCES "orders"("id"),
"quantity" SMALLINT NOT NULL CHECK("quantity">0),
PRIMARY KEY("productId","orderId")
);

INSERT INTO "products_to_orders" VALUES (1,1,2), (2,1,10);

CREATE TABLE "groups"(
    "id" SMALLSERIAL PRIMARY KEY,
    "title" VARCHAR(256) NOT NULL CHECK("title"!=''),
    "ownerId" INT REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "groups"("title", "ownerId") VALUES('db', 1), ('back', 2);

CREATE TABLE "users_to_groups"(
"groupId" SMALLINT REFERENCES "groups"("id"),
"userId" INT REFERENCES "users"("id"),
PRIMARY KEY("groupId", "userId")
);

INSERT INTO "users_to_groups" VALUES (1,1), (1,2), (1,3), (2,1);

CREATE TABLE "messages"(
    "id" SERIAL PRIMARY KEY,
    "body" VARCHAR(4096) CHECK("body"!='') NOT NULL,
    "isRead" BOOLEAN NOT NULL DEFAULT FALSE,
    "userId" INTEGER,
    "groupId" SMALLINT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "checkBodyLength" CHECK(LENGTH("body")>=2),
    FOREIGN KEY ("groupId", "userId") REFERENCES "users_to_groups" ("groupId", "userId")
);

INSERT INTO "messages"("groupId", "userId", "body")
VALUES (2, 1, 'hi!'), (1, 2, 'hi!'), (1, 3, 'hi!'), (1, 3, ')))');