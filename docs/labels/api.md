# API de Etiquetas e Impressão

> Autenticação: rotas protegidas por auth padrão do projeto (ex.: auth:sanctum). Autorizações conforme policies/roles já existentes (estoque/retaguarda).

## Reimpressão por IMEI
- **POST** `/api/labels/imei/{imeiUnit}/reprint`
  - Aciona enfileiramento de etiqueta para o IMEI.
  - Resposta: `{ "data": { "job_id": ..., "status": "pending" } }`

## Jobs de impressão
- **GET** `/api/labels/print-jobs`
  - Query: `status`, `type`, `empresa_id`, `filial_id`, `from`, `to`, `requested_by`, `imei`, `per_page`.
  - Retorna coleção `LabelPrintJobResource`.
- **GET** `/api/labels/print-jobs/{job}`
  - Retorna job com items (se carregados).
- **POST** `/api/labels/print-jobs/{job}/retry`
  - Requeue do job (reset para pending) e redispatch de processamento.
  - Resposta: `LabelPrintJobResource`.
- **GET** `/api/labels/print-jobs/{job}/items`
  - Query: `status`, `imei`, `per_page`.
  - Retorna coleção `LabelPrintJobItemResource`.

## Spool
- **GET** `/api/printing/spool-items`
  - Query: `status`, `printer_id`, `empresa_id`, `from`, `to`, `imei`, `per_page`.
  - Retorna coleção `PrinterSpoolItemResource`.
- **GET** `/api/printing/spool-items/{spoolItem}`
  - Detalhe do spool item (printer, imei, job item).
- **POST** `/api/printing/spool-items/{spoolItem}/retry`
  - Reenvia item com status failed.

## Impressoras (CRUD)
- **GET** `/api/printing/printers`
  - Query: `active`, `driver`, `empresa_id`, `filial_id`, `per_page`.
- **POST** `/api/printing/printers`
  - Body: `empresa_id`, `localizacao_id` (filial), `name`, `code`, `driver`, `connection_config`, `is_default`, `active`.
- **GET** `/api/printing/printers/{printer}`
- **PUT/PATCH** `/api/printing/printers/{printer}`
  - Body similar ao POST (campos opcionais).
- **DELETE** `/api/printing/printers/{printer}`
  - Desativa (active=false, is_default=false).
  - Retorna `PrinterResource`.

## Templates
- **GET** `/api/labels/templates`
  - Query: `empresa_id`, `filial_id`, `type`, `active`, `per_page`.
- **POST** `/api/labels/templates/{template}/set-default`
  - Define template default para (empresa, filial, type), limpando outros defaults.

## Relatórios
- **GET** `/api/reports/labels/printing/summary-by-day`
  - Query: `empresa_id`, `filial_id`, `from`, `to`.
  - Retorna array de agregados diários com métricas de jobs e items.
- **GET** `/api/reports/labels/printing/summary-by-printer`
  - Query: `empresa_id`, `filial_id`, `from`, `to`, `printer_id`.
  - Métricas por impressora (spool_count/printed/failed, avg_attempts, last_printed_at).
- **GET** `/api/reports/labels/printing/user-reprints`
  - Query: `empresa_id`, `filial_id`, `from`, `to`, `user_id`.
  - Total de reimpressões por usuário (source=reprint).

> Note: As respostas de Resources seguem o padrão JSON do Laravel (data, pagination). Usar `per_page` e `page` para paginação.
