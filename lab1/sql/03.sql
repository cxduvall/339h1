-- What badge numbers (or ``stars")  have been assigned to more than one officer over the years?

--SELECT g.star
--    FROM (SELECT COUNT(*) as count, j.star
--            FROM (data_officer o JOIN data_officerbadgenumber b ON o.id = b.officer_id) AS j
--            GROUP BY j.star) AS g
--    WHERE g.count > 1
--    ORDER BY g.star;

SELECT DISTINCT b2.star
            FROM (data_officerbadgenumber b1 JOIN data_officerbadgenumber b2
                ON (b1.officer_id < b2.officer_id AND b1.star = b2.star))

-- don't worry about order, and also not about duplicates??

-- o := data\_officer
-- b := data\_officerbadgenumber
-- \Pi_{star} \sigma{count > 1} ? (o \join_{o.id = b.officer\_id} b)
-- >> count aggregate

