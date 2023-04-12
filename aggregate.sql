
-- max
-- min
-- sum
-- avg
-- count

SELECT max("height") FROM "users";
SELECT max("weight") FROM "users";

SELECT min("height") FROM "users";
SELECT min("weight") FROM "users";

SELECT avg("height") FROM "users";
SELECT avg("weight") FROM "users";

SELECT avg("weight") 
FROM "users"
WHERE "isMale"=FALSE;

SELECT min("weight"), "isMale" 
FROM "users"
GROUP BY "isMale";

-- сумарна вага чоловіків, жінок

SELECT sum("weight"), "isMale" 
FROM "users"
GROUP BY "isMale";

SELECT avg("height"), "isMale" 
FROM "users"
GROUP BY "isMale";

SELECT count(*), "firstName"
FROM "users"
WHERE "isMale"=TRUE
GROUP BY "firstName";

-- кількість чоловіків, жінок
SELECT count("id"), "isMale"
FROM "users"
GROUP BY "isMale";

-- середній зріст чоловіків старше 35 років
SELECT avg("height"), "isMale"
FROM "users"
WHERE extract("years" from age("birthday"))>35 AND "isMale"=TRUE
GROUP BY "isMale";

-- кількість юзерів, які народилися з 1982 по 1985 включно
SELECT count("id") AS "кількість юзерів, які народилися з 1982 по 1985 включно"
FROM "users"
WHERE extract("years" from "birthday") BETWEEN 1982 AND 1985;

-- OR

SELECT count("id"), extract("years" from "birthday")
FROM "users"
WHERE extract("years" from "birthday") BETWEEN 1982 AND 1985
GROUP BY extract("years" from "birthday");

-- кількість людей з прізвищами: Carlson, Reed, Horton
SELECT count("id"), "lastName"
FROM "users"
WHERE "lastName" IN ('Carlson', 'Reed', 'Horton')
GROUP BY "lastName";

-- кількість людей, які народилися 08 08 будь-якого року
SELECT count("id"), extract("months" from "birthday") as "month", extract("day" from "birthday") as "day"
FROM "users"
WHERE extract("months" from "birthday")=8 AND extract("day" from "birthday")=8
GROUP BY "month", "day"

SELECT *
FROM
(
SELECT count("id"), extract("months" from "birthday") as "month", extract("days" from "birthday") as "day"
FROM "users"
GROUP BY "month", "day"
) AS "usersBD"
WHERE "usersBD"."month"=8 AND "usersBD"."day"=8

-- кількість чоловіків зі зростом менше 1.6
SELECT count("id"), "isMale"
FROM "users"
WHERE "height"<1.60 AND "isMale"=TRUE
GROUP BY "isMale";

-- кількість жінок з вагою більше 100
SELECT count("id"), "isMale"
FROM "users"
WHERE "weight">100 AND "isMale"=FALSE
GROUP BY "isMale";

SELECT "isMale", count("id") AS "з вагою більше 100"
FROM "users"
WHERE "weight">100 AND "isMale"=FALSE
GROUP BY "isMale";

