-- We say that two officers are co-accused if both are named in a single complaint report.
-- What pair of officers have the most co-accusals?  Give their officer IDs.

-- SELECT MAX(c.co-accusals), c.oid1, c.oid2 FROM (co-accusals) c

SELECT c.oid1, c.oid2
FROM (SELECT COUNT(*) as co_accusals, o1.officer_id as oid1, o2.officer_id as oid2
        FROM data_officerallegation o1
            JOIN data_officerallegation o2
            ON o1.allegation_id=o2.allegation_id
        WHERE o1.officer_id < o2.officer_id
        GROUP BY o1.officer_id, o2.officer_id) c
ORDER BY c.co_accusals DESC
LIMIT 1;

-- >> max, count