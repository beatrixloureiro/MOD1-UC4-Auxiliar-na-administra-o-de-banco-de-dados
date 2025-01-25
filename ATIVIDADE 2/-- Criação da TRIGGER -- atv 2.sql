-- Criação da TRIGGER -- 

DELIMITER //

CREATE TRIGGER after_usuario BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    SET new.senha = MD5(NEW.senha);
END;
//

DELIMITER ;

SELECT * FROM usuario;

INSERT INTO usuario (login, senha) values ('fulaninho3', '12345');

SELECT * FROM usuario;