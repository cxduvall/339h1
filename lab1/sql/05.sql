-- What is the full name of the youngest officers on the force?  Use the officers' birth year for this.
SELECT d.first_name, d.last_name
    FROM data_officer d
    WHERE d.birth_year = (SELECT Max(t.birth_year) AS max_year
                                FROM data_officer t)

-- D := data\_officer
-- maxyear := max_{birth\_year}D
-- >> \Pi_{first\_name, last\_name} \sigma_{birth\_year=maxyear} D