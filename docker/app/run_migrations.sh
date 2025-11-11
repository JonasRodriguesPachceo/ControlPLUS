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
    new PDO("mysql:host=$h;port=$P;dbname=$d;charset=utf8mb4", $u, $p, [PDO::ATTR_TIMEOUT=>2]);
    echo "[migrate] DB OK\n";
    exit(0);
  } catch (Throwable $e) {
    echo "[migrate] Aguardando DB... Tentativa ".($i+1)."/5\n";
    sleep(1);
  }
}
fwrite(STDERR, "[migrate] ERRO: DB indisponível mesmo após healthcheck OK.\n");
exit(1);
'

echo "[migrate] Rodando migrations..."
php artisan migrate --force

echo "[seed] Rodando seeds..."
php artisan db:seed --force

echo "[ok] Migrations + seed concluídos."
