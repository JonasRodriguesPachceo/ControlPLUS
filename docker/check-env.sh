#!/usr/bin/env bash
set -eo pipefail

ENV_FILE="/var/www/html/.env"

if [ ! -f "$ENV_FILE" ]; then
    echo "Arquivo .env não encontrado. Crie um .env baseado em .env.example."
    exit 1
fi

REQUIRED_VARS=(
    APP_ENV
    APP_KEY
    DB_HOST
    DB_DATABASE
    DB_USERNAME
    DB_PASSWORD
)

MISSING_VARS=()

for VAR in "${REQUIRED_VARS[@]}"; do
    VALUE="${!VAR:-}"
    if [ -z "$VALUE" ]; then
        MISSING_VARS+=("$VAR")
    fi
done

if [ "${#MISSING_VARS[@]}" -ne 0 ]; then
    echo "Variáveis obrigatórias ausentes no ambiente: ${MISSING_VARS[*]}"
    exit 1
fi

exec "$@"
