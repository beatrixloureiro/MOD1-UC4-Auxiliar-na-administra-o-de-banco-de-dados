-- Criação da stored function -- 

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

SELECT classificar_cliente (97);
