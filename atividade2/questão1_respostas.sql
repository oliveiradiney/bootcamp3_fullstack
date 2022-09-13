‘
/*Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da
consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.*/

select id_nf, id_item, cod_prod, valor_unit
from estoque
where desconto is null


/*Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR VENDIDO.
OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).*/

select id_nf, id_item, cod_prod, valor_unit, round(valor_unit -(valor_unit*desconto/100),2) as valor_vendido
from estoque
where desconto is not null


/*Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.*/

update estoque
set desconto = 0
where desconto is null


/*Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta
são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE *
VALOR_UNIT.
O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).*/

select id_nf, id_item, cod_prod, valor_unit, round((quantidade * valor_unit),2) as valor_total,
round((valor_unit - (valor_unit*(desconto/100))),2) as valor_vendido, desconto
from estoque

/*
Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: OVALOR_TOTAL
é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por
ID_NF.
*/

select id_nf, sum(quantidade * valor_unit) as valor_total
from estoque
group by id_nf 
order by valor_total desc


/*
Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO.


VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
*/
        
select id_nf, round((valor_unit - (valor_unit*(desconto/100))),2) as valor_vendido
from estoque
order by valor_vendido desc


/*
Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO.

O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
*/

select id_nf, sum(round((valor_unit - (valor_unit*(desconto/100))),2)) as valor_vendido
from estoque
group by id_nf
order by valor_vendido desc




/*
Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da consulta
são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD.
*/

select cod_prod,sum(quantidade) as mais_vendidos
from estoque
group by cod_prod


/*
Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.


Agrupe o resultado da consulta por ID_NF, COD_PROD.
*/

select id_nf, cod_prod, count(quantidade) as quantidade
from estoque
where quantidade > 10
group by id_nf, cod_prod

/*
Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do
maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF,
VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT.
Agrupe o resultado da consulta por ID_NF.
*/

select e.id_nf, sum(e.quantidade * e.valor_unit) as valor_total
from estoque e
group by e.id_nf
having sum(e.quantidade * e.valor_unit) > 500
order by valor_total desc

/*
Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da
consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PROD.
*/

select e.cod_prod, round(avg(e.desconto),2) as valor_médio
from estoque e
group by cod_prod

/*
Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
o resultado da consulta por COD_PROD.
*/

select e.cod_prod, MIN(e.desconto) as menor, MAX(e.desconto) as maior, round(AVG(e.desconto),2) as media
from estoque e
group by e.cod_prod

/*
Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
resultado da consulta por ID_NF.
*/

select e.id_nf, count(e.id_item) as qtd_itens
from estoque e
group by e.id_nf
having count(e.id_item) > 3


select e.id_nf, sum(e.quantidade) as qtd_itens
from estoque e
group by e.id_nf
having sum(e.quantidade) > 3



