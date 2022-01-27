-- List the IDs, first and last name, complaint percentile and honorable mention percentile of the officers named
-- Jason with a last name beginning with "V".
SELECT t.id, t.first_name, t.last_name, t.complaint_percentile, t.honorable_mention_percentile
    FROM data_officer t
    WHERE t.first_name='Jason' AND t.last_name LIKE 'V%'

-- Pi_{...} sigma_{first\_name='Jason' \and last\_name \textrm{LIKE} '%V'} data\_officer