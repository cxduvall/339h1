-- What is the average number of awards for officers with fewer than 10 allegations?
-- Hint: not all officers receive awards and not all officers have allegations.
-- andrew

-- data_allegation: officer_id
-- data_award: officer_id
-- data_officer: id

-- ids w fewer than 10 allegations:
SELECT AVG(n.awards)
    FROM (SELECT (CASE WHEN p.officer_id IS NOT NULL THEN COUNT(p.officer_id) ELSE 0 END) as awards
            FROM ((SELECT z.officer_id
                    FROM (SELECT (CASE WHEN a.officer_id IS NOT NULL THEN COUNT(a.officer_id) ELSE 0 END) as num_allegations, o.id as officer_id
                            FROM data_officer o LEFT JOIN data_officerallegation a ON o.id=a.officer_id
                            GROUP BY o.id, a.officer_id) z
                    WHERE z.num_allegations < 10) o
                LEFT JOIN data_award p
                ON o.officer_id=p.officer_id)
            GROUP BY o.officer_id, p.officer_id) n;