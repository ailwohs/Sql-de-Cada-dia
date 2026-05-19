/* Faça todos os exercícios no SGBD.
Capítulo 8 -
Exercício 1
- Traga numa consulta:
1. Todos alunos que nasceram exatamente no ano de 1990.
2. Conte a quantidade de alunos: o sexo MASCULINO e do sexo FEMININO.
*/

SELECT nomealuno, datanascimento
FROM ALUNO
WHERE YEAR(datanascimento) = 1990



SELECT sexo, COUNT(sexo)
FROM ALUNO
WHERE datanascimento >= TO_DATE('01-01-1990') AND 
datanascimento <= TO_DATE('31-12-1990')
GROUP BY sexo


/*
Exercício 2
-  Traga todos os professores que estudam na Universidade Catolica de Brasilia ou Universidade Caxias.
-  Ordene o resultado em ordem DECRESCENTE pelo nome do professor.
*/
SELECT nome, nomefaculdadeformacao
FROM PROFESSOR
WHERE nomefaculdadeformacao IN ('Universidade Catolica de Brasilia', 'Universidade Caxias')
ORDER BY nome DESC
----

SELECT 'MEU NOME É jULIA',
LOWER ('MEU NOME É jULIA'),
INITCAP ('MEU NOME É jULIA'),
FROM DUAL


SELECT
LENGTH('MEU NOME É jULIA'),
FROM DUAL
--


-- TRAS UMA REPETIÇÃO APARTIR DO NÚMERO DE CARACTERES
SELECT 'MEU NOME É jULIA',
SUBSTR('MEU NOME É jULIA', 1, 3)
FROM DUAL

