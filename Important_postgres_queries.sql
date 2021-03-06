-- get select queries for all tables in database
select ' select  '''|| tablename  ||''', count(*) from ' || tablename ||' 
union' from pg_tables where schemaname='public';

-- check postgres version
select version();

-- check if databasw is in recovery mode or NOT
select pg_is_in_recovery();

-- to switch wal to the archive
select pg_switch_wal();

-- see the current lsn of wal
select pg_current_wal_lsn();

-- see the current wal file into which database is writing
-- select pg_walfile_name('0/12000148');
select pg_walfile_name(pg_current_wal_lsn());

-- start the basebackup
select pg_start_backup('backup');

-- stop the basebackup
select pg_stop_backup();

-- upgrade postgis extension
SELECT PostGIS_Extensions_Upgrade();

-- postgis version check
SELECT postgis_full_version();

-- wal replay paused check. recovery control function
select pg_is_wal_replay_paused();

-- list all the available extensions in postgres
select * from pg_available_extensions;

--altering columns's data type
ALTER TABLE assets
ALTER COLUMN asset_no TYPE INT 
USING asset_no::integer;

--check database size
SELECT pg_size_pretty( pg_database_size('dbname') );

--check table size
SELECT pg_size_pretty( pg_total_relation_size('tablename') );

--check last value of a sequence
SELECT last_value FROM sequence_name;

--alter the sequence set to a certain number
SELECT setval('sequence_name',value_to_be_set,true);
--true means that the next value will be the number provided + 1
--false means that the next value would be the number provided
