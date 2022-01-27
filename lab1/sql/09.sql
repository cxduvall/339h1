-- What is the average number of awards for officers with greater than or equal to 100 allegations?

SELECT AVG(n.awards)
    FROM (SELECT (CASE WHEN a.officer_id IS NOT NULL THEN COUNT(a.officer_id) ELSE 0 END) as awards, o.officer_id
            FROM ((SELECT z.officer_id
                    FROM (SELECT COUNT(*) as num_allegations, a.officer_id
                            FROM data_officerallegation a
                            GROUP BY a.officer_id) z
                    WHERE z.num_allegations >= 100) o
                LEFT JOIN data_award a
                ON o.officer_id=a.officer_id)
            GROUP BY a.officer_id, o.officer_id) n;

-- some officers have 0 awards! whenever join, consider the edge case.

-- >> count