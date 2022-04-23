--SQL Challenge
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title_name,
	ti.from_date,
	ti.to_date
--INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title_name
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;


SELECT COUNT(title_name), title_name
INTO retiring_titles
FROM unique_titles
GROUP bY title_name
ORDER BY COUNT(title_name) DESC;

--------------------------Employees Eligible for the Mentorship

SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title_name
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;