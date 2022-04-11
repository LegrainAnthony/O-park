-- Revert opark:1.DML from pg

BEGIN;

DROP TABLE IF EXISTS "attraction","visitor","reserve","incident";

COMMIT;
