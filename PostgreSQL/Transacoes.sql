BEGIN;
UPDATE banco SET ativo = false WHERE numero=0;
COMMIT;

SELECT numero, nome, ativo FROM banco WHERE numero=0;

