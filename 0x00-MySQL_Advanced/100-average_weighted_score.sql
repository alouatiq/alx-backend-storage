-- 12. Average weighted score
-- Stored procedure to compute and store average weighted score for a user

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE weighted_score FLOAT;
    DECLARE total_weight INT;

    SELECT SUM(c.score * p.weight), SUM(p.weight)
    INTO weighted_score, total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    UPDATE users
    SET average_score = IFNULL(weighted_score / total_weight, 0)
    WHERE id = user_id;
END$$

DELIMITER ;
