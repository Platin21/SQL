use tennis;

SELECT
    CONCAT(ROUND((SUM(`amount`) / 100) * 10,2),' Euro') AS 'Spende'
FROM
    `penalties`
WHERE `pen_date`>= '2013-12-01' AND pen_date = '2013-12-31';

# Between: bug does not work bi direciontional

SELECT
    CONCAT(ROUND(SUM(1.0 * `amount`),0),' Euro') AS 'Spende'
FROM
    `penalties`
WHERE
    `pen_date` BETWEEN '2013-12-01' AND '2013-12-31';

