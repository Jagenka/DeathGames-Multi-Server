MOD_URL=$(curl -s https://api.github.com/repos/Jagenka/deathgames-server-mod/releases/latest \
  | jq -r '.assets[] | select(.name | test("^deathgames-server-mod-.*\\.jar$") and (test("-all") | not)) | .browser_download_url')

sed -i "s|^MOD_URL=.*|MOD_URL=${MOD_URL}|" .env
docker compose up -d