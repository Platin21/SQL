SET SQL_SAFE_UPDATES = 0;
UPDATE players SET initials = CONCAT(LEFT(playerno,1),UPPER(LEFT(name,2)));
SET SQL_SAFE_UPDATES = 1;
