
# Ajuste questões de segurança, incluindo usuários, papéis e permissões.

use  programa_esportes_projeto_senac_allan;
show tables ;
select * from senha_user;
select * from usuarios;

# criando nova tabela para requisitos de segurança como login e senha criptografada utilizando trigger (md5)
/*CREATE TABLE IF NOT EXISTS programa_esportes_projeto_senac_allan.senha_user (
  idsenha INT NOT NULL AUTO_INCREMENT,
  login VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  ultimo_login DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (idsenha))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
)
*/

#comando de aplicação trigger 
/**DELIMITER //
CREATE TRIGGER usuario_novo
BEFORE INSERT ON senha_user
FOR EACH ROW
BEGIN
  SET NEW.senha = MD5(NEW.senha);
END//
DELIMITER ;
**/

/*# inserir valores login e senha 



INSERT INTO programa_esportes_projeto_senac_allan.senha_user (login, senha, ultimo_login)
VALUES
  ('jonh', 'jonh1234', '2022-11-10 11:00:00'),
  ('Robert', 'robert1980', '2023-11-10 12:00:00'),
  ('Tom', 'tom1990', '2022-12-10 13:00:00'),
  ('Leonarde', 'leo2005', '2023-09-10 14:00:00'),
  ('Nicolas', 'nico2010', '2022-08-10 15:00:00'),
  ('Robert', 'ro2011', '2022-07-10 16:00:00'),
  ('Marta', 'mar2013', '2023-05-10 17:00:00'),
  ('Anthony', 'ant1996', '2023-11-10 18:00:00'); 
*/

/*# ligação FK tabela usuarios e senha_user 
ALTER TABLE usuarios 
ADD senha_id int not null;

ALTER TABLE usuarios add constraint fk_senha foreign key (senha_id)
REFERENCES senha_user (idsenha);
*/

drop user 'admin'@'localhost';   #  deleta usuario de tiver criado 
create user 'admin'@'localhost' identified by '123456'; # criando usuario com senha 

# Permissões para usuario manipulação dos bancos utilizado para criar as outras orientações 
-- criando permissões igual root 
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
flush privileges; 

select * from mysql.user;

-- criar o role/papel admin conta usuário  regras e restrições com base na interação com app 
drop role 'admin_usuario';
create role 'admin_usuario';

-- retirar todas as permissões admin usuário para definir as regras 
revoke All privileges on *.* from 'admin'@'localhost';

grant 'admin_usuario' to 'admin'@'localhost'; # atribuindo o admin a regra usuario 
set default role 'admin_usuario' to 'admin'@'localhost';

-- especificação das regras que usuario pode movimentar com base no uso do app ; 
-- manipulação das tabelas como exemplos consulta, inserir dados , modificadar dados e deletar dados .
-- será basicamente o admin que faz o login com senha no app , poderar ter acesso a essas especificações.
# utilização apenas ao banco especifico
grant select,insert,update,delete on programa_esportes_projeto_senac_allan.* to 'admin_usuario';

show grants for 'admin_usuario';




