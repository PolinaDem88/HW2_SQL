CREATE DATABASE hw2; -- Создаем БД с именем hw2

USE hw2; -- Подключаемся к БД hw2

-- 1. Используя операторы языка SQL,создайте таблицу “sales”. Заполните ее данными.
CREATE TABLE sales 
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE,
  count_product INT
);

DESC sales;

INSERT INTO sales (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

-- 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва
SELECT
	id AS "id заказа",
CASE
	WHEN count_product < 100
		THEN 'Маленький заказ'
    WHEN count_product BETWEEN 100 AND 300
		THEN 'Средний заказ'
	Else 'Большой заказ'   
END AS "Тип заказа"
FROM sales;

-- 3.  Создайте таблицу “orders”, заполните ее значениями

CREATE TABLE orders 
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(5) NOT NULL,
  amount DECIMAL (20, 2) NOT NULL,
  order_status VARCHAR(45) NOT NULL
);

DESC orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT id, order_status,
CASE 
    WHEN "OPEN" 
		THEN 'Order is in open state'
    WHEN "CLOSED" 
		THEN 'Order is closed'
    ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;

/*
4. Чем 0 отличается от NULL?
"0" — это значение, число 0,
"NULL" указывает на "пустое место" 
*/