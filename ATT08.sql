/* Faça todos os exercícios no SGBD.

Capítulo 10
Exercício 1
- Traga numa consulta:
1. A turma em que cada professor ensina. Para TURMA use: codTurma, nomeTurma, turno.
2. A disciplina de cada turma vinculada. Para DISCIPLINA use: codDisciplina, nomeDisciplina.
3. Para professor traga as seguintes informações: matrícula, nome, especialidade.
*/

SELECT p.matricula, p.nome, p.especialidade, t.codTurma, t.nomeTurma, t.turno, d.codDisciplina, d.nomeDisciplina
FROM PROFESSOR p
JOIN TURMA t ON p.matricula = t.matricula_professor
JOIN DISCIPLINA d ON t.codDisciplina = d.codDisciplina



/*
Exercício 2
- Conte a quantidade de turmas em que cada professor leciona.
- Ex: professor x - total: 10 turmas
1. Para professor traga: nome
2. Para turma traga: quantidade.
3. Adicione o critério: a quantidade de turma na consulta deve ser maior que 1.
4. Ordene de forma CRESCENTE pela quantidade.
5. Use um ALIAS: Quantidade de Turmas
*/

SELECT p.nome, COUNT(t.codTurma) AS 'Quantidade de Turmas'
FROM PROFESSOR p
JOIN TURMA t ON p.matricula = t.matricula_professor
GROUP BY p.nome
HAVING COUNT(t.codTurma) > 1
ORDER BY COUNT(t.codTurma) ASC


/*
Exercício 3
- Monte um relatório que mostre:
1. Matricula do aluno, nome do aluno.
2. Todas as turmas que ele está matriculado. Para turma use: codTurma, nomeTurma.
3. O nome e a matrícula dos professores que lecionam essas turmas.
*/

SELECT a.matricula, a.nome, t.codTurma, t.nomeTurma, p.nome AS 'Nome do Professor', p.matricula AS 'Matricula do Professor'
FROM ALUNO a
JOIN FREQUENTA f ON a.matricula = f.matricula
JOIN TURMA t ON f.codTurma = t.codTurma
JOIN PROFESSOR p ON t.matricula_professor = p.matricula
ORDER BY a.matricula ASC, t.codTurma ASC



/*
Exercício 4
- Qual erro do comando abaixo?
SELECT matricula, nome, codTurma, matricula
FROM ALUNO, FREQUENTA
WHERE matricula = matricula
*/

SELECT a.matricula, a.nome, f.codTurma, f.matricula
FROM ALUNO a
JOIN FREQUENTA f ON a.matricula = f.matricula
WHERE a.matricula = f.matricula


/*
Exercício 5
- Através de uma consulta responda: existe algum PROFESSOR que também é ALUNO?
Use o identificador 'matricula' para saber.
*/

SELECT p.matricula, p.nome
FROM PROFESSOR p
JOIN ALUNO a ON p.matricula = a.matricula
WHERE p.matricula = a.matricula


/*
Exercício 6
Encontre a média aritmética da turma T04 de matematica discreta.
Veja a TABELA 'DISCIPLINA'.
*/

SELECT AVG(f.nota) AS 'Média da Turma T04 de Matematica Discreta'
FROM FREQUENTA f
JOIN TURMA t ON f.codTurma = t.codTurma
WHERE t.codTurma = 'T04'



/*
Exercício 7
- Encontre quantos alunos cursam a matéria de 'logica matematica'
*/
SELECT COUNT(*) AS 'Quantidade de Alunos que cursam Logica Matematica'
FROM FREQUENTA f
JOIN TURMA t ON f.codTurma = t.codTurma
JOIN DISCIPLINA d ON t.codDisciplina = d.codDisciplina
WHERE d.nomeDisciplina = 'logica matematica'


    -- CORREÇÃO 

    /*
 Capítulo 10
 Exercício 1 
 - Traga numa consulta:
 1. A turma em que cada professor ensina. Para TURMA use: codTurma, nomeTurma, turno.
 2. A disciplina de cada turma vinculada. Para DISCIPLINA use: codDisciplina, nomeDisciplina.
 3. Para professor traga as seguintes informações: matrícula, nome, especialidade.
*/
SELECT P.matricula, P.nome, P.especialidade, T.codTurma, T.nomeTurma, T.turno, D.codDisciplina, D.nomeDisciplina
FROM PROFESSOR P,ENSINA E, TURMA T, DISCIPLINA D
WHERE P.matricula = E.matricula AND
E.codTurma = T.codTurma AND
T.codDisciplina = D.codDisciplina

-- Outra forma
SELECT P.matricula, P.nome, P.especialidade, T.codTurma, T.nomeTurma, T.turno, D.codDisciplina, D.nomeDisciplina
FROM PROFESSOR P
INNER JOIN ENSINA E
ON P.matricula = E.matricula 
INNER JOIN TURMA T
ON E.codTurma = T.codTurma 
INNER JOIN DISCIPLINA D
ON T.codDisciplina = D.codDisciplina


/*
 Exercício 2
 - Conte a quantidade de turmas em que cada professor leciona.
 - Ex: professor x - total: 10 turmas
 1. Para professor traga: nome
 2. Para turma traga: quantidade.
 3. Adicione o critério: a quantidade de turmas na consulta deve ser maior que 1.
 4. Ordene de forma CRESCENTE pela quantidade.
 5. Use um ALIAS: Quantidade de Turmas
*/

SELECT P.nome, COUNT(T.codTurma) "Quantidade de turmas"
FROM PROFESSOR P,ENSINA E,TURMA T
WHERE P.matricula = E.matricula
AND E.codTurma = T.codTurma
GROUP BY P.nome
HAVING COUNT(T.codTurma) > 1
ORDER BY COUNT(T.codTurma)

-- Outra forma 
SELECT P.nome, COUNT(T.codTurma) "Quantidade de turmas"
FROM PROFESSOR P
INNER JOIN ENSINA E
ON P.matricula = E.matricula
INNER JOIN TURMA T
ON E.codTurma = T.codTurma
GROUP BY P.nome
HAVING COUNT(T.codTurma) > 1
ORDER BY COUNT(T.codTurma)

/*
 Exercício 3
 - Monte um relatório que mostre:
 1. Matricula do aluno, nome do aluno.
 2. Todas as turmas que ele está matriculado. Para turma use: codTurma, nomeTurma.
 3. O nome e a matrícula dos professores que lecionam essas turmas. 
*/
 SELECT A.matricula, A.nome, F.codTurma, T.nomeTurma, P.matricula "Matricula do Professor", P.nome "Nome do Professor"
 FROM ALUNO A,FREQUENTA F, TURMA T, ENSINA E, PROFESSOR P
 WHERE A.matricula = F.matricula AND
 F.codTurma = T.codTurma AND
 T.codTurma = E.codTurma AND
 E.matricula = P.matricula
 
 -- Outra forma
 SELECT A.matricula, A.nome, F.codTurma, T.nomeTurma, P.matricula "Matricula do Professor", P.nome "Nome do Professor"
 FROM ALUNO A
 INNER JOIN FREQUENTA F
 ON A.matricula = F.matricula
 INNER JOIN TURMA T
 ON F.codTurma = T.codTurma 
 INNER JOIN ENSINA E
 ON T.codTurma = E.codTurma
 INNER JOIN PROFESSOR P
 ON E.matricula = P.matricula
 
/*
 Exercício 4
 - Qual erro do comando abaixo? 
 SELECT matricula, nome, codTurma, matricula
 FROM ALUNO, FREQUENTA
 WHERE matricula = matricula
*/
SELECT ALUNO.matricula, nome, codTurma, FREQUENTA.matricula
FROM ALUNO, FREQUENTA
WHERE ALUNO.matricula = FREQUENTA.matricula

/* 
 Exercício 5
 - Através de uma consulta responda: existe algum PROFESSOR que também é ALUNO?
 Use o identificador 'matricula' para saber.
*/
SELECT P.matricula, P.nome
FROM PROFESSOR P, ALUNO A
WHERE P.matricula = A.matricula

/*
 Exercício 6
 Encontre a média aritmética da turma T04 de matematica discreta.
 Veja a TABELA 'DISCIPLINA'.
*/
SELECT AVG(NOTA) 
FROM ALUNO A, FREQUENTA F, TURMA T, DISCIPLINA D
WHERE A.MATRICULA = F.MATRICULA
AND F.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND T.CODTURMA = 'T04'
AND D.NOMEDISCIPLINA = 'Matematica Discreta';
 
/*
 Exercício 7
 - Encontre quantos alunos cursam a matéria de 'logica matematica'
*/
SELECT COUNT(*)
FROM ALUNO A, FREQUENTA F, TURMA T, DISCIPLINA D
WHERE A.MATRICULA = F.MATRICULA
AND F.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND D.nomeDisciplina = 'Logica Matematica';
 

SELECT COUNT(*) AS 'Quantidade de Alunos que cursam Logica Matematica'
FROM FREQUENTA f
JOIN TURMA t ON f.codTurma = t.codTurma
JOIN DISCIPLINA d ON t.codDisciplina = d.codDisciplina
WHERE d.nomeDisciplina = 'logica matematica'

 







