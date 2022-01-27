-- What are the 5 most common allegation names from civilian complaint reports?
-- Include all of the allegations associated with a complaint report.
-- Hint: use the data_allegationcategory table for this question.

-- andrew

SELECT i.allegation_name
FROM (SELECT Count(*) as count, allegation_name
        FROM ((SELECT p.allegation_category_id
                FROM (data_officerallegation o JOIN data_allegation a on o.allegation_id=a.id) p
                WHERE NOT p.is_officer_complaint) x
            JOIN data_allegationcategory y ON x.allegation_category_id=y.id) g
        GROUP BY g.allegation_name) i
ORDER BY count DESC
LIMIT 5;