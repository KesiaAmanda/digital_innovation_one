CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL,
	nome VARCHAR(100),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios(id)
);

INSERT INTO funcionarios (nome, gerente) VALUES
('Ancelmo', null),
('Beatriz', 1),
('Magno', 1),
('Crenilda', 2),
('Wagner', 4);

SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL
UNION
SELECT id, nome, gerente FROM funcionarios WHERE id = 999;

CREATE OR REPLACE RECURSIVE VIEW vw_func(id,gerente,funcionario) AS (
	SELECT id, CAST('' AS VARCHAR) AS gerente, nome 
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, gerente.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
	JOIN funcionarios gerente ON gerente.id = vw_func.id
);

SELECT id, gerente, funcionario FROM vw_func;


