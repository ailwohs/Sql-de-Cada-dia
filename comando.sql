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



-- WHERE SERVE PARA LIMITAR AS CONSULTAS
SELECT * FROM ALUNO 
WHERE sexo = 'F'
-- EXEMPLO

SELECT * FROM FREQUENTA
WHERE NOTA >= 8.0 

-- != OPERADOR DIFERENTE 
SELECT * FROM FREQUENTA
WHERE NOTA != 8.0

-- BETWEEN COMPARAR VALOR DE UMA COLUNA EM UMA FAIXA DE VALORES

SELECT * FROM FREQUENTA
WHERE NOTA BETWEEN 7.0 AND 10.0

-- IN É USADO PARA LIMITAR 

SELECT * FROM FREQUENTA 
WHERE NOTA IN (7,8)

-- OR FUNCIONA QUASE IGUAL
SELECT * FROM FREQUENTA
WHERE NOTA = 7.0 OR NOTA = 8.0
-- % REPRESENTA ZERO OU MAIS CARACTERES
-- O _ REPRESENTA EXATAMENTE UM CARACTER


-- VAI TRAZER TODOS OS ALUNOS QUE COMEÇAM COM A LETRA A
SELECT * FROM ALUNO
WHERE NOME LIKE 'A%'

SELECT * FROM ALUNO
WHERE NOME LIKE '____SAMPAIO'
 

-- VALORES NULOS

SELECT * FROM ALUNO
WHERE cidade IS NULL

-- para comparar colunas que não estão nulos
SELECT * FROM ALUNO
WHERE cidade IS not NULL

-- quando precisa ser verdadeiro uso o and
SELEC T * FROM ALUNO
WHERE sexo = 'M' AND bairro = 'Aguas Clares'

-- ORDER BY PARA ORDENAR OS RESULTADOS
-- ASC ORDEM CRESCENTE 
-- DESC ORDEM DECRESCENTE
SELECT * FROM ALUNO
ORDER BY NOME ASC 
-- VAO PRDERNAR OS NOMES EM CRESCENTE 

SELECT * FROM ALUNO
ORDER BY bairro -- mesmo sem usar asc vai em ordem crescente

SELECT * FROM FREQUENTA
ORDER BY nota DESC

SELECT * FROM ALUNO
ORDER BY nome, bairro 


-- max serve para trazer o maior valor de uma coluna
SELECT MAX(nota) FROM FREQUENTA
SELECT MAX(datanascimento) FROM ALUNO
SELECT MAX(nome) FROM ALUNO
ORDER BY nome 

-- MIN SERVE PARA TRAZER O MENOR VALOR DE UMA COLUNA
SELECT MIN(nota) FROM FREQUENTA
-- DA PARA USAR MIN E MAX JUNTOS
SELECT MIN(nota), MAX(nota) FROM FREQUENTA
SELECT MIN(datanascimento) FROM ALUNO

-- COUNT CONTA A QUANTIDADE DE DETERMINADA COISA
SELECT COUNT(*) FROM ALUNO
SELECT COUNT(endereco) FROM ALUNO

-- FUNCAO AVG PARA CALCULAR A MEDIA DE UMA COLUNA
SELECT AVG(nota) FROM FREQUENTA
-- AVG APENAS PARA VALORES NÚMERICOS
SELECT AVG(falta) FROM FREQUENTA

-- SUM SERVE PARA CALCULAR A SOMA DE UMA COLUNA
SELECT SUM(nota) FROM FREQUENTA
-- APENAS PARA VALORES NUMÉRICOS

-- AGRUNPANDO OS DADOS

-- GROUP BY PODE DIVIDIR OS RESULTADOS EM GRUPOS MENORES

SELECT * FROM FREQUENTA
-- TO CHAR SERVE PARA FORMATAR O RESULTADO DE UMA CONSULTA
SELECT codturma, semestre, TO_CHAR(AVG(nota),'99.9') FROM FREQUENTA
FROM FREQUENTA
GROUP BY codturma, semestre


SELECT cidade, bairro, COUNT(*)
FROM ALUNO
WHERE cidade IS NOT NULL
GROUP BY cidade, bairro
ORDER BY cidade, bairro

-- HAVING SERVE PARA IMPORTAR CONDIÇÕES EM AGRUPAMENTOS

SELECT cidade, bairro, COUNT(*)
FROM ALUNO
WHERE cidade IS NOT NULL
GROUP BY cidade, bairro
HAVING bairro LIKE '%Sul'
ORDER BY cidade, bairro

-- função um pedaço que o codigo que repete e pode ser reutilizado

-- funções de conversão 

SELECT nota, nota+ 0.4 FROM FREQUENTA

-- FUNÇÃO TO_CHAR CONVERTE UM VALOR NUMÉRICO EM STRING
-- PARA DATA YYYY PARA ANO MM PARA MÊS DD PARA DIA


SELECT nome,datanascimento
FROM ALUNO 
WHERE TO_CHAR (datanascimento, 'YYYY') = '1990'

SELECT TO_CHAR (SYSDATE, 'DD/MM/YYYY HH24:MI:SS MONTH DAY') 
FROM DUAL

-- TO_DATE CONVERTE STRING EM DATA
SELECT TO_DATE('12/09/2006', 'DD/MM/YYYY') FROM DUAL
SELECT nome, datanascimento
FROM ALUNO
WHERE datanascimento = TO_DATE('12/09/2006', 'DD/MM/YYYY')

-- INSERIR REGISTROS

INSERT INTO frequenta VALUES ('UC120052210', 'T01', 7.0,0,1,2012);
INSERT INTO frequenta VALUES ('UC120052210', 'T02', 8.0);

-- Join serve para juntar os dados de duas ou mais tabelas
SELECT * FROM ALUNO
INSERT INTO FREQUENTA VALUES ('UC120052210', 'T01', NULL, NULL, NULL, NULL);

-- Existem váriações do JOIN 
SELECT A.matricula, A.nome, F.codturma
FROM ALUNO A, FREQUENTA F
WHERE A.matricula = F.matricula

-- AMBAS SÃO AS MESMA COISA

SELECT A.matricula, A.nome, F.codturma
FROM ALUNO A
JOIN FREQUENTA F
ON A.matricula = F.matricula

-- NATURAL JOIN SERVE PARA JUNTAR AS TABELAS PELO NOME DAS COLUNAS QUE SÃO IGUAIS
SELECT matricula, nome, codturma
FROM ALUNO
NATURAL JOIN FREQUENTA


-- GROUP BY serve para agrupar registros que têm o mesmo valor em uma ou mais colunas.
-- ORDER BY serve para ordenar o resultado da consulta.
-- LEFT JOIN serve para juntar duas tabelas, mas garantindo que todos os registros da tabela da esquerda apareçam

-- índicies no banco de dados são estruturas que melhoram a velocidade das consultas, mas podem diminuir a velocidade de inserções e atualizações. Eles funcionam como um índice em um livro, permitindo acesso rápido aos dados.
-- eles são como sumários que ajudam a encontrar informações rapidamente, mas podem tornar o processo de adicionar ou atualizar informações mais lento, porque o índice precisa ser atualizado também.
-- são pré definidos pelo administrador do banco de dados, que decide quais colunas devem ter índices com base nas consultas mais frequentes e na estrutura dos dados.

SELECT * FROM ALUNO
WHERE nome = 'Roger Sampaio'

INDICE NOME_IDX GROUP BY nome
    SUM'NOME_IDX' ON ALUNO (nome)


-- OS ÍNDICIES SÃO PRÉ DEFINIDOS
-- MAS PODE EXISTEM ALGUMS MECANISMOS QUE ESTUDEM O SISTEMA 
-- E CRIEM SOZINHOS ESSES ÍNDICIES


/*5. 3º DESAFIO: CRIAÇÃO DE TABELAS NOVAS (MODELAGEM + SQL)
A. CENÁRIO A — LIGANDO ÁLBUNS A ESTADOS DE VENDA
A base original não guarda “estado” do cliente além do país.
A ideia é criar um dado fictício para enriquecer o modelo.
• Criar tabela.
• Preencher manualmente alguns estados (SP, RJ, MG etc.).
• Criar query relacionando vendas por álbum e estado.
• Identificar qual estado “campeão” em vendas por álbum.
Isso simula “master data enhancement”.


B. CENÁRIO B — LIGANDO PESSOAS A PLAYLISTS
Playlist e Customer não têm relação direta.
• Crie uma tabela de ligação que permita isso.
• Agora surgem desafios:
o Quantas playlists cada cliente segue?
o Quais playlists são mais populares?
o Quem escuta mais rock? (cruzando PlaylistTrack → Genre)
o Qual cliente cria playlists mais variadas?


C. CENÁRIO C — CRIAÇÃO DE TABELA “ALBUMSALESSUMMARY”
Simula um agregado físico, usado para performance.
Missão:
• Criar a tabela.
• Preencher essa tabela com base em cálculos reais.
• Criar um processo (pode ser um script SQL) que "atualize" os valores.
• Depois, cruzar essa tabela com Artist e Genre.
Isso ensina materialização, agregação e conceito de “mestre derivado”.
*/

CREATE TABLE ESTADO (
    id_estado INT PRIMARY KEY,
    nome_estado VARCHAR(50)
);