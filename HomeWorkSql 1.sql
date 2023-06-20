-- Создайте таблицу с мобильными телефонами. Заполните БД данными

CREATE DATABASE homework;
USE homework;
CREATE TABLE phones
(id INT PRIMARY KEY NOT NULL,
product_name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
product_count INT,
price INT NOT NULL
);

INSERT INTO phones(id, product_name, manufacturer, product_count, price)
VALUES
(1, 'iPhone X', 'Apple', 3, 76000),
(2, 'iPhone 8', 'Apple', 2, 51000),
(3, 'Galaxy S9', 'Samsung', 2, 56000),
(4, 'Galaxy S8', 'Samsung', 1, 41000),
(5, 'P20Pro', 'Huawei', 5, 36000);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price FROM phones WHERE product_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM phones WHERE manufacturer = 'Samsung';

