
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
