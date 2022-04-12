-- Deploy opark:1.DML to pg

BEGIN;


CREATE TABLE IF NOT EXISTS "visitor" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "num_ticket" INT NOT NULL UNIQUE ,
  "date_start_validity" INT NOT NULL,--![0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\+[0-9]{1,2})
  "date_end_validity" INT NOT NULL CHECK ("date_end_validity" > "date_start_validity"), --! Ne doit pas être supérieur date_start
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "attraction" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "public_name" TEXT NOT NULL UNIQUE,
  "capacity" INT NOT NULL,
  "opening_time" INT NOT NULL,
  "closing_time" INT NOT NULL,
  "duration" INT NOT NULL,
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),
  "created_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "incident" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "num_incident" INT NOT NULL,
  "nature" TEXT NOT NULL,
  "technician" TEXT NOT NULL,
  "resolve_date" INT NOT NULL,
  "attraction_id" INT REFERENCES "attraction"("id"),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),
  "created_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "reserve" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "number_of_places" INT NOT NULL,
  "reservation_schedule" TIMESTAMPTZ,
  "attraction_reserve" INT REFERENCES "attraction"("id"),
  "visitor_id" INT REFERENCES "visitor"("id")
);

COMMIT;
