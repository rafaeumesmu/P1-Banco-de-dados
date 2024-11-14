-- 1. Selecionar todos os produtos
SELECT * FROM Produtos;

-- 2. Selecionar produtos com preço superior a 15
SELECT nome, preco FROM Produtos WHERE preco > 15.00;

-- 3. Ordenar produtos por preço em ordem crescente
SELECT nome, preco FROM Produtos ORDER BY preco ASC;

-- 4. Contar o número total de produtos
SELECT COUNT(*) FROM Produtos;

-- 5. Consultar todos os produtos de um pedido específico
SELECT p.nome, pp.quantidade, p.preco
FROM Pedidos_Produtos pp
JOIN Produtos p ON pp.produto_id = p.id_produto
WHERE pp.pedido_id = 1;

-- 6. Inserir um novo produto
INSERT INTO Produtos (nome, descricao, preco, disponibilidade)
VALUES ('Hambúrguer Vegano', 'Hambúrguer de grão de bico com alface, tomate e molho vegano.', 18.99, TRUE);

-- 7. Atualizar o preço de um produto específico
UPDATE Produtos 
SET preco = 20.00 
WHERE id_produto = 1;

-- 8. Excluir um produto do cardápio
DELETE FROM Produtos WHERE id_produto = 10;

-- 9. Calcular a soma total dos preços de todos os produtos
SELECT SUM(preco) AS total_vendas FROM Produtos;

-- 10. Calcular o preço médio dos produtos
SELECT AVG(preco) AS preco_medio FROM Produtos;

-- 11. Contar quantos produtos foram vendidos em cada pedido
SELECT pedido_id, SUM(quantidade) AS total_produtos_vendidos
FROM Pedidos_Produtos
GROUP BY pedido_id;

-- 12. Selecionar produtos com preço maior que a média dos preços
SELECT nome, preco 
FROM Produtos 
WHERE preco > (SELECT AVG(preco) FROM Produtos);

-- 13. Mostrar os 5 produtos mais baratos
SELECT nome, preco FROM Produtos ORDER BY preco ASC LIMIT 5;
