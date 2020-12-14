-- 1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
SELECT 
    *
FROM
    _regions r
        JOIN
    _cities t ON t.region_id = r.region_id
WHERE
    r.region_id = '1053480'

-- 2. Выбрать все города из Московской области.
SELECT 
    *
FROM
    _cities t
join
_regions r ON r.region_id = t.region_id
join
_countries c ON r.country_id = c.id
where city_id = '99'

-- База данных сотрудники
-- 1.Выбрать среднюю зарплату по отделам.
SELECT
AVG(salary)
FROM 
	employees e
JOIN	
	dept_emp d ON e.emp_no = d.emp_no
JOIN
	salaries s ON s.emp_no = d.emp_no
JOIN
	departments de ON de.dept_no = d.dept_no  
GROUP BY
	de.dept_no
-- 2. Выбрать максимальную зарплату у сотрудника.
SELECT
MAX(salary)
FROM salaries s
JOIN employees e ON s.emp_no=e.emp_no
-- 3. Удалить одного сотрудника, у которого максимальная зарплата.

-- 4. Посчитать количество сотрудников во всех отделах.
SELECT
	departments.dept_name AS dept_name,
	COUNT(dept_emp.emp_no)
FROM 
	departments
JOIN	
	dept_emp ON departments.dept_no = dept_emp.dept_no  
GROUP BY
	dept_name

-- 5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
