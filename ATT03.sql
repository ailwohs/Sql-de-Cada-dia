/* Exercícios Capítulo 05. Use o SGBD para fazer.
Exercício 1
- Consulte todos os professores que trabalham na universidade em que a especialidade seja 'Matematica',
'Literatura'. Ordene (na forma CRESCENTE) pelo nome do professor.
Use a tabela PROFESSOR.
*/
SELECT * FROM PROFESSOR
WHERE especialidade IN ('Matematica', 'Literatura') 
ORDER BY nome ASC

/*Exercício 2
- Consulta todas as notas dos alunos
Ordene o resultado pela nota na forma DECRESCENTE.*/

SELECT * FROM FREQUENTA
ORDER BY nota DESC  

/*
Exercício 3
- Traga todas as especialidades dos professores (não repita os resultados)
Dica: use o operador DISTINCT e a tabela PROFESSOR.
*/

SELECT DISTINCT especialidade FROM PROFESSOR
