#!/usr/bin/env bash
set -euo pipefail
APP_DIR=${1:-/var/www/html}

echo ">> Ajustando grupo www e permissões em: ${APP_DIR}"
chown -R ${PUID:-1000}:${PGID:-1000} "${APP_DIR}"
chgrp -R www "${APP_DIR}" || true
find "${APP_DIR}" -type d -exec chmod 2775 {} \;
find "${APP_DIR}" -type f -exec chmod 0664 {} \;

mkdir -p "${APP_DIR}/storage" "${APP_DIR}/bootstrap/cache"
chmod -R 2775 "${APP_DIR}/storage" "${APP_DIR}/bootstrap/cache"
setfacl -Rm g:www:rwx "${APP_DIR}/storage" "${APP_DIR}/bootstrap/cache" || true

echo ">> OK"
