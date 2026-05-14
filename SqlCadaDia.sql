
/* ATIVIDADES GERAIS CURSO SQL DE CADA DIA */
-- POR ROGER SAMPAIO

SELECT * FROM PROFESSOR;
DESCRIBE PROFESSOR;
WHERE especialidade IN ("Matematica", "Literatura");
ORDER BY nome;

SELECT nota FROM FREQUENTA
ORDER BY nota DESC;

SELECT DISTINCT especialidade FROM PROFESSOR

-- EXMPRESSÕES ARITMÉTICAS
SELECT 
matricula,
nota “nova antiga”,
nota+0.5 “nova nova”
FROM FREQUENTA

-- EXPRESSÕES LÓGICAS
SELECT          
matricula,
nota “nova antiga”, 


SELECT AS “ALUNO” nome,
sexo,   
cidade
FROM ALUNO
WHERE sexo = 'F' AND cidade = 'São Paulo'   
ORDER BY nome
SELECT AS "ALUNOS" nome,
idade,
cidade
FROM ALUNO
WHERE idade > 18 AND cidade = "São Paulo";

SELECT AS "ALUNOS" nome,
idade,
cidade
FROM ALUNO LIMIT 5;
SELECT AS "ALUNOS MAIORES" nome,
cidade,
sexo
FROM ALUNO
WHERE idade > 18
ORDER BY nome
LIMIT 5;

