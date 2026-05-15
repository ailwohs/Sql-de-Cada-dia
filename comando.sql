DESCRIBE ALUNO
-- DESCRIBE OU DESC USADOS PARA VER O QUE TEM DENTRO DAS TABELAS
DESC PROFESSOR 

-- O COMANDO SELECT SERVE PARA CONSULTAR OS DADOS
SELECT * FROM ALUNO;

SELECT SEXO,CIDADE,NOME FROM ALUNO


-- ALIAS PARA SIMPLIFICAR O NOME DA TABELA
-- mais de uma palavra uma aspas dupla
SELECT NOME "Nome completo",
MATRICULA AS mat, 
DATANASCIMENTO  AS nascimento,
SEXO FROM ALUNO

DESCRIBE ALUNO


-- comando select 
-- somar também é só acrescentar + 
SELECT matricula AS mat,
codTurma "codigo da turma",
nota+0.5 "nota com acrescimo",
nota "nota anterior"
FROM FREQUENTA

-- DISTINCT USADO PARA EVITAR OPERADORES DUPLICADOS
-- SEMPRE VEM RESULTADOS COM VALORES DIFERENTES 

SELECT DISTINCT nome,sexo FROM ALUNO
SELECT DISTINCT bairro FROM ALUNO

-- CONCATENAÇÃO JUNTAR COLUNAS STRING NA QUERY 
-- '' as aspas servem para dar espaço e deixar mais bonito aqui
SELECT nome, 
cidade || ' ' ||
bairro || ' ' ||
cep || ' ' ||
endereco  "Endereço completo" 
FROM ALUNO


-- expressões aritméticas 
-- pode trabalhar com número multiplicando, dividindo etc 
SELECT 
matricula,
nota "nota antiga",
nota+0.5 "nova nota"
FROM FREQUENTA

DESCRIBE FREQUENTA


-- VALOR NULL = VALOR NULO AUSÊNCIA DE VALOR

INSERT INTO ALUNO 
VALUES ('UC120052210', 'Julia Renata', 'F', '478721716', 11247132, '12/09/2006', NULL, NULL, NULL, NULL);
INSERT INTO ALUNO
VALUES ('UC124052210', 'Marcone Freitas', 'M', '47872sa1716', 1124711232, '12/1/2006', NULL, NULL, NULL, NULL);


SELECT * FROM ALUNO 
SELECT nome,
cidade || '--Cidade--'
FROM ALUNO

INSERT INTO 
FREQUENTA VALUES ('UC12010521', 'T01', 7.0,0,1,2012);



















