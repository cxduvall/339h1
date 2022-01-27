-- Count the number of victims of each race that appear in a civilian (non-officer) complaint.
-- Sort your results in descending order by victim count.

SELECT *
    FROM (SELECT SUM(z.race_count) as victim_count,
                 z.allegation_id,
                 SUM(CASE WHEN z.race='Asian' THEN z.race_count ELSE 0 END) AS count_asian,
                 SUM(CASE WHEN z.race='Black or African-American' THEN z.race_count ELSE 0 END) AS count_black,
                 SUM(CASE WHEN z.race='WHITE' THEN z.race_count ELSE 0 END) AS count_white,
                 SUM(CASE WHEN z.race='Persons of Spanish Language' THEN z.race_count ELSE 0 END) AS count_spanlang,
                 SUM(CASE WHEN z.race='Other' THEN z.race_count ELSE 0 END) AS count_other
            FROM (SELECT COUNT(*) as race_count, v.race as race, v.allegation_id
                    FROM data_victim v
                        JOIN (SELECT *
                                FROM data_allegation p
                                WHERE NOT p.is_officer_complaint) AS a
                        ON a.id = v.allegation_id
                    GROUP BY v.allegation_id, v.race) z
            GROUP BY z.allegation_id) n
    ORDER BY n.victim_count DESC;

-- >> sum