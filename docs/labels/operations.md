# Operação e Fluxos Funcionais

## Cenários

### Entrada de estoque com IMEI
- Usuário registra entrada (form/tela de estoque).
- Sistema cria `StockMove` (entry) e `ImeiUnit` via `ImeiUnitService`.
- `LabelPrintQueueService` enfileira job de etiquetas (source=entry).
- Após salvar, a tela mostra: quantidade de IMEIs, status do job, ações de “ver detalhes” e “reenviar” se falhou.
- Operador pode acompanhar status pelo painel de jobs/spool.

### Reimpressão de etiqueta
- Em tela de IMEI/produto/PDV, botão “Reimprimir etiqueta” chama `POST /api/labels/imei/{imeiUnit}/reprint`.
- Sistema cria job (source=reprint) + item e processa como entrada normal.
- Feedback: job enfileirado, status pode ser visto no painel de jobs/spool.

### PDV / Venda
- Itens de venda com IMEI exibem lista de IMEIs.
- Ação “Reimprimir” por IMEI (ou por item, chamando múltiplos reprints) usando o endpoint de reprint.

### Gestão de impressoras
- Cadastrar impressora: definir empresa/filial, driver (dummy/http/... ), connection_config, code, name, active, is_default.
- Apenas uma impressora default por filial/empresa para etiquetas IMEI.
- Se desativar default, configurar outra como default para evitar falhas.

### Monitoramento
- Painel simples consumindo `/api/labels/print-jobs` e `/api/printing/spool-items`:
  - Filtrar por status (pending/processing/done/failed), período, filial.
  - Ver detalhes do job e itens; retry de job/item failed.
- Relatórios:
  - Volume por dia, por impressora.
  - Reimpressões por usuário (source=reprint).

## FAQ Operacional
- **Job failed, o que fazer?**: Use retry no job ou, se a falha for de spool, retry no item de spool. Verifique impressora/driver/endpoint.
- **Job done, mas sem impressão física**: Conferir impressora padrão, driver (dummy vs http), serviço externo de impressão, status do spool (printed vs failed).
- **Reimpressões excessivas**: Consulte user-reprints report para identificar usuários que mais reimprimem.
