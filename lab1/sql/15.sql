-- What is the average (most recent) salary of the officers who have received 100 or more allegations?

SELECT AVG(g.salary) FROM
(SELECT MIN(q.salary) as salary -- max/min doesn't matter
    FROM (SELECT x.officer_id, s.salary FROM (SELECT MAX(z.year) AS year, z.officer_id
            FROM (data_officer o JOIN data_salary s ON o.id = s.officer_id) z

            GROUP BY z.officer_id) x
            JOIN data_salary s ON x.officer_id=s.officer_id AND s.year=x.year) q
             JOIN data_officerallegation a ON q.officer_id = a.officer_id
    GROUP BY q.officer_id
    HAVING COUNT(*) >= 100) g;

-- >> max, count