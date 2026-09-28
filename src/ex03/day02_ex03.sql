WITH date_range AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day')::date AS calendar_date
)
SELECT dr.calendar_date AS missing_date
FROM date_range dr
LEFT JOIN person_visits pv
    ON pv.visit_date = dr.calendar_date
   AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.id IS NULL
ORDER BY missing_date ASC;