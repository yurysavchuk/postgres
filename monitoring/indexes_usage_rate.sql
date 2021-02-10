--  When you query a database the default behavior is going to be: scan the entire table to find records that match.

-- good usage of indexes:
--
-- Rows with greater than 1000 or 10000 records
-- Percentage of index used greater than 90%

-- table is likely to continue growing and is clearly missing some needed indexes since f.e.
-- only 11% of the time an index is used when querying that table

SELECT relname,
       CASE idx_scan
           WHEN 0 THEN 'Insufficient data'
           ELSE (100 * idx_scan / (seq_scan + idx_scan))::text
           END percent_of_times_index_used,
       n_live_tup rows_in_table
FROM
    pg_stat_user_tables
ORDER BY
    n_live_tup DESC;