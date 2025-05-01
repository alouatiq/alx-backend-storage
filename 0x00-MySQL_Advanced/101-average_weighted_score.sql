-- 13. Average weighted score for all!
-- Stored procedure to compute and store average weighted scores for all users

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE uid INT;
    DECLARE cur CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    user_loop: LOOP
        FETCH cur INTO uid;
        IF done THEN
            LEAVE user_loop;
        END IF;

        UPDATE users
        SET average_score = (
            SELECT ROUND(SUM(c.score * p.weight) / SUM(p.weight), 4)
            FROM corrections c
            JOIN projects p ON c.project_id = p.id
            WHERE c.user_id = uid
        )
        WHERE id = uid;

    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
