SELECT * FROM "users";

SELECT "id", "firstName", "lastName", "isMale", 
"birthday"
FROM "users"
WHERE extract("years" FROM "birthday") = 1998; 


SELECT "id", "firstName", "lastName", "isMale", 
"birthday"
FROM "users"
WHERE extract("days" FROM "birthday") = 13; 


SELECT "id", "firstName", "lastName", "isMale", 
"birthday"
FROM "users"
WHERE extract("months" FROM "birthday") BETWEEN 6 AND 8
AND "isMale" = true; 


SELECT "id", "firstName", "lastName", "isMale", 
extract("years" FROM age("birthday")) AS "age",
"birthday", "height"
FROM "users"
WHERE extract("years" FROM age("birthday")) > 45
AND "isMale" = true
AND "height" < 1.75; 

-- дістати пошту усіх чоловіків старше 35 і зростом вище 1.65

SELECT "id", "email", "isMale",
extract("years" FROM age("birthday")) AS "вік", "height"
FROM "users"
WHERE extract("years" FROM age("birthday")) > 35
AND "isMale" = true
AND "height" > 1.65
LIMIT 10 OFFSET 10;

SELECT concat("firstName",' ',"lastName") AS "fullName"
FROM "users";

-- вибрати усіх з довжиною повного імені від 15 (включно) до 20 символів [15;20)

SELECT *
FROM (
    SELECT concat("firstName", ' ', "lastName") AS "fullName",
length (concat("firstName", ' ', "lastName")) AS "length"
FROM "users"
) AS "fn_length"
WHERE "fn_length"."length"=18