WITH date_range AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date missing_date
)
SELECT dr.missing_date
FROM date_range dr
LEFT JOIN person_visits pv ON pv.visit_date = dr.missing_date
	AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.id IS NULL
ORDER BY 1