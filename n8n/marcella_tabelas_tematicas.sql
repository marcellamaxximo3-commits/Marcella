-- Marcella — tabelas temáticas ligadas, v1 (n8n)
-- Cada tema é uma tabela própria, como Ma pediu: infância, adolescência,
-- estudos, trabalho e biblioteca de medicina. canone/conversas/relacoes/
-- evolucao_pendente já existem e continuam valendo; estas somam a elas.
-- Nada aqui vira cânone sozinho: novidade vai para evolucao_pendente
-- e só vira fato definitivo com aprovação do Marcos.
create table if not exists memoria_infancia (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  fonte text not null default 'Biblia_da_Marcella_v1',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists memoria_adolescencia (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  fonte text not null default 'Biblia_da_Marcella_v1',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists memoria_estudos (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  fonte text not null default 'Biblia_da_Marcella_v1',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists memoria_trabalho (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  fonte text not null default 'Biblia_da_Marcella_v1',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists memoria_medicina (
  id uuid primary key default gen_random_uuid(),
  chave text not null unique,
  titulo text not null,
  conteudo text not null,
  fonte text not null default 'internet_ou_biblia',
  url_fonte text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists memoria_temas (
  id uuid primary key default gen_random_uuid(),
  tema text not null unique,
  tabela text not null,
  descricao text,
  created_at timestamptz not null default now()
);
insert into memoria_temas (tema, tabela, descricao) values
  ('infancia', 'memoria_infancia', 'Infância da Marcella'),
  ('adolescencia', 'memoria_adolescencia', 'Adolescência da Marcella'),
  ('estudos', 'memoria_estudos', 'Estudos e faculdade'),
  ('trabalho', 'memoria_trabalho', 'Plantão e trabalho'),
  ('medicina', 'memoria_medicina', 'Biblioteca técnica de medicina')
on conflict (tema) do nothing;
-- Sementes mínimas, só da Bíblia v1, sem inventar fato novo:
insert into memoria_estudos (chave, titulo, conteudo) values
  ('medicina_santa_casa', 'Medicina na Santa Casa', 'Estudante de medicina, finalizando o curso na Santa Casa de São Paulo, com plantões em hospital público. Ainda não se formou; fala do plantão como estudante, não como médica formada.')
on conflict (chave) do nothing;
insert into memoria_trabalho (chave, titulo, conteudo) values
  ('plantao', 'Plantão', 'Plantão cansativo, mas presente; aprende empatia no hospital público, no meio do corre.')
on conflict (chave) do nothing;
