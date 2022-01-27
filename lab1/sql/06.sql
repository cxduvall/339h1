-- List the distinct officer names (first-name, last-name) that appear more than once in data_officer where the duplicate officer names have different suffixes.
-- This may indicate familial relationships, e.g., a father-son relationship like John Smith, Jr. and John Smith, Sr.
--SELECT t1.first_name, t2.last_name
 --                   FROM (data_officer t1 JOIN data_officer t2 ON (t1.first_name=t2.first_name AND t1.last_name=t2.last_name)) -- pairs of officers w same names
 --                   WHERE (t1.id < t2.id AND t1.suffix_name <> t2.suffix_name) -- GROUP BY t.first_name, t.last_name HAVING COUNT(*) > 1)

--SELECT b.first_name, b.last_name
--FROM (SELECT g.first_name, g.last_name, COUNT(DISTINCT g.suffix_name) as suffix_count
 --   FROM data_officer g
 --   GROUP BY g.first_name, g.last_name) b
--WHERE b.suffix_count > 1;

SELECT DISTINCT (pair.f1, pair.l1)
FROM ((SELECT first_name as f1, last_name as l1, suffix_name, id FROM data_officer d1) s1
        JOIN (SELECT first_name as f2, last_name as l2, suffix_name, id FROM data_officer d2) s2
                        ON (s1.id < s2.id
                            AND s1.f1=s2.f2
                            AND s1.l1=s2.l2
                            AND (s1.suffix_name <> s2.suffix_name
                                     OR (s2.suffix_name IS NOT NULL AND s1.suffix_name IS NULL)
                                     OR (s1.suffix_name IS NOT NULL AND s2.suffix_name IS NULL)))) pair;

-- \Pi_{first\_name, last\_name} \sigma_{o1.id \neq o2.id} (data\_officer o1 \join_{first\_name, last\_name} data\_officer o2)