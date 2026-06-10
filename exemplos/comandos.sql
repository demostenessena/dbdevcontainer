/*markdown
# Comandos SQL
*/

/*markdown
## Criando um schema `dbex`
*/

create schema dbex;

/*markdown
## Removendo o schema `dbex`
*/

drop schema dbex;

/*markdown
## Visualizando as sequências (Postgres)
*/

select sequence_schema, sequence_name 
from information_schema.sequences
where sequence_schema not in ('information_schema', 'pg_catalog')
order by sequence_name;

/*markdown
## Atualizando o valor de uma sequência
*/

select setval('dbex.cliente_id_seq',1);