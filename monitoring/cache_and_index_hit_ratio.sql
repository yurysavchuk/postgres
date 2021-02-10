--  Had it been something like 80% or 90%, the solution is simple:
--  get your database more memory by upgrading to the next step up.

-- Your cache hit ratio is going to give the percentage of time your data is served from
-- within memory vs. having to go to disk. Generally serving data from memory vs. disk is
-- going to orders of magnitude faster, thus the more you can serve from memory the better.
-- For a typical web application making a lot of short requests I'm going to target > 99% here

SELECT
    'index hit rate' AS name,
    (sum(idx_blks_hit)) / nullif(sum(idx_blks_hit + idx_blks_read),0) AS ratio
FROM pg_statio_user_indexes
UNION ALL
SELECT
    'table hit rate' AS name,
    sum(heap_blks_hit) / nullif(sum(heap_blks_hit) + sum(heap_blks_read),0) AS ratio
FROM pg_statio_user_tables;