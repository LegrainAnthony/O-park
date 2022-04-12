-- Verify opark:1.DML on pg

BEGIN;

SELECT "id", "public_name", "capacity","opening_time","closing_time","duration" FROM "attraction";
SELECT "id", "num_ticket", "date_start_validity","date_end_validity" FROM "visitor";
SELECT "id", "num_incident", "nature", "technician", "resolve_date", "attraction_id" FROM "incident";
SELECT "id", "number_of_places", "reservation_schedule","attraction_reserve","visitor_id" FROM "reserve";

ROLLBACK;
