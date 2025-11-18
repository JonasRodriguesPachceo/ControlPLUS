# Arquitetura Técnica do Módulo de Etiquetas

## Classes principais

### Services
- **ImeiLabelService**: gera payload base e payload formatado (template) para IMEI.
- **LabelPrintQueueService**: cria `label_print_jobs`/items, requeue, status.
- **LabelPrintSpoolService**: cria spool (`printer_spool_items`), resolve impressora padrão, envia ao driver, atualiza status.
- **LabelTemplateResolverService**: encontra template padrão (empresa/filial/tipo).
- **LabelTemplateFormatterService**: aplica template ao payload base e retorna layout final.
- **LabelPrinterDriverFactory**: resolve driver por impressora/default.
- **PrinterResolverService**: resolve impressora padrão por empresa/filial.
- **LabelPrintingReportService**: métricas agregadas (por dia, impressora, reprints).

### Jobs
- **ProcessLabelPrintJob**: processa items pendentes do job, gera payload formatado, cria spool.
- **SendPrinterSpoolItemJob**: envia item de spool ao driver e atualiza status.

### Models
- **LabelPrintJob**, **LabelPrintJobItem**.
- **Printer**, **PrinterSpoolItem**.
- **LabelTemplate**.
- **ImeiUnit** (IMEI/serial, metadados de etiqueta).

### Contracts / Drivers
- **LabelPrinterDriverInterface**.
- **DummyLabelPrinterDriver**, **HttpLabelPrinterDriver** (drivers reais adicionais podem ser plugados).

## Relacionamentos
- LabelPrintJob 1:N LabelPrintJobItem.
- LabelPrintJobItem 1:1 PrinterSpoolItem.
- PrinterSpoolItem N:1 Printer.
- LabelPrintJobItem N:1 ImeiUnit.

## Fluxos (pseudo-sequência)

### Entrada de Estoque → Impressão
```
StockEntryService
  -> ImeiUnitService::createManyForEntry
  -> LabelPrintQueueService::enqueueForImeis
      -> cria LabelPrintJob + LabelPrintJobItems
      -> dispatch(ProcessLabelPrintJob)
ProcessLabelPrintJob
  -> ImeiLabelService (+ TemplateResolver/Formatter)
  -> LabelPrintSpoolService::queueFromLabelPayload
      -> cria PrinterSpoolItem
      -> dispatch(SendPrinterSpoolItemJob)
SendPrinterSpoolItemJob
  -> LabelPrintSpoolService::sendToPrinter
      -> LabelPrinterDriverFactory::makeForPrinter
      -> Driver (ex.: HttpLabelPrinterDriver)
      -> Atualiza status do PrinterSpoolItem
```

### Reimpressão
```
Controller/UX (reprint IMEI)
  -> LabelPrintQueueService::enqueueSingleLabel
      -> cria LabelPrintJob (source=reprint) + item
      -> dispatch(ProcessLabelPrintJob)
... fluxo idêntico ao acima para spool/driver
```
