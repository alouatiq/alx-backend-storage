-- 10. Safe divide
-- Create a function to safely divide two numbers

DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN IF(b = 0, 0, a / b);
END$$

DELIMITER ;
