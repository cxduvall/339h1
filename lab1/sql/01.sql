-- Give the IDs of the TRRs where 10 or more shots were fired.  Sort the IDs in ascending order.
SELECT t.id
    FROM trr_trr t
    WHERE t.total_number_of_shots >= 10
    ORDER BY t.id
