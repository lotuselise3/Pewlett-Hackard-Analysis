-- The Number of Retiring Employees by Title

-- List of current employees born between Jan. 1, 1952 and Dec. 31, 1955
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles 
	ON (e.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY 
	e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

-- Number of Retiring Employees by Most Recent Title
SELECT COUNT(emp_no), title
INTO retiring_titles 
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;