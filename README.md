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
  
