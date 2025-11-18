# Extensibilidade e Futuro

## Novos tipos de etiqueta
- `label_print_jobs.type` é genérico (atual: imei_label).
- Para novos tipos (ex.: etiquetas de prateleira, caixa, trade-in/recondicionado):
  - Criar templates `LabelTemplate` com `type` correspondente.
  - Ajustar service/origem para enfileirar jobs com `type` apropriado (reutilizando LabelPrintQueueService).
  - Implementar formatter/resolver específicos, se necessário, ou reusar o atual.

## Novos drivers
- Implementar `LabelPrinterDriverInterface`.
- Registrar no `config/printing.php` em `drivers`.
- Configurar `Printer->driver` para o driver novo (ex.: zpl_tcp, escpos_tcp).
- `LabelPrinterDriverFactory` resolverá o driver por impressora/default.

## Integração com Trade-in / OS
- Reutilizar pipeline:
  - `LabelPrintQueueService` para enfileirar IMEIs ou unidades geradas em trade-in/recondicionamento.
  - `LabelPrintSpoolService` e drivers já prontos para envio.
  - Templates: criar `type` específico (ex.: tradein_label) e associar aos templates novos.
- Hooks atuais (entrada/IMEI creation) podem ser replicados no fluxo de OS interna para gerar etiquetas quando apropriado.

## Templates
- Estrutura de config flexível (fields/barcode/qr/options). Novos campos podem ser adicionados ao formatter/resolver conforme surgirem necessidades de layout.
- Para novos tipos, criar templates por empresa/filial e definir default (set-default).

## Observações
- Contratos e services foram desenhados para serem pluggáveis: drivers podem ser trocados/configurados por impressora; tipos/templates podem ser expandidos sem alterar o core do fluxo.
