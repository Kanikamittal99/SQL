SHOW DATABASES;
USE company;

drop table trigger_test;
CREATE TABLE trigger_test (
     message VARCHAR(100)
);

-- Trigger
DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;



