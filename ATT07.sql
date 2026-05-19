/* Faça todos os exercícios no SGBD.
Capítulo 9
Exercício 1
- Traga numa consulta:
1. Quantidade de pessoas em cada bairro.
2. Os nomes dos bairros devem estar com todas letras MAIÚSCULAS.
3. Valores NULOS no bairro devem ser DESCONSIDERADOS.
4. Ordene (de forma CRESCENTE) pelo bairro.
*/

SELECT UPPER(bairro) AS 'Bairro', COUNT(*) AS 'Quantidade de Pessoas'
FROM ALUNO
WHERE bairro IS NOT NULL
GROUP BY UPPER(bairro)
ORDER BY UPPER(bairro) ASC


/*
Exercício 2
- Calcule e traga a idade de todos os professores.
- No resultado deve ser tragos: nome, sexo e por idade do professor calculada.
- Use um ALIAS para a coluna idade calculada: 'idade'
- Substitua os espaços entre os nomes por *.
*/


SELECT nome, sexo, FLOOR(MONTHS_BETWEEN(SYSDATE, datanascimento) / 12) AS 'Idade'
FROM PROFESSOR
