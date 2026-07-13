/*markdown
# Comandos DML
*/

/*markdown
## Preprocessamento das sequências (necessário quando re-executar os comandos)
*/

select * 
    from pg_class 
    where relkind = 'S';

/*markdown
Reiniciando os valores das sequências
*/

ALTER SEQUENCE dbex.cidades_id_seq RESTART WITH 1;
ALTER SEQUENCE dbex.localizacoes_id_seq RESTART WITH 1;
ALTER SEQUENCE dbex.tempos_id_seq RESTART WITH 1;

/*markdown
## Inserindo os dados (Comando `INSERT INTO`)
*/

/*markdown
Inserindo uma cidade na tabela `cidades`.
*/

INSERT INTO dbex.cidades(id, nome, estado)
  VALUES (30,'Natal','RN');

/*markdown
Inserindo várias cidades na tabela `cidades`.
*/

INSERT INTO dbex.cidades (nome, estado) VALUES
('São Paulo', 'SP'),
('Campinas', 'SP'),
('Rio de Janeiro', 'RJ'),
('Niterói', 'RJ'),
('Salvador', 'BA'),
('Feira de Santana', 'BA'),
('Curitiba', 'PR'),
('Londrina', 'PR'),
('Belo Horizonte', 'MG'),
('Uberlândia', 'MG');

/*markdown
Inserindo várias localizações para cada cidade.
*/


INSERT INTO dbex.localizacoes (latitude, longitude, id_cidade) VALUES
(-23.5505, -46.6333, 1),
(-22.9056, -47.0608, 2),
(-22.9068, -43.1729, 3),
(-22.8832, -43.1034, 4),
(-12.9777, -38.5016, 5),
(-12.2664, -38.9663, 6),
(-25.4284, -49.2733, 7),
(-23.3045, -51.1696, 8),
(-19.9167, -43.9345, 9),
(-18.9140, -48.2740, 10);

/*markdown
Inserindo várias centrais de armazenamento dos dados.
*/


INSERT INTO dbex.centrais (codigo) VALUES
('C0001'),
('C0002'),
('C0003'),
('C0004'),
('C0005'),
('A1001'),
('A1002'),
('B2001'),
('B2002'),
('B2003');

/*markdown
Inserindo várias coletas de dados climáticos.
*/


INSERT INTO dbex.tempos (temp_min, temp_max, precip_pluviom, data_coleta, id_cidade) VALUES
(20, 28, 5.2, '2025-01-10 08:00', 1),
(18, 26, 1.1, '2025-01-10 08:00', 2),
(17, 24, 0.0, '2025-01-10 08:00', 3),
(19, 30, NULL, '2025-01-11 09:00', 4),
(25, 33, NULL, '2025-01-11 09:00', 5),
(16, 25, NULL, '2025-01-11 09:00', 6),
(21, 27, 0.0, '2025-01-12 10:00', 7),
(22, 29, 3.0, '2025-01-12 10:00', 8),
(23, 31, 2.4, '2025-01-12 10:00', 9),
(24, 32, NULL, '2025-01-13 08:00', 10);

/*markdown
Cadastrando as distribuições dos dados climáticos nas diversas centrais de armazenamento.
*/


INSERT INTO dbex.centrais_tempos (id_tempo, codigo_central) VALUES
(1, 'C0001'),
(1, 'C0002'),
(2, 'C0001'),
(3, 'C0003'),
(4, 'A1001'),
(5, 'A1001'),
(6, 'B2001'),
(7, 'B2002'),
(8, 'C0004'),
(9, 'C0005');

/*markdown
## Removendo os dados (Comando `DELETE`)
*/

/*markdown
Removendo as distribuições dos dados climáticos das centrais de armazenamento.
*/

DELETE FROM dbex.centrais_tempos;

/*markdown
Removendo as centrais de armazenamento
*/

DELETE FROM dbex.centrais;

/*markdown
Removendo os dados climáticos
*/

DELETE FROM dbex.tempos;

/*markdown
Removendo as localizações das cidades
*/

DELETE FROM dbex.localizacoes;

/*markdown
Removendo as cidades
*/

DELETE FROM dbex.cidades;

/*markdown
Comando para visualizar o conteúdo da tabela `cidades`
*/

SELECT * FROM dbex.cidades;

/*markdown
Exibindo as localizações dos sensores (tabela `localizacoes`)
*/

SELECT * FROM dbex.localizacoes;

/*markdown
Inserindo um registro omitindo os campos na tabela `cidades`
*/

INSERT INTO dbex.cidades (nome, estado)
  VALUES ('Macaíba','RN'), ('Mossoró','RN');

/*markdown
Inserindo a localização de uma cidade
*/

INSERT INTO dbex.localizacoes
VALUES (-5.825,-35.424,1);

/*markdown
Inserindo as localizações de duas cidades
*/

INSERT INTO dbex.localizacoes
VALUES (-8.042,-35.009,2),(-3.791,-38.598,3);
Visualizando as centrais.

/*markdown
Visualizando o conteúdo da tabela `centrais`
*/

SELECT * FROM dbex.centrais

/*markdown
Criando a Tabela `clientes`
*/

CREATE TABLE dbex.clientes (
    cpf char(11) not null,
    nome varchar(150) not null,
    email varchar(150) null,
    primary key(cpf)
);

/*markdown
Inserindo os dados na tabela `clientes`
*/

INSERT INTO dbex.clientes (cpf, nome, email) VALUES
    ('01234567890', 'C Heusser', 'cheusser@email'),
    ('01234567891', 'F Machado', null),
    ('01234567892', 'S Silva', null);

/*markdown
Remover os usuários com e-mail vazio
*/

DELETE FROM dbex.clientes WHERE email IS NULL;

/*markdown
Remover o registro 'CMT01' da tabela Central
*/

DELETE FROM dbex.centrais
WHERE dbex.centrais.codigo = 'CMT01';

/*markdown
Remover todas as associações com id_tempo igual à 4 e a central de código 'CMT02'
*/

delete from dbex.temposcentral
where id_tempo = 4 and
      codigo_central = 'CMT02';

/*markdown
Remover os clientes que não possuem e-mail e data de nascimento
*/

delete from dbex.clientes
where email is null and dt_nasc is null;

/*markdown
Remover os clientes que não possuem e-mail ou data de nascimento
*/

delete from dbex.clientes where email is null or dt_nasc is null;

/*markdown
# Atualizando os dados (Comando `UPDATE`)
*/

/*markdown
Alterar o valor Pluviométrico dos registros de 'Natal' de 10% para 30%.
*/

UPDATE dbex.tempos SET precip_pluviom = 30
WHERE precip_pluviom = 10 AND id_cidade = 1;

/*markdown
Alterar o nome de 'S Silva' para 'P Silva'  e o e-mail de null para 'psilva@email.com' na tabela Cliente
*/

UPDATE dbex.clientes
    SET nome = 'P Silva',
        email = 'psilva@email.com'
    WHERE nome = 'S Silva' AND email is NULL;

/*markdown
Alterar os valores Pluviométricos de 0% para 50%.
*/

UPDATE dbex.tempos
    SET precip_pluviom = 50
    WHERE precip_pluviom = 0;

/*markdown
Incrementar 1o nas temperaturas máximas e mínimas da cidade de Natal.
*/

UPDATE dbex.tempos
    SET tempo_min = tempo_min + 1,
        tempo_max = tempo_max + 1
    WHERE id_cidade = 1;

/*markdown
# Casamento de Padrões (Pattern Matching)
*/

/*markdown
Nome iniciando com a letra "A"
*/

select * from dbex.clientes where nome like 'a%' or nome like 'A%';

select * from dbex.clientes where lower(nome) like 'a%';

select * from dbex.clientes where upper(nome) like 'A%';

/*markdown
Nome com a palavra "en"
*/

nome like '%en%';

/*markdown
Nome terminando com a letra "A"
*/

nome like '%A';

/*markdown
Sobrenome é "Santos"
*/

nome like '_% Santos _%' or nome like '_% Santos';

/*markdown
Clientes que não tenham o sobrenome "Santos"
*/

not (nome like '_% Santos _%' or nome like '_% Santos');

nome not like '_% Santos _%' and nome not like '_% Santos';

/*markdown
Segunda letra da palavra é "a"
*/

palavra like '_a%';

/*markdown
Formatação de data (dd/mm/aaaa)
*/

entrada like '__/__/____';
