-- Inserir dados na tabela Categorias
INSERT INTO Categorias (nome_categoria) VALUES
('Hambúrgueres'),
('Saladas'),
('Sucos'),
('Pizzas'),
('Doces'),
('Bebidas');

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (nome, descricao, preco, categoria_id) VALUES
('Hambúrguer Vegano', 'Hambúrguer de grão de bico com alface, tomate, cebola roxa e maionese vegana.', 18.99, 1),
('Hambúrguer de Lentilha', 'Hambúrguer de lentilha, alface, rúcula e molho pesto vegano.', 19.99, 1),
('Batata Doce Frita', 'Porção de batata doce frita com tempero caseiro.', 10.50, 3),
('Salada Mediterrânea', 'Salada fresca com alface, tomate, pepino, azeitonas e molho de tahine.', 12.00, 2),
('Suco Detox', 'Suco natural de couve, limão e gengibre.', 6.50, 3),
('Sanduíche de Tofu Grelhado', 'Tofu grelhado, alface, tomate, abacate e molho de mostarda e melado.', 15.00, 1),
('Pizza Vegana', 'Pizza individual com molho de tomate, cogumelos, abobrinha, pimentão e queijo vegano.', 22.00, 4),
('Tapioca Vegana', 'Tapioca recheada com pasta de amendoim e banana caramelizada.', 8.50, 5),
('Bowl de Açai', 'Açaí com granola, banana, morango e melado de cana.', 14.00, 5),
('Água de Coco', 'Água de coco fresca 500ml.', 5.00, 6),
('Hambúrguer Vegano', 'Hambúrguer de grão de bico com molho vegano.', 18.99, 1),
('Hambúrguer de Lentilha', 'Hambúrguer de lentilha com molho pesto.', 19.99, 1),
('Batata Doce Frita', 'Batata doce frita.', 10.50, 3),
('Salada Mediterrânea', 'Salada com alface, tomate e azeitonas.', 12.00, 2),
('Suco Detox', 'Suco de couve, limão e gengibre.', 6.50, 3),
('Sanduíche de Tofu', 'Tofu grelhado com alface e tomate.', 15.00, 1),
('Pizza Vegana', 'Pizza de cogumelos e queijo vegano.', 22.00, 4),
('Tapioca Vegana', 'Tapioca com banana e pasta de amendoim.', 8.50, 5),
('Bowl de Açaí', 'Açaí com granola e frutas.', 14.00, 5),
('Água de Coco', 'Água de coco 500ml.', 5.00, 6);

-- Inserir dados na tabela Ingredientes
INSERT INTO Ingredientes (nome, quantidade_em_estoque, unidade) VALUES
('Grão de Bico', 100, 'kg'),
('Alface', 50, 'unidades'),
('Tomate', 50, 'unidades'),
('Cebola Roxa', 30, 'unidades'),
('Maionese Vegana', 20, 'kg'),
('Lentilha', 60, 'kg'),
('Rúcula', 30, 'unidades'),
('Molho Pesto Vegano', 10, 'litros'),
('Batata Doce', 200, 'kg'),
('Pepino', 40, 'unidades'),
('Azeitonas', 20, 'kg'),
('Molho de Tahine', 10, 'litros'),
('Couve', 100, 'kg'),
('Limão', 30, 'unidades'),
('Gengibre', 10, 'kg'),
('Tofu', 50, 'kg'),
('Abacate', 30, 'unidades'),
('Mostarda', 15, 'litros'),
('Melado', 10, 'litros'),
('Cogumelos', 40, 'kg'),
('Abobrinha', 30, 'unidades'),
('Pimentão', 30, 'unidades'),
('Queijo Vegano', 20, 'kg'),
('Pasta de Amendoim', 15, 'kg'),
('Banana', 50, 'unidades'),
('Granola', 20, 'kg'),
('Morango', 30, 'unidades'),
('Melado de Cana', 10, 'litros'),
('Água de Coco', 100, 'litros');

-- Inserir dados na tabela Estoque
INSERT INTO Estoque (ingrediente_id, produto_id, quantidade) VALUES
(1, 1, 5),  -- Grão de Bico em Hambúrguer Vegano
(2, 1, 5),  -- Alface em Hambúrguer Vegano
(3, 1, 5),  -- Tomate em Hambúrguer Vegano
(4, 1, 3),  -- Cebola Roxa em Hambúrguer Vegano
(5, 1, 2),  -- Maionese Vegana em Hambúrguer Vegano
(6, 2, 5),  -- Lentilha em Hambúrguer de Lentilha
(2, 2, 3),  -- Alface em Hambúrguer de Lentilha
(7, 2, 2),  -- Molho Pesto Vegano em Hambúrguer de Lentilha
(8, 3, 4),  -- Batata Doce em Batata Doce Frita
(9, 4, 2),  -- Pepino em Salada Mediterrânea
(10, 4, 2), -- Azeitonas em Salada Mediterrânea
(11, 4, 1), -- Molho de Tahine em Salada Mediterrânea
(12, 5, 3), -- Couve em Suco Detox
(13, 5, 3), -- Limão em Suco Detox
(14, 5, 1), -- Gengibre em Suco Detox
(15, 6, 3), -- Tofu em Sanduíche de Tofu
(2, 6, 2),  -- Alface em Sanduíche de Tofu
(3, 6, 2),  -- Tomate em Sanduíche de Tofu
(16, 7, 4), -- Abacate em Sanduíche de Tofu
(17, 8, 3), -- Mostarda em Sanduíche de Tofu
(18, 8, 2), -- Melado em Sanduíche de Tofu
(19, 9, 3), -- Cogumelos em Pizza Vegana
(20, 9, 2), -- Abobrinha em Pizza Vegana
(21, 9, 2), -- Pimentão em Pizza Vegana
(22, 9, 3), -- Queijo Vegano em Pizza Vegana
(23, 10, 2), -- Pasta de Amendoim em Tapioca Vegana
(24, 10, 2), -- Banana em Tapioca Vegana
(25, 11, 4), -- Granola em Bowl de Açai
(26, 11, 3), -- Morango em Bowl de Açai
(27, 11, 2), -- Melado de Cana em Bowl de Açai
(28, 12, 4); -- Água de Coco em Água de Coco

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao.silva@email.com', '123456789', 'Rua A, 123, São Paulo, SP'),
('Maria Oliveira', 'maria.oliveira@email.com', '987654321', 'Rua B, 456, Rio de Janeiro, RJ'),
('Carlos Souza', 'carlos.souza@email.com', '555555555', 'Avenida C, 789, Belo Horizonte, MG');

-- Inserir dados na tabela Pedidos
INSERT INTO Pedidos (cliente_id, data_pedido, status, pagamento_status) VALUES
(1, '2024-11-01 10:30:00', 'Concluído', 'Pago'),
(2, '2024-11-02 11:00:00', 'Em Preparação', 'Pendente'),
(3, '2024-11-03 12:45:00', 'Pendente', 'Pendente');


-- Inserir dados na tabela Pedidos_Produtos
INSERT INTO Pedidos_Produtos (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2), -- 2 Hambúrguer Vegano no pedido de João
(1, 3, 1), -- 1 Batata Doce Frita no pedido de João
(2, 5, 2), -- 2 Sucos Detox no pedido de Maria
(3, 6, 1); -- 1 Sanduíche de Tofu Grelhado no pedido de Carlos

-- Inserir dados na tabela Funcionarios
INSERT INTO Funcionarios (nome, cargo, salario, data_admissao) VALUES
('Ana Costa', 'Cozinheira', 2500.00, '2023-05-10'),
('Pedro Lima', 'Garçom', 2000.00, '2023-07-15'),
('Lucas Pereira', 'Gerente', 3000.00, '2023-01-20');

