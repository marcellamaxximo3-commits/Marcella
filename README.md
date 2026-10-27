# Marcella Maxxima — projeto da agente

Projeto da agente virtual Marcella Maxxima: estudante de medicina, personagem fictícia.
O app que o usuário instala é a PWA em `pwa/` (página estática, respostas prontas).
A conversa ao vivo com memória vive no n8n + Supabase — ver `ARQUITETURA_KISS.md`.

## Pastas

- `pwa/` — app instalável (servir esta pasta na VPS, depois de pronta a ligação).
- `pwa-teste/` — variante de teste que tenta o webhook do n8n e volta para a resposta local se ele falhar.
- `Biblia_da_Marcella_v1.md` — cânone da personagem (não alterar sem decisão explícita).
- `marcella_system_prompt_v1.md` / `marcella_system_prompt_v2.md` — prompts em camadas.
- `n8n/` — rascunho de workflow v1 (o fluxo em produção foi construído no n8n, ver `ARQUITETURA_KISS.md`).
- `supabase_tabelas_memoria.sql` e `n8n/marcella_tabelas_tematicas.sql` — esquemas iniciais.
- `CAMINHO_DAS_PEDRAS.md` e `resumo_projeto_marcella.md` — processo e histórico.
- `interface/`, `fotos/`, `teste_voz_01.md`, `uma_semana_com_a_marcella.md` — protótipo, referências e exemplos.

## Deploy na VPS (Easypanel / Docker)

O `Dockerfile` na raiz do repositório constrói uma imagem nginx:alpine que serve
só a pasta `pwa/` na porta 80. É o que o Easypanel precisa para o build:
`docker build -t marcella .` e depois rodar a imagem expondo a porta 80.
Se o build falhar com "no such file or directory" para o Dockerfile, o
repositório está desatualizado — sincronize com o `main` antes de rebuildar.

## Segurança — ler antes de subir na VPS

Nenhum segredo (senha, chave de API, token) está neste repositório, e nenhum deve ser
adicionado a ele. Credenciais do n8n, do Supabase e do modelo ficam só no servidor
(VPS / n8n), como variáveis de ambiente, nunca em arquivo commitado.

## Imagens

As imagens (`pwa/foto.jpg`, `pwa/icon-*.png`, `fotos/01-retrato-principal.webp`) são
binárias e não entram neste envio feito pela API do GitHub. Para o app ficar com
foto e ícones na VPS, copie esses arquivos do projeto original para as mesmas
pastas antes de servir — sem eles, a página funciona, mas o avatar e os ícones
não aparecem.
