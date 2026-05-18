Exercícios Capítulo 04. Faça todos no SGBD.

/* Exercício 1
- Consulte todos os alunos que sejam do sexo masculino e que moram na Asa Norte
- Na tabela como resultado nomeie o atributo 'nome' para 'Nome Completo' e 'bairro' para 'Onde Mora'
*/

SELECT nome "Nome Completo", bairro "Onde Mora"
FROM ALUNO 
WHERE sexo = 'M' AND bairro = 'Asa Norte'



/* Exercício 2

Usando a tabela FREQUENTA traga todas as notas no intervalo de 8 e 9

e que o número de faltas seja superior ou igual a 2

*/





/*

Exercício 3

Traga todos os alunos que a primeira letra do nome começa com a letra 'C'

e que a cidade seja existente (diferente do valor NULL).

Ordene o resultado em ordem crescente. Dica: pesquise o comando ORDER BY.

*/





/*

Exercício 4

Traga todos os alunos que não estão reprovados (nota >= 7, E faltas não superior ou igual a 4)

Use a tabela FREQUENTA

*/





/*

Exercício 5

Traga todos os alunos que estão reprovados (nota < 7 ou faltas superior ou igual a 4)

Use a tabela FREQUENTA

*/