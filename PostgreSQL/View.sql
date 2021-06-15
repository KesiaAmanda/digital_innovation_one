CREATE OR REPLACE VIEW vw_bancos_ativos AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
)	WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51,'Boa Ideia', FALSE);


CREATE OR REPLACE VIEW vw_bancos_ativos_com_a AS(
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
)	WITH LOCAL CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_ativos_com_a;

INSERT INTO vw_bancos_ativos_com_a (numero, nome, ativo) VALUES (51,'Alfa', TRUE);