-- What officer rank (position) has the biggest range in salary?

SELECT t.rank
    FROM (SELECT (MAX(s.salary) - MIN(s.salary)) AS diff, s.rank
            FROM data_salary s
            GROUP BY s.rank) t
    ORDER BY t.diff DESC
    LIMIT 1;

-- S := data\_salary
-- \Pi_{(\max_{salary}(S)-\min_{salary}(S)) as diff, rank} (S)