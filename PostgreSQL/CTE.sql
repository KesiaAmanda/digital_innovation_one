WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
			tipo_transacao.nome AS tipo_transacao_nome,
			cliente_transacoes.valor AS cliente_transacoes_valor
	FROM cliente
	INNER JOIN cliente_transacoes ON cliente.numero = cliente_transacoes.cliente_numero
	INNER JOIN tipo_transacao ON cliente_transacoes.tipo_transacao_id = tipo_transacao.id
)

SELECT cliente_nome, tipo_transacao_nome, cliente_transacoes_valor
FROM clientes_e_transacoes;
	