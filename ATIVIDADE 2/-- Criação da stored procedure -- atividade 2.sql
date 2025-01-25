-- Criação da stored procedure --

SET GLOBAL log_bin_trust_function_creators = 1;

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

select * from venda;

call lista_compras_cliente (97, '2018-01-08 12:10:00', '2021-12-07 12:10:00' );