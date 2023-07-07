CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW auto AS
SELECT
id, name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM auto;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW auto AS
SELECT
id, name, cost
FROM cars
WHERE cost < 30000;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

CREATE OR REPLACE VIEW auto2 AS
SELECT
id, name, cost 
FROM cars
WHERE name IN ('Skoda', 'Audi');

-- Доп задания:
-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания

SELECT
DENSE_RANK() OVER (ORDER BY cost) AS 'dens_rank',
name FROM cars;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость

SELECT 
top,
name,
cost,
SUM(cost) OVER () AS total_cost
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY cost DESC) AS top
    FROM cars
) AS ranked_cars
WHERE top <= 3;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены

SELECT *
FROM (
    SELECT *,
           LAG(cost) OVER (ORDER BY id) AS previous_price
    FROM cars
) AS previous_cars
WHERE cost > previous_price;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены

SELECT *
FROM (
    SELECT *,
           LEAD(cost) OVER (ORDER BY id) AS next_price
    FROM cars
) AS next_cars
WHERE cost < next_price;

-- 5* Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля

SELECT *,
       LEAD(cost) OVER (ORDER BY cost) - cost AS price_difference
FROM cars
ORDER BY cost;




