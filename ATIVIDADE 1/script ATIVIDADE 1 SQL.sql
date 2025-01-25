CREATE USER 'user_relatorio'@'localhost' IDENTIFIED by 'user_relatorio';

GRANT SELECT ON *.* to 'user_relatorio'@'localhost';

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED by 'user_funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON *.* to 'user_funcionario'@'localhost';

SELECT * FROM mysql.user; 

