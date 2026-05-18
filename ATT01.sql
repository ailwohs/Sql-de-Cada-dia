DESCRIBE ALUNO;

/* 2 - É necessário criar uma consulta que traga para cada aluno: matrícula, código da turma
em que ele está matriculado, nota, quantidade de faltas e semestre. Para ficar mais clara
a informação, no cabeçalho da tabela deve aparecer 'código da turma' para codTurma e
'Qtde de faltas' para faltas. Dica: use ALIAS e consulte a tabela 'FREQUENTA' */

-- FUNCIONOU 

SELECT matricula, codturma, nota, falta, semestre FROM FREQUENTA;

SELECT matricula,
codturma "código da turma",
nota,
falta AS "Qtde de faltas",
semestre 
FROM FREQUENTA

DESCRIBE FREQUENTA;


/*3 - Crie um relatório na forma de consulta que traga os seguintes dados: nome, sexo,
cidade, bairro, CEP e endereço de cada aluno. Os campos cidade, bairro, CEP e endereço
devem ser exibidos como uma única coluna no resultado, separados por * e espaco para cada informação.
Dica: Use a tabela 'ALUNO' e operadores de CONCATENAÇÃO.
Ex: Carlos 'M' Brasilia * TagSul * 72025650 * QSF 15 CASA 109.*/

-- NÃO FUNCIONOU

SELECT nome,
sexo, 
cidade,
bairro || ' ' ||
cep || ' ' ||
endereco || ' ' ||
FROM ALUNO

-- CORRIGINDO 
SELECT nome,
sexo,
cidade || ' * ' ||
bairro || ' * ' ||
cep || ' * ' ||
endereco "Endereco Completo"
FROM ALUNO


/*4 - Exiba todos os registros da tabela turma excluindo a repetição do turno. */
-- FUNCIONOU MAIS OU MENOS 
SELECT DISTINCT turno FROM TURMA
DESCRIBE TURMA

/*5 - Crie um consulta que traga uma nova nota para os alunos: isso é, subtraindo o valor de 1.0 ponto.
Dica: use a tabela FREQUENTA. Exiba tanto a nova antiga como a nova nota.*/

SELECT 
nota "nota antiga",
nota-1.0 "nota nova"
FROM FREQUENTA