# Урок 5. Транзакции и оптимизация запросов

-- 1. Реализовать практические задания на примере других таблиц и запросов.

## Блокировка чтения
![1](https://user-images.githubusercontent.com/67762168/102718400-f6827700-42f8-11eb-8529-c751bd5ef7a6.png)
![2](https://user-images.githubusercontent.com/67762168/102718420-13b74580-42f9-11eb-953c-fe9bb4126877.png)
![3](https://user-images.githubusercontent.com/67762168/102718425-1a45bd00-42f9-11eb-9a39-6c51217f243f.png)
![4](https://user-images.githubusercontent.com/67762168/102718432-20d43480-42f9-11eb-8455-d592b33b7750.png)
![5](https://user-images.githubusercontent.com/67762168/102718435-25005200-42f9-11eb-9c4e-6b072cd720eb.png)
![6](https://user-images.githubusercontent.com/67762168/102718436-292c6f80-42f9-11eb-95ac-6b4d9056b23a.png)
## Блокировка записи
![7](https://user-images.githubusercontent.com/67762168/102718447-35183180-42f9-11eb-91b3-dfc0e85104d1.png)
![8](https://user-images.githubusercontent.com/67762168/102718460-4103f380-42f9-11eb-82ec-8f43de30410b.png)

-- 2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.
- Поиск товара по определенным параметрам, если имеется данная комплектация то осуществляется транзакция. В случае если товар на текущий момент отсутсвует то транзакция откатывается.
- Разработка проекта - транзакция не будет выполнена пока не будут выполнены все условия предусмотренные в ходе разработки, а также учтенных изменений и дополнений.

-- 3. Проанализировать несколько запросов с помощью EXPLAIN.
## Запрос: выбрать среднию зарплату по отделам
SELECT
de.dept_no, AVG(salary)
FROM 
	employees e
JOIN	
	dept_emp d ON e.emp_no = d.emp_no
JOIN
	salaries s ON s.emp_no = e.emp_no
JOIN
	departments de ON de.dept_no = d.dept_no  
GROUP BY
	de.dept_no
![9](https://user-images.githubusercontent.com/67762168/102777155-18373900-43a1-11eb-9ce1-ddba242aad16.png)
![10](https://user-images.githubusercontent.com/67762168/102777158-19686600-43a1-11eb-978b-3be805ba8dba.png)
  Из данного запроса видно, что осуществляется полный перебор в таблице employees при добавлении индекса, получаем следующий результат: 
![11](https://user-images.githubusercontent.com/67762168/102777162-1a00fc80-43a1-11eb-9125-4eceb1eb84f6.png)
![12](https://user-images.githubusercontent.com/67762168/102777164-1a999300-43a1-11eb-8ac5-95b8e84cfe2b.png)
  Время без оптимизации 5,376 sec/0,000017 sec. Время после добавления индекса 4,992 sec/0,000013 sec., что незначительно уменьшило время на выполение запроса.
  В случаее с группировкой запроса:
SELECT
 * 
 FROM
(SELECT
e.emp_no,
AVG(salary)
FROM 
	employees e
JOIN	
salaries s ON s.emp_no = e.emp_no
GROUP BY
	e.emp_no) T1,
(SELECT 
	d.dept_no
FROM 
    departments de
JOIN 
    dept_emp d ON de.dept_no = d.dept_no
GROUP BY
	de.dept_no) T2    
	Имеем следующий результат:
![13](https://user-images.githubusercontent.com/67762168/102777165-1b322980-43a1-11eb-8081-18a548bb0dd7.png)
![14](https://user-images.githubusercontent.com/67762168/102777166-1bcac000-43a1-11eb-9f58-349674b1a5ba.png)
  Время на выполнение запроса составило 2,729 sec / 0,0025 sec, что также не позволило достигнуть намеченных результатов...

