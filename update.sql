ALTER TABLE "users"
ADD COLUMN "weight" SMALLINT CHECK("weight" BETWEEN 25 AND 250);

UPDATE "users"
SET "weight" = ("height"-0.8)*100;

UPDATE "users"
SET "weight" = 100, "height" = 1.65
WHERE "id" = 125
RETURNING *;



-- встановити вагу 55 всім з іменами Anna, Mary

UPDATE "users"
SET "weight" = 55
WHERE "firstName" in ('Anna', 'Mary')
RETURNING *;

-- встановити вагу 230 всім чоловікам старше 65 років зі зростом більше 2 метри

UPDATE "users"
SET "weight" = 230
WHERE "isMale" = TRUE
AND age("birthday") > make_interval(65)
AND "height" > 2.00
RETURNING *;

-- встановити вагу 60 всім жінкам молодше 30 років зі зростом <= 1.65

UPDATE "users"
SET "weight" = 60
WHERE "isMale" = FALSE
AND age("birthday") < make_interval(30)
AND "height" <= 1.65
RETURNING *;

DELETE FROM "users"
WHERE "id"=8
RETURNING *;




