/* Faça todos no SGBD.

Capítulo 7
Exercício 1
- Traga numa consulta:
1. A quantidade de professores que estuda em cada faculdade - através de agrupamento.
2. Nomeie as colunas de resultado usando 'ALIAS' para: 'Faculdade de Formação' e 'Qtde professores'
3. Ordene em ORDEM CRESCENTE pelo nome da faculdade
Ex:
Faculdade de Formação       | Quantidade
Universidade de Brasilia      2
*/
SELECT nomefaculdadeformacao AS 'Faculdade de Formação', COUNT(*) AS 'Qtde professores'
FROM PROFESSOR
GROUP BY nomefaculdadeformacao
ORDER BY nomefaculdadeformacao ASC

/*
Exercício 2
- Usando o exercício 1 como exemplo, agrupe também pelo sexo.
Ex:
Faculdade de Formação       | Sexo | Quantidade
Universidade de Brasilia      M       2
*/

SELECT nomefaculdadeformacao AS 'Faculdade de Formação', sexo AS 'Sexo', COUNT(*) AS 'Qtde professores'
FROM PROFESSOR
GROUP BY nomefaculdadeformacao, sexo
ORDER BY nomefaculdadeformacao ASC, sexo ASC

/*
Exercício 3
- Descubra o erro no comando abaixo
*/
SELECT especialidade,nomefaculdadeformacao
FROM PROFESSOR
GROUP BY especialidade, nomefaculdadeformacao
ORDER BY nomefaculdadeformacao ASC, especialidade ASC