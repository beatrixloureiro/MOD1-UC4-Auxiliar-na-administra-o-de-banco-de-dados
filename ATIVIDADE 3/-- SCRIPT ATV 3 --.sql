-- Explain e Todas as vendas pagas em dinheiro --
SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';																			-- bybia --

-- Relatório de todas as vendas pagas em dinheiro e EXPLAIN --
SELECT
    v.data AS data_venda,
    v.valor_total,
    p.nome AS nome_produto,
    iv.quantidade,
    iv.valor_unitario,
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
JOIN uc4atividades.cliente c ON v.cliente_id = c.id	
JOIN uc4atividades.funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC; 																																												-- bybia --

EXPLAIN SELECT
    v.data AS data_venda,
    v.valor_total,
    p.nome AS nome_produto,
    iv.quantidade,
    iv.valor_unitario,
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
JOIN uc4atividades.cliente c ON v.cliente_id = c.id
JOIN uc4atividades.funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC; 

-- Explain de todas as vendas de produtos de um dado fabricante --
SELECT * FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

EXPLAIN SELECT * FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';																												 -- bybia --

-- Encontrar todas as vendas de produtos de um dado fabricante --

SELECT
    p.nome AS nome_produto,
    p.descricao AS descricao_produto,
    v.data AS data_venda,
    iv.quantidade AS quantidade_vendida
    
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
WHERE p.fabricante = 'Ultralar'
ORDER BY p.nome;

EXPLAIN SELECT
    p.nome AS nome_produto,
    p.descricao AS descricao_produto,
    v.data AS data_venda,
    iv.quantidade AS quantidade_vendida
    
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
WHERE p.fabricante = 'Ultralar'
ORDER BY p.nome;																																											-- bybia --

-- Relatório de vendas de produto por cliente --

SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome; 

EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome; 
																																															-- bybia --
SELECT 
	c.nome AS nome_cliente, 
    p.nome AS nome_produto, 
    SUM(iv.subtotal), 
    SUM(iv.quantidade)
    
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
JOIN cliente c ON c.id = v.cliente_id
GROUP BY c.nome, p.nome;

EXPLAIN SELECT 
	c.nome AS nome_cliente, 
    p.nome AS nome_produto, 
    SUM(iv.subtotal), 
    SUM(iv.quantidade)
    
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
JOIN cliente c ON c.id = v.cliente_id
GROUP BY c.nome, p.nome;

-- INDICES --
CREATE INDEX idx_venda ON venda(tipo_pagamento);
SHOW INDEX FROM  venda;

CREATE INDEX idx_produto_fabricante ON produto (fabricante);
SHOW INDEX FROM  produto;

CREATE INDEX idx_item_venda_cliente_produto ON item_venda(nome_produto);
SHOW INDEX FROM  item_venda;																																									-- bybia --

-- COMANDO EXPLAIN --

EXPLAIN SELECT *  FROM venda WHERE tipo_pagamento = 'D';

EXPLAIN SELECT *  FROM produto WHERE fabricante = 'Ultralar';

EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade) FROM item_venda iv WHERE venda_id = 47;																										-- bybia --

--  view para consultas --
CREATE VIEW vendas_dinheiro AS 
SELECT
    v.data AS data_venda,
    v.valor_total,
    p.nome AS nome_produto,
    iv.quantidade,
    iv.valor_unitario,
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
JOIN uc4atividades.cliente c ON v.cliente_id = c.id
JOIN uc4atividades.funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC; 

SELECT * FROM vendas_dinheiro;

CREATE VIEW produtos_lar AS
SELECT
    p.nome AS nome_produto,
    p.descricao AS descricao_produto,
    v.data AS data_venda,
    iv.quantidade AS quantidade_vendida
    
FROM uc4atividades.venda v
JOIN uc4atividades.item_venda iv ON v.id = iv.venda_id
JOIN uc4atividades.produto p ON iv.produto_id = p.id
WHERE p.fabricante = 'Ultralar'
ORDER BY p.nome;
																																															-- bybia --
SELECT * FROM produtos_lar;

CREATE VIEW venda_por_cliente_produto AS
SELECT 
	c.nome AS nome_cliente, 
    p.nome AS nome_produto, 
    SUM(iv.subtotal), 
    SUM(iv.quantidade)
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
JOIN cliente c ON c.id = v.cliente_id
GROUP BY c.nome, p.nome;

SELECT * FROM venda_por_cliente_produto;