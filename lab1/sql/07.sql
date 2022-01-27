-- What are the names of the 5 areas with the most complaint reports per-capita?
-- Calculate the number of complaint reports by the number of residents.
-- Hint: We want to know where the allegation took place, even if it is outside the officer's usual beat.

--SELECT z.name FROM (
SELECT f.name, f.percapita, f.pop_total,f.complaints_total FROM
(SELECT area.name, x.percapita, x.pop_total,x.complaints_total FROM
(SELECT q.complaints_total / p.pop_total as percapita, q.area_id       , p.pop_total, q.complaints_total
    FROM (SELECT SUM(a.count) as pop_total, a.area_id
                                FROM data_racepopulation a
                                GROUP BY area_id) p
                    RIGHT JOIN (SELECT (1.0 * Count(*)) as complaints_total, a.area_id
                            FROM data_allegation_areas a --(data_allegation a RIGHT JOIN data_area b ON a.beat_id = b.id) --data_allegation_areas
                            GROUP BY a.area_id) q
                    ON p.area_id=q.area_id) x
JOIN data_area area ON area.id=x.area_id) f
WHERE f.percapita IS NOT NULL
ORDER BY f.percapita DESC
LIMIT 5--) z;


-- getting the population of a given area:
-- for each group
-- >> count

