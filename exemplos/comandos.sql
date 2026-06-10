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
where sequence_schema  in ('information_schema', 'pg_catalog')
order by sequence_name;

/*markdown
# Comandos DDL
*/

/*markdown
## Criando o schema `dbex`
*/


create schema dbex;

/*markdown
## Criando a tabela Cidade
*/

CREATE TABLE IF NOT EXISTS dbex.cidade (
    id UUID DEFAULT gen_random_uuid(),
    nome varchar(150) not null,
    estado char(2) not null,
    constraint cidade_pk primary key (id)
);

/*markdown
## Visualizando os dados da Tabela `Cidade`
*/

SELECT * FROM dbex.cidade;

/*markdown
## Inserindo uma cidade
*/

INSERT INTO dbex.cidade (nome, estado) VALUES ('MOSSORÓ', 'RN');

/*markdown
## Adicionando a restrição que duas cidades com o mesmo nome não pode ser cadastrada em um estado.
*/

ALTER TABLE dbex.cidade ADD CONSTRAINT cidade_nome_estado_uk UNIQUE (nome, estado);

DELETE FROM dbex.cidade WHERE nome = 'MOSSORÓ' AND estado = 'RN';

SELECT setval('dbex.cidade_id_seq', (SELECT MAX(id) FROM dbex.cidade));

DROP TABLE dbex.cidade;