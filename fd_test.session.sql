DROP TABLE IF EXISTS "users";

CREATE TABLE "users"(
    "id" SERIAL NOT NULL UNIQUE,
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

