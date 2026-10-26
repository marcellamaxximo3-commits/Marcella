-- Supabase — memória da Marcella
-- Projeto: dwranvdgnznmkwnulbjr (URL já conhecida; nenhuma chave neste arquivo)
-- Como usar: colar no SQL Editor do Supabase e rodar. Não colar chave aqui.
-- Depois de rodar, avisar a Rumi para ela confirmar se as 3 tabelas aparecem na leitura.
--
-- Desenho (do CAMINHO_DAS_PEDRAS.md, passo 6):
--   canone    = biografia travada (não muda sem decisão consciente)
--   conversas = o que já foi conversado, para retomar depois
--   relacoes  = o que a agente aprendeu com cada pessoa
--   evolucao_pendente (extra, opcional) = diário de novidades que SÓ vira
--     parte definitiva com aprovação do Marcos — nunca direto no canone.

-- 1) Cânone / vida travada
create table if not exists canone (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  categoria text not null default 'vida',
  -- sugestões: vida, voz, limites, aparencia
  travado boolean not null default true,
  fonte text not null default 'Biblia_da_Marcella_v1',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 2) Conversas (memória de relação + memória emocional)
create table if not exists conversas (
  id uuid primary key default gen_random_uuid(),
  pessoa text not null default 'Marcos',
  tema text,
  resumo text not null,
  tom_emocional text,
  -- ex.: orgulho, saudade, cansaço de plantão — não só o fato, mas o tom
  aprendido text,
  data_conversa date not null default current_date,
  created_at timestamptz not null default now()
);

-- 3) Relações (uma linha por pessoa)
create table if not exists relacoes (
  id uuid primary key default gen_random_uuid(),
  pessoa text not null unique,
  o_que_aprendeu text,
  ultimo_tema text,
  ultima_conversa timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 4) Evolução pendente — opcional, mas recomendado.
-- Nada aqui altera o canone sozinho; vira definitivo só após aprovação.
create table if not exists evolucao_pendente (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  conteudo text not null,
  origem_conversa_id uuid references conversas (id),
  status text not null default 'pendente',
  -- pendente | aprovado | rejeitado
  created_at timestamptz not null default now()
);

-- Índices úteis para retomar conversa depois
create index if not exists idx_conversas_pessoa_data
  on conversas (pessoa, data_conversa desc);
create index if not exists idx_conversas_tema
  on conversas (tema);

-- Sementes da Bíblia v1 — OPCIONAL.
-- Descomentar só se quiser já deixar o cânone inicial gravado.
-- São fatos da Biblia_da_Marcella_v1.md, não invenções novas.
-- insert into canone (chave, titulo, conteudo, categoria) values
--   ('nome', 'Nome', 'Marcella Maxxima', 'vida'),
--   ('idade', 'Idade', '23 anos', 'vida'),
--   ('cidade', 'Cidade', 'São Paulo/SP', 'vida'),
--   ('ocupacao', 'Ocupação na narrativa', 'Estudante de medicina, finalizando o curso na Santa Casa de SP, com plantões em hospital público', 'vida'),
--   ('hobby', 'Hobby-assinatura', 'Tênis — “força e delicadeza”', 'vida'),
--   ('limite_saude', 'Limite: saúde', 'Conteúdo de medicina é educativo e de bastidores de estudante. Nunca diagnóstico, prescrição ou atendimento a seguidores.', 'limites'),
--   ('limite_transparencia', 'Limite: transparência', 'Marcella é uma influenciadora virtual; não se apresentar como médica de verdade em atendimento.', 'limites')
-- on conflict (chave) do nothing;
