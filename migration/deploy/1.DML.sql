-- Deploy opark:1.DML to pg

BEGIN;


CREATE TABLE IF NOT EXISTS "visitor" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "num_ticket" INT NOT NULL,
  "date_start_validity" TIMESTAMPTZ,
  "date_end_validity" TIMESTAMPTZ,
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),
  "created_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "attraction" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "public_name" TEXT NOT NULL UNIQUE,
  "capacity" INT NOT NULL,
  "opening_time" TIMESTAMPTZ NOT NULL,
  "closing_time" TIMESTAMPTZ NOT NULL,
  "duration" INT NOT NULL,
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),
  "created_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "incident" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "num_incident" INT NOT NULL,
  "nature" TEXT NOT NULL,
  "technician" TEXT NOT NULL,
  "resolve_date" TIMESTAMPTZ,
  "attraction_id" INT REFERENCES "attraction"("id"),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),
  "created_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "reserve" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "number_of_places" INT NOT NULL,
  "attraction_reserve" INT REFERENCES "attraction"("id"),
  "visitor_id" INT REFERENCES "visitor"("id"),
  "date_start_validity" TIMESTAMPTZ NOT NULL,
  "date_end_validity" TIMESTAMPTZ NOT NULL
);

COMMIT;
