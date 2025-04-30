-- 7. Average score
-- Stored procedure to compute and store average score for a user

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score FLOAT;

    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE corrections.user_id = user_id;

    UPDATE users
    SET average_score = IFNULL(avg_score, 0)
    WHERE id = user_id;
END$$

DELIMITER ;
