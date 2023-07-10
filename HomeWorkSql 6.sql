CREATE DATABASE homework6;
USE homework6;
/* 1. Создайте процедуру, которая принимает количество
секунд и форматирует их в количество дней, часов, минут и
секунд.
*/

delimiter //
CREATE PROCEDURE format_seconds(IN total_seconds INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    SET days = (total_seconds / (24 * 3600));
    SET total_seconds = total_seconds % (24 * 3600);
    SET hours = (total_seconds / 3600);
    SET total_seconds = total_seconds % 3600;
    SET minutes = (total_seconds / 60);
    SET seconds = total_seconds % 60;

    SELECT CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds') AS formatted_time;
END //
delimiter ;

CALL format_seconds(123456);

-- Создайте функцию, которая выводит только четные числа от 1 до 10 включительно.

delimiter //

CREATE FUNCTION  get_even_numbers()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ' ');
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN result;
END //
delimiter ;

SELECT get_even_numbers();
