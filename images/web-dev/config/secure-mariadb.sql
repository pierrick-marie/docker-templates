-- Remove test database
DROP DATABASE test;

-- From mysql database
-- USE mysql;
-- Delete anonymous users
DELETE FROM mysql.user WHERE User LIKE '';
-- Delete public user
DELETE FROM mysql.user WHERE User LIKE 'PUBLIC';

-- Setup root password with "root"
-- Do that at the end because I have to reboot the server
-- ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD("root");
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';

