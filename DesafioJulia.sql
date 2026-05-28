-- QUESTÃO 1 - FICA EM ABERTO - TENHO UMA RESPOSTA MAS SEM CERTEZA
	-- 1. Qual o propósito dessa base de dados? O que ela armazena? 

--  Representa um sistema de vendas e gerenciamento de músicas. Armazena informações de:
-- Artistas / Albuns / Musicas / faixas / playlists / clientes / funcionarios / vendas / faturas / generos musicais e tipos de midias

	-- essa questão fica um pouco em aberta, esse gerenciamento de música funciona como? tipo um spotify ou não

--2. Qual tabela guarda informações sobre os artistas? 
-- QUESTÃO 2 
	SELECT * FROM Artist

-- 3. Qual tabela guarda informações sobre vendas? 
-- QUESTÃO 3 OK
	SELECT * FROM Invoice 
	SELECT * FROM InvoiceLine 
-- Invoice InvoiceLine - pergunta 03

--4. Em qual tabela fica o nome de um álbum? 
-- QUESTÃO 4
SELECT * FROM Album;
-- usando select para consultar informações 
-- Album`, coluna `Title`. PERGUNTA 4
SELECT Title  FROM Album

-- QUESTÃO 5
-- 5. Qual é a chave primária da tabela Album? 
-- resposta = AlbumId
--  ver como faz com codigo

-- QUESTÃO 6
-- 6. Qual é a chave estrangeira em Track que aponta para Album? 
-- → FK_Track_Album.
-- Da para ver entre as tabelas também ou em codigo
	-- 	SHOW INDEX FROM Track; para bancos relacionas
PRAGMA index_list('Track');
-- - Lucas instruiu no comando

--QUESTÃO 7 
-- 7. Para que serve um índice? PESQUISAR MAIS SOBRE
--			PESQUISAR SOBRE = pesquisei sobre
-- Serve para melhorar a performance das consultas SQL, acelerando buscas, filtros, joins e ordenaçõe

-- QUESTÃO 8 
--8. Como identificar índices existentes em uma tabela? 
	  --- as chaves pk e fk geralmente já são criadas com um indicie 
	 -- OU POR LINHA DE COMANDOS
	PRAGMA index_list('Genre');
	PRAGMA index_list('Album');
	PRAGMA index_list('Artist');

-- QUESTÃO 9 
--9. Em Customer, qual coluna provavelmente identifica o país do cliente? 
-- → A coluna Country. → 
	SELECT COUNTRY FROM Customer

-- QUESTÃO 10
--10. Analise a tabela Genre: quais tipos de gêneros musicais existem e quantos  são? 
	SELECT * FROM Genre 
-- SELECT COM COUNT 
-- COUNT SERVE PARA CONTAR A QUANTIDADE DE DETERMINADA COISA 
	SELECT COUNT(*) AS "Total Generos"
	FROM Genre;

-- QUESTÃO 11
-- 11. Liste os 10 primeiros artistas ordenados alfabeticamente. 
-- 			NÃO SEI SE ESTÁ CERTO
SELECT Name
FROM Artist
ORDER BY Name ASC
LIMIT 10;
-- LIMIT PESQUISEI POR FORA

-- QUESTÃO 12
-- 12. Quantos álbuns cada artista possui? 
SELECT Name AS Artista,
       COUNT(Album.AlbumId) AS "Quantidade de Albuns"
FROM Artist
LEFT JOIN Album
ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY "Quantidade de Albuns" DESC;

-- Junta a tabela Album com Artist.

-- QUESTÃO 13
-- 13. Qual o total arrecadado em vendas (Invoice) no banco todo? 14. Quantas faixas existem por gênero musical? 
SELECT SUM(Total) AS "Total Arrecadado"
FROM Invoice;

-- QUESTÃO 14
-- 14. Quantas faixas existem por gênero musical?
/* SELECT Name AS Genero,
       COUNT(TrackId) AS "Quantidade de Faixas"
FROM Genre
LEFT JOIN Track
ON Genre.GenreId = Track.GenreId
GROUP BY Name
ORDER BY "Quantidade de Faixas" DESC; */

SELECT Genre.Name AS Genero,
       COUNT(TrackId) AS "Quantidade de Faixas"
FROM Genre
LEFT JOIN Track
ON Genre.GenreId = Track.GenreId
GROUP BY Genre.Name
ORDER BY "Quantidade de Faixas" DESC;

-- QUESTÃO 15 
-- 15. Qual o cliente que mais comprou?
SELECT Customer.FirstName || ' ' || Customer.LastName AS Cliente,
      SUM(Invoice.Total) AS "Total Comprado"
FROM Customer
JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId,
        Customer.FirstName,
        Customer.LastName
ORDER BY "Total Comprado" DESC
LIMIT 1;
-- usando concatenação = Gabriel fez o comando de outra forma

-- QUESTÃO 16 
-- 16. Qual o total de vendas por país dos clientes?
SELECT BillingCountry AS Pais,
       SUM(Total) AS "Total de Vendas"
FROM Invoice
GROUP BY BillingCountry
ORDER BY "Total de Vendas" DESC;

-- QUESTÃO 17
-- 17. Quais os 5 álbuns mais vendidos?
SELECT Title AS Album,
       COUNT(InvoiceLineId) AS "Quantidade Vendida"
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
JOIN Album
ON Track.AlbumId = Album.AlbumId
GROUP BY Album.AlbumId
ORDER BY "Quantidade Vendida" DESC
LIMIT 5;
-- Cada InvoiceLine representa uma música vendida.

-- QUESTÃO 18
-- 18. O que a FK InvoiceId em InvoiceLine representa no modelo?
-- 		Cada linha em InvoiceLine pertence a uma venda registrada em Invoice.

-- QUESTÃO 19
-- 19. Identifique uma tabela que funciona como relacionamento N:N (muitos-para-muitos)
--A tabela PlaylistTrack. Ela relaciona: * Playlist * Track
-- da para ver pelo diagrama - existe algum comando?

-- QUESTÃO 20
-- 20. Analise o índice IFK_TrackAlbumId: qual o impacto dele na performance da consulta por álbum?
-- PESQUISAR - pesquisei sobre indicie
	---  Esse índice melhora consultas que filtram músicas por álbum e fazem JOIN entre `Track e `Album`.
		--- Sem ele, o banco precisaria varrer toda a tabela `Track`.

-- QUESTÃO 21
-- 21. Crie uma query que liste cada álbum com o valor total vendido dele
-- pode fazer mais de um join -- inner join é a mesma coisa que Join
SELECT Title AS Album,
       SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS "Valor total de vendas"
FROM Album
JOIN Track
ON Album.AlbumId = Track.AlbumId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Album.AlbumId
ORDER BY "Valor total de vendas" DESC;

-- QUESTÃO 22
-- 22. Encontre o gênero musical mais lucrativo
SELECT Genre.Name AS Genero,
       SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS "Total de Lucro"
FROM Genre
JOIN Track
ON Genre.GenreId = Track.GenreId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Genre.GenreId
ORDER BY "Total de Lucro" DESC
LIMIT 1;
-- o Join precisa saber qual tabela está puxando o name já que tem Join

-- QUESTÃO 23
-- 23. Identifique padrões: quais artistas vendem mais em quais países?
		-- O comando está errado - deveria puxar apenas um pais por venda
	-- teria que pegar o total de vendas
SELECT Artist.Name AS Artista,Invoice.BillingCountry AS Pais,
       SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS "Total de Vendas"
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
JOIN Track
ON Album.AlbumId = Track.AlbumId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
GROUP BY Artist.Name, Invoice.BillingCountry
ORDER BY "Total de Vendas" DESC;
-- TEM QUE FAZER vários Join

-- QUESTÃO 24
-- 24. Liste os funcionários responsáveis por mais clientes
SELECT e.FirstName || ' ' || e.LastName AS Funcionários,
       COUNT(c.CustomerId) AS "Total de Clientes"
FROM Employee e
JOIN Customer c
ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY "Total de Clientes" DESC;


-- QUESTÃO 25
-- 25. Quais playlists contêm faixas do álbum X?
SELECT DISTINCT p.Name AS Playlist
FROM Playlist p
JOIN PlaylistTrack pt
ON p.PlaylistId = pt.PlaylistId
JOIN Track t
ON pt.TrackId = t.TrackId
JOIN Album al
ON t.AlbumId = al.AlbumId
WHERE al.Title = 'Big Ones';

-- ENTENDENDO O ERRO 
SELECT DISTINCT p.Name AS Playlist 
FROM Playlist p -- CHAMANDO PLAYLIST DE P
JOIN PlaylistTrack pt
ON p.PlaylistId = pt.PlaylistId 
JOIN Track t
ON pt.TrackId = t.TrackId
JOIN Album al 
ON t.AlbumId - al.AlbumId -- traço errado 
WHERE al.Title = "Big Ones"
-- COLOQUEI O TRAÇO ERRADO E ACABAVA PUXANDO UM RESULTADO DIFERENTE = SÓ NOTEI DEPOIS

-- codigo gabriel 
SELECT DISTINCT p.PlaylistId, P.Name, A.Title 
FROM Album a 
INNER JOIN Track t 
ON A.AlbumId = T.AlbumId 
INNER JOIN PlaylistTrack pt 
ON t.TrackId = pt.TrackId 
INNER JOIN Playlist p 
ON pt.PlaylistId = P.PlaylistId 
WHERE A.Title = 'By The Way';
-- FIQUEI NA DUVIDA SE ERA AS ASPAS QUE ESTAVAM INFLUENCIANDO 
-- O Gabriel puxou por ID NÃO POR NOME DE ALBUM = FUNCIONA IGUAL
SELECT DISTINCT p.PlaylistId, P.Name, A.Title 
FROM Album a 
INNER JOIN Track t 
ON A.AlbumId = T.AlbumId 
INNER JOIN PlaylistTrack pt 
ON t.TrackId = pt.TrackId 
INNER JOIN Playlist p 
ON pt.PlaylistId = P.PlaylistId 
WHERE A.Title = "By The Way"

-- QUESTÃO 26
--  26. Quantas faixas cada cliente comprou, 
-- e quem tem o maior tíquete médio?
SELECT c.FirstName || ' ' || c.LastName AS Cliente,
       COUNT(il.TrackId) AS "Quantidade de Faixas",
       AVG(i.Total) AS "Ticket Medio"
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId
ORDER BY "Ticket Medio" DESC;
-- AVG É A MELHOR SOLUÇÃO?
-- APARENTEMENTE ESTÁ ERRADO

-- QUESTÃO 27
-- 27. Qual a faixa mais vendida do catálogo?
SELECT t.Name AS Faixa,
       COUNT(il.InvoiceLineId) AS "Total de Vendas"
FROM Track t
JOIN InvoiceLine il
ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY "Total de Vendas" DESC
LIMIT 1;

-- QUESTÃO 28 
-- 28. Qual seria o impacto de remover determinado índice? Explique.
-- 		-- IRIA DIMUNUIR A PERFORMACE DAS CONSULTAS 

-- QUESTÃO 29 
-- 29. Desenhe mentalmente o modelo lógico:
-- quais entidades são centrais e por quê?

--As entidades centrais são: Track / Invoice / InvoiceLine
--Porque conectam: artistas/ álbuns/ clientes/ vendas/ gêneros/ playlists.
--Elas representam o núcleo operacional do sistema.


-- QUESTÃO 30
-- 30. Se fosse necessário melhorar o desempenho geral do sistema,
-- quais índices adicionais você proporia? Justifique.
-- TEM ALGUM COMANDO PARA VER ESSES ÍNDICES ? PRECISARIA VER QUAIS COMANDOS JÁ TEM PRÉ DEFINIDOS E VER QUAIS AINDA 
-- FALTAM PARA MELHORAR O DESEMPENHO DO SISTEMA
		--- CustomerId / GenreId / TrackId / ArtistId
-- eu pesquisei os comandos
CREATE INDEX idx_invoice_customer
ON Invoice(CustomerId);
CREATE INDEX idx_track_genre
ON Track(GenreId);
CREATE INDEX idx_invoiceline_track
ON InvoiceLine(TrackId);
CREATE INDEX idx_album_artist
ON Album(ArtistId);

-------------------------------------------------------------------------------------------

-- ETAPA 2 
-- Criação da VIEW `vw_albums_best_sellers`
-- CONSULTAR APENAS UMA COLUNA NA TABELA 
CREATE VIEW vw_albums_best_sellers AS
SELECT
    al.Title AS "Nome do Album",
    ar.Name AS "Nome do Artista",
    COUNT(il.InvoiceLineId) AS "Quantidade total de Vendas",
    SUM(il.UnitPrice * il.Quantity) AS "Valor Total de Vendas",
    COUNT(DISTINCT t.TrackId) AS "Quantidade de Faixas",
    MAX(i.InvoiceDate) AS "Ultima data de Venda"
FROM Album al
JOIN Artist ar
    ON al.ArtistId = ar.ArtistId
JOIN Track t
    ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
GROUP BY al.AlbumId, al.Title, ar.Name;

--- part 2 Consulta da VIEW
SELECT *
FROM vw_albums_best_sellers

--- até a view funcionou criou a view 

--5. 3º DESAFIO — CRIAÇÃO DE NOVAS TABELAS
--Criando tabela 
-- precisa de um relacionamento entre as tabelas STATE E CUSTOMER
CREATE TABLE State (
    StateId INTEGER PRIMARY KEY,
    StateCode VARCHAR(2),
    StateName VARCHAR(50)
);

-- faltou fazer um relacionamento ou algo para conectar com a tabela customer = não estão conversando 
UPDATE Customer 
SET StateId = (
	SELECT s.StateId
	FROM State s 
	WHERE s.StateCode = Customer.State 
);

-- O UPDATE AINDA NÃO FEZ SE RELACIONAREM

-- Inserindo estados 
-- a tabela state só puxa esses estados agora
-- tem que inserir manualmente os outros?
INSERT INTO State VALUES (1, 'SP', 'São Paulo');
INSERT INTO State VALUES (2, 'RJ', 'Rio de Janeiro');
INSERT INTO State VALUES (3, 'MG', 'Minas Gerais');
INSERT INTO State VALUES (4, 'SC', 'Santa Catarina');

-- Relacionando vendas por álbum e estado
-- • Identificar qual estado “campeão” em vendas por álbum. 
-- não funciona corretamente 
-- não puxa todos os estados que precisa 
SELECT
    s.StateName,
    al.Title,
    SUM(il.UnitPrice * il.Quantity) AS "Total de Vendas"
FROM State s
JOIN Customer c
ON c.State = s.StateCode
JOIN Invoice i
ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
JOIN Track t
ON il.TrackId = t.TrackId
JOIN Album al
ON t.AlbumId = al.AlbumId
GROUP BY s.StateName, al.Title
ORDER BY "Total de Vendas" DESC;

-- o select existe mas não funciona corretamente = poderia usar inner join
-- usar with? gabriel está usando

----- CENÁRIO B NÃO FUNCIONOU AINDA
--  B. Cenário B — Ligando Pessoas a Playlists
-- Criando tabela de relacionamento
-- NÃO FUNCIONOU
/*
CREATE TABLE CustomerPlaylist (
    CustomerId INTEGER,
    PlaylistId INTEGER,
    PRIMARY KEY (CustomerId, PlaylistId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (PlaylistId) REFERENCES Playlist(PlaylistId)
);
*/
--Quantas playlists cada cliente segue?
SELECT
    c.FirstName || ' ' || c.LastName AS Cliente,
    COUNT(cp.PlaylistId) AS "Total de Playlists"
FROM Customer c
LEFT JOIN CustomerPlaylist cp
ON c.CustomerId = cp.CustomerId
GROUP BY c.CustomerId;

-- Quais playlists são mais populares?
SELECT
    p.Name,
    COUNT(cp.CustomerId) AS Seguidores
FROM Playlist p
JOIN CustomerPlaylist cp
ON p.PlaylistId = cp.PlaylistId
GROUP BY p.PlaylistId
ORDER BY Seguidores DESC;

--Quem escuta mais rock?
SELECT
    c.FirstName || ' ' || c.LastName AS Cliente,
    COUNT(*) AS TotalRock
FROM Customer c
JOIN CustomerPlaylist cp
ON c.CustomerId = cp.CustomerId
JOIN PlaylistTrack pt
ON cp.PlaylistId = pt.PlaylistId
JOIN Track t
ON pt.TrackId = t.TrackId
JOIN Genre g
ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY c.CustomerId
ORDER BY TotalRock DESC;

-- NENHUM SELECT FLUIU CORRETAMENTE MAS O ERRO ESTÁ NA CRIAÇÃO INICIAL 
------------------------------
SELECT NAME FROM Artist a
SELECT * FROM Artist 
SELECT * FROM Genre g 
SELECT * FROM MediaType 
SELECT * FROM Invoice 
SELECT * FROM InvoiceLine 
-- selects iniciais 


-- corrigindo erro da parte 3 do desafio
-- a tabela state está "flutuando" está solta preciso conectar ela com o customers

-- comando sugerido pelo Gabriel
ALTER TABLE Customer
ADD COLUMN StateId INTEGER;
-- NÃO DEU CERTO
--
CREATE TABLE State (
    StateId INTEGER PRIMARY KEY,
    StateCode VARCHAR(2),
    StateName VARCHAR(50)
);

----
UPDATE Customer
SET StateId = (
    SELECT s.StateId
    FROM State s
    WHERE s.StateCode = Customer.State
);

SELECT
    s.StateName AS Estado,
    al.Title AS Album,
    SUM(il.UnitPrice * il.Quantity) AS TotalVendas
FROM State s
JOIN Customer c
    ON c.StateId = s.StateId
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il
    ON i.InvoiceId = il.InvoiceId
JOIN Track t
    ON il.TrackId = t.TrackId
JOIN Album al
    ON t.AlbumId = al.AlbumId
GROUP BY s.StateName, al.Title
ORDER BY s.StateName, TotalVendas DESC;


ALTER TABLE Customer
ADD CONSTRAINT fk_customer_state
FOREIGN KEY (StateId)
REFERENCES State(StateId);

ALTER TABLE State 
ADD 

SELECT DISTINCT State
FROM Customer;

---

SELECT
    State,
    COUNT(*) AS Total
FROM Customer
GROUP BY State
ORDER BY Total DESC;


SELECT
    Resultado.Album,
    Resultado.Estado,
    Resultado.TotalVendas
FROM (
    SELECT
        al.Title AS Album,
        s.StateName AS Estado,
        SUM(il.UnitPrice * il.Quantity) AS TotalVendas
    FROM State s
    JOIN Customer c
        ON c.State = s.StateCode
    JOIN Invoice i
        ON c.CustomerId = i.CustomerId
    JOIN InvoiceLine il
        ON i.InvoiceId = il.InvoiceId
    JOIN Track t
        ON il.TrackId = t.TrackId
    JOIN Album al
        ON t.AlbumId = al.AlbumId
    GROUP BY al.Title, s.StateName
) Resultado
WHERE Resultado.TotalVendas = (
    SELECT MAX(Sub.TotalVendas)
    FROM (
        SELECT
            SUM(il2.UnitPrice * il2.Quantity) AS TotalVendas
        FROM State s2
        JOIN Customer c2
            ON c2.State = s2.StateCode
        JOIN Invoice i2
            ON c2.CustomerId = i2.CustomerId
        JOIN InvoiceLine il2
            ON i2.InvoiceId = il2.InvoiceId
        JOIN Track t2
            ON il2.TrackId = t2.TrackId
        JOIN Album al2
            ON t2.AlbumId = al2.AlbumId
        WHERE al2.Title = Resultado.Album
        GROUP BY s2.StateName
    ) Sub
)
ORDER BY Resultado.Album;


ALTER TABLE Customer 
ADD COLUMN StateId INTEGER;

UPDATE Customer
SET StateId = (
    SELECT s.StateId
    FROM State s
    WHERE s.StateCode = Customer.State
);


------

CREATE TABLE CustomerState (
    CustomerId INTEGER,
    StateId INTEGER,
    PRIMARY KEY (CustomerId, StateId)
);
---
INSERT INTO CustomerState (CustomerId, StateId)
SELECT
    c.CustomerId,
    s.StateId
FROM Customer c
JOIN State s
ON c.State = s.StateCode;

----
SELECT *
FROM CustomerState;

---

WITH Q AS (
    SELECT
        a.AlbumId,
        a.Title,
        SUM(il.Quantity) AS Quantidade,
        s.StateName AS Estado
    FROM Album a
    INNER JOIN Track t
        ON a.AlbumId = t.AlbumId
    INNER JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    INNER JOIN Invoice i
        ON il.InvoiceId = i.InvoiceId
    INNER JOIN Customer c
        ON i.CustomerId = c.CustomerId
    INNER JOIN CustomerState cs
        ON c.CustomerId = cs.CustomerId
    INNER JOIN State s
        ON cs.StateId = s.StateId
    GROUP BY a.AlbumId, a.Title, s.StateName
)

SELECT *
FROM Q q1
WHERE Quantidade = (
    SELECT MAX(q2.Quantidade)
    FROM Q q2
    WHERE q2.AlbumId = q1.AlbumId
);

-- ver quantos clientes existem por estado
SELECT
    State,
    COUNT(*) AS TotalClientes
FROM Customer
GROUP BY State
ORDER BY TotalClientes DESC;

-- ver quantas vendas existem por estado
SELECT
    c.State,
    COUNT(i.InvoiceId) AS TotalVendas
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.State
ORDER BY TotalVendas DESC;

--

ALTER TABLE State
ADD CONSTRAINT fk_state_customer
FOREIGN KEY (StateId)
REFERENCES Customer(StateId);


ALTER TABLE Customer
ADD CONSTRAINT fk_customer_state
FOREIGN KEY (StateId)
REFERENCES State(StateId);


commit;

-- não está puxando os dados corretamente, na parte dois do desafio
-- tem um erro de chave estrangeira 
-- a tabela state não consegue conversar com a tabela customer
--- não tem um relacionamento entre elas, não tem uma chave estrangeira, não tem um campo que conecte as duas tabelas

ALTER TABLE Customer
ADD COLUMN StateId INTEGER;
FOREIGN KEY (StateId) REFERENCES State(StateId);

-- Entregar a atividade amanhã meio dia




