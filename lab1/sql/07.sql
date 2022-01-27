-- What are the names of the 5 areas with the most complaint reports per-capita?
-- Calculate the number of complaint reports by the number of residents.
-- Hint: We want to know where the allegation took place, even if it is outside the officer's usual beat.

--SELECT z.name FROM (

-- If area type is not community:
    -- Get the area geometry, find some community that the geometry fits inside, and return the community’s area id
-- Else: just return the area (community) id


--SELECT z.name FROM (
SELECT f.area_name--, f.percapita, f.pop_total,f.complaints_total
FROM
(SELECT q.complaints_total / p.pop_total as percapita, q.area_name      , p.pop_total, q.complaints_total
    FROM (SELECT SUM(a.count) as pop_total, a.area_id
                                FROM data_racepopulation a
                                GROUP BY area_id) p
                    RIGHT JOIN (SELECT (1.0 * Count(*)) as complaints_total, a.area_id, a.area_name
                            FROM (SELECT n.id AS area_id, n.name AS area_name
                                        FROM data_allegation m JOIN data_area n ON st_contains(n.polygon,m.point)
                                        WHERE n.area_type = 'community') a --(data_allegation a RIGHT JOIN data_area b ON a.beat_id = b.id) --data_allegation_areas
                            GROUP BY a.area_id, a.area_name) q
                    ON p.area_id=q.area_id) f
WHERE f.percapita IS NOT NULL
ORDER BY f.percapita DESC
LIMIT 5;


-- getting the population of a given area:
-- for each group
-- >> count

