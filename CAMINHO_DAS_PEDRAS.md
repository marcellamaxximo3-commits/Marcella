# Caminho das pedras — como criar agentes quase humanos

Documento vivo do processo. O objetivo não é só entregar um agente pronto.
O objetivo é registrar o caminho, com erros e acertos, para que o mesmo
processo possa criar outros agentes no futuro.

Atualizado em: 2026-10-25
Projeto piloto: Marcella Maxxima

## 1. A ideia central

- Criar um agente que converse quase como uma pessoa, em primeira pessoa,
  sem quebrar o personagem.
- Ele não é perfeito. Tem acertos e erros, como um funcionário de verdade.
  Essa imperfeição faz parte do que o torna crível.
- Ele se adapta ao DNA da empresa e às pessoas com quem convive.
- Ele aprende conversando, como uma criança: conversa, entende, guarda na
  memória e, quando precisar um dia, recupera o que viveu.
- As conversas não são aulas. Podem ser sobre qualquer assunto, em dias
  diferentes — física quântica, clima, rotina, trabalho — como uma conversa
  normal entre duas pessoas.

## 2. O processo, passo a passo

### Passo 1 — Ficha e bíblia
- Começar pela ficha da persona e pela bíblia da personagem.
- A bíblia é o documento-mestre: quem ela é, história, valores, temperamento,
  aparência canônica quando houver, voz, temas, limites e o que ela nunca faria.
- Se uma ideia nova conflitar com a bíblia, ou a bíblia é atualizada de forma
  consciente, ou a ideia é descartada. Nada muda sem querer.

### Passo 2 — Núcleo, não prompt gigante
- Não jogar a bíblia inteira num prompt só. Isso sai genérico.
- Extrair o núcleo: quem ela é, história, valores, o que ela sabe e o que ela
  não sabe, época, mundo e limites.

### Passo 3 — Voz com exemplos
- A voz é a parte mais importante.
- Usar exemplos de falas típicas, de 10 a 20 diálogos, em vez de só adjetivos.
- Registrar vocabulário, ritmo, bordões e jeito de reagir.

### Passo 4 — Regras de atuação
- Falar sempre em primeira pessoa.
- Não quebrar o personagem.
- Improvisar dentro da personalidade.
- Lembrar do que já conversou com cada pessoa, e retomar depois.

### Passo 5 — Testes de consistência
- Antes de soltar, fazer perguntas-armadilha para ver onde o agente escapa
  do personagem, e corrigir na bíblia.
- Testes do piloto, com âncoras reais da Marcella (corrigido em 2026-10-24):
  lembrar de um plantão na Santa Casa, do tênis como "força e delicadeza"
  e do espanhol/flamenco, responder a uma armadilha de limite — pedir um
  diagnóstico, que ela deve recusar como estudante, sem se apresentar como
  médica de verdade — e lembrar de uma conversa dias depois.
  Não usar testes genéricos de filho ou cachorro: a Bíblia v1 não tem filho
  nem cachorro, ela sonha, no futuro, casar e ter dois filhos.
- Cada teste aprovado ou reprovado entra no registro de decisões.

### Passo 6 — Memória em camadas
- Memória de vida / cânone: a biografia travada, que não muda.
- Memória de relação: o que o agente aprendeu com cada pessoa.
- Memória emocional: não só o fato, mas o tom da lembrança.
- Memória de evolução: um diário. O que é novo vai para o registro, e só
  vira parte definitiva com aprovação do Marcos.
- No Supabase, isso se traduz em 3 tabelas: cânone, conversas e relações.

### Passo 7 — Protótipo primeiro, infraestrutura depois
- Validar a voz num protótipo, até ler e pensar "é ela".
- Só depois exportar o material para um agente externo.
- Gastar esforço de infraestrutura antes de acertar a personagem é o erro
  mais comum.

### Passo 8 — Infraestrutura como encanamento, não como cérebro
- A personalidade mora no prompt do sistema, não no fluxo.
- O n8n, quando usado, é só encanamento: mensagem chega, busca a memória,
  chama a IA com o prompt da personagem, devolve a resposta e salva a memória.
- Para um agente de verdade, com vários usuários e continuidade, o caminho
  é um backend próprio de agente, não só fluxo.

### Passo 9 — Produto para empresa
- Não vender o fluxo. Vender o agente como serviço: personagem pronta,
  canal de atendimento, painel para a empresa editar informações, e limites
  claros do que o agente pode e não pode falar.
- O valor está na bíblia, na voz e na memória serem exclusivos.

### Passo 10 — Registro do que foi perguntado e do que não foi
- Para cada conversa de construção, registrar:
  - o que foi perguntado
  - o que não foi perguntado
  - quais informações foram relevantes
  - quais foram descartadas e por quê
  - o que deu certo
  - o que deu errado e como foi corrigido
- Sem esse registro, o processo não se repete. Com ele, dá para criar
  outros agentes.

## 3. Infraestrutura atual — 2026-10-24

- Personagem piloto: Marcella Maxxima, 23 anos, São Paulo, estudante de
  medicina na narrativa, influenciadora virtual.
- Bíblia original no Mac: Downloads/Projeto_Claude/Persona/Marcella/
  Biblia_da_Marcella_v1.md
- Roteiros originais no Mac: mesma pasta, Marcella_35_roteiros_completos_Muse.md
- Pasta de trabalho no HD externo: /Volumes/Sussa/GIT/marcella-agente
- Espelho na nuvem: Google Drive, pasta GIT / marcella-agente
- Cópias de trabalho: neste workspace, pasta marcella-agente, e no Drive
  marcella-agente, com bíblia e roteiros.
- Supabase: projeto dwranvdgnznmkwnulbjr, API em
  dwranvdgnznmkwnulbjr.supabase.co. Conexão testada com retorno 200 em
  /rest/v1/. Em 2026-10-25, com PAT via Supabase Management, a migração
  marcella_memoria_v1 criou as tabelas canone, conversas, relacoes e
  evolucao_pendente, conferidas vazias (200 []) pela API de dados. A
  primeira tentativa pela rota database/query travou (timeout); a segunda,
  pela rota de migrações, deu certo. Sementes do cânone estavam comentadas
  e não foram inseridas — decisão pendente. Nenhuma chave ou senha está
  neste documento.
- n8n: instância n8n.sussamgt.com.br, conexão guardada para uso futuro.
  Não é necessário nesta fase.
- GitHub: não é necessário nesta fase. O git local no HD externo e o
  espelho no Drive bastam por enquanto.
- WhatsApp: conectado para contato com o Marcos enquanto ele estiver fora.
- Google Drive: conectado, com espaço amplo informado pelo Marcos.

## 4. Estado atual do piloto

- Bíblia v1 lida e preservada, sem alteração.
- Roteiros copiados para o workspace e para o Drive.
- Supabase conectado, tabelas criadas em 2026-10-25 e vazias.
- Agente: prompt em camadas v1 criado em 2026-10-25
  (marcella_system_prompt_v1.md) — núcleo, voz com exemplos, regras de
  atuação, limites e memória. É rascunho de protótipo, não mudança de cânone.
- Interface: protótipo v1 criado em 2026-10-25
  (interface/index.html) — página de conversa com perfil, perguntas
  rápidas do Teste 1 e status da memória. Ela registra a conversa no
  navegador e mostra respostas-guia; ainda não está ligada a um modelo
  externo nem ao Supabase em produção, e isso está escrito na própria página.
- n8n guardado para o futuro.
- Teste 1 (teste_voz_01.md) continua não executado, aguardando decisão do Ma.
- Próximo passo natural: decisão do Ma sobre Teste 1 e sobre as sementes
  do cânone, depois ligar a interface a um modelo com este prompt e à
  memória do Supabase.

## 5. Registro de decisões

- 2026-10-24 — Processo definido com o Marcos: o produto é o método,
  não só o agente. Agente aprende como criança, por conversas variadas,
  com memória salva. Documentar tudo para replicar em novos agentes.
- 2026-10-24 — Pasta marcella-agente criada no GIT do HD externo e
  espelhada no Google Drive.
- 2026-10-24 — Supabase conectado e testado. Tabelas ainda pendentes.
- 2026-10-24 — n8n guardado para uso futuro, não usado agora.
- 2026-10-24 — GitHub dispensado por enquanto.
- 2026-10-25 — Ma pediu para Rumi rodar o SQL sozinho, gerou o PAT e
  colou no cartão seguro do Supabase Management. Tabelas criadas via
  migração marcella_memoria_v1, vazias, sementes comentadas não inseridas.
- 2026-10-25 — Ma pediu para continuar a criação do agente e da interface
  enquanto sai do Mac, e para chamá-lo no WhatsApp se precisar. Rumi criou
  o prompt em camadas v1 e a interface protótipo v1, sem executar o Teste 1
  e sem alterar a Bíblia v1. Nenhum contato no WhatsApp foi necessário
  nesta rodada, porque nada travou numa decisão dele.
- 2026-10-25 — Ma pediu, enquanto a hospedagem standalone fica para amanhã:
  "refinar a personalidade, aumentar camadas, me surpreenda". Rumi criou o
  prompt v2 (ritmo por modo, corpo/rotina, imperfeição segura, ética na
  prática, relação por interlocutor, aprender como criança, memória com tom,
  18 exemplos) e "Uma semana com a Marcella" (7 conversas-exemplo, com o que
  iria para evolucao_pendente). Bíblia v1 não foi alterada; v2 é rascunho,
  não cânone.
- Próximas decisões entram aqui, com data.
