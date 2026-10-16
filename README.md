# III COPA NADA VAI NOS SEPARAR — site + banco de dados no GitHub

O sistema é um arquivo só (`index.html`) + a tela de apresentação (`inicio.html`).
**Não precisa de servidor ligado**: o banco de dados é um arquivo `dados.json` dentro do
seu repositório do GitHub, lido e gravado direto pelo site.

## Como funciona (recomendado)
- **Banco de dados** = arquivo `dados.json` na raiz do repositório (inscritos, grupos, placares, mesas, cards, banner, logo).
- **Visitantes**: abrem o site publicado e já veem os dados (o site faz a leitura sozinho).
- **Admin**: entra com a senha e clica **Publicar agora** (ou deixa publicar sozinho, 12s após cada alteração) usando um **token** do GitHub guardado só no navegador dele.
- Cada publicação vira uma **versão no histórico do repositório** → backup automático e de graça.

## Passo a passo (1 vez)

### 1. Criar o repositório
Crie um repositório **público** no GitHub (ex.: `copa-nada-vai-nos-separar`) e envie para ele
(Upload files):
- `index.html`
- `inicio.html`
- `banner.jpg` e `logo.png` (opcional, aparecem para todo mundo)
- a pasta `server/` (opcional — só se quiser servidor próprio)

### 2. Ligar o GitHub Pages
Repositório → **Settings** → **Pages** → Source: *Deploy from a branch* → branch **main**, pasta **/ (root)** → Save.
Endereço: `https://SEU-USUARIO.github.io/NOME-DO-REPO/` (apresentação em `.../inicio.html`).

### 3. Criar o token (só o admin precisa)
1. github.com → sua foto → **Settings** → **Developer settings**
2. **Personal access tokens** → **Fine-grained tokens** → *Generate new token*
3. **Repository access**: *Only select repositories* → escolha o repositório da copa
4. **Permissions** → Repository permissions → **Contents: Read and write**
5. *Generate token* e copie (aparece uma vez só)

### 4. Publicar os dados
No site, entre como admin → aba **Banco / Online** → seção **Banco online — GitHub**:
- Repositório: `SEU-USUARIO/NOME-DO-REPO` (ou cole o link)
- Branch: `main` • Arquivo: `dados.json`
- Token: cole o token → **Salvar** → **Publicar agora ⬆**

Pronto: o arquivo `dados.json` é criado no repositório e todo mundo passa a ver os mesmos dados.
Se o navegador do admin perder tudo, basta **Baixar do GitHub ⬇**.

> Dica: no site publicado (`SEU-USUARIO.github.io/NOME-DO-REPO`) o repositório é detectado
> automaticamente — os visitantes não configuram nada.

## Segurança
- Leitura: pública (o repositório precisa ser público para os visitantes lerem).
- Escrita: só com o token, que fica apenas no navegador do admin (não vai para o site).
- A senha de admin continua sendo um hash SHA-256 local, usada para liberar as telas de edição.

## Backups extras (aba Banco / Online)
- Últimos 5 backups automáticos no navegador (sem imagens).
- **Exportar / Importar JSON** para guardar um arquivo de verdade.
- Histórico de commits do GitHub = backup completo de todas as publicações.

## Servidor próprio (opcional)
A pasta `server/` tem uma alternativa com Node/Express (`GET/PUT /api/state`, banco `db.json`).
Útil para rodar local: `cd server` → `npm install` → `node server.js` (abra `http://localhost:3000/`).
No Windows, clique duplo em `ligar.bat` (sobe já com a senha do admin configurada).
- `GET /api/state` → público.
- `PUT /api/state` → exige o cabeçalho `x-admin-hash` igual ao env `ADMIN_HASH`.
