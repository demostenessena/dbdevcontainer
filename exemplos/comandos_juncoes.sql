/*markdown
## Operadores de Junção
*/

/*markdown
### Operador de Junção cruzada
*/

/*markdown
Retornando a junção cruzada dos dados da tabela `cidades` com a tabela `localizacoes`.
*/

select c.*, l.* 
    from dbex.cidades c, dbex.localizacoes l;

/*markdown
Retornar as cidades com as suas respectivas localizações
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c, dbex.localizacoes l
    where c.id = l.id_cidade;

/*markdown
Retornando as cidades de "SP" com as suas respectivas localizações.
*/

select c.id, c.nome, c.estado, l.id, l.id_cidade, l.latitude, l.longitude
    from dbex.cidades c, dbex.localizacoes l
    where   c.id = l.id_cidade and
            c.estado = 'SP';

/*markdown
### Operador CROSS JOIN (Junção Cruzada)
*/

/*markdown
Retornar as cidades de "SP" com as suas respectivas localizações.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c cross join dbex.localizacoes l 
    where   c.id = l.id_cidade and
            c.estado = 'SP';

/*markdown
## Operadores de Junção Qualificada
*/

/*markdown
### Operador `INNER JOIN` (junção interna)
*/

/*markdown
Retornar as cidades com as suas respectivas localizações.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c inner join dbex.localizacoes l on (c.id = l.id_cidade);

/*markdown
Retornar as cidades em "SP" e "RJ" com as suas respectivas localizações.
*/

select c.*, l.* 
	from dbex.cidades as c inner join 
		 dbex.localizacoes as l
               on (c.id = l.id_cidade)
	where c.estado in ('SP','RJ');

/*markdown
Retornar os dados climáticos com a respectiva cidade e localização.
*/

select  t.data_coleta, t.temp_max, t.temp_min, 
		c.nome, c.estado,
		l.latitude, longitude
	from (dbex.tempos t inner join 
		 dbex.cidades c on (t.id_cidade = c.id))
		 inner join dbex.localizacoes l 
		 on (l.id_cidade = c.id);

/*markdown
Inserindo a cidade de "Assu".
*/

insert into dbex.cidades (nome, estado) values ('Assu','RN');

/*markdown
Retornar todas as cidades com as suas respectivas localizações. Observe que algumas cidades não possuem localização cadastrada, mas serão exibidas nesse código.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c left outer join dbex.localizacoes l on (c.id = l.id_cidade);

/*markdown
Retornar todas as cidades com as suas respectivas localizações. Observe que algumas cidades não possuem localização cadastrada, mas serão exibidas nesse código.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.localizacoes l right outer join 
		 dbex.cidades c  
		on (c.id = l.id_cidade);

/*markdown
Retornar todas as cidades com as respectivas localizações. Observe que o comando `FULL OUTER JOIN` retornará todas as cidades e localizações, mesmo aquelas que não possuem correspondente na outra tabela.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c full outer join 
		 dbex.localizacoes l 
		on (c.id = l.id_cidade);