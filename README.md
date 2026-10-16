# III COPA NADA VAI NOS SEPARAR — banco + online

## Hoje (local)
Tudo fica em `index.html` → `localStorage` (1 objeto JSON) + backups automáticos (últimos 5, aba **Banco / Online**).
- Admin: edita times, placares, mesas, banner/logo.
- Visitante: só vê.

## Exportar / importar
Aba **Banco / Online** → Exportar JSON (leva o arquivo) / Importar JSON (traz de volta).

## Publicar online (participantes veem, admin edita)
1. `cd server && npm install`
2. Descubra seu hash: abra o `index.html`, defina a senha de admin, aperte F12 e digite `localStorage.getItem("copa3_admin_hash")`.
3. Inicie com `ADMIN_HASH=<hash> npm start` (ou crie `.env`).
4. Teste: `GET http://localhost:3000/api/state` (público).
5. Na página, aba Banco/Online, cole `http://localhost:3000` e clique **Publicar agora**.
6. Deploy (Render/Railway/Fly): suba a pasta, configure env `ADMIN_HASH` + comando `npm start`. Cole a URL pública na página.

## Regras do servidor (`server/server.js`)
- `GET /api/state` → público, sem senha (torcida acompanha).
- `PUT /api/state` → exige cabeçalho `x-admin-hash` igual ao `ADMIN_HASH` (só quem sabe a senha publica).
- Banco = `server/db.json` (1 JSON, mesmo formato do navegador). Para escalar, troque `readDb/writeDb` por SQLite/Postgres.
