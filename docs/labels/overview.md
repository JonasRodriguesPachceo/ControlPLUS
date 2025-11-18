# Visão Geral do Módulo de Etiquetas

## Objetivo
Impressão de etiquetas unitárias (IMEI/serial) para operações de estoque e PDV, incluindo reimpressão e monitoramento.

## Escopo
- Entrada de estoque com IMEIs.
- Reimpressão por IMEI e por venda/PDV.
- Monitoramento de fila de impressão (jobs, spool) e status de impressoras.
- Templates de layout lógicos e drivers pluggáveis.

## Glossário rápido
- **LabelPrintJob**: job de impressão de etiquetas (cabeçalho).
- **LabelPrintJobItem**: item de job, 1:1 com IMEI a imprimir.
- **PrinterSpoolItem**: item de spool pronto para envio ao driver/impressora.
- **Printer**: impressora configurada (driver + connection_config, default por filial).
- **LabelTemplate**: template lógico de layout (campos, barcode, QR).

## Fluxo alto nível
- IMEIs são criados (entrada, reentrada futura/trade-in, etc.).
- `LabelPrintQueueService` enfileira um job (`label_print_jobs` + items).
- `ProcessLabelPrintJob` gera payload (via `ImeiLabelService` + template) e cria spool (`printer_spool_items`).
- `SendPrinterSpoolItemJob` envia spool ao driver (`LabelPrinterDriverInterface`).
- Driver (dummy ou http) entrega à impressora/serviço externo.

## Tabelas envolvidas
- **label_print_jobs**: cabeçalho do job de etiquetas (status, empresa/filial, source/reprint, requested_at).
- **label_print_job_items**: itens por IMEI (status, erro).
- **printers**: impressoras configuradas (driver, connection_config, is_default, active).
- **printer_spool_items**: spool pronto para envio ao driver (payload final, status, attempts, printed_at).
- **label_templates**: templates lógicos de layout (config JSON, default por empresa/filial/tipo).
- **imei_units**: unidades rastreáveis (imei/serial) com metadados de etiqueta.
