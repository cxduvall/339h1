-- What are the first names and last names of the officers are under the age of 30?  Sort them by last name,  first name.
SELECT t.first_name, t.last_name
    FROM data_officer t
    WHERE t.birth_year > 1992
    ORDER BY t.last_name, t.first_name

-- \Pi_{first\_name, last\_name} \sigma_{birth_year>1992} (data\_officer)