-- Transforming matches' date to the week number

USE dawa_stage;

DROP PROCEDURE IF EXISTS changeDate;
delimiter //
CREATE PROCEDURE changeDate()
BEGIN

DECLARE weekNum INT;
DECLARE count INT;
DECLARE currID INT;
DECLARE finished INT;
DECLARE max INT;

SET weekNum = 1;
SET count = 1;

-- CHANGE TABLE NAME HERE
SELECT COUNT(id_1819) INTO max FROM `season-1819`;

bucle: LOOP
-- REMEMBER TO CHANGE TABLE AND ID NAME HERE
UPDATE `season-1819` SET Date=weekNum WHERE id_1819 BETWEEN count AND count+8;
SET count = count + 9;
SET weekNum = weekNum + 1;
IF count >= max THEN LEAVE bucle; END IF;
END LOOP bucle;

END //
DELIMITER ;

CALL changeDate();

DROP PROCEDURE changeDate;