/*. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/


DELIMITER $$
CREATE FUNCTION days(n INT)
RETURNS VARCHAR (50)
DETERMINISTIC
BEGIN
	DECLARE d  INT DEFAULT 1;
	DECLARE h  INT DEFAULT 1;
	DECLARE m  INT DEFAULT 1;
	DECLARE s  INT DEFAULT 1;
	DECLARE res VARCHAR(50);
    WHILE n> 60 DO
	if n>= 86400 then
		set d = n/86400;
		set n= n%86400;
	elseif n>=3600 then
		set h = n/3600;
		set n =n%3600;
	elseif n>60 then
		set m=n/60;
		set n=n%60;
	else set s=n;
    END if;
    END WHILE;
	set res = CONCAT(d, 'days',h,'hours',m,'minutes',s,'seconds');
    RETURN res;
END $$
DELIMITER ;
SELECT days(1234567);

/*2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10*/

DELIMITER $$
CREATE PROCEDURE chet(n INT)
DETERMINISTIC
BEGIN
DECLARE i  INT DEFAULT 0;
DECLARE res VARCHAR(50);
	set res= ' ';
	if n<0 then 
	select 0;
    else
	WHILE i< n DO
		set i= i+2;
		set res = CONCAT(res, ' ', i);
        select res;
	END WHILE;   
	END IF;
      
END $$
DELIMITER ;
call chet(8);


