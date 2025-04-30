-- 13. Average weighted score for all!
-- Stored procedure to compute and store average weighted scores for all users

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE uid INT;
    DECLARE cur CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO uid;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL ComputeAverageWeightedScoreForUser(uid);
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
