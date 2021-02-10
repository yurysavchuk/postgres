-- pg_stat_statements is one of the most useful extensions for Postgres.
-- It records queries that are run against your database and a number of stats about them.
-- It is a great place to go once a month or so and look up what queries are slowest on average
-- as well as ones that consume the most total time against your system

SELECT
    (total_time / 1000 / 60) as total_minutes,
    (total_time/calls) as average_time,
    query
FROM pg_stat_statements
ORDER BY 1 DESC
    LIMIT 50;
