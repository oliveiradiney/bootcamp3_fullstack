
/*
a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD =
código da disciplinas).
*/


select a.mat as matricula, a.nome 
from alunos a join historico h on h.mat = a.mat
where h.cod_disc='BD' and h.nota < 5;


/*
b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
em 2015.
*/


select a.mat as matricula, a.nome, AVG(h.nota) as média
from alunos a join historico h on h.mat = a.mat
where h.cod_disc='POO'
group by a.mat


/*
c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
em 2015 e que esta média seja superior a 6.
*/


select a.mat as matricula, a.nome
from alunos a join historico h on h.mat = a.mat
where h.cod_disc='POO' 
group by a.mat
having AVG(h.nota) > 6


/*d) Encontre quantos alunos não são de Natal.*/


select * from alunos where cidade <> 'NATAL';
