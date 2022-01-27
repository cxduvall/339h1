-- Count the number of victims of each race that appear in a civilian (non-officer) complaint.
-- Sort your results in descending order by victim count.

SELECT COUNT(*), v.race
    FROM data_allegation a INNER JOIN data_victim v ON a.id = v.allegation_id
    WHERE a.is_officer_complaint IS FALSE
    GROUP BY v.race
    ORDER BY COUNT(*) DESC;

-- >> sum