-- What badge numbers (or ``stars")  have been assigned to more than one officer over the years?
SELECT g.star
    FROM (SELECT COUNT(*) as count, j.star
            FROM (data_officer o JOIN data_officerbadgenumber b ON o.id = b.officer_id) AS j
            GROUP BY j.star) AS g
    WHERE g.count > 1

-- don't worry about order, and also not about duplicates??

-- o := data\_officer
-- b := data\_officerbadgenumber
-- \Pi_{star} \sigma{count > 1} ? (o \join_{o.id = b.officer\_id} b)
-- >> count aggregate

