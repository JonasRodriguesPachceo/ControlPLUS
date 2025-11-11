#!/usr/bin/env sh
set -eu

cd /var/www/html

echo "[migrate] Aguardando banco de dados (PDO)..."
php -r '
$h=getenv("DB_HOST") ?: "db";
$P=getenv("DB_PORT") ?: "3306";
$u=getenv("DB_USERNAME") ?: "control";
$p=getenv("DB_PASSWORD") ?: "control";
$d=getenv("DB_DATABASE") ?: "control_plus";

for ($i=0; $i<5; $i++) {
  try {
    $pdo = new PDO("mysql:host=$h;port=$P;dbname=$d;charset=utf8mb4", $u, $p, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_TIMEOUT => 2
    ]);
    echo "[migrate] DB OK\n";
    // Detecta primeira execução:
    // 1) se NÃO existe tabela migrations -> primeira vez
    // 2) se existe mas tem 0 linhas -> primeira vez
    $exists = (int)$pdo->query("
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = DATABASE() AND table_name = 'migrations'
    ")->fetchColumn();

    if ($exists === 0) {
      echo "FIRST_RUN=1\n";
      exit(0);
    }

    $applied = (int)$pdo->query("SELECT COUNT(*) FROM migrations")->fetchColumn();
    echo "FIRST_RUN=" . ($applied === 0 ? "1" : "0") . "\n";
    exit(0);
  } catch (Throwable $e) {
    echo "[migrate] Aguardando DB... Tentativa ".($i+1)."/5\n";
    sleep(1);
  }
}
fwrite(STDERR, "[migrate] ERRO: DB indisponível mesmo após tentativas.\n");
exit(1);
' | tee /tmp/migrate_probe.out >/dev/null

FIRST_RUN=$(grep -oE 'FIRST_RUN=[01]' /tmp/migrate_probe.out | cut -d= -f2 || echo 0)

echo "[migrate] Aplicando migrations..."
php artisan migrate --force --no-interaction

if [ "$FIRST_RUN" = "1" ]; then
  echo "[seed] Primeira execução detectada — rodando seeds..."
  php artisan db:seed --force --no-interaction
  echo "[ok] Migrations + seed inicial concluídos."
else
  echo "[ok] Migrations aplicadas (sem seed)."
fi
