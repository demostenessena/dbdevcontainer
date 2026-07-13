/*markdown
# Comandos DML
*/

/*markdown
## Inserindo os dados (Comando INSERT INTO)
*/

INSERT INTO dbex.cidades(id, nome, estado)
  VALUES (30,'Natal','RN');

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


INSERT INTO dbex.localizacoes (latitude, longitude, id_cidade) VALUES
(-23.5505, -46.6333, 4),
(-22.9056, -47.0608, 5),
(-22.9068, -43.1729, 6),
(-22.8832, -43.1034, 7),
(-12.9777, -38.5016, 8),
(-12.2664, -38.9663, 9),
(-25.4284, -49.2733, 10),
(-23.3045, -51.1696, 11),
(-19.9167, -43.9345, 12),
(-18.9140, -48.2740, 13);

ALTER TABLE dbex.centrais ALTER COLUMN codigo TYPE char(5);


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


INSERT INTO dbex.tempos (temp_min, temp_max, precip_pluviom, data_coleta, id_cidade) VALUES
(20, 28, 5.2, '2025-01-10 08:00', 4),
(18, 26, 1.1, '2025-01-10 08:00', 5),
(17, 24, 0.0, '2025-01-10 08:00', 6),
(19, 30, NULL, '2025-01-11 09:00', 7),
(25, 33, NULL, '2025-01-11 09:00', 8),
(16, 25, NULL, '2025-01-11 09:00', 9),
(21, 27, 0.0, '2025-01-12 10:00', 10),
(22, 29, 3.0, '2025-01-12 10:00', 11),
(23, 31, 2.4, '2025-01-12 10:00', 12),
(24, 32, NULL, '2025-01-13 08:00', 13);

CREATE TABLE IF NOT EXISTS dbex.centrais_tempos (
    id_tempo int NOT NULL,
    codigo_central char(5) NOT NULL, 
    CONSTRAINT centrais_tempos_pk PRIMARY KEY (id_tempo, codigo_central),
    CONSTRAINT ct_tempos_fk FOREIGN KEY(id_tempo) REFERENCES dbex.tempos (id),
    CONSTRAINT ct_centrais_fk FOREIGN KEY(codigo_central) REFERENCES dbex.centrais (codigo)
);


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
## Comando para visualizar o conteúdo da tabela `cidades`
*/

SELECT * FROM dbex.cidades;

/*markdown
## Exibindo as localizações dos sensores (tabela `localizacoes`)
*/

SELECT * FROM dbex.localizacoes;

/*markdown
## Inserindo um registro omitindo os campos na tabela `cidades`
*/

INSERT INTO dbex.cidades (nome, estado)
  VALUES ('Macaíba','RN'), ('Mossoró','RN');

/*markdown
## Inserindo a localização do sensor da cidade Natal
*/

INSERT INTO dbex.localizacoes
VALUES (-5.825,-35.424,1);

/*markdown
## Inserindo as localizações dos sensores das cidades Recife e Fortaleza
*/

INSERT INTO dbex.localizacoes
VALUES (-8.042,-35.009,2),(-3.791,-38.598,3);
Visualizando as centrais.

/*markdown
## Visualizando o conteúdo da tabela `centrais`
*/

SELECT * FROM dbex.centrais

/*markdown
## Inserindo as centrais na tabela Central
*/

INSERT INTO dbex.centrais
VALUES ('CMT01'),('CMT02');

/*markdown

## Inserindo dados na tabela Tempo
*/


INSERT INTO
dbex.tempos(id, tempo_min, tempo_max, precip_pluviom,
                                    data_coleta, id_cidade)
    VALUES
        (1,25,29,10,'2020-08-12',1),
        (2, 25, 29, null, '2020-08-13', 1),
        (3, 26, 31, 20, '2020-08-14', 1),
        (4, 26, 29, 15, '2020-08-12', 2),
        (5, 26, 30, 15, '2020-08-13', 2),
        (6, 26, 30, 20, '2020-08-14', 2),
        (7, 27, 30, 10, '2020-08-12', 3),
        (8, 27, 31, null, '2020-08-13', 3),
        (9, 26, 31, 30, '2020-08-14', 3);

/*markdown
## Inserindo dados na tabela TempoCentral
*/

INSERT INTO dbex.temposCentral(id_tempo, codigo_central)
    VALUES
        (1, 'CMT01'),
        (1, 'CMT02'),
        (2, 'CMT01'),
        (3, 'CMT02'),
        (4, 'CMT02'),
        (4, 'CMT01'),
        (5, 'CMT01'),
        (6, 'CMT01'),
        (7, 'CMT01'),
        (8, 'CMT02'),
        (9, 'CMT02');

/*markdown
## Criando a Tabela Cliente
*/

CREATE TABLE dbex.clientes (
    cpf char(11) not null,
    nome varchar(150) not null,
    email varchar(150) null,
    primary key(cpf)
);

/*markdown
## Inserindo os dados na tabela Cliente
*/

INSERT INTO dbex.clientes (cpf, nome, email) VALUES
    ('01234567890', 'C Heusser', 'cheusser@email'),
    ('01234567891', 'F Machado', null),
    ('01234567892', 'S Silva', null);

/*markdown
# Comando DELETE
*/

/*markdown
## Removendo todos os dados da tabela Tempo
*/

DELETE FROM dbex.tempos;

/*markdown
## Visualizando os dados da tabela Tempo
*/

SELECT * FROM dbex.tempos;

/*markdown
## Removendo os dados da tabela TempoCentral
*/

DELETE FROM dbex.temposCentral;

/*markdown
## Visualizando os dados na tabela Cliente
*/

SELECT * FROM dbex.clientes;

/*markdown
## Remover os usuários com e-mail vazio
*/

DELETE FROM dbex.clientes WHERE email IS NULL;

/*markdown
## Remover todos os usuários
*/

DELETE FROM dbex.clientes;

/*markdown
## Remover o registro 'CMT01' da tabela Central
*/

DELETE FROM dbex.centrais
WHERE dbex.centrais.codigo = 'CMT01';

/*markdown
## Remover todas as associações com id_tempo igual à 4 e a central de código 'CMT02'
*/

delete from dbex.temposcentral
where id_tempo = 4 and
      codigo_central = 'CMT02';

/*markdown
## Remover os clientes que não possuem e-mail e data de nascimento
*/

delete from dbex.clientes
where email is null and dt_nasc is null;

/*markdown
## Remover os clientes que não possuem e-mail ou data de nascimento
*/

delete from dbex.clientes where email is null or dt_nasc is null;

/*markdown
# Comando UPDATE
*/

/*markdown
## Alterar o valor Pluviométrico dos registros de 'Natal' de 10% para 30%.
*/

UPDATE dbex.tempos SET precip_pluviom = 30
WHERE precip_pluviom = 10 AND id_cidade = 1;

/*markdown
## Alterar o nome de 'S Silva' para 'P Silva'  e o e-mail de null para 'psilva@email.com' na tabela Cliente
*/

UPDATE dbex.clientes
    SET nome = 'P Silva',
        email = 'psilva@email.com'
    WHERE nome = 'S Silva' AND email is NULL;

/*markdown

## Alterar os valores Pluviométricos de 0% para 50%.
*/

UPDATE dbex.tempos
    SET precip_pluviom = 50
    WHERE precip_pluviom = 0;

/*markdown
## Incrementar 1o nas temperaturas máximas e mínimas da cidade de Natal.
*/

UPDATE dbex.tempos
    SET tempo_min = tempo_min + 1,
        tempo_max = tempo_max + 1
    WHERE id_cidade = 1;

/*markdown
# Casamento de Padrões (Pattern Matching)
*/

/*markdown
## Nome iniciando com a letra "A"
*/

select * from dbex.clientes where nome like 'a%' or nome like 'A%';

select * from dbex.clientes where lower(nome) like 'a%';

select * from dbex.clientes where upper(nome) like 'A%';

/*markdown
## Nome com a palavra "en"
*/

nome like '%en%';

/*markdown
## Nome terminando com a letra "A"
*/

nome like '%A';

/*markdown
## Sobrenome é "Santos"
*/

nome like '_% Santos _%' or nome like '_% Santos';

/*markdown
## Clientes que não tenham o sobrenome "Santos"
*/

not (nome like '_% Santos _%' or nome like '_% Santos');

nome not like '_% Santos _%' and nome not like '_% Santos';

/*markdown
## Segunda letra da palavra é "a"
*/

palavra like '_a%';

/*markdown
## Formatação de data (dd/mm/aaaa)
*/

entrada like '__/__/____';
