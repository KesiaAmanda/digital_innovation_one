SELECT banco.nome AS banco_nome, 
		agencia.nome AS agencia_nome, 
		conta_corrente.numero AS conta_corrente_numero, 
		conta_corrente.digito AS conta_corrente_digito, 
		cliente.nome AS cliente_nome, 
		tipo_transacao.nome AS tipo_transacao, 
		cliente_transacoes.valor AS valor
FROM banco
INNER JOIN agencia ON banco.numero = agencia.banco_numero
INNER JOIN conta_corrente ON conta_corrente.banco_numero = banco.numero
							AND conta_corrente.agencia_numero = agencia.numero
INNER JOIN cliente ON cliente.numero = conta_corrente.cliente_numero
INNER JOIN cliente_transacoes ON cliente.numero = cliente_transacoes.cliente_numero
INNER JOIN tipo_transacao ON cliente_transacoes.tipo_transacao_id = tipo_transacao.id;