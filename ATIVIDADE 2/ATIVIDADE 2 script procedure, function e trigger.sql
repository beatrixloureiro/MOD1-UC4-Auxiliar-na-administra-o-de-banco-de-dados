-- stored procedure --

DELIMITER //
CREATE PROCEDURE lista_compras_cliente (
    IN id_cliente INT,
    IN data_inicial DATETIME,
    IN data_final DATETIME
)
BEGIN
    SELECT
        c.nome as nome_cliente,
        v.id as id_compra,
        v.valor_total as total,
        p.nome as nome_produto,
        iv.quantidade
    FROM
        uc4atividades.cliente c
    JOIN
        uc4atividades.venda v ON c.id = v.cliente_id
    JOIN
        uc4atividades.item_venda iv ON v.id = iv.venda_id
    JOIN
        uc4atividades.produto p ON iv.produto_id = p.id
    WHERE
        c.id = id_cliente
        AND v.data BETWEEN data_inicial AND data_final;
END //
DELIMITER ;

SELECT * FROM venda;

CALL lista_compras_cliente (200, '2018-01-08 12:10:00', '2021-12-07 12:10:00' );																				-- bybia --

-- stored function -- 

DELIMITER //
CREATE FUNCTION classificar_cliente (id_cliente INT) RETURNS VARCHAR(8)
BEGIN
    DECLARE categoria_cliente VARCHAR(10);

    IF (select sum(valor_total) from venda where cliente_id = id_cliente) > 10000 THEN
        SET categoria_cliente = 'PREMIUM';
    ELSE
        SET categoria_cliente = 'REGULAR';
    END IF;

    RETURN categoria_cliente;
END //
DELIMITER ;

SELECT classificar_cliente (200);																																-- bybia --

-- Criação da TRIGGER -- 

DELIMITER //
CREATE TRIGGER after_usuario BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    SET new.senha = MD5(NEW.senha);
END;
//
DELIMITER ;																																						-- bybia --

SELECT * FROM usuario;

INSERT INTO usuario (login, senha) values ('beltrano', '12345');

SELECT * FROM usuario;								