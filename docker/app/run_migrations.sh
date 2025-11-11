#!/usr/bin/env sh
set -eu

cd /var/www/html

echo "[migrate] Aguardando banco de dados (PDO)..."

FIRST_RUN=$(
php -d detect_unicode=0 -r '
$h=getenv("DB_HOST") ?: "db";
$P=getenv("DB_PORT") ?: "3306";
$u=getenv("DB_USERNAME") ?: "control";
$p=getenv("DB_PASSWORD") ?: "control";
$d=getenv("DB_DATABASE") ?: "control_plus";
$max = (int)(getenv("DB_WAIT_ATTEMPTS") ?: 5);

for ($i=0; $i<$max; $i++) {
  try {
    $pdo = new PDO("mysql:host=$h;port=$P;dbname=$d;charset=utf8mb4", $u, $p, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_TIMEOUT => 2
    ]);
    fwrite(STDERR, "[migrate] DB OK\n");

    // Existe tabela migrations?
    $exists = (int)$pdo->query("
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = DATABASE() AND table_name = \"migrations\"
    ")->fetchColumn();

    if ($exists === 0) {
      echo "FIRST_RUN=1\n";
      exit(0);
    }

    // Se existe, tem linhas?
    $applied = (int)$pdo->query("SELECT COUNT(*) FROM migrations")->fetchColumn();
    echo "FIRST_RUN=" . ($applied === 0 ? "1" : "0") . "\n";
    exit(0);

  } catch (Throwable $e) {
    fwrite(STDERR, "[migrate] Aguardando DB... Tentativa ".($i+1)."/$max\n");
    sleep(1);
  }
}
fwrite(STDERR, "[migrate] ERRO: DB indisponível após $max tentativas.\n");
echo "FIRST_RUN=0\n"; // fallback defensivo
' 2> /tmp/migrate_probe.log | awk -F= '/^FIRST_RUN=/{print $2; exit}'
)

cat /tmp/migrate_probe.log

echo "[migrate] Aplicando migrations..."
php artisan migrate --force --no-interaction

if [ "${FIRST_RUN:-0}" = "1" ]; then
  echo "[seed] Primeira execução detectada — rodando seeds..."
  php artisan db:seed --force --no-interaction
  echo "[ok] Migrations + seed inicial concluídos."
else
  echo "[ok] Migrations aplicadas (sem seed)."
fi
