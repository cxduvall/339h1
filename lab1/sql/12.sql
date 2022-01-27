-- List the names of the areas that have the three highest median incomes in Chicago.
-- For your relational algebra, you may regard the median incomes in the DB as integers instead of varchars.

SELECT x.name
FROM (SELECT a.name, replace(replace(a.median_income,',',''),'$','')::numeric as income
        FROM data_area a
        WHERE a.median_income IS NOT NULL) x
ORDER BY x.income DESC
LIMIT 3;

-- maxrow_{a}(R) := \sigma_{R.a=max_{a}(R).a}(R)
-- withoutfirstrow_{a}(R) := R - maxrow_{a}(R)
-- withoutnrows_{n,a}(R) := withoutfirstrow_{a}(withoutfirstrow_{a}(...(R))) where withoutfirstrow_{a} is
--      nested n times. Function valid for n>=0 (just return R for n=0)
-- nthrow_{n, a}(R) := max_{a}(withoutnrows_{n-1,a}(R))
-- top_{n, a}(R) := nthrow_{0, a}(R) union nthrow_{1, a}(R) union ... union nthrow{n, a}(R)
-- >> possible by taking (for 2nd):
-- \Pi_{name}