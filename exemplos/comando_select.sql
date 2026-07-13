/*markdown
# Comando SELECT
*/

/*markdown
## Visualizando todas as colunas de todos os registros
*/

/*markdown
Visualizando as cidades
*/

select * from dbex.cidades;

/*markdown
Visualizando todos os dados climáticos
*/

select * from dbex.tempos;

/*markdown
## Selecionando as colunas dos registros a serem exibidas
*/

/*markdown
Visualizando a data da coleta, as temperaturas e as precipitações pluviométricas
*/

select data_coleta, temp_min, temp_max, precip_pluviom 
    from dbex.tempos;

/*markdown

## Utilizando apelido (_alias_) para as colunas e para as tabelas
*/

/*markdown
Visualizando a data da coleta, as temperaturas e as precipitações pluviométricas
*/

select t.data_coleta as "data da coleta",
        t.temp_min as "mínima",
        t.temp_max as "máxima",
        t.precip_pluviom as "precipitação"
    from dbex.tempos t;

/*markdown

## Paginação dos dados
*/

/*markdown
Visualizando a data da coleta, as temperaturas e as precipitações pluviométricas limitando a 4 registros (`limit`) e permitindo a paginação (`offset`)
*/

select data_coleta as "data da coleta",
        temp_min as "mínima",
        temp_max as "máxima",
        precip_pluviom as precipitação
    from dbex.tempos offset 8 limit 4;

/*markdown
## Aplicando operações e funções nas colunas do resultado do comando `SELECT`
*/

/*markdown
Listar as diferentes temperaturas máximas identificadas em todos os registros
*/


select distinct temp_min as "temperatura mínima" 
from dbex.tempos;

/*markdown

Listar a data da coleta e a variação da temperatura de todos os registros
*/

select t.data_coleta, 
		(temp_max - temp_min) || ' ºc' as "variação"
	from dbex.tempos t;

/*markdown
## Aplicando a condição de processamento dos registros (cláusula `WHERE`)
*/

/*markdown
Listar a data da coleta e a variação da temperatura dos registros com a precipitação maior que 2.0.
*/

select t.data_coleta, 
		(temp_max - temp_min) || ' ºc' as "variação"
	from dbex.tempos t
    where precip_pluviom > 2.0;

/*markdown
Listar a data da coleta e a variação da temperatura dos registros com a precipitação maior que 2.0.
*/

select  data_coleta as "data da coleta",
        concat((temp_max - temp_min), '°c') as "variação da temperatura"
   from dbex.tempos
   where extract(day from data_coleta) <> 11 and precip_pluviom > 2.0;

/*markdown

Listar a data da coleta e a variação da temperatura dos registros com a precipitação entre 1.0 e 3.0 (inclusivamente).
*/

select precip_pluviom, data_coleta
    from dbex.tempos
    where precip_pluviom between 1.0 and 3.0;

/*markdown

*Importante!* A cláusula `limit` não limita a quantidade de registros avaliados. O comando abaixo ilustra uma possibilidade de comando para limitar a quantidade de registro processados.
*/

select precip_pluviom, data_coleta
    from (select precip_pluviom, data_coleta 
            from dbex.tempos offset 0 limit 4) 
    where precip_pluviom >= 1 and precip_pluviom <= 3;

/*markdown

## Ordenando os resultados de uma consulta
*/

/*markdown
Listar a precipitação e a data da coleta dos registros com a precipitação entre 1.0 e 3.0 (inclusivamente). Esse comando ordena o resultado pela data de coleta (ascendente) e a precipitação pluviométrica (descrescente).
*/


select precip_pluviom, data_coleta
    from dbex.tempos
    where precip_pluviom between 1 and 3
    order by data_coleta asc, precip_pluviom desc;

/*markdown
## Funções de Agrupamento
*/

/*markdown
Listar a quantidade de registros cadastrados na tabela `tempos`.
*/

select count(*)
	from dbex.tempos;

/*markdown
Obter a média aritmética das temperaturas máximas coletas em Janeiro de 2025.
*/

select avg(temp_max)
    from dbex.tempos 
    where extract(month from data_coleta) = 01 and
                         extract(year from data_coleta) = 2025;


delete from dbex.tempos;

select  data_coleta, count(*) as "quantidade", 
		max(temp_max) as "máxima"
    from dbex.tempos 
	where temp_max > 24
    group by data_coleta;

select data_coleta as "data da coleta", count(*) as "quantidade"
    from dbex.tempos
    group by data_coleta 
		having data_coleta != '2025-01-11 09:00';

select  data_coleta as "data da coleta", 
		precip_pluviom as "precipitação",
		count(*) as "quantidade",
		max(temp_max) as "máxima"
    from dbex.tempos
	where temp_max > 24
    group by data_coleta, precip_pluviom 
		having data_coleta != '2025-01-11 09:00' and 
				precip_pluviom is not null;

select id from dbex.cidades where nome = 'São Paulo';

select temp_max, temp_min 
	from dbex.tempos 
	where id_cidade = 4;

select temp_max, temp_min 
	from dbex.tempos 
	where id_cidade in 
		(select id 
			from dbex.cidades 
			where nome = 'São Paulo')
	;

select temp_max, temp_min 
	from dbex.tempos 
	where id_cidade not in 
		(select id 
			from dbex.cidades 
			where nome = 'São Paulo')
	;

select t.temp_max, t.temp_min 
	from dbex.tempos t, dbex.cidades c
	where t.id_cidade = c.id 
		  and c.estado = 'SP';			

select c.*, t.* 
	from dbex.cidades c, dbex.tempos t
	where   c.id = t.id_cidade and
            c.estado = 'SP';