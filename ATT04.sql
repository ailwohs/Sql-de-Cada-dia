/* Execute no SGBD.

Capítulo 6
Exercício 1
- Traga numa consulta:
1. A nota máxima
2. A nota mínima
3. A quantidade de faltas de todos os alunos
4. A média aritmética das notas
5. O somatório das notas
*/

SELECT MAX(nota), MIN(nota), COUNT(falta), AVG(nota), SUM(nota) 
FROM FREQUENTA  


/*
Exercício 2
- Há um problema nesse comando abaixo. Encontre o erro e corrija.
SELECT falta, COUNT(falta) FROM FREQUENTA
*/

SELECT COUNT(falta) FROM FREQUENTA


/*
Exercício 3
- Descubra o professor mais velho e mais novo da universidade.
Use a tabela PROFESSOR.
*/

SELECT MAX(datanascimento), MIN(datanascimento) FROM PROFESSOR
