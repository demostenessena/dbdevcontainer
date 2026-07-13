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

select c.nome, c.estado, l.latitude, l.longitude
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
Retornar as cidades de "SP" com as suas respectivas localizações.
*/

select c.nome, c.estado, l.latitude, l.longitude
    from dbex.cidades c inner join dbex.localizacoes l on (c.id = l.id_cidade)
    where c.estado = 'SP';