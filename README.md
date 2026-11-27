# Super Amigos! Catálogo Digital

Site estático (HTML) para o GitHub Pages, com banco de dados e fotos no Supabase (plano gratuito).

## Passo a passo
1. Crie uma conta em supabase.com e um projeto novo.
2. **SQL Editor** > cole o conteúdo de `supabase-setup.sql` > Run.
3. **Authentication > Users > Add user**: e-mail `funcionarios@superamigos.com` (ou outro) e a **senha-chave** que os funcionários vão digitar. Marque "Auto confirm user".
4. **Project Settings > API**: copie a *Project URL* e a chave *anon public* para o `config.js` (e ajuste o `STAFF_EMAIL`).
5. Suba `index.html` e `config.js` em um repositório no GitHub. **Settings > Pages > Deploy from branch (main)**.
6. Abra o link do Pages, clique em Funcionário, digite a senha-chave e cadastre as fotos.

## Segurança
A senha não fica no código: o login é feito pelo Supabase e as regras do banco impedem qualquer visitante de alterar o catálogo ou ver modelos indisponíveis. Para trocar a senha, edite o usuário em Authentication > Users.

## Limites conhecidos
Sem integração automática com o Google Drive (importe as fotos pelo botão de lote) e sem filtro por tamanho (use a subcategoria).
