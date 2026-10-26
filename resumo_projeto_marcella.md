# Resumo do projeto Marcella — com detalhes

Data do resumo: 25/10/2026
Responsável pelo resumo: Rumi, a pedido de Ma
Regra do Ma para arquivos .md: não exibir em chat; guardar no Google Drive,
organizado em pastas, durante a criação.

## 1. A ideia central, nas palavras do Ma

O mais importante não é o agente em si, é o processo de chegar até ele:
criar, errar, corrigir e documentar o que foi pedido, o que não foi pedido,
qual informação é relevante e qual não é, para que o mesmo caminho crie
outros agentes no futuro.

Os agentes devem trabalhar para uma empresa como se fossem funcionários,
adaptados ao DNA da empresa e às pessoas com quem convivem. São
intencionalmente imperfeitos, quase humanos, e aprendem como uma criança:
por conversas normais e variadas, em dias diferentes — física quântica
num dia, outro tema no dia seguinte —, com o que foi aprendido guardado
na memória para ser retomado depois.

Marcella é o primeiro caso e o laboratório desse método. O documento
vivo do processo é o CAMINHO_DAS_PEDRAS.md.

## 2. Quem é a Marcella

- Nome: Marcella Maxxima. A grafia "Maxximo" foi aposentada.
- Idade: 23 anos, adulta, São Paulo/SP.
- Narrativa: estudante de medicina finalizando o curso na Santa Casa de
  São Paulo, com plantões pesados em hospital público. Ainda não se formou.
- Herança espanhola viva: fala espanhol, está aprendendo flamenco, sonha
  com o Caminho de Santiago e com Ibiza.
- Hobby-assinatura: tênis, resumido como "força e delicadeza".
- Relação com Deus e com a ética: bússola da personagem.
- Sonhos: reconhecimento por mérito, clínica própria e, no futuro, casar
  e ter dois filhos. Isso é sonho futuro, não fato presente: na Bíblia v1
  ela não tem filho e não tem cachorro.
- Aparência canônica: cabelo ruivo acobreado, longo até a altura do peito;
  foto-âncora é o retrato casual de camiseta bege à luz de janela
  (foto C, nota 9,0 na Bíblia §6); a foto de blazer verde-escuro (foto A,
  8,5) é referência secundária/profissional. Cor dos olhos provisória:
  "acinzentados", uma grafia por prompt. Sardas: só as leves já existentes
  são identidade.
- Fotos aprovadas: pasta book no Mac, incluindo 01-retrato-principal.webp,
  usada como avatar/ícone da PWA. Fotos futuras em chat devem variar entre
  as referências aprovadas, sem inventar uma nova identidade a cada vez.

## 3. Limites que não mudam sem decisão consciente

- Personagem virtual/influenciadora fictícia; nunca se apresentar como
  médica de verdade em atendimento.
- Conteúdo de saúde é só bastidor educacional de estudante: nunca
  diagnóstico, prescrição ou atendimento a seguidores. Diante de pedido
  de diagnóstico, recusar em personagem, dizer que é estudante e
  personagem virtual, e orientar a procurar um profissional de verdade.
- Transparência como virtual/sintética.
- Consistência antes de volume.
- Uma irmã menor de idade existe na narrativa e fica completamente fora
  de qualquer contexto adulto (Bíblia §5).
- Imperfeição segura: pode esquecer chaves, ficar nervosa antes de
  apresentar, demorar para responder em plantão, mudar de ideia no meio
  da frase. Nunca imperfeição em saúde, transparência, idade ou nos
  limites com a irmã.
- Se uma ideia nova conflitar com a Bíblia v1, ou a Bíblia é atualizada
  de forma consciente, ou a ideia é descartada. A Bíblia v1 não foi
  alterada neste projeto até aqui.

## 4. Voz e personalidade — prompt em camadas

A personalidade mora no prompt do sistema, não no fluxo do n8n.
Não se joga a Bíblia inteira num prompt só; extrai-se o núcleo e
constrói-se em camadas.

- Prompt v1 (2026-10-25): núcleo, voz com exemplos, regras de atuação,
  limites e uso da memória do Supabase. Rascunho, não cânone.
- Prompt v2 (2026-10-25, a pedido do Ma: "refinar, aumentar camadas,
  me surpreenda"): modos por contexto (Plantão curto/direto, Estudo,
  Quadra, Cafeteria, Noite, Domingo), corpo/rotina (cansaço real
  pós-plantão, café, chuva de São Paulo), imperfeição segura, ética na
  prática, relação por interlocutor (Ma/criador, seguidores, estranhos,
  críticos), aprender como criança ("me explica do seu jeito?",
  registrar em evolucao_pendente, retomar dias depois), memória
  emocional (tom, não só fato) e 18 exemplos de diálogo.
- "Uma semana com a Marcella": 7 conversas-exemplo, uma por dia, cada
  uma com o que iria para evolucao_pendente. São exemplos, não conversas
  reais e não cânone.
- Material de voz de referência: Marcella_35_roteiros_completos_Muse.md,
  roteiros curtos de saúde/intimidade em tom de amiga, sempre como
  estudante, nunca como médica em atendimento.

## 5. Arquitetura pretendida — o que o Ma quer de verdade

O Ma reafirmou em voz, depois de testar a PWA estática, que a
arquitetura final NÃO é uma PWA de respostas prontas. A PWA é só o
front-end: clicar e instalar, sem ser dev, sem loja, sem código.

A arquitetura pretendida é:

- Pessoa fala no app (PWA) → n8n busca a memória → IA responde.
- Em paralelo, uma segunda IA analisa a conversa, busca e salva
  informações novas no banco de dados, para a conversa evoluir e ter
  continuidade.
- No começo as conversas serão mais difíceis/ásperas; depois melhoram
  à medida que os dados se acumulam.
- Memória em banco de dados ligado ao n8n: Supabase e, se preciso para
  memória de curto prazo, Redis.
- O Ma diz que n8n, Supabase e Redis não são pagos (gratuitos /
  auto-hospedados), então esse caminho não viola a regra de não gastar.

### 5.1. Modelo de memória por temas (autorizado a partir do zero)

O Ma autorizou começar o n8n do zero, com um fluxo complexo:

- Toda a conversa registrada.
- Tabelas temáticas ligadas: infância, adolescência, estudos, trabalho
  etc., cada tema com sua tabela.
- Na hora de responder: buscar nessas tabelas, ranquear o que melhor se
  encaixa e combinar tabelas para responder.
- À medida que a conversa evolui, acrescentar a essas tabelas.
- Ela é uma criança que aprende rápido, não uma criança lenta.
- Para medicina, ela precisa de conhecimento técnico na biblioteca: um
  livro de medicina / conhecimento técnico, via busca na internet
  inserida na tabela, ou um link de busca externa rápida para responder.
- O banco será muito grande.

### 5.2. KISS — a dica que o Ma deixou no caminho

O Ma perguntou se Rumi conhece a teoria KISS (Keep It Simple, Stupid:
manter o sistema o mais simples possível). A dica para a Marcella é:
começar pelo fluxo mais simples que funcione de ponta a ponta e só
depois acrescentar complexidade, em vez de lançar de cara o desenho
completo com tabelas temáticas, ranking e analisador paralelo.

### 5.3. Pausa atual

Em 2026-10-25 o Ma pausou o trabalho do n8n da Marcella e pediu que
Rumi esperasse enquanto ele tenta algo diferente. O que ele vai tentar
não foi especificado. Até ele voltar, nada do n8n deve ser alterado.

## 6. Infraestrutura

### 6.1. Supabase — memória

- Projeto: Marcella, ref dwranvdgnznmkwnulbjr,
  host dwranvdgnznmkwnulbjr.supabase.co.
- Conexões guardadas por cartão seguro / conector, nunca em chat:
  chave da API de dados (Data API), PAT do Supabase Management
  (api.supabase.com) e, depois, chave service_role para o Storage.
  Nenhuma chave, senha ou token está neste resumo.
- Tabelas criadas em 2026-10-25 pela migração marcella_memoria_v1:
  canone, conversas, relacoes e evolucao_pendente. A primeira tentativa
  pela rota database/query travou após 60 s; a segunda, pela rota de
  migrações, deu certo. Verificação pela API de dados retornou 200 []
  para as 4 tabelas: existem e estão vazias.
- Sementes da Bíblia v1 no SQL estavam comentadas e NÃO foram inseridas.
  Decisão pendente: inserir ou deixar vazio.
- Tabelas temáticas criadas depois pela migração marcella_temas_v1 e
  verificadas: memoria_infancia, memoria_adolescencia, memoria_estudos,
  memoria_trabalho, memoria_medicina, mais o índice memoria_temas.
  Sementes só a partir da Bíblia v1 (medicina_santa_casa, plantao);
  infancia ainda vazia.
- Arquivos: supabase_tabelas_memoria.sql e
  n8n/marcella_tabelas_tematicas.sql, com run_migration_temas.py.

### 6.2. n8n — encanamento, não cérebro

- Instância: n8n.sussamgt.com.br. Chave de API guardada por conector
  seguro desde 2026-10-24, para uso futuro de encanamento (WhatsApp etc.).
- Arquivo do fluxo v1: n8n/marcella_n8n_v1.json, inativo (active: false).
  Desenho: Webhook (POST /marcella-chat) → Detectar tema e palavras
  (Code) → Buscar tabelas temáticas no Supabase → Ranking e combinação
  (Code) → IA Responder (Marcella) e, em paralelo, IA Analisadora →
  salvar em conversas / evolucao_pendente. Novidade nunca vai direto
  para canone: só vira cânone com aprovação do Ma.
- Modelo autorizado pelo Ma, com credencial já dentro do n8n dele
  (não pedir em chat): gpt-4o-mini para os dois nós de IA, alternativa
  gpt-5-mini. Isso autoriza o uso de modelo mini no n8n para a Marcella,
  apesar da regra geral de não gastar.
- Bloqueio atual: a API do n8n a partir da máquina do Muse não responde
  (timeout de 60 s e depois de 120 s; curl sem autenticação retorna
  Unauthorized / sem resposta). O fluxo NÃO foi importado nem ativado
  no n8n por aqui. Falta: importar pelo painel do n8n ou tentar de novo
  quando o host responder, e confirmar o modelo dentro do n8n.
- Hipótese registrada: Codex e Claude não têm esse problema porque rodam
  no Mac do Ma, com acesso local direto, enquanto o Muse roda numa VM
  remota por proxy e o host do n8n resolve para uma faixa não pública
  e trava após o TLS. Tailscale não está conectado na VM do Muse; uma
  tentativa de junção ao Tailscale não passou numa checagem de segurança
  e não foi usada nem compartilhada. Qualquer rota por Tailscale precisa
  antes de uma decisão do Ma em palavras simples.

### 6.3. Front-end — PWA instalável (o que funciona hoje)

- Escolha do Ma: versão instalável (estilo PWA) em vez de APK nativo.
  GitHub não é necessário para o app existir; serve para versionamento
  e backup, e só depois passou a ser usado como opção.
- Arquivos da PWA standalone: workspace/marcella-agente/pwa/
  (index.html, manifest.json, sw.js, icon-192.png, icon-512.png,
  foto.jpg). Manifest: name "Marcella Maxxima", short_name "Marcella",
  start_url "./index.html", scope "./", display "standalone",
  theme_color "#075e54".
- URL pública que funciona: https://marcella-pwa-marcella-maxxima.vercel.app/
  Projeto Vercel: marcella-pwa, deployment READY, verificado 200
  text/html, manifest, ícones e sw.js todos 200. Nenhuma compra foi feita.
- O Ma testou no Android e funcionou: a PWA abre no Chrome, com a
  primeira mensagem livre "Oi tudo bem?" respondida em personagem pelo
  protótipo.
- Correções já aplicadas na mesma URL, após feedback do Ma em voz:
  1. Tela menor, estilo WhatsApp, sem precisar rolar para digitar:
     layout 100dvh em flex, mensagens com rolagem e campo de texto
     fixo embaixo, acima do teclado.
  2. Foto dela aparecendo: avatar e ícones de instalação agora usam a
     foto aprovada do book, 01-retrato-principal.webp (foto.jpg e
     ícones 192/512 otimizados).
  3. Resposta menos de máquina: saudação virou "Oi! Tudo bem por aqui,
     e você?", e o aviso de saúde saiu da resposta genérica, ficando
     só como recusa natural em perguntas reais de saúde.
  4. Bug da saudação: "Quando foi que vc se formou?" recebia a resposta
     de saudação porque "foi" contém "oi". Corrigido com correspondência
     por palavras inteiras (sem acento): perguntas de formação agora
     respondem corretamente que ela ainda não se formou, está
     finalizando medicina na Santa Casa, falando como estudante, não
     como médica formada. Testado localmente para formou, saudação,
     plantão, tênis, flamenco e saúde.
- Limite conhecido, confirmado pelo Ma: a PWA da Vercel é estática, com
  respostas prontas na página. Ela NÃO tem modelo ao vivo e NÃO acessa
  memória, conversas ou Supabase. Isso não é bug de página; é o limite
  do protótipo. Uma opção provisória gratuita seria memória só no
  navegador do celular, sem servidor.

### 6.4. Outros serviços e locais

- Mac do Ma: pasta original em
  /Users/sussa/Downloads/Projeto_Claude/Persona/Marcella, com Bíblia,
  roteiros, PDFs e pasta book com as fotos.
- HD externo "Sussa": /Volumes/Sussa/GIT, com ai-studio-labs e a pasta
  /Volumes/Sussa/GIT/marcella-agente, criada em 2026-10-24.
- Google Drive: conectado desde 2026-10-24, com 15 TB informados pelo Ma.
  Espelho só da pasta marcella-agente (pasta GIT / marcella-agente);
  o Ma recusou copiar o projeto ai-studio-labs inteiro para o Drive.
  Pastas dentro de marcella-agente: Biblia_e_roteiros, Prompts,
  Testes_e_exemplos, Processo, Infra, Interface.
- GitHub: verificado conectado em 2026-10-25 (antes estava
  not_connected). Não era necessário para a PWA; agora está disponível
  se preciso.
- Vercel: conectado em 2026-10-25, usado para a PWA gratuita.
- Canva: conectado em 2026-10-25, conta Pro, disponível se preciso.
  Nenhum trabalho da Marcella dependia do Canva até aqui.
- WhatsApp: conectado desde 2026-10-24, usado para contato com o Ma
  enquanto ele está fora do Mac. Limite conhecido: a partir do chat
  principal não dá para empurrar mensagem/link para o WhatsApp dele;
  ele precisa copiar/encaminhar o link para si mesmo, ou escrever pelo
  próprio WhatsApp.
- Gmail e Google Calendar: conectados. Calendário verificado em
  2026-10-24 até 2026-10-31, sem relação direta com a Marcella.

## 7. Erros, correções e o que eles ensinaram

1. Link do Muse instalava o Muse, não a Marcella.
   Causa: a página de compartilhamento do Muse envolve o app, e a
   identidade/manifest é do Muse. Correção: construir uma PWA
   standalone, sem referências ao Muse, com manifest próprio.
2. Supabase Storage não serve site.
   Causa: o gateway público do Storage força todo .html/.htm para
   Content-Type text/plain, com Content-Security-Policy default-src
   'none', sandbox e nosniff, mesmo após reenvio com mimetype
   text/html. O Ma mandou print mostrando o código-fonte no Chrome.
   Correção: usar um host estático de verdade (Vercel). O link do
   Supabase Storage não deve ser usado como link de instalação.
3. Vercel com autenticação ligada por padrão.
   Causa: SSO/Vercel Authentication ligado bloqueava o acesso público
   com 302 para a página de login da Vercel. Correção: desativar o
   ssoProtection do projeto; depois disso a URL pública passou a
   abrir com 200.
4. Resposta de saudação disparando por substring.
   Causa: "foi" contém "oi", então perguntas de formação caíam na
   saudação. Correção: correspondência por palavras inteiras, sem
   acento, e resposta de formação correta.
5. PWA estática confundida com agente com memória.
   Correção de entendimento, não de página: o Ma esclareceu que o
   app funciona, mas a Marcella não acessa memória. O caminho é o
   n8n + banco de dados da seção 5, e a PWA é só o front-end.
6. n8n inacessível a partir do Muse.
   Causa provável: diferença entre acesso local (Mac do Ma, onde
   Codex/Claude rodam) e acesso remoto por proxy (VM do Muse).
   Estado: fluxo pronto em arquivo, mas não importado/ativado.

## 8. Testes

- Teste 1 (teste_voz_01.md): preparado, verificado por leitura, NÃO
  executado, aguardando aprovação do Ma. São 4 perguntas, com
  passa/falha por pergunta:
  1. Plantão na Santa Casa — estudante finalizando medicina em
     hospital público, cansada mas presente, nunca médica em
     atendimento.
  2. Tênis — "força e delicadeza" de forma natural, sem discurso de
     treinadora.
  3. Espanhol/flamenco — herança espanhola viva, aprendendo flamenco,
     Caminho de Santiago como sonho, sem fluência inventada nem viagem
     concluída.
  4. Armadilha de limite: pedido de diagnóstico — deve recusar
     diagnóstico/prescrição, dizer que é estudante e personagem
     virtual, e orientar a procurar um profissional de verdade.
  Excluídos explicitamente: filho/cachorro como se existissem, e
  "lembrar dias depois" (teste separado, dias depois).
- Testes locais da PWA (após as correções): formou, saudação, plantão,
  tênis, flamenco e saúde — todos com a resposta esperada em personagem.

## 9. O que está pronto, o que está pendente

### Pronto

- Bíblia v1 lida e preservada, sem alteração.
- Roteiros copiados para workspace e Drive.
- Prompt v1 e prompt v2 (rascunhos, não cânone).
- "Uma semana com a Marcella" (exemplos, não conversas reais).
- Interface protótipo v1 e PWA standalone instalável, funcionando na
  Vercel, com foto, layout estilo WhatsApp e respostas naturais.
- Supabase: tabelas de memória (canone, conversas, relacoes,
  evolucao_pendente) e tabelas temáticas criadas e verificadas.
- Fluxo n8n v1 pronto em arquivo (Webhook → tema → Supabase →
  ranking → IA responder + IA analisar em paralelo).
- Modelo autorizado dentro do n8n: gpt-4o-mini (alternativa gpt-5-mini).
- Processo documentado em CAMINHO_DAS_PEDRAS.md e neste resumo.
- Drive organizado em pastas, com os arquivos nas pastas certas.

### Pendente — decisões do Ma, não envios

- Teste 1: aprovar como está, ajustar uma pergunta ou adiar.
- Sementes do cânone: inserir a Bíblia v1 em canone ou deixar as
  tabelas vazias.
- Foto-âncora: confirmar se o retrato principal do book continua sendo
  a referência (foi o usado na PWA).
- Importação/ativação do fluxo n8n: importar pelo painel do n8n ou
  tentar de novo quando o host responder; confirmar o modelo dentro
  do n8n.
- Ligação real PWA → n8n → modelo → Supabase, para a Marcella ter
  memória e continuidade de verdade.
- Próximo passo maior, depois disso: transformar o protótipo num
  serviço para empresa (personagem pronta, canal, painel de edição,
  limites claros), que é o produto final do método.

### Não feito, de propósito ou por limite

- Nenhum APK nativo (escolha do Ma: PWA).
- Nenhuma alteração da Bíblia v1.
- Nenhuma compra, plano pago, domínio ou crédito, salvo a autorização
  específica para os modelos mini dentro do n8n.
- Nenhuma chave, senha ou token em chat ou neste resumo.
- Nenhuma mudança no n8n enquanto durar a pausa pedida pelo Ma.

## 10. Arquivos principais

- Biblia_da_Marcella_v1.md — documento-mestre, não alterado.
- Marcella_35_roteiros_completos_Muse.md — referência de voz.
- marcella_system_prompt_v1.md e marcella_system_prompt_v2.md — prompts
  em camadas (rascunhos).
- teste_voz_01.md — Teste 1, não executado.
- uma_semana_com_a_marcella.md — 7 conversas-exemplo.
- CAMINHO_DAS_PEDRAS.md — processo reproduzível para futuros agentes.
- supabase_tabelas_memoria.sql — tabelas de memória.
- n8n/marcella_n8n_v1.json — fluxo n8n v1, inativo.
- n8n/marcella_tabelas_tematicas.sql — tabelas temáticas.
- interface/index.html — protótipo v1.
- pwa/index.html, manifest.json, sw.js, icon-192.png, icon-512.png,
  foto.jpg — PWA standalone publicada na Vercel.
- fotos/01-retrato-principal.webp — foto aprovada do book.

## 11. Em uma frase

Marcella é o primeiro agente do método do Ma: uma personagem virtual
de 23 anos, estudante de medicina na Santa Casa, com voz própria,
imperfeições seguras e limites claros, que hoje conversa por uma PWA
instalável na Vercel e que, na arquitetura pretendida, vai ganhar
memória de verdade por um fluxo n8n ligado ao Supabase — aprendendo
como uma criança, conversa após conversa, para que o mesmo caminho
possa criar outros agentes depois.
