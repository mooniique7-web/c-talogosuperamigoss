-- Cole tudo isto em Supabase > SQL Editor > Run (uma vez só).
create table if not exists cats(
  id text primary key, name text not null, sub text default '', emoji text default '', img text default '', ord bigint default 0);
create table if not exists models(
  id text primary key, name text not null, cat text, sub text default '', style text default '',
  photos text[] default '{}', avail boolean default true, created bigint default 0);

alter table cats enable row level security;
alter table models enable row level security;

-- Clientes (anônimos): veem categorias e só modelos disponíveis
create policy "cats_ler" on cats for select using (true);
create policy "models_ler_publico" on models for select using (avail = true or auth.role() = 'authenticated');
-- Funcionário (logado): altera tudo
create policy "cats_editar" on cats for all to authenticated using (true) with check (true);
create policy "models_editar" on models for all to authenticated using (true) with check (true);

-- Bucket público de fotos
insert into storage.buckets(id,name,public) values('fotos','fotos',true) on conflict do nothing;
create policy "fotos_ler" on storage.objects for select using (bucket_id='fotos');
create policy "fotos_enviar" on storage.objects for insert to authenticated with check (bucket_id='fotos');
create policy "fotos_apagar" on storage.objects for delete to authenticated using (bucket_id='fotos');

-- Categorias iniciais
insert into cats(id,name,sub,emoji,ord) values
('adulto','Adulto','','😎',1),('extra','Extra','G1, G2 e G3','🧔',2),('oversized','Oversized','M, G e GG','🧢',3),
('infantil','Infantil','2 ao 10','😄',4),('juvenil','Juvenil','12 ao 16','🎧',5),('polo','Polo','','😊',6),
('regata','Regata','','💪',7),('baby','Baby','','👶',8) on conflict do nothing;
