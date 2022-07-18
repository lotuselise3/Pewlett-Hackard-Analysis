-- The Employees Eligible for the Mentorship Program

-- Create a mentorship-eligibility table that holds the current employees born between January 1, 1965 and December 31, 1965
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles
	ON (e.emp_no = titles.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;