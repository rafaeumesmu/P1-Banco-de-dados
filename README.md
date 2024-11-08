# P1-Banco-de-dado
Resumo dos Relacionamentos:
Clientes e Pedidos: Um cliente pode fazer múltiplos pedidos. A tabela pedidos contém a chave estrangeira id_cliente.
Funcionários e Pedidos: Cada pedido é processado por um funcionário. A tabela pedidos contém a chave estrangeira id_funcionario.
Pedidos e Itens_Pedido: Um pedido pode conter múltiplos itens. A tabela itens_pedido tem uma chave estrangeira id_pedido.
Produtos e Itens_Pedido: Cada item de pedido está associado a um produto específico. A tabela itens_pedido tem uma chave estrangeira id_produto.
Produtos e Estoque: O estoque controla a quantidade de cada produto. A tabela estoque tem uma chave estrangeira id_produto.
