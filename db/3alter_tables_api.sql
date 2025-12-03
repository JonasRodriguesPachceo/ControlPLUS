SET FOREIGN_KEY_CHECKS = 0;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_delivery decimal(12,4);',
            'ALTER TABLE produtos ADD COLUMN valor_delivery decimal(12,4);'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tempo_preparo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tempo_preparo integer default null;',
            'ALTER TABLE produtos ADD COLUMN tempo_preparo integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'referencia'
            ),
            'ALTER TABLE produtos MODIFY COLUMN referencia varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN referencia varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'adRemICMSRet'
            ),
            'ALTER TABLE produtos MODIFY COLUMN adRemICMSRet decimal(10,4) default 0;',
            'ALTER TABLE produtos ADD COLUMN adRemICMSRet decimal(10,4) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pBio'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pBio decimal(10,4) default 0;',
            'ALTER TABLE produtos ADD COLUMN pBio decimal(10,4) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tipo_servico'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tipo_servico boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN tipo_servico boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN delivery boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN delivery boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'cUFOrig'
            ),
            'ALTER TABLE produtos MODIFY COLUMN cUFOrig varchar(2) default null;',
            'ALTER TABLE produtos ADD COLUMN cUFOrig varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pOrig'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pOrig decimal(5,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN pOrig decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'indImport'
            ),
            'ALTER TABLE produtos MODIFY COLUMN indImport integer default 0;',
            'ALTER TABLE produtos ADD COLUMN indImport integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'codigo_anp'
            ),
            'ALTER TABLE produtos MODIFY COLUMN codigo_anp varchar(10) default null;',
            'ALTER TABLE produtos ADD COLUMN codigo_anp varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_glp'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_glp decimal(5,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_glp decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_gnn'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_gnn decimal(5,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_gnn decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_gni'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_gni decimal(5,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_gni decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_partida'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_partida decimal(10, 2) default 0;',
            'ALTER TABLE produtos ADD COLUMN valor_partida decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'unidade_tributavel'
            ),
            'ALTER TABLE produtos MODIFY COLUMN unidade_tributavel varchar(4) default \'\';',
            'ALTER TABLE produtos ADD COLUMN unidade_tributavel varchar(4) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'quantidade_tributavel'
            ),
            'ALTER TABLE produtos MODIFY COLUMN quantidade_tributavel decimal(10, 2) default 0;',
            'ALTER TABLE produtos ADD COLUMN quantidade_tributavel decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'composto'
            ),
            'ALTER TABLE produtos MODIFY COLUMN composto boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN composto boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'estoque_minimo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN estoque_minimo decimal(5, 2) default 0;',
            'ALTER TABLE produtos ADD COLUMN estoque_minimo decimal(5, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'alerta_validade'
            ),
            'ALTER TABLE produtos MODIFY COLUMN alerta_validade varchar(255) default \'\';',
            'ALTER TABLE produtos ADD COLUMN alerta_validade varchar(255) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'referencia_balanca'
            ),
            'ALTER TABLE produtos MODIFY COLUMN referencia_balanca integer default null;',
            'ALTER TABLE produtos ADD COLUMN referencia_balanca integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'variacao_modelo_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN variacao_modelo_id integer default null;',
            'ALTER TABLE produtos ADD COLUMN variacao_modelo_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'cfop_entrada_estadual'
            ),
            'ALTER TABLE produtos MODIFY COLUMN cfop_entrada_estadual varchar(4) default null;',
            'ALTER TABLE produtos ADD COLUMN cfop_entrada_estadual varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'cfop_entrada_outro_estado'
            ),
            'ALTER TABLE produtos MODIFY COLUMN cfop_entrada_outro_estado varchar(4) default null;',
            'ALTER TABLE produtos ADD COLUMN cfop_entrada_outro_estado varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'sidebar_active'
            ),
            'ALTER TABLE users MODIFY COLUMN sidebar_active boolean default 1;',
            'ALTER TABLE users ADD COLUMN sidebar_active boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'notificacao_cardapio'
            ),
            'ALTER TABLE users MODIFY COLUMN notificacao_cardapio boolean default 0;',
            'ALTER TABLE users ADD COLUMN notificacao_cardapio boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'notificacao_marketplace'
            ),
            'ALTER TABLE users MODIFY COLUMN notificacao_marketplace boolean default 0;',
            'ALTER TABLE users ADD COLUMN notificacao_marketplace boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'tipo_contador'
            ),
            'ALTER TABLE users MODIFY COLUMN tipo_contador boolean default 0;',
            'ALTER TABLE users ADD COLUMN tipo_contador boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'logo'
            ),
            'ALTER TABLE empresas MODIFY COLUMN logo varchar(100) default null;',
            'ALTER TABLE empresas ADD COLUMN logo varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'tipo_contador'
            ),
            'ALTER TABLE empresas MODIFY COLUMN tipo_contador boolean default 0;',
            'ALTER TABLE empresas ADD COLUMN tipo_contador boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'exclusao_icms_pis_cofins'
            ),
            'ALTER TABLE empresas MODIFY COLUMN exclusao_icms_pis_cofins boolean default 0;',
            'ALTER TABLE empresas ADD COLUMN exclusao_icms_pis_cofins boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'limite_cadastro_empresas'
            ),
            'ALTER TABLE empresas MODIFY COLUMN limite_cadastro_empresas integer default 0;',
            'ALTER TABLE empresas ADD COLUMN limite_cadastro_empresas integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'percentual_comissao'
            ),
            'ALTER TABLE empresas MODIFY COLUMN percentual_comissao decimal(10,2) default 0;',
            'ALTER TABLE empresas ADD COLUMN percentual_comissao decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'empresa_selecionada'
            ),
            'ALTER TABLE empresas MODIFY COLUMN empresa_selecionada integer default null;',
            'ALTER TABLE empresas ADD COLUMN empresa_selecionada integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'tipo_pizza'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN tipo_pizza boolean default 0;',
            'ALTER TABLE categoria_produtos ADD COLUMN tipo_pizza boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'delivery'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN delivery boolean default 0;',
            'ALTER TABLE categoria_produtos ADD COLUMN delivery boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'codigo_beneficio_fiscal'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN codigo_beneficio_fiscal varchar(10) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN codigo_beneficio_fiscal varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'cfop_entrada_estadual'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN cfop_entrada_estadual varchar(4) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN cfop_entrada_estadual varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'cfop_entrada_outro_estado'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN cfop_entrada_outro_estado varchar(4) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN cfop_entrada_outro_estado varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'padrao'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN padrao boolean default 0;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN padrao boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'data_fechamento'
            ),
            'ALTER TABLE caixas MODIFY COLUMN data_fechamento timestamp default null;',
            'ALTER TABLE caixas ADD COLUMN data_fechamento timestamp default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'valor_fechamento'
            ),
            'ALTER TABLE caixas MODIFY COLUMN valor_fechamento decimal(10,2) default 0;',
            'ALTER TABLE caixas ADD COLUMN valor_fechamento decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'valor_dinheiro'
            ),
            'ALTER TABLE caixas MODIFY COLUMN valor_dinheiro decimal(10,2) default 0;',
            'ALTER TABLE caixas ADD COLUMN valor_dinheiro decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'valor_cheque'
            ),
            'ALTER TABLE caixas MODIFY COLUMN valor_cheque decimal(10,2) default 0;',
            'ALTER TABLE caixas ADD COLUMN valor_cheque decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'valor_outros'
            ),
            'ALTER TABLE caixas MODIFY COLUMN valor_outros decimal(10,2) default 0;',
            'ALTER TABLE caixas ADD COLUMN valor_outros decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'modulos'
            ),
            'ALTER TABLE planos MODIFY COLUMN modulos text;',
            'ALTER TABLE planos ADD COLUMN modulos text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'visivel_contadores'
            ),
            'ALTER TABLE planos MODIFY COLUMN visivel_contadores boolean default 0;',
            'ALTER TABLE planos ADD COLUMN visivel_contadores boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'senha'
            ),
            'ALTER TABLE clientes MODIFY COLUMN senha varchar(200) default null;',
            'ALTER TABLE clientes ADD COLUMN senha varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'token'
            ),
            'ALTER TABLE clientes MODIFY COLUMN token integer default null;',
            'ALTER TABLE clientes ADD COLUMN token integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'valor_cashback'
            ),
            'ALTER TABLE clientes MODIFY COLUMN valor_cashback decimal(10,2) default 0;',
            'ALTER TABLE clientes ADD COLUMN valor_cashback decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'orcamento'
            ),
            'ALTER TABLE nves MODIFY COLUMN orcamento boolean default 0;',
            'ALTER TABLE nves ADD COLUMN orcamento boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'ref_orcamento'
            ),
            'ALTER TABLE nves MODIFY COLUMN ref_orcamento integer default null;',
            'ALTER TABLE nves ADD COLUMN ref_orcamento integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'data_emissao_saida'
            ),
            'ALTER TABLE nves MODIFY COLUMN data_emissao_saida date default null;',
            'ALTER TABLE nves ADD COLUMN data_emissao_saida date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'data_emissao_retroativa'
            ),
            'ALTER TABLE nves MODIFY COLUMN data_emissao_retroativa date default null;',
            'ALTER TABLE nves ADD COLUMN data_emissao_retroativa date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'bandeira_cartao'
            ),
            'ALTER TABLE nves MODIFY COLUMN bandeira_cartao varchar(2) default null;',
            'ALTER TABLE nves ADD COLUMN bandeira_cartao varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'cnpj_cartao'
            ),
            'ALTER TABLE nves MODIFY COLUMN cnpj_cartao varchar(18) default null;',
            'ALTER TABLE nves ADD COLUMN cnpj_cartao varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'cAut_cartao'
            ),
            'ALTER TABLE nves MODIFY COLUMN cAut_cartao varchar(18) default null;',
            'ALTER TABLE nves ADD COLUMN cAut_cartao varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'tipo_pagamento'
            ),
            'ALTER TABLE nves MODIFY COLUMN tipo_pagamento varchar(2) default \'\';',
            'ALTER TABLE nves ADD COLUMN tipo_pagamento varchar(2) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'bandeira_cartao'
            ),
            'ALTER TABLE nfces MODIFY COLUMN bandeira_cartao varchar(2) default 99;',
            'ALTER TABLE nfces ADD COLUMN bandeira_cartao varchar(2) default 99;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'cnpj_cartao'
            ),
            'ALTER TABLE nfces MODIFY COLUMN cnpj_cartao varchar(18) default null;',
            'ALTER TABLE nfces ADD COLUMN cnpj_cartao varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'cAut_cartao'
            ),
            'ALTER TABLE nfces MODIFY COLUMN cAut_cartao varchar(18) default null;',
            'ALTER TABLE nfces ADD COLUMN cAut_cartao varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'gerar_conta_receber'
            ),
            'ALTER TABLE nfces MODIFY COLUMN gerar_conta_receber boolean default 0;',
            'ALTER TABLE nfces ADD COLUMN gerar_conta_receber boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'valor_cashback'
            ),
            'ALTER TABLE nfces MODIFY COLUMN valor_cashback decimal(10,2) default null;',
            'ALTER TABLE nfces ADD COLUMN valor_cashback decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'lote'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN lote varchar(30) default null;',
            'ALTER TABLE item_nves ADD COLUMN lote varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'data_vencimento'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN data_vencimento date default null;',
            'ALTER TABLE item_nves ADD COLUMN data_vencimento date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'variacao_id'
            ),
            'ALTER TABLE item_pre_vendas MODIFY COLUMN variacao_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_pre_vendas ADD COLUMN variacao_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nfces'
                  AND COLUMN_NAME = 'codigo_beneficio_fiscal'
            ),
            'ALTER TABLE item_nfces MODIFY COLUMN codigo_beneficio_fiscal varchar(10) default null;',
            'ALTER TABLE item_nfces ADD COLUMN codigo_beneficio_fiscal varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nfces'
                  AND COLUMN_NAME = 'variacao_id'
            ),
            'ALTER TABLE item_pre_vendas MODIFY COLUMN variacao_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_pre_vendas ADD COLUMN variacao_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'sms_key'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN sms_key varchar(120) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN sms_key varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_whatsapp'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_whatsapp varchar(120) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_whatsapp varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'estoques'
                  AND COLUMN_NAME = 'produto_variacao_id'
            ),
            'ALTER TABLE estoques MODIFY COLUMN produto_variacao_id BIGINT UNSIGNED NULL',
            'ALTER TABLE estoques ADD COLUMN produto_variacao_id BIGINT UNSIGNED NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'movimentacao_produtos'
                  AND COLUMN_NAME = 'produto_variacao_id'
            ),
            'ALTER TABLE movimentacao_produtos MODIFY COLUMN produto_variacao_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE movimentacao_produtos ADD COLUMN produto_variacao_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'status_pagamento'
            ),
            'ALTER TABLE ctes MODIFY COLUMN status_pagamento boolean default 0;',
            'ALTER TABLE ctes ADD COLUMN status_pagamento boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'api'
            ),
            'ALTER TABLE ctes MODIFY COLUMN api boolean default 0;',
            'ALTER TABLE ctes ADD COLUMN api boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'caixa_id'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN caixa_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE conta_pagars ADD COLUMN caixa_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'caixa_id'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN caixa_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE conta_recebers ADD COLUMN caixa_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'funcionarios'
                  AND COLUMN_NAME = 'comissao'
            ),
            'ALTER TABLE funcionarios MODIFY COLUMN comissao decimal(10 ,2) default 0;',
            'ALTER TABLE funcionarios ADD COLUMN comissao decimal(10 ,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'funcionarios'
                  AND COLUMN_NAME = 'salario'
            ),
            'ALTER TABLE funcionarios MODIFY COLUMN salario decimal(10 ,2) default 0;',
            'ALTER TABLE funcionarios ADD COLUMN salario decimal(10 ,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'comissao_vendas'
                  AND COLUMN_NAME = 'valor_venda'
            ),
            'ALTER TABLE comissao_vendas MODIFY COLUMN valor_venda decimal(10,2) default 0;',
            'ALTER TABLE comissao_vendas ADD COLUMN valor_venda decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'latitude_carregamento'
            ),
            'ALTER TABLE mdves MODIFY COLUMN latitude_carregamento varchar(15) default \'\';',
            'ALTER TABLE mdves ADD COLUMN latitude_carregamento varchar(15) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'longitude_carregamento'
            ),
            'ALTER TABLE mdves MODIFY COLUMN longitude_carregamento varchar(15) default \'\';',
            'ALTER TABLE mdves ADD COLUMN longitude_carregamento varchar(15) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'latitude_descarregamento'
            ),
            'ALTER TABLE mdves MODIFY COLUMN latitude_descarregamento varchar(15) default \'\';',
            'ALTER TABLE mdves ADD COLUMN latitude_descarregamento varchar(15) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'longitude_descarregamento'
            ),
            'ALTER TABLE mdves MODIFY COLUMN longitude_descarregamento varchar(15) default \'\';',
            'ALTER TABLE mdves ADD COLUMN longitude_descarregamento varchar(15) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'estado_emissao'
            ),
            'ALTER TABLE mdves MODIFY COLUMN estado_emissao enum(\'novo\', \'aprovado\', \'rejeitado\', \'cancelado\');',
            'ALTER TABLE mdves ADD COLUMN estado_emissao enum(\'novo\', \'aprovado\', \'rejeitado\', \'cancelado\');'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'mdfe_numero'
            ),
            'ALTER TABLE mdves MODIFY COLUMN mdfe_numero integer default null;',
            'ALTER TABLE mdves ADD COLUMN mdfe_numero integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_servicos'
                  AND COLUMN_NAME = 'imagem'
            ),
            'ALTER TABLE categoria_servicos MODIFY COLUMN imagem varchar(25) default \'\';',
            'ALTER TABLE categoria_servicos ADD COLUMN imagem varchar(25) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'imagem'
            ),
            'ALTER TABLE servicos MODIFY COLUMN imagem varchar(25) default null;',
            'ALTER TABLE servicos ADD COLUMN imagem varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE servicos MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE servicos ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'interrupcoes'
                  AND COLUMN_NAME = 'motivo'
            ),
            'ALTER TABLE interrupcoes MODIFY COLUMN motivo varchar(50) default null;',
            'ALTER TABLE interrupcoes ADD COLUMN motivo varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servico_os'
                  AND COLUMN_NAME = 'valor'
            ),
            'ALTER TABLE servico_os MODIFY COLUMN valor decimal(10, 2) default 0;',
            'ALTER TABLE servico_os ADD COLUMN valor decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servico_os'
                  AND COLUMN_NAME = 'subtotal'
            ),
            'ALTER TABLE servico_os MODIFY COLUMN subtotal decimal(10, 2) default 0;',
            'ALTER TABLE servico_os ADD COLUMN subtotal decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_os'
                  AND COLUMN_NAME = 'valor'
            ),
            'ALTER TABLE produto_os MODIFY COLUMN valor decimal(10, 2) default 0;',
            'ALTER TABLE produto_os ADD COLUMN valor decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_os'
                  AND COLUMN_NAME = 'subtotal'
            ),
            'ALTER TABLE produto_os MODIFY COLUMN subtotal decimal(10, 2) default 0;',
            'ALTER TABLE produto_os ADD COLUMN subtotal decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'prioridade'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN prioridade enum(\'baixa\', \'media\', \'alta\') default \'baixa\';',
            'ALTER TABLE agendamentos ADD COLUMN prioridade enum(\'baixa\', \'media\', \'alta\') default \'baixa\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'tamanho_pizzas'
                  AND COLUMN_NAME = 'nome_en'
            ),
            'ALTER TABLE tamanho_pizzas MODIFY COLUMN nome_en varchar(50) default null;',
            'ALTER TABLE tamanho_pizzas ADD COLUMN nome_en varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'tamanho_pizzas'
                  AND COLUMN_NAME = 'nome_es'
            ),
            'ALTER TABLE tamanho_pizzas MODIFY COLUMN nome_es varchar(50) default null;',
            'ALTER TABLE tamanho_pizzas ADD COLUMN nome_es varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'em_atendimento'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN em_atendimento boolean default 1;',
            'ALTER TABLE pedidos ADD COLUMN em_atendimento boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'nfce_id'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN nfce_id integer default null;',
            'ALTER TABLE pedidos ADD COLUMN nfce_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tempo_preparo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tempo_preparo integer default null;',
            'ALTER TABLE produtos ADD COLUMN tempo_preparo integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'ponto_carne'
            ),
            'ALTER TABLE produtos MODIFY COLUMN ponto_carne varchar(30) default null;',
            'ALTER TABLE produtos ADD COLUMN ponto_carne varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'tamanho_id'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN tamanho_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_pedidos ADD COLUMN tamanho_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'valor_pizza'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN valor_pizza enum(\'divide\', \'valor_maior\') default \'divide\';',
            'ALTER TABLE configuracao_cardapios ADD COLUMN valor_pizza enum(\'divide\', \'valor_maior\') default \'divide\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cte_os'
                  AND COLUMN_NAME = 'data_viagem'
            ),
            'ALTER TABLE cte_os MODIFY COLUMN data_viagem varchar(10) default \'\';',
            'ALTER TABLE cte_os ADD COLUMN data_viagem varchar(10) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cte_os'
                  AND COLUMN_NAME = 'horario_viagem'
            ),
            'ALTER TABLE cte_os MODIFY COLUMN horario_viagem varchar(5) default \'\';',
            'ALTER TABLE cte_os ADD COLUMN horario_viagem varchar(5) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cte_os'
                  AND COLUMN_NAME = 'cfop'
            ),
            'ALTER TABLE cte_os MODIFY COLUMN cfop varchar(4) default null;',
            'ALTER TABLE cte_os ADD COLUMN cfop varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cte_os'
                  AND COLUMN_NAME = 'recibo'
            ),
            'ALTER TABLE cte_os MODIFY COLUMN recibo varchar(30) default null;',
            'ALTER TABLE cte_os ADD COLUMN recibo varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'confirmar_itens_prevenda'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN confirmar_itens_prevenda boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN confirmar_itens_prevenda boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'bairro_deliveries'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE bairro_deliveries MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE bairro_deliveries ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'tipo_entrega'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN tipo_entrega varchar(30) default \'\';',
            'ALTER TABLE market_place_configs ADD COLUMN tipo_entrega varchar(30) default \'\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'finalizado'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN finalizado boolean default 0;',
            'ALTER TABLE pedido_deliveries ADD COLUMN finalizado boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'nfce_id'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN nfce_id integer default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN nfce_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN ecommerce boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN ecommerce boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_ecommerce decimal(12,4) default null;',
            'ALTER TABLE produtos ADD COLUMN valor_ecommerce decimal(12,4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'percentual_desconto'
            ),
            'ALTER TABLE produtos MODIFY COLUMN percentual_desconto integer default null;',
            'ALTER TABLE produtos ADD COLUMN percentual_desconto integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'descricao_ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN descricao_ecommerce varchar(255) default null;',
            'ALTER TABLE produtos ADD COLUMN descricao_ecommerce varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'largura'
            ),
            'ALTER TABLE produtos MODIFY COLUMN largura decimal(8, 2) default null;',
            'ALTER TABLE produtos ADD COLUMN largura decimal(8, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'comprimento'
            ),
            'ALTER TABLE produtos MODIFY COLUMN comprimento decimal(8, 2) default null;',
            'ALTER TABLE produtos ADD COLUMN comprimento decimal(8, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'altura'
            ),
            'ALTER TABLE produtos MODIFY COLUMN altura decimal(8, 2) default null;',
            'ALTER TABLE produtos ADD COLUMN altura decimal(8, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'peso'
            ),
            'ALTER TABLE produtos MODIFY COLUMN peso decimal(12, 3) default null;',
            'ALTER TABLE produtos ADD COLUMN peso decimal(12, 3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'ecommerce'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN ecommerce boolean default 0;',
            'ALTER TABLE categoria_produtos ADD COLUMN ecommerce boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'destaque_ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN destaque_ecommerce boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN destaque_ecommerce boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'hash_ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN hash_ecommerce varchar(50) default null;',
            'ALTER TABLE produtos ADD COLUMN hash_ecommerce varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'texto_ecommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN texto_ecommerce text;',
            'ALTER TABLE produtos ADD COLUMN texto_ecommerce text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'usuario_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN usuario_correios varchar(30) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN usuario_correios varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'codigo_acesso_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN codigo_acesso_correios varchar(100) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN codigo_acesso_correios varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'cartao_postagem_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN cartao_postagem_correios varchar(100) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN cartao_postagem_correios varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_correios text;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_correios text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_expira_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_expira_correios varchar(30) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_expira_correios varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'dr_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN dr_correios varchar(30) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN dr_correios varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'contrato_correios'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN contrato_correios varchar(30) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN contrato_correios varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'hash_ecommerce'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN hash_ecommerce varchar(50) default null;',
            'ALTER TABLE categoria_produtos ADD COLUMN hash_ecommerce varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'notificacao_ecommerce'
            ),
            'ALTER TABLE users MODIFY COLUMN notificacao_ecommerce boolean default 0;',
            'ALTER TABLE users ADD COLUMN notificacao_ecommerce boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'auto_cadastro'
            ),
            'ALTER TABLE planos MODIFY COLUMN auto_cadastro boolean default 0;',
            'ALTER TABLE planos ADD COLUMN auto_cadastro boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'uid'
            ),
            'ALTER TABLE clientes MODIFY COLUMN uid varchar(30) default null;',
            'ALTER TABLE clientes ADD COLUMN uid varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE clientes MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE clientes ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table config_gerals modify column balanca_digito_verificador integer default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'numero_ultima_nfse'
            ),
            'ALTER TABLE empresas MODIFY COLUMN numero_ultima_nfse integer default null;',
            'ALTER TABLE empresas ADD COLUMN numero_ultima_nfse integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'numero_serie_nfse'
            ),
            'ALTER TABLE empresas MODIFY COLUMN numero_serie_nfse integer default null;',
            'ALTER TABLE empresas ADD COLUMN numero_serie_nfse integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'codigo_tributacao_municipio'
            ),
            'ALTER TABLE servicos MODIFY COLUMN codigo_tributacao_municipio varchar(30) default null;',
            'ALTER TABLE servicos ADD COLUMN codigo_tributacao_municipio varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'lista_id'
            ),
            'ALTER TABLE nfces MODIFY COLUMN lista_id integer default null;',
            'ALTER TABLE nfces ADD COLUMN lista_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pre_vendas'
                  AND COLUMN_NAME = 'lista_id'
            ),
            'ALTER TABLE pre_vendas MODIFY COLUMN lista_id integer default null;',
            'ALTER TABLE pre_vendas ADD COLUMN lista_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pre_vendas'
                  AND COLUMN_NAME = 'variacao_id'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN variacao_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_nves ADD COLUMN variacao_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'codigo_sequencial'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN codigo_sequencial integer default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN codigo_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_auth_nfse'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_auth_nfse varchar(255) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_auth_nfse varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'token_nfse'
            ),
            'ALTER TABLE empresas MODIFY COLUMN token_nfse varchar(200) default null;',
            'ALTER TABLE empresas ADD COLUMN token_nfse varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'notificacoes'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN notificacoes text;',
            'ALTER TABLE config_gerals ADD COLUMN notificacoes text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'loja_id'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN loja_id varchar(15) default null;',
            'ALTER TABLE market_place_configs ADD COLUMN loja_id varchar(15) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'destaque_delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN destaque_delivery boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN destaque_delivery boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'hash_delivery'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN hash_delivery varchar(50) default null;',
            'ALTER TABLE categoria_produtos ADD COLUMN hash_delivery varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'hash_delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN hash_delivery varchar(50) default null;',
            'ALTER TABLE produtos ADD COLUMN hash_delivery varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'texto_delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN texto_delivery text;',
            'ALTER TABLE produtos ADD COLUMN texto_delivery text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE nves MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE nves ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE nfces MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE nfces ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'email'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN email varchar(80) default null;',
            'ALTER TABLE market_place_configs ADD COLUMN email varchar(80) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'cor_principal'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN cor_principal varchar(10) default null;',
            'ALTER TABLE market_place_configs ADD COLUMN cor_principal varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ecommerce_configs'
                  AND COLUMN_NAME = 'dados_deposito'
            ),
            'ALTER TABLE ecommerce_configs MODIFY COLUMN dados_deposito text;',
            'ALTER TABLE ecommerce_configs ADD COLUMN dados_deposito text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table pedido_ecommerces modify column tipo_pagamento enum('cartao', 'pix', 'boleto', 'deposito');
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'aut_xml'
            ),
            'ALTER TABLE empresas MODIFY COLUMN aut_xml varchar(18) default null;',
            'ALTER TABLE empresas ADD COLUMN aut_xml varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_ecommerces'
                  AND COLUMN_NAME = 'comprovante'
            ),
            'ALTER TABLE pedido_ecommerces MODIFY COLUMN comprovante varchar(25) default null;',
            'ALTER TABLE pedido_ecommerces ADD COLUMN comprovante varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'segmento_id'
            ),
            'ALTER TABLE planos MODIFY COLUMN segmento_id integer default null;',
            'ALTER TABLE planos ADD COLUMN segmento_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'timeout_nfe'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN timeout_nfe integer default 8;',
            'ALTER TABLE configuracao_supers ADD COLUMN timeout_nfe integer default 8;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'timeout_nfce'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN timeout_nfce integer default 8;',
            'ALTER TABLE configuracao_supers ADD COLUMN timeout_nfce integer default 8;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'timeout_cte'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN timeout_cte integer default 8;',
            'ALTER TABLE configuracao_supers ADD COLUMN timeout_cte integer default 8;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'timeout_mdfe'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN timeout_mdfe integer default 8;',
            'ALTER TABLE configuracao_supers ADD COLUMN timeout_mdfe integer default 8;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_id varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_id varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_link'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_link varchar(255) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_link varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_valor'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_valor decimal(12, 4) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_valor decimal(12, 4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_categoria'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_categoria varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_categoria varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'condicao_mercado_livre'
            ),
            'ALTER TABLE produtos MODIFY COLUMN condicao_mercado_livre varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN condicao_mercado_livre varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'quantidade_mercado_livre'
            ),
            'ALTER TABLE produtos MODIFY COLUMN quantidade_mercado_livre integer default null;',
            'ALTER TABLE produtos ADD COLUMN quantidade_mercado_livre integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_tipo_publicacao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_tipo_publicacao varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_tipo_publicacao varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_youtube'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_youtube varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_youtube varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_descricao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_descricao text;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_descricao text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mercado_livre_configs'
                  AND COLUMN_NAME = 'refresh_token'
            ),
            'ALTER TABLE mercado_livre_configs MODIFY COLUMN refresh_token varchar(255) default null;',
            'ALTER TABLE mercado_livre_configs ADD COLUMN refresh_token varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mercado_livre_configs'
                  AND COLUMN_NAME = 'token_expira'
            ),
            'ALTER TABLE mercado_livre_configs MODIFY COLUMN token_expira bigint default null;',
            'ALTER TABLE mercado_livre_configs ADD COLUMN token_expira bigint default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mercado_livre_perguntas'
                  AND COLUMN_NAME = 'resposta'
            ),
            'ALTER TABLE mercado_livre_perguntas MODIFY COLUMN resposta text;',
            'ALTER TABLE mercado_livre_perguntas ADD COLUMN resposta text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_mercado_livres'
                  AND COLUMN_NAME = 'codigo_rastreamento'
            ),
            'ALTER TABLE pedido_mercado_livres MODIFY COLUMN codigo_rastreamento varchar(30) default null;',
            'ALTER TABLE pedido_mercado_livres ADD COLUMN codigo_rastreamento varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'fiscal'
            ),
            'ALTER TABLE planos MODIFY COLUMN fiscal boolean default 1;',
            'ALTER TABLE planos ADD COLUMN fiscal boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'crt'
            ),
            'ALTER TABLE nves MODIFY COLUMN crt integer default null;',
            'ALTER TABLE nves ADD COLUMN crt integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'conta_empresa_id'
            ),
            'ALTER TABLE caixas MODIFY COLUMN conta_empresa_id integer default null;',
            'ALTER TABLE caixas ADD COLUMN conta_empresa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'sangria_caixas'
                  AND COLUMN_NAME = 'conta_empresa_id'
            ),
            'ALTER TABLE sangria_caixas MODIFY COLUMN conta_empresa_id integer default null;',
            'ALTER TABLE sangria_caixas ADD COLUMN conta_empresa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'suprimento_caixas'
                  AND COLUMN_NAME = 'conta_empresa_id'
            ),
            'ALTER TABLE suprimento_caixas MODIFY COLUMN conta_empresa_id integer default null;',
            'ALTER TABLE suprimento_caixas ADD COLUMN conta_empresa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'suprimento_caixas'
                  AND COLUMN_NAME = 'tipo_pagamento'
            ),
            'ALTER TABLE suprimento_caixas MODIFY COLUMN tipo_pagamento varchar(2) default null;',
            'ALTER TABLE suprimento_caixas ADD COLUMN tipo_pagamento varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'combo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN combo boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN combo boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'margem_combo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN margem_combo decimal(5, 2) default 0;',
            'ALTER TABLE produtos ADD COLUMN margem_combo decimal(5, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'margem_combo'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN margem_combo decimal(5,2) default 50;',
            'ALTER TABLE config_gerals ADD COLUMN margem_combo decimal(5,2) default 50;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'nfce_id'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN nfce_id integer default null;',
            'ALTER TABLE agendamentos ADD COLUMN nfce_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'funcionario_id'
            ),
            'ALTER TABLE nfces MODIFY COLUMN funcionario_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE nfces ADD COLUMN funcionario_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'nuvem_shop_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN nuvem_shop_id varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN nuvem_shop_id varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'nuvem_shop_valor'
            ),
            'ALTER TABLE produtos MODIFY COLUMN nuvem_shop_valor decimal(12, 4) default null;',
            'ALTER TABLE produtos ADD COLUMN nuvem_shop_valor decimal(12, 4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'texto_nuvem_shop'
            ),
            'ALTER TABLE produtos MODIFY COLUMN texto_nuvem_shop text;',
            'ALTER TABLE produtos ADD COLUMN texto_nuvem_shop text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'nuvem_shop_id'
            ),
            'ALTER TABLE clientes MODIFY COLUMN nuvem_shop_id varchar(20) default null;',
            'ALTER TABLE clientes ADD COLUMN nuvem_shop_id varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'modBCST'
            ),
            'ALTER TABLE produtos MODIFY COLUMN modBCST integer default null;',
            'ALTER TABLE produtos ADD COLUMN modBCST integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pMVAST'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pMVAST decimal(5,2) default null;',
            'ALTER TABLE produtos ADD COLUMN pMVAST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pICMSST'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pICMSST decimal(5,2) default null;',
            'ALTER TABLE produtos ADD COLUMN pICMSST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'redBCST'
            ),
            'ALTER TABLE produtos MODIFY COLUMN redBCST decimal(5,2) default null;',
            'ALTER TABLE produtos ADD COLUMN redBCST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'modBCST'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN modBCST integer default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN modBCST integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'pMVAST'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN pMVAST decimal(5,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN pMVAST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'pICMSST'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN pICMSST decimal(5,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN pICMSST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'redBCST'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN redBCST decimal(5,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN redBCST decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE conta_pagars ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE conta_recebers ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE nfces MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE nfces ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE nves MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE nves ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'estoques'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE estoques MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE estoques ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE ctes MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE ctes ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE mdves MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE mdves ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cte_os'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE cte_os MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE cte_os ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'caixas'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE caixas MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE caixas ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pre_vendas'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE pre_vendas MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE pre_vendas ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table produtos modify column nome varchar(200);
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'valor_implantacao'
            ),
            'ALTER TABLE planos MODIFY COLUMN valor_implantacao decimal(10,2) default 0;',
            'ALTER TABLE planos ADD COLUMN valor_implantacao decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'signed_xml'
            ),
            'ALTER TABLE nves MODIFY COLUMN signed_xml text default null;',
            'ALTER TABLE nves ADD COLUMN signed_xml text default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'signed_xml'
            ),
            'ALTER TABLE nfces MODIFY COLUMN signed_xml text default null;',
            'ALTER TABLE nfces ADD COLUMN signed_xml text default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'tipo_modal'
            ),
            'ALTER TABLE mdves MODIFY COLUMN tipo_modal integer default 1;',
            'ALTER TABLE mdves ADD COLUMN tipo_modal integer default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'reservas'
                  AND COLUMN_NAME = 'data_checkin_realizado'
            ),
            'ALTER TABLE reservas MODIFY COLUMN data_checkin_realizado timestamp default CURRENT_TIMESTAMP;',
            'ALTER TABLE reservas ADD COLUMN data_checkin_realizado timestamp default CURRENT_TIMESTAMP;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'consumo_reservas'
                  AND COLUMN_NAME = 'frigobar'
            ),
            'ALTER TABLE consumo_reservas MODIFY COLUMN frigobar boolean default 0;',
            'ALTER TABLE consumo_reservas ADD COLUMN frigobar boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'reserva'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN reserva boolean default 0;',
            'ALTER TABLE categoria_produtos ADD COLUMN reserva boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'reserva'
            ),
            'ALTER TABLE produtos MODIFY COLUMN reserva boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN reserva boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'reservas'
                  AND COLUMN_NAME = 'motivo_cancelamento'
            ),
            'ALTER TABLE reservas MODIFY COLUMN motivo_cancelamento text;',
            'ALTER TABLE reservas ADD COLUMN motivo_cancelamento text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'reserva'
            ),
            'ALTER TABLE servicos MODIFY COLUMN reserva boolean default 0;',
            'ALTER TABLE servicos ADD COLUMN reserva boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'reservas'
                  AND COLUMN_NAME = 'nfe_id'
            ),
            'ALTER TABLE reservas MODIFY COLUMN nfe_id integer default null;',
            'ALTER TABLE reservas ADD COLUMN nfe_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vbc_icms'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vbc_icms decimal(10,2) default 0;',
            'ALTER TABLE item_nves ADD COLUMN vbc_icms decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vbc_pis'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vbc_pis decimal(10,2) default 0;',
            'ALTER TABLE item_nves ADD COLUMN vbc_pis decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vbc_cofins'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vbc_cofins decimal(10,2) default 0;',
            'ALTER TABLE item_nves ADD COLUMN vbc_cofins decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vbc_ipi'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vbc_ipi decimal(10,2) default 0;',
            'ALTER TABLE item_nves ADD COLUMN vbc_ipi decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'reservas'
                  AND COLUMN_NAME = 'nfse_id'
            ),
            'ALTER TABLE reservas MODIFY COLUMN nfse_id integer default null;',
            'ALTER TABLE reservas ADD COLUMN nfse_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'padrao_reserva_nfse'
            ),
            'ALTER TABLE servicos MODIFY COLUMN padrao_reserva_nfse boolean default 0;',
            'ALTER TABLE servicos ADD COLUMN padrao_reserva_nfse boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_servicos'
                  AND COLUMN_NAME = 'marketplace'
            ),
            'ALTER TABLE categoria_servicos MODIFY COLUMN marketplace boolean default 0;',
            'ALTER TABLE categoria_servicos ADD COLUMN marketplace boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'marketplace'
            ),
            'ALTER TABLE servicos MODIFY COLUMN marketplace boolean default 0;',
            'ALTER TABLE servicos ADD COLUMN marketplace boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_servicos'
                  AND COLUMN_NAME = 'hash_delivery'
            ),
            'ALTER TABLE categoria_servicos MODIFY COLUMN hash_delivery varchar(50) default null;',
            'ALTER TABLE categoria_servicos ADD COLUMN hash_delivery varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'hash_delivery'
            ),
            'ALTER TABLE servicos MODIFY COLUMN hash_delivery varchar(50) default null;',
            'ALTER TABLE servicos ADD COLUMN hash_delivery varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'descricao'
            ),
            'ALTER TABLE servicos MODIFY COLUMN descricao text;',
            'ALTER TABLE servicos ADD COLUMN descricao text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'percentual_lucro'
            ),
            'ALTER TABLE produtos MODIFY COLUMN percentual_lucro decimal(10,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN percentual_lucro decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'percentual_lucro_produto'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN percentual_lucro_produto decimal(10,2) default 0;',
            'ALTER TABLE config_gerals ADD COLUMN percentual_lucro_produto decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'destaque_marketplace'
            ),
            'ALTER TABLE servicos MODIFY COLUMN destaque_marketplace boolean default null;',
            'ALTER TABLE servicos ADD COLUMN destaque_marketplace boolean default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nota_servicos'
                  AND COLUMN_NAME = 'gerar_conta_receber'
            ),
            'ALTER TABLE nota_servicos MODIFY COLUMN gerar_conta_receber boolean default null;',
            'ALTER TABLE nota_servicos ADD COLUMN gerar_conta_receber boolean default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nota_servicos'
                  AND COLUMN_NAME = 'data_vencimento'
            ),
            'ALTER TABLE nota_servicos MODIFY COLUMN data_vencimento date default null;',
            'ALTER TABLE nota_servicos ADD COLUMN data_vencimento date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nota_servicos'
                  AND COLUMN_NAME = 'conta_receber_id'
            ),
            'ALTER TABLE nota_servicos MODIFY COLUMN conta_receber_id integer default null;',
            'ALTER TABLE nota_servicos ADD COLUMN conta_receber_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'tipos_pagamento_pdv'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN tipos_pagamento_pdv text;',
            'ALTER TABLE config_gerals ADD COLUMN tipos_pagamento_pdv text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'movimentacao_produtos'
                  AND COLUMN_NAME = 'user_id'
            ),
            'ALTER TABLE movimentacao_produtos MODIFY COLUMN user_id integer default null;',
            'ALTER TABLE movimentacao_produtos ADD COLUMN user_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'senha_manipula_valor'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN senha_manipula_valor varchar(20) default null;',
            'ALTER TABLE config_gerals ADD COLUMN senha_manipula_valor varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'abrir_modal_cartao'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN abrir_modal_cartao boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN abrir_modal_cartao boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'user_id'
            ),
            'ALTER TABLE nves MODIFY COLUMN user_id integer default null;',
            'ALTER TABLE nves ADD COLUMN user_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'user_id'
            ),
            'ALTER TABLE nfces MODIFY COLUMN user_id integer default null;',
            'ALTER TABLE nfces ADD COLUMN user_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'categoria_id'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN categoria_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE categoria_produtos ADD COLUMN categoria_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'codigo_barras2'
            ),
            'ALTER TABLE produtos MODIFY COLUMN codigo_barras2 varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN codigo_barras2 varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'codigo_barras3'
            ),
            'ALTER TABLE produtos MODIFY COLUMN codigo_barras3 varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN codigo_barras3 varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'sub_categoria_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN sub_categoria_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE produtos ADD COLUMN sub_categoria_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'percentual_desconto_orcamento'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN percentual_desconto_orcamento decimal(5,2) default null;',
            'ALTER TABLE config_gerals ADD COLUMN percentual_desconto_orcamento decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'valor_credito'
            ),
            'ALTER TABLE clientes MODIFY COLUMN valor_credito decimal(10,2) default 0;',
            'ALTER TABLE clientes ADD COLUMN valor_credito decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'arquivo'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN arquivo varchar(25) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN arquivo varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'arquivo'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN arquivo varchar(25) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN arquivo varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_atacado'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_atacado decimal(22,7) default 0;',
            'ALTER TABLE produtos ADD COLUMN valor_atacado decimal(22,7) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'quantidade_atacado'
            ),
            'ALTER TABLE produtos MODIFY COLUMN quantidade_atacado integer default null;',
            'ALTER TABLE produtos ADD COLUMN quantidade_atacado integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'funcionamento_descricao'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN funcionamento_descricao varchar(100) default null;',
            'ALTER TABLE market_place_configs ADD COLUMN funcionamento_descricao varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'oferta_delivery'
            ),
            'ALTER TABLE produtos MODIFY COLUMN oferta_delivery boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN oferta_delivery boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'observacao'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN observacao varchar(200) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN observacao varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'tipo_pagamento'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN tipo_pagamento varchar(20) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN tipo_pagamento varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'troco_para'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN troco_para decimal(10,2) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN troco_para decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table empresas modify column tributacao enum('MEI', 'Simples Nacional', 'Regime Normal', 'Simples Nacional, excesso sublimite de receita bruta');
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'tipo_entrega'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN tipo_entrega enum(\'delivery\', \'retirada\') default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN tipo_entrega enum(\'delivery\', \'retirada\') default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'caixa_id'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN caixa_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE ordem_servicos ADD COLUMN caixa_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'contigencia'
            ),
            'ALTER TABLE nves MODIFY COLUMN contigencia boolean default 0;',
            'ALTER TABLE nves ADD COLUMN contigencia boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'contigencia'
            ),
            'ALTER TABLE nfces MODIFY COLUMN contigencia boolean default 0;',
            'ALTER TABLE nfces ADD COLUMN contigencia boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'reenvio_contigencia'
            ),
            'ALTER TABLE nfces MODIFY COLUMN reenvio_contigencia boolean default 0;',
            'ALTER TABLE nfces ADD COLUMN reenvio_contigencia boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'funcionario_id'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN funcionario_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE pedidos ADD COLUMN funcionario_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'funcionario_id'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN funcionario_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE item_pedidos ADD COLUMN funcionario_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'gerenciar_estoque'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN gerenciar_estoque boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN gerenciar_estoque boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'funcionarios'
                  AND COLUMN_NAME = 'codigo'
            ),
            'ALTER TABLE funcionarios MODIFY COLUMN codigo varchar(30) default null;',
            'ALTER TABLE funcionarios ADD COLUMN codigo varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'data_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN data_entrega date default null;',
            'ALTER TABLE nves ADD COLUMN data_entrega date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cst_csosn'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cst_csosn varchar(3) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cst_csosn varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cst_pis'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cst_pis varchar(3) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cst_pis varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cst_cofins'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cst_cofins varchar(3) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cst_cofins varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cst_ipi'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cst_ipi varchar(3) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cst_ipi varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cfop_estadual'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cfop_estadual varchar(4) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cfop_estadual varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cfop_outro_estado'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cfop_outro_estado varchar(4) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cfop_outro_estado varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cfop_entrada_estadual'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cfop_entrada_estadual varchar(4) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cfop_entrada_estadual varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'cfop_entrada_outro_estado'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN cfop_entrada_outro_estado varchar(4) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN cfop_entrada_outro_estado varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'perc_icms'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN perc_icms decimal(5, 2) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN perc_icms decimal(5, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'perc_pis'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN perc_pis decimal(5, 2) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN perc_pis decimal(5, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'perc_cofins'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN perc_cofins decimal(5, 2) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN perc_cofins decimal(5, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'perc_ipi'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN perc_ipi decimal(5, 2) default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN perc_ipi decimal(5, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_id varchar(20) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_id varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_slug'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_slug varchar(80) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_slug varchar(80) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_link'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_link varchar(255) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_link varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_valor'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_valor decimal(12, 4) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_valor decimal(12, 4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_type'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_type varchar(30) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_type varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_status'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_status varchar(30) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_status varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_descricao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_descricao text;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_descricao text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'woocommerce_stock_status'
            ),
            'ALTER TABLE produtos MODIFY COLUMN woocommerce_stock_status varchar(30) default null;',
            'ALTER TABLE produtos ADD COLUMN woocommerce_stock_status varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'categorias_woocommerce'
            ),
            'ALTER TABLE produtos MODIFY COLUMN categorias_woocommerce text;',
            'ALTER TABLE produtos ADD COLUMN categorias_woocommerce text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'observacao_padrao_nfe'
            ),
            'ALTER TABLE empresas MODIFY COLUMN observacao_padrao_nfe text;',
            'ALTER TABLE empresas ADD COLUMN observacao_padrao_nfe text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'observacao_padrao_nfce'
            ),
            'ALTER TABLE empresas MODIFY COLUMN observacao_padrao_nfce text;',
            'ALTER TABLE empresas ADD COLUMN observacao_padrao_nfce text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'agrupar_itens'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN agrupar_itens boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN agrupar_itens boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'movimentacao_produtos'
                  AND COLUMN_NAME = 'estoque_atual'
            ),
            'ALTER TABLE movimentacao_produtos MODIFY COLUMN estoque_atual decimal(14,4) default 0;',
            'ALTER TABLE movimentacao_produtos ADD COLUMN estoque_atual decimal(14,4) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'xPed'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN xPed varchar(30) default null;',
            'ALTER TABLE item_nves ADD COLUMN xPed varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'nItemPed'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN nItemPed varchar(30) default null;',
            'ALTER TABLE item_nves ADD COLUMN nItemPed varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'registro_tefs'
                  AND COLUMN_NAME = 'usuario_id'
            ),
            'ALTER TABLE registro_tefs MODIFY COLUMN usuario_id integer default null;',
            'ALTER TABLE registro_tefs ADD COLUMN usuario_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table nves modify column observacao varchar(255) default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_carrinho_deliveries'
                  AND COLUMN_NAME = 'observacao'
            ),
            'ALTER TABLE item_carrinho_deliveries MODIFY COLUMN observacao varchar(50) default null;',
            'ALTER TABLE item_carrinho_deliveries ADD COLUMN observacao varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_carrinho_deliveries'
                  AND COLUMN_NAME = 'tamanho_id'
            ),
            'ALTER TABLE item_carrinho_deliveries MODIFY COLUMN tamanho_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_carrinho_deliveries ADD COLUMN tamanho_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'maximo_usuarios'
            ),
            'ALTER TABLE planos MODIFY COLUMN maximo_usuarios integer default null;',
            'ALTER TABLE planos ADD COLUMN maximo_usuarios integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'maximo_locais'
            ),
            'ALTER TABLE planos MODIFY COLUMN maximo_locais integer default null;',
            'ALTER TABLE planos ADD COLUMN maximo_locais integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tipo_unico'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tipo_unico boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN tipo_unico boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'padrao'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN padrao boolean default 0;',
            'ALTER TABLE natureza_operacaos ADD COLUMN padrao boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'balanca_pdv'
            ),
            'ALTER TABLE produtos MODIFY COLUMN balanca_pdv boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN balanca_pdv boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'fone'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN fone varchar(20) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN fone varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'cupom'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN cupom varchar(6) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN cupom varchar(6) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'tipo_comissao'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN tipo_comissao enum(\'percentual_vendedor\', \'percentual_margem\') default \'percentual_vendedor\';',
            'ALTER TABLE config_gerals ADD COLUMN tipo_comissao enum(\'percentual_vendedor\', \'percentual_margem\') default \'percentual_vendedor\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'veiculos'
                  AND COLUMN_NAME = 'funcionario_id'
            ),
            'ALTER TABLE veiculos MODIFY COLUMN funcionario_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE veiculos ADD COLUMN funcionario_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'usar_resp_tecnico'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN usar_resp_tecnico boolean default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN usar_resp_tecnico boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'limite_credito'
            ),
            'ALTER TABLE clientes MODIFY COLUMN limite_credito decimal(10,2) default null;',
            'ALTER TABLE clientes ADD COLUMN limite_credito decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_integra_notas'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_integra_notas varchar(255) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_integra_notas varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'funcionario_id'
            ),
            'ALTER TABLE nves MODIFY COLUMN funcionario_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE nves ADD COLUMN funcionario_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'infAdProd'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN infAdProd varchar(200) default null;',
            'ALTER TABLE item_nves ADD COLUMN infAdProd varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'mercado_livre_modelo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN mercado_livre_modelo varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN mercado_livre_modelo varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'token_api'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN token_api varchar(50) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN token_api varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table nfces modify column observacao varchar(200) default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'sobrescrever_cfop'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN sobrescrever_cfop boolean default 0;',
            'ALTER TABLE natureza_operacaos ADD COLUMN sobrescrever_cfop boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fretes'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE fretes MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE fretes ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fretes'
                  AND COLUMN_NAME = 'total_despesa'
            ),
            'ALTER TABLE fretes MODIFY COLUMN total_despesa decimal(12,2) default null;',
            'ALTER TABLE fretes ADD COLUMN total_despesa decimal(12,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table fretes modify column horario_inicio time default null;
alter table fretes modify column horario_fim time default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fretes'
                  AND COLUMN_NAME = 'conta_receber_id'
            ),
            'ALTER TABLE fretes MODIFY COLUMN conta_receber_id integer default null;',
            'ALTER TABLE fretes ADD COLUMN conta_receber_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'veiculos'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE veiculos MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE veiculos ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'despesa_fretes'
                  AND COLUMN_NAME = 'conta_pagar_id'
            ),
            'ALTER TABLE despesa_fretes MODIFY COLUMN conta_pagar_id integer default null;',
            'ALTER TABLE despesa_fretes ADD COLUMN conta_pagar_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'modelo'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN modelo varchar(20) default \'light\';',
            'ALTER TABLE config_gerals ADD COLUMN modelo varchar(20) default \'light\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'alerta_sonoro'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN alerta_sonoro boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN alerta_sonoro boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'mensagem_aproveitamento_credito'
            ),
            'ALTER TABLE empresas MODIFY COLUMN mensagem_aproveitamento_credito text;',
            'ALTER TABLE empresas ADD COLUMN mensagem_aproveitamento_credito text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'perc_ap_cred'
            ),
            'ALTER TABLE empresas MODIFY COLUMN perc_ap_cred decimal(10,2) default 0;',
            'ALTER TABLE empresas ADD COLUMN perc_ap_cred decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_carrinho_deliveries'
                  AND COLUMN_NAME = 'servico_id'
            ),
            'ALTER TABLE item_carrinho_deliveries MODIFY COLUMN servico_id integer default null;',
            'ALTER TABLE item_carrinho_deliveries ADD COLUMN servico_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_carrinho_deliveries modify column produto_id bigint unsigned default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'funcionarios'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE funcionarios MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE funcionarios ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'funcionario_id_agendamento'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN funcionario_id_agendamento integer default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN funcionario_id_agendamento integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'inicio_agendamento'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN inicio_agendamento varchar(5) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN inicio_agendamento varchar(5) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'fim_agendamento'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN fim_agendamento varchar(5) default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN fim_agendamento varchar(5) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'data_agendamento'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN data_agendamento date default null;',
            'ALTER TABLE carrinho_deliveries ADD COLUMN data_agendamento date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedido_deliveries'
                  AND COLUMN_NAME = 'servico_id'
            ),
            'ALTER TABLE item_pedido_deliveries MODIFY COLUMN servico_id integer default null;',
            'ALTER TABLE item_pedido_deliveries ADD COLUMN servico_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_pedido_deliveries modify column produto_id bigint unsigned default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'funcionario_id_agendamento'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN funcionario_id_agendamento integer default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN funcionario_id_agendamento integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'inicio_agendamento'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN inicio_agendamento varchar(5) default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN inicio_agendamento varchar(5) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'fim_agendamento'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN fim_agendamento varchar(5) default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN fim_agendamento varchar(5) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'data_agendamento'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN data_agendamento date default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN data_agendamento date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'pedido_delivery_id'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN pedido_delivery_id integer default null;',
            'ALTER TABLE agendamentos ADD COLUMN pedido_delivery_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_nfces modify column quantidade decimal(12,3);
alter table item_nves modify column quantidade decimal(12,3);
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'msg_wpp_manha_horario'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN msg_wpp_manha_horario boolean default 0;',
            'ALTER TABLE agendamentos ADD COLUMN msg_wpp_manha_horario boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'msg_wpp_alerta_horario'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN msg_wpp_alerta_horario boolean default 0;',
            'ALTER TABLE agendamentos ADD COLUMN msg_wpp_alerta_horario boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_minimo_venda'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_minimo_venda decimal(12,4) default 0;',
            'ALTER TABLE produtos ADD COLUMN valor_minimo_venda decimal(12,4) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE servicos MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE servicos ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'lista_preco_id'
            ),
            'ALTER TABLE clientes MODIFY COLUMN lista_preco_id integer default null;',
            'ALTER TABLE clientes ADD COLUMN lista_preco_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'interrupcoes'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE interrupcoes MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE interrupcoes ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'localizacaos'
                  AND COLUMN_NAME = 'perc_ap_cred'
            ),
            'ALTER TABLE localizacaos MODIFY COLUMN perc_ap_cred decimal(10,2) default 0;',
            'ALTER TABLE localizacaos ADD COLUMN perc_ap_cred decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'localizacaos'
                  AND COLUMN_NAME = 'mensagem_aproveitamento_credito'
            ),
            'ALTER TABLE localizacaos MODIFY COLUMN mensagem_aproveitamento_credito text;',
            'ALTER TABLE localizacaos ADD COLUMN mensagem_aproveitamento_credito text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'escolher_localidade_venda'
            ),
            'ALTER TABLE users MODIFY COLUMN escolher_localidade_venda boolean default 0;',
            'ALTER TABLE users ADD COLUMN escolher_localidade_venda boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_empresas'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE conta_empresas MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE conta_empresas ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'exportar_balanca'
            ),
            'ALTER TABLE produtos MODIFY COLUMN exportar_balanca boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN exportar_balanca boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'chave_sat'
            ),
            'ALTER TABLE nfces MODIFY COLUMN chave_sat varchar(44) default null;',
            'ALTER TABLE nfces ADD COLUMN chave_sat varchar(44) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'cabecalho_pdv'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN cabecalho_pdv boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN cabecalho_pdv boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'regime_nfse'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN regime_nfse integer default null;',
            'ALTER TABLE config_gerals ADD COLUMN regime_nfse integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'referencia_xml'
            ),
            'ALTER TABLE produtos MODIFY COLUMN referencia_xml varchar(50) default null;',
            'ALTER TABLE produtos ADD COLUMN referencia_xml varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'mercadopago_public_key_pix'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN mercadopago_public_key_pix varchar(120) default null;',
            'ALTER TABLE config_gerals ADD COLUMN mercadopago_public_key_pix varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'mercadopago_access_token_pix'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN mercadopago_access_token_pix varchar(120) default null;',
            'ALTER TABLE config_gerals ADD COLUMN mercadopago_access_token_pix varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'local_id'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN local_id integer default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN local_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'horario_entrega'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN horario_entrega time default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN horario_entrega time default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'convenio_id'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN convenio_id integer default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN convenio_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_deliveries'
                  AND COLUMN_NAME = 'endereco_id'
            ),
            'ALTER TABLE carrinho_deliveries MODIFY COLUMN endereco_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE carrinho_deliveries ADD COLUMN endereco_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'status_entrega'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN status_entrega boolean default 0;',
            'ALTER TABLE ordem_servicos ADD COLUMN status_entrega boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'adiantamento'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN adiantamento decimal(10,2) default 0;',
            'ALTER TABLE ordem_servicos ADD COLUMN adiantamento decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'pMVAST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN pMVAST decimal(10,4) default null;',
            'ALTER TABLE item_nves ADD COLUMN pMVAST decimal(10,4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vBCST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vBCST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vBCST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'pICMSST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN pICMSST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN pICMSST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vICMSST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vICMSST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vICMSST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vBCFCPST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vBCFCPST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vBCFCPST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'pFCPST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN pFCPST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN pFCPST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vFCPST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vFCPST decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vFCPST decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'modBCST'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN modBCST integer default null;',
            'ALTER TABLE item_nves ADD COLUMN modBCST integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tipo_dimensao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tipo_dimensao boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN tipo_dimensao boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'espessura'
            ),
            'ALTER TABLE produtos MODIFY COLUMN espessura decimal(8,2) default null;',
            'ALTER TABLE produtos ADD COLUMN espessura decimal(8,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'definir_vendedor_pdv_off'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN definir_vendedor_pdv_off boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN definir_vendedor_pdv_off boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'acessos_pdv_off'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN acessos_pdv_off varchar(255) default null;',
            'ALTER TABLE config_gerals ADD COLUMN acessos_pdv_off varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'escritorio_contabils'
                  AND COLUMN_NAME = 'token_sieg'
            ),
            'ALTER TABLE escritorio_contabils MODIFY COLUMN token_sieg varchar(255) default null;',
            'ALTER TABLE escritorio_contabils ADD COLUMN token_sieg varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE categoria_produtos ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE produtos MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE produtos ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE clientes MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE clientes ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fornecedors'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE fornecedors MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE fornecedors ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE natureza_operacaos ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'transportadoras'
                  AND COLUMN_NAME = '_id_import'
            ),
            'ALTER TABLE transportadoras MODIFY COLUMN _id_import integer default null;',
            'ALTER TABLE transportadoras ADD COLUMN _id_import integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'tipo_menu'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN tipo_menu enum(\'vertical\', \'horizontal\') default \'vertical\';',
            'ALTER TABLE config_gerals ADD COLUMN tipo_menu enum(\'vertical\', \'horizontal\') default \'vertical\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'cor_menu'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN cor_menu enum(\'light\', \'brand\', \'dark\') default \'light\';',
            'ALTER TABLE config_gerals ADD COLUMN cor_menu enum(\'light\', \'brand\', \'dark\') default \'light\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'cor_top_bar'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN cor_top_bar enum(\'light\', \'brand\', \'dark\') default \'light\';',
            'ALTER TABLE config_gerals ADD COLUMN cor_top_bar enum(\'light\', \'brand\', \'dark\') default \'light\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'suporte'
            ),
            'ALTER TABLE users MODIFY COLUMN suporte boolean default 0;',
            'ALTER TABLE users ADD COLUMN suporte boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'valor_entrega'
            ),
            'ALTER TABLE nfces MODIFY COLUMN valor_entrega decimal(10, 2) default 0;',
            'ALTER TABLE nfces ADD COLUMN valor_entrega decimal(10, 2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'observacao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN observacao varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN observacao varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'observacao2'
            ),
            'ALTER TABLE produtos MODIFY COLUMN observacao2 varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN observacao2 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'observacao3'
            ),
            'ALTER TABLE produtos MODIFY COLUMN observacao3 varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN observacao3 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'observacao4'
            ),
            'ALTER TABLE produtos MODIFY COLUMN observacao4 varchar(100) default null;',
            'ALTER TABLE produtos ADD COLUMN observacao4 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table mdves modify column quantidade_carga decimal(16, 4) default 0;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'asaas_token'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN asaas_token varchar(255) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN asaas_token varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'banco_plano'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN banco_plano enum(\'mercado_pago\', \'asaas\') default \'mercado_pago\';',
            'ALTER TABLE configuracao_supers ADD COLUMN banco_plano enum(\'mercado_pago\', \'asaas\') default \'mercado_pago\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'codigo_cnae'
            ),
            'ALTER TABLE servicos MODIFY COLUMN codigo_cnae varchar(30) default null;',
            'ALTER TABLE servicos ADD COLUMN codigo_cnae varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'natureza_operacao'
            ),
            'ALTER TABLE servicos MODIFY COLUMN natureza_operacao varchar(100) default null;',
            'ALTER TABLE servicos ADD COLUMN natureza_operacao varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'estado_local_prestacao_servico'
            ),
            'ALTER TABLE servicos MODIFY COLUMN estado_local_prestacao_servico varchar(2) default null;',
            'ALTER TABLE servicos ADD COLUMN estado_local_prestacao_servico varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'aliquota_ir'
            ),
            'ALTER TABLE servicos MODIFY COLUMN aliquota_ir decimal(7,2) default null;',
            'ALTER TABLE servicos ADD COLUMN aliquota_ir decimal(7,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'aliquota_csll'
            ),
            'ALTER TABLE servicos MODIFY COLUMN aliquota_csll decimal(7,2) default null;',
            'ALTER TABLE servicos ADD COLUMN aliquota_csll decimal(7,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'valor_deducoes'
            ),
            'ALTER TABLE servicos MODIFY COLUMN valor_deducoes decimal(16,7) default null;',
            'ALTER TABLE servicos ADD COLUMN valor_deducoes decimal(16,7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'desconto_incondicional'
            ),
            'ALTER TABLE servicos MODIFY COLUMN desconto_incondicional decimal(16,7) default null;',
            'ALTER TABLE servicos ADD COLUMN desconto_incondicional decimal(16,7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'desconto_condicional'
            ),
            'ALTER TABLE servicos MODIFY COLUMN desconto_condicional decimal(16,7) default null;',
            'ALTER TABLE servicos ADD COLUMN desconto_condicional decimal(16,7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'outras_retencoes'
            ),
            'ALTER TABLE servicos MODIFY COLUMN outras_retencoes decimal(16,7) default null;',
            'ALTER TABLE servicos ADD COLUMN outras_retencoes decimal(16,7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tipo_producao'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tipo_producao boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN tipo_producao boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'auto_cadastro'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN auto_cadastro boolean default 1;',
            'ALTER TABLE configuracao_supers ADD COLUMN auto_cadastro boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'usar_ibpt'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN usar_ibpt boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN usar_ibpt boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_producaos'
                  AND COLUMN_NAME = 'observacao'
            ),
            'ALTER TABLE item_producaos MODIFY COLUMN observacao varchar(100) default null;',
            'ALTER TABLE item_producaos ADD COLUMN observacao varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_producaos'
                  AND COLUMN_NAME = 'dimensao'
            ),
            'ALTER TABLE item_producaos MODIFY COLUMN dimensao varchar(100) default null;',
            'ALTER TABLE item_producaos ADD COLUMN dimensao varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'incluir_servico'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN incluir_servico boolean default 0;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN incluir_servico boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_nves modify column quantidade decimal(12,4);
alter table item_nfces modify column quantidade decimal(12,4);
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'casas_decimais_quantidade'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN casas_decimais_quantidade integer default 2;',
            'ALTER TABLE config_gerals ADD COLUMN casas_decimais_quantidade integer default 2;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cash_back_configs'
                  AND COLUMN_NAME = 'mensagem_automatica_5_dias'
            ),
            'ALTER TABLE cash_back_configs MODIFY COLUMN mensagem_automatica_5_dias text;',
            'ALTER TABLE cash_back_configs ADD COLUMN mensagem_automatica_5_dias text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cash_back_configs'
                  AND COLUMN_NAME = 'mensagem_automatica_1_dia'
            ),
            'ALTER TABLE cash_back_configs MODIFY COLUMN mensagem_automatica_1_dia text;',
            'ALTER TABLE cash_back_configs ADD COLUMN mensagem_automatica_1_dia text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'localizacaos'
                  AND COLUMN_NAME = 'token_whatsapp'
            ),
            'ALTER TABLE localizacaos MODIFY COLUMN token_whatsapp varchar(120) default null;',
            'ALTER TABLE localizacaos ADD COLUMN token_whatsapp varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE produtos MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE produtos ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE categoria_produtos ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE users MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE users ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'definir_vendedor_pdv'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN definir_vendedor_pdv boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN definir_vendedor_pdv boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'cliente_padrao_pdv_off'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN cliente_padrao_pdv_off integer default null;',
            'ALTER TABLE config_gerals ADD COLUMN cliente_padrao_pdv_off integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'motivo_estorno'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN motivo_estorno varchar(255) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN motivo_estorno varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'motivo_estorno'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN motivo_estorno varchar(255) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN motivo_estorno varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'asaas_token_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN asaas_token_boleto varchar(255) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN asaas_token_boleto varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'receber_com_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN receber_com_boleto boolean default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN receber_com_boleto boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'receber_com_boleto'
            ),
            'ALTER TABLE empresas MODIFY COLUMN receber_com_boleto boolean default 0;',
            'ALTER TABLE empresas ADD COLUMN receber_com_boleto boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'dia_vencimento_boleto'
            ),
            'ALTER TABLE empresas MODIFY COLUMN dia_vencimento_boleto integer default null;',
            'ALTER TABLE empresas ADD COLUMN dia_vencimento_boleto integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'asaas_id'
            ),
            'ALTER TABLE empresas MODIFY COLUMN asaas_id varchar(20) default null;',
            'ALTER TABLE empresas ADD COLUMN asaas_id varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'percentual_juros_padrao_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN percentual_juros_padrao_boleto decimal(5,2) default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN percentual_juros_padrao_boleto decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'percentual_multa_padrao_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN percentual_multa_padrao_boleto decimal(5,2) default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN percentual_multa_padrao_boleto decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'dias_atraso_suspender_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN dias_atraso_suspender_boleto integer default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN dias_atraso_suspender_boleto integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'sandbox_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN sandbox_boleto boolean default 1;',
            'ALTER TABLE configuracao_supers ADD COLUMN sandbox_boleto boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'id_estrangeiro'
            ),
            'ALTER TABLE clientes MODIFY COLUMN id_estrangeiro varchar(30) default null;',
            'ALTER TABLE clientes ADD COLUMN id_estrangeiro varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'codigo_pais'
            ),
            'ALTER TABLE clientes MODIFY COLUMN codigo_pais varchar(4) default null;',
            'ALTER TABLE clientes ADD COLUMN codigo_pais varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fornecedors'
                  AND COLUMN_NAME = 'id_estrangeiro'
            ),
            'ALTER TABLE fornecedors MODIFY COLUMN id_estrangeiro varchar(30) default null;',
            'ALTER TABLE fornecedors ADD COLUMN id_estrangeiro varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fornecedors'
                  AND COLUMN_NAME = 'codigo_pais'
            ),
            'ALTER TABLE fornecedors MODIFY COLUMN codigo_pais varchar(4) default null;',
            'ALTER TABLE fornecedors ADD COLUMN codigo_pais varchar(4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'gerar_conta_receber_padrao'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN gerar_conta_receber_padrao boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN gerar_conta_receber_padrao boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'tipo_servico'
            ),
            'ALTER TABLE ctes MODIFY COLUMN tipo_servico integer default null;',
            'ALTER TABLE ctes ADD COLUMN tipo_servico integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'doc_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN doc_anterior varchar(20) default null;',
            'ALTER TABLE ctes ADD COLUMN doc_anterior varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'emitente_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN emitente_anterior varchar(100) default null;',
            'ALTER TABLE ctes ADD COLUMN emitente_anterior varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'tp_doc_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN tp_doc_anterior varchar(2) default null;',
            'ALTER TABLE ctes ADD COLUMN tp_doc_anterior varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'serie_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN serie_anterior varchar(3) default null;',
            'ALTER TABLE ctes ADD COLUMN serie_anterior varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'n_doc_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN n_doc_anterior varchar(8) default null;',
            'ALTER TABLE ctes ADD COLUMN n_doc_anterior varchar(8) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'data_emissao_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN data_emissao_anterior date default null;',
            'ALTER TABLE ctes ADD COLUMN data_emissao_anterior date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'uf_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN uf_anterior varchar(2) default null;',
            'ALTER TABLE ctes ADD COLUMN uf_anterior varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'ie_anterior'
            ),
            'ALTER TABLE ctes MODIFY COLUMN ie_anterior varchar(20) default null;',
            'ALTER TABLE ctes ADD COLUMN ie_anterior varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'referencia_cte'
            ),
            'ALTER TABLE ctes MODIFY COLUMN referencia_cte varchar(44) default null;',
            'ALTER TABLE ctes ADD COLUMN referencia_cte varchar(44) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'lista_precos'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE lista_precos MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE lista_precos ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'funcionarios'
                  AND COLUMN_NAME = 'permite_alterar_valor_app'
            ),
            'ALTER TABLE funcionarios MODIFY COLUMN permite_alterar_valor_app boolean default 1;',
            'ALTER TABLE funcionarios ADD COLUMN permite_alterar_valor_app boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'contrato_empresas'
                  AND COLUMN_NAME = 'texto'
            ),
            'ALTER TABLE contrato_empresas MODIFY COLUMN texto text;',
            'ALTER TABLE contrato_empresas ADD COLUMN texto text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'cpf_cnpj_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN cpf_cnpj_tomador varchar(18) default null;',
            'ALTER TABLE ctes ADD COLUMN cpf_cnpj_tomador varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'ie_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN ie_tomador varchar(15) default null;',
            'ALTER TABLE ctes ADD COLUMN ie_tomador varchar(15) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'razao_social_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN razao_social_tomador varchar(60) default null;',
            'ALTER TABLE ctes ADD COLUMN razao_social_tomador varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'nome_fantasia_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN nome_fantasia_tomador varchar(60) default null;',
            'ALTER TABLE ctes ADD COLUMN nome_fantasia_tomador varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'telefone_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN telefone_tomador varchar(20) default null;',
            'ALTER TABLE ctes ADD COLUMN telefone_tomador varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'email_tomador'
            ),
            'ALTER TABLE ctes MODIFY COLUMN email_tomador varchar(60) default null;',
            'ALTER TABLE ctes ADD COLUMN email_tomador varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ecommerce_configs'
                  AND COLUMN_NAME = 'cor_principal'
            ),
            'ALTER TABLE ecommerce_configs MODIFY COLUMN cor_principal varchar(10) default \'#000\';',
            'ALTER TABLE ecommerce_configs ADD COLUMN cor_principal varchar(10) default \'#000\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'mensagem_padrao_impressao_venda'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN mensagem_padrao_impressao_venda text;',
            'ALTER TABLE config_gerals ADD COLUMN mensagem_padrao_impressao_venda text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'mensagem_padrao_impressao_os'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN mensagem_padrao_impressao_os text;',
            'ALTER TABLE config_gerals ADD COLUMN mensagem_padrao_impressao_os text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'ultimo_codigo_produto'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN ultimo_codigo_produto integer default 0;',
            'ALTER TABLE config_gerals ADD COLUMN ultimo_codigo_produto integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'ultimo_codigo_cliente'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN ultimo_codigo_cliente integer default 0;',
            'ALTER TABLE config_gerals ADD COLUMN ultimo_codigo_cliente integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'ultimo_codigo_fornecedor'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN ultimo_codigo_fornecedor integer default 0;',
            'ALTER TABLE config_gerals ADD COLUMN ultimo_codigo_fornecedor integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fornecedors'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE fornecedors MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE fornecedors ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE clientes MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE clientes ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'app_valor_aprazo'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN app_valor_aprazo boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN app_valor_aprazo boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'valor_prazo'
            ),
            'ALTER TABLE produtos MODIFY COLUMN valor_prazo decimal(12,4) default null;',
            'ALTER TABLE produtos ADD COLUMN valor_prazo decimal(12,4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'impressao_sem_janela_cupom'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN impressao_sem_janela_cupom boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN impressao_sem_janela_cupom boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'impresso'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN impresso boolean default 0;',
            'ALTER TABLE item_pedidos ADD COLUMN impresso boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedido_deliveries'
                  AND COLUMN_NAME = 'impresso'
            ),
            'ALTER TABLE item_pedido_deliveries MODIFY COLUMN impresso boolean default 0;',
            'ALTER TABLE item_pedido_deliveries ADD COLUMN impresso boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedido_deliveries'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE pedido_deliveries MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE pedido_deliveries ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'usuario_alterar_plano'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN usuario_alterar_plano boolean default 1;',
            'ALTER TABLE configuracao_supers ADD COLUMN usuario_alterar_plano boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'adicionals'
                  AND COLUMN_NAME = 'categoria_id'
            ),
            'ALTER TABLE adicionals MODIFY COLUMN categoria_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE adicionals ADD COLUMN categoria_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'acrescimo'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN acrescimo decimal(10,2) default 0;',
            'ALTER TABLE pedidos ADD COLUMN acrescimo decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'percentual_taxa_servico'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN percentual_taxa_servico decimal(5,2) default 0;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN percentual_taxa_servico decimal(5,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'alterar_valor_pdv_off'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN alterar_valor_pdv_off boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN alterar_valor_pdv_off boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'info_topo_menu'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN info_topo_menu boolean default 1;',
            'ALTER TABLE configuracao_supers ADD COLUMN info_topo_menu boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'dias_alerta_boleto'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN dias_alerta_boleto integer default 10;',
            'ALTER TABLE configuracao_supers ADD COLUMN dias_alerta_boleto integer default 10;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ifood_configs'
                  AND COLUMN_NAME = 'merchantUUID'
            ),
            'ALTER TABLE ifood_configs MODIFY COLUMN merchantUUID varchar(40) default null;',
            'ALTER TABLE ifood_configs ADD COLUMN merchantUUID varchar(40) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'ifood_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN ifood_id varchar(50) default null;',
            'ALTER TABLE produtos ADD COLUMN ifood_id varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'token_ibpt'
            ),
            'ALTER TABLE empresas MODIFY COLUMN token_ibpt varchar(200) default null;',
            'ALTER TABLE empresas ADD COLUMN token_ibpt varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'vendizap_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN vendizap_id varchar(50) default null;',
            'ALTER TABLE produtos ADD COLUMN vendizap_id varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'tema_padrao'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN tema_padrao enum(\'light\', \'dark\') default \'light\';',
            'ALTER TABLE configuracao_supers ADD COLUMN tema_padrao enum(\'light\', \'dark\') default \'light\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'tema_padrao'
            ),
            'ALTER TABLE users MODIFY COLUMN tema_padrao varchar(10) default null;',
            'ALTER TABLE users ADD COLUMN tema_padrao varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'vendizap_valor'
            ),
            'ALTER TABLE produtos MODIFY COLUMN vendizap_valor decimal(12, 4) default null;',
            'ALTER TABLE produtos ADD COLUMN vendizap_valor decimal(12, 4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'variacao_modelos'
                  AND COLUMN_NAME = 'vendizap_id'
            ),
            'ALTER TABLE variacao_modelos MODIFY COLUMN vendizap_id varchar(50) default null;',
            'ALTER TABLE variacao_modelos ADD COLUMN vendizap_id varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'variacao_modelo_items'
                  AND COLUMN_NAME = 'vendizap_id'
            ),
            'ALTER TABLE variacao_modelo_items MODIFY COLUMN vendizap_id varchar(50) default null;',
            'ALTER TABLE variacao_modelo_items ADD COLUMN vendizap_id varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'mesa_id'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN mesa_id integer default null;',
            'ALTER TABLE pedidos ADD COLUMN mesa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'local_pedido'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN local_pedido varchar(10) default null;',
            'ALTER TABLE pedidos ADD COLUMN local_pedido varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'qr_code_mesa'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN qr_code_mesa boolean default 0;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN qr_code_mesa boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'cor_principal'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN cor_principal varchar(10) default null;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN cor_principal varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'destaque_cardapio'
            ),
            'ALTER TABLE produtos MODIFY COLUMN destaque_cardapio boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN destaque_cardapio boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'oferta_cardapio'
            ),
            'ALTER TABLE produtos MODIFY COLUMN oferta_cardapio boolean default 0;',
            'ALTER TABLE produtos ADD COLUMN oferta_cardapio boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'session_cart_cardapio'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN session_cart_cardapio varchar(30) default null;',
            'ALTER TABLE pedidos ADD COLUMN session_cart_cardapio varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_cardapios'
                  AND COLUMN_NAME = 'cliente_nome'
            ),
            'ALTER TABLE carrinho_cardapios MODIFY COLUMN cliente_nome varchar(50) default null;',
            'ALTER TABLE carrinho_cardapios ADD COLUMN cliente_nome varchar(50) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_variacaos'
                  AND COLUMN_NAME = 'variacao_modelo_item_id'
            ),
            'ALTER TABLE produto_variacaos MODIFY COLUMN variacao_modelo_item_id integer default null;',
            'ALTER TABLE produto_variacaos ADD COLUMN variacao_modelo_item_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'confirma_mesa'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN confirma_mesa boolean default 1;',
            'ALTER TABLE pedidos ADD COLUMN confirma_mesa boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'sub_variacao_modelo_id'
            ),
            'ALTER TABLE produtos MODIFY COLUMN sub_variacao_modelo_id integer default null;',
            'ALTER TABLE produtos ADD COLUMN sub_variacao_modelo_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'duplicar_cpf_cnpj'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN duplicar_cpf_cnpj boolean default 1;',
            'ALTER TABLE configuracao_supers ADD COLUMN duplicar_cpf_cnpj boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'finalizacao_pdv'
            ),
            'ALTER TABLE users MODIFY COLUMN finalizacao_pdv varchar(25) default null;',
            'ALTER TABLE users ADD COLUMN finalizacao_pdv varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'nome_cardapio'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN nome_cardapio varchar(60) default null;',
            'ALTER TABLE item_pedidos ADD COLUMN nome_cardapio varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'telefone_cardapio'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN telefone_cardapio varchar(20) default null;',
            'ALTER TABLE item_pedidos ADD COLUMN telefone_cardapio varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_pedidos'
                  AND COLUMN_NAME = 'finalizado_pdv'
            ),
            'ALTER TABLE item_pedidos MODIFY COLUMN finalizado_pdv boolean default 0;',
            'ALTER TABLE item_pedidos ADD COLUMN finalizado_pdv boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'session_cart_user'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN session_cart_user varchar(30) default null;',
            'ALTER TABLE pedidos ADD COLUMN session_cart_user varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'carrinho_cardapios'
                  AND COLUMN_NAME = 'session_cart_user'
            ),
            'ALTER TABLE carrinho_cardapios MODIFY COLUMN session_cart_user varchar(30) default null;',
            'ALTER TABLE carrinho_cardapios ADD COLUMN session_cart_user varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'limite_pessoas_qr_code'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN limite_pessoas_qr_code integer default null;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN limite_pessoas_qr_code integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'agendamentos'
                  AND COLUMN_NAME = 'numero_sequencial'
            ),
            'ALTER TABLE agendamentos MODIFY COLUMN numero_sequencial integer default null;',
            'ALTER TABLE agendamentos ADD COLUMN numero_sequencial integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'categoria_conta_id'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN categoria_conta_id integer default null;',
            'ALTER TABLE conta_recebers ADD COLUMN categoria_conta_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'categoria_conta_id'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN categoria_conta_id integer default null;',
            'ALTER TABLE conta_pagars ADD COLUMN categoria_conta_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'veiculo_id'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN veiculo_id integer default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN veiculo_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'placa'
            ),
            'ALTER TABLE nfces MODIFY COLUMN placa varchar(9) default null;',
            'ALTER TABLE nfces ADD COLUMN placa varchar(9) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'uf'
            ),
            'ALTER TABLE nfces MODIFY COLUMN uf varchar(2) default null;',
            'ALTER TABLE nfces ADD COLUMN uf varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'numeracao_volumes'
            ),
            'ALTER TABLE nfces MODIFY COLUMN numeracao_volumes varchar(20) default null;',
            'ALTER TABLE nfces ADD COLUMN numeracao_volumes varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'especie'
            ),
            'ALTER TABLE nfces MODIFY COLUMN especie varchar(20) default null;',
            'ALTER TABLE nfces ADD COLUMN especie varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'peso_liquido'
            ),
            'ALTER TABLE nfces MODIFY COLUMN peso_liquido decimal(8, 3) default null;',
            'ALTER TABLE nfces ADD COLUMN peso_liquido decimal(8, 3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'peso_bruto'
            ),
            'ALTER TABLE nfces MODIFY COLUMN peso_bruto decimal(8, 3) default null;',
            'ALTER TABLE nfces ADD COLUMN peso_bruto decimal(8, 3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'valor_frete'
            ),
            'ALTER TABLE nfces MODIFY COLUMN valor_frete decimal(12, 2) default null;',
            'ALTER TABLE nfces ADD COLUMN valor_frete decimal(12, 2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'transportadora_id'
            ),
            'ALTER TABLE nfces MODIFY COLUMN transportadora_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE nfces ADD COLUMN transportadora_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'tipo'
            ),
            'ALTER TABLE nfces MODIFY COLUMN tipo integer default null;',
            'ALTER TABLE nfces ADD COLUMN tipo integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nfces'
                  AND COLUMN_NAME = 'qtd_volumes'
            ),
            'ALTER TABLE nfces MODIFY COLUMN qtd_volumes integer default null;',
            'ALTER TABLE nfces ADD COLUMN qtd_volumes integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'data_nascimento'
            ),
            'ALTER TABLE clientes MODIFY COLUMN data_nascimento date default null;',
            'ALTER TABLE clientes ADD COLUMN data_nascimento date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'valor_original'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN valor_original decimal(16,7) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN valor_original decimal(16,7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'recebimento_parcial'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN recebimento_parcial boolean default 0;',
            'ALTER TABLE conta_recebers ADD COLUMN recebimento_parcial boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'desconto'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN desconto decimal(16, 7) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN desconto decimal(16, 7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'acrescimo'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN acrescimo decimal(16, 7) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN acrescimo decimal(16, 7) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'observacao2'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN observacao2 varchar(100) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN observacao2 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'observacao3'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN observacao3 varchar(100) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN observacao3 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'observacao2'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN observacao2 varchar(100) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN observacao2 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'observacao3'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN observacao3 varchar(100) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN observacao3 varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'resp_tec_email'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN resp_tec_email varchar(80) default null;',
            'ALTER TABLE config_gerals ADD COLUMN resp_tec_email varchar(80) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'resp_tec_cpf_cnpj'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN resp_tec_cpf_cnpj varchar(18) default null;',
            'ALTER TABLE config_gerals ADD COLUMN resp_tec_cpf_cnpj varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'resp_tec_nome'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN resp_tec_nome varchar(60) default null;',
            'ALTER TABLE config_gerals ADD COLUMN resp_tec_nome varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'resp_tec_telefone'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN resp_tec_telefone varchar(20) default null;',
            'ALTER TABLE config_gerals ADD COLUMN resp_tec_telefone varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'modelo_etiquetas'
                  AND COLUMN_NAME = 'distancia_entre_linhas'
            ),
            'ALTER TABLE modelo_etiquetas MODIFY COLUMN distancia_entre_linhas decimal(7,2) default 0;',
            'ALTER TABLE modelo_etiquetas ADD COLUMN distancia_entre_linhas decimal(7,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'limitar_credito_cliente'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN limitar_credito_cliente boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN limitar_credito_cliente boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'market_place_configs'
                  AND COLUMN_NAME = 'token_whatsapp'
            ),
            'ALTER TABLE market_place_configs MODIFY COLUMN token_whatsapp varchar(120) default null;',
            'ALTER TABLE market_place_configs ADD COLUMN token_whatsapp varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_ordem_producaos'
                  AND COLUMN_NAME = 'cliente_id'
            ),
            'ALTER TABLE item_ordem_producaos MODIFY COLUMN cliente_id integer default null;',
            'ALTER TABLE item_ordem_producaos ADD COLUMN cliente_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_ordem_producaos MODIFY column item_producao_id bigint unsigned default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_ordem_producaos'
                  AND COLUMN_NAME = 'numero_pedido'
            ),
            'ALTER TABLE item_ordem_producaos MODIFY COLUMN numero_pedido varchar(100) default null;',
            'ALTER TABLE item_ordem_producaos ADD COLUMN numero_pedido varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'documento_pdv'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN documento_pdv varchar(4) default \'nfce\';',
            'ALTER TABLE config_gerals ADD COLUMN documento_pdv varchar(4) default \'nfce\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'numero_inicial_comanda'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN numero_inicial_comanda integer default null;',
            'ALTER TABLE config_gerals ADD COLUMN numero_inicial_comanda integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'numero_final_comanda'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN numero_final_comanda integer default null;',
            'ALTER TABLE config_gerals ADD COLUMN numero_final_comanda integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'pedidos'
                  AND COLUMN_NAME = 'desconto'
            ),
            'ALTER TABLE pedidos MODIFY COLUMN desconto decimal(10,2) default 0;',
            'ALTER TABLE pedidos ADD COLUMN desconto decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'fatura_reservas'
                  AND COLUMN_NAME = 'conta_receber_id'
            ),
            'ALTER TABLE fatura_reservas MODIFY COLUMN conta_receber_id integer default null;',
            'ALTER TABLE fatura_reservas ADD COLUMN conta_receber_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'corrigir_numeracao_fiscal'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN corrigir_numeracao_fiscal boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN corrigir_numeracao_fiscal boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nfces'
                  AND COLUMN_NAME = 'tamanho_id'
            ),
            'ALTER TABLE item_nfces MODIFY COLUMN tamanho_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE item_nfces ADD COLUMN tamanho_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'categoria_produtos'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE categoria_produtos MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE categoria_produtos ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nfces'
                  AND COLUMN_NAME = 'observacao'
            ),
            'ALTER TABLE item_nfces MODIFY COLUMN observacao varchar(255) default null;',
            'ALTER TABLE item_nfces ADD COLUMN observacao varchar(255) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'nome_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN nome_entrega varchar(60) default null;',
            'ALTER TABLE nves ADD COLUMN nome_entrega varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'documento_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN documento_entrega varchar(20) default null;',
            'ALTER TABLE nves ADD COLUMN documento_entrega varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'rua_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN rua_entrega varchar(60) default null;',
            'ALTER TABLE nves ADD COLUMN rua_entrega varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'cep_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN cep_entrega varchar(9) default null;',
            'ALTER TABLE nves ADD COLUMN cep_entrega varchar(9) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'numero_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN numero_entrega varchar(10) default null;',
            'ALTER TABLE nves ADD COLUMN numero_entrega varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'bairro_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN bairro_entrega varchar(40) default null;',
            'ALTER TABLE nves ADD COLUMN bairro_entrega varchar(40) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'complemento_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN complemento_entrega varchar(100) default null;',
            'ALTER TABLE nves ADD COLUMN complemento_entrega varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'cidade_id_entrega'
            ),
            'ALTER TABLE nves MODIFY COLUMN cidade_id_entrega integer default null;',
            'ALTER TABLE nves ADD COLUMN cidade_id_entrega integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cotacaos'
                  AND COLUMN_NAME = 'planejamento_id'
            ),
            'ALTER TABLE cotacaos MODIFY COLUMN planejamento_id integer default null;',
            'ALTER TABLE cotacaos ADD COLUMN planejamento_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'desconto'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN desconto decimal(14,2) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN desconto decimal(14,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'frete'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN frete decimal(14,2) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN frete decimal(14,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_planejamento_custos'
                  AND COLUMN_NAME = 'peso_especifico'
            ),
            'ALTER TABLE produto_planejamento_custos MODIFY COLUMN peso_especifico decimal(10,2) default null;',
            'ALTER TABLE produto_planejamento_custos ADD COLUMN peso_especifico decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_planejamento_custos'
                  AND COLUMN_NAME = 'calculo'
            ),
            'ALTER TABLE produto_planejamento_custos MODIFY COLUMN calculo decimal(14,4) default null;',
            'ALTER TABLE produto_planejamento_custos ADD COLUMN calculo decimal(14,4) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'gerar_conta_pagar_padrao'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN gerar_conta_pagar_padrao boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN gerar_conta_pagar_padrao boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'modelo_etiquetas'
                  AND COLUMN_NAME = 'referencia'
            ),
            'ALTER TABLE modelo_etiquetas MODIFY COLUMN referencia boolean default 0;',
            'ALTER TABLE modelo_etiquetas ADD COLUMN referencia boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'modelo_etiquetas'
                  AND COLUMN_NAME = 'valor_atacado'
            ),
            'ALTER TABLE modelo_etiquetas MODIFY COLUMN valor_atacado boolean default 0;',
            'ALTER TABLE modelo_etiquetas ADD COLUMN valor_atacado boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'peso_bruto'
            ),
            'ALTER TABLE produtos MODIFY COLUMN peso_bruto decimal(12, 3) default null;',
            'ALTER TABLE produtos ADD COLUMN peso_bruto decimal(12, 3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cotacaos'
                  AND COLUMN_NAME = 'observacao_frete'
            ),
            'ALTER TABLE cotacaos MODIFY COLUMN observacao_frete varchar(200) default null;',
            'ALTER TABLE cotacaos ADD COLUMN observacao_frete varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'cotacaos'
                  AND COLUMN_NAME = 'valor_frete'
            ),
            'ALTER TABLE cotacaos MODIFY COLUMN valor_frete decimal(10,2) default null;',
            'ALTER TABLE cotacaos ADD COLUMN valor_frete decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'contador_id'
            ),
            'ALTER TABLE planos MODIFY COLUMN contador_id integer default null;',
            'ALTER TABLE planos ADD COLUMN contador_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'plano_empresas'
                  AND COLUMN_NAME = 'contador_id'
            ),
            'ALTER TABLE plano_empresas MODIFY COLUMN contador_id integer default null;',
            'ALTER TABLE plano_empresas ADD COLUMN contador_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'nves'
                  AND COLUMN_NAME = 'marca'
            ),
            'ALTER TABLE nves MODIFY COLUMN marca varchar(30) default null;',
            'ALTER TABLE nves ADD COLUMN marca varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'codigo_material'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN codigo_material varchar(60) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN codigo_material varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'equipamento'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN equipamento varchar(200) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN equipamento varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'desenho'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN desenho varchar(200) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN desenho varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'material'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN material varchar(200) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN material varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'quantidade'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN quantidade decimal(10,2) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN quantidade decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'unidade'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN unidade varchar(20) default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN unidade varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planejamento_custos'
                  AND COLUMN_NAME = 'projeto_id'
            ),
            'ALTER TABLE planejamento_custos MODIFY COLUMN projeto_id integer default null;',
            'ALTER TABLE planejamento_custos ADD COLUMN projeto_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ctes'
                  AND COLUMN_NAME = 'tipo_cte'
            ),
            'ALTER TABLE ctes MODIFY COLUMN tipo_cte integer default 0;',
            'ALTER TABLE ctes ADD COLUMN tipo_cte integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_cardapios'
                  AND COLUMN_NAME = 'confirma_mesa'
            ),
            'ALTER TABLE configuracao_cardapios MODIFY COLUMN confirma_mesa boolean default 0;',
            'ALTER TABLE configuracao_cardapios ADD COLUMN confirma_mesa boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'lista_precos'
                  AND COLUMN_NAME = 'valor_alteracao'
            ),
            'ALTER TABLE lista_precos MODIFY COLUMN valor_alteracao decimal(10,2) default 0;',
            'ALTER TABLE lista_precos ADD COLUMN valor_alteracao decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'impressora_pedidos'
                  AND COLUMN_NAME = 'requisicao_segundos'
            ),
            'ALTER TABLE impressora_pedidos MODIFY COLUMN requisicao_segundos integer default 15;',
            'ALTER TABLE impressora_pedidos ADD COLUMN requisicao_segundos integer default 15;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'cadastrar_planos'
            ),
            'ALTER TABLE empresas MODIFY COLUMN cadastrar_planos boolean default 0;',
            'ALTER TABLE empresas ADD COLUMN cadastrar_planos boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'local_armazenamento'
            ),
            'ALTER TABLE produtos MODIFY COLUMN local_armazenamento varchar(200) default null;',
            'ALTER TABLE produtos ADD COLUMN local_armazenamento varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produto_planejamento_custos'
                  AND COLUMN_NAME = 'peso_bruto'
            ),
            'ALTER TABLE produto_planejamento_custos MODIFY COLUMN peso_bruto decimal(10,2) default null;',
            'ALTER TABLE produto_planejamento_custos ADD COLUMN peso_bruto decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_proposta_planejamento_custos'
                  AND COLUMN_NAME = 'peso_bruto'
            ),
            'ALTER TABLE item_proposta_planejamento_custos MODIFY COLUMN peso_bruto decimal(10,2) default null;',
            'ALTER TABLE item_proposta_planejamento_custos ADD COLUMN peso_bruto decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'home_componentes'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN home_componentes varchar(255) default \'[]\';',
            'ALTER TABLE config_gerals ADD COLUMN home_componentes varchar(255) default \'[]\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table config_gerals modify column home_componentes text;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'token_whatsapp'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN token_whatsapp varchar(120) default null;',
            'ALTER TABLE config_gerals ADD COLUMN token_whatsapp varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pICMSEfet'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pICMSEfet decimal(5,2) default null;',
            'ALTER TABLE produtos ADD COLUMN pICMSEfet decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'pRedBCEfet'
            ),
            'ALTER TABLE produtos MODIFY COLUMN pRedBCEfet decimal(5,2) default null;',
            'ALTER TABLE produtos ADD COLUMN pRedBCEfet decimal(5,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'nDI'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN nDI varchar(30) default null;',
            'ALTER TABLE item_nves ADD COLUMN nDI varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'dDI'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN dDI date default null;',
            'ALTER TABLE item_nves ADD COLUMN dDI date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'dDesemb'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN dDesemb date default null;',
            'ALTER TABLE item_nves ADD COLUMN dDesemb date default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'tpViaTransp'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN tpViaTransp varchar(2) default null;',
            'ALTER TABLE item_nves ADD COLUMN tpViaTransp varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vAFRMM'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vAFRMM decimal(12,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vAFRMM decimal(12,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'tpIntermedio'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN tpIntermedio varchar(2) default null;',
            'ALTER TABLE item_nves ADD COLUMN tpIntermedio varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'cpf_cnpj_di'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN cpf_cnpj_di varchar(18) default null;',
            'ALTER TABLE item_nves ADD COLUMN cpf_cnpj_di varchar(18) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'UFTerceiro'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN UFTerceiro varchar(2) default null;',
            'ALTER TABLE item_nves ADD COLUMN UFTerceiro varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'cExportador'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN cExportador varchar(30) default null;',
            'ALTER TABLE item_nves ADD COLUMN cExportador varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'nAdicao'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN nAdicao varchar(10) default null;',
            'ALTER TABLE item_nves ADD COLUMN nAdicao varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'cFabricante'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN cFabricante varchar(20) default null;',
            'ALTER TABLE item_nves ADD COLUMN cFabricante varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'cidade_desembarque_id'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN cidade_desembarque_id integer default null;',
            'ALTER TABLE item_nves ADD COLUMN cidade_desembarque_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vBCII'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vBCII decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vBCII decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vDespAdu'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vDespAdu decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vDespAdu decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vII'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vII decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vII decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vIOF'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vIOF decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vIOF decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'referencia'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN referencia varchar(60) default null;',
            'ALTER TABLE conta_recebers ADD COLUMN referencia varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'referencia'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN referencia varchar(60) default null;',
            'ALTER TABLE conta_pagars ADD COLUMN referencia varchar(60) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_pagars'
                  AND COLUMN_NAME = 'conta_empresa_id'
            ),
            'ALTER TABLE conta_pagars MODIFY COLUMN conta_empresa_id integer default null;',
            'ALTER TABLE conta_pagars ADD COLUMN conta_empresa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'conta_empresa_id'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN conta_empresa_id integer default null;',
            'ALTER TABLE conta_recebers ADD COLUMN conta_empresa_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'cst_ibscbs'
            ),
            'ALTER TABLE produtos MODIFY COLUMN cst_ibscbs varchar(3) default null;',
            'ALTER TABLE produtos ADD COLUMN cst_ibscbs varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'cclass_trib'
            ),
            'ALTER TABLE produtos MODIFY COLUMN cclass_trib varchar(10) default null;',
            'ALTER TABLE produtos ADD COLUMN cclass_trib varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_ibs_uf'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_ibs_uf decimal(10,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_ibs_uf decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_ibs_mun'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_ibs_mun decimal(10,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_ibs_mun decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_cbs'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_cbs decimal(10,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_cbs decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'perc_dif'
            ),
            'ALTER TABLE produtos MODIFY COLUMN perc_dif decimal(10,2) default 0;',
            'ALTER TABLE produtos ADD COLUMN perc_dif decimal(10,2) default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'small_header_user'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN small_header_user varchar(50) default \'small-4.png\';',
            'ALTER TABLE config_gerals ADD COLUMN small_header_user varchar(50) default \'small-4.png\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'email_aviso_novo_cadastro'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN email_aviso_novo_cadastro varchar(120) default null;',
            'ALTER TABLE configuracao_supers ADD COLUMN email_aviso_novo_cadastro varchar(120) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'tipo_item_sped'
            ),
            'ALTER TABLE produtos MODIFY COLUMN tipo_item_sped varchar(2) default null;',
            'ALTER TABLE produtos ADD COLUMN tipo_item_sped varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'cliente_id'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN cliente_id integer default null;',
            'ALTER TABLE item_conta_empresas ADD COLUMN cliente_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'fornecedor_id'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN fornecedor_id integer default null;',
            'ALTER TABLE item_conta_empresas ADD COLUMN fornecedor_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'numero_documento'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN numero_documento varchar(100) default null;',
            'ALTER TABLE item_conta_empresas ADD COLUMN numero_documento varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'categoria_id'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN categoria_id bigint unsigned DEFAULT NULL',
            'ALTER TABLE item_conta_empresas ADD COLUMN categoria_id bigint unsigned DEFAULT NULL'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'conta_pagar_id'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN conta_pagar_id integer default null;',
            'ALTER TABLE item_conta_empresas ADD COLUMN conta_pagar_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_conta_empresas'
                  AND COLUMN_NAME = 'conta_receber_id'
            ),
            'ALTER TABLE item_conta_empresas MODIFY COLUMN conta_receber_id integer default null;',
            'ALTER TABLE item_conta_empresas ADD COLUMN conta_receber_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'registro_tefs'
                  AND COLUMN_NAME = 'finalizacao'
            ),
            'ALTER TABLE registro_tefs MODIFY COLUMN finalizacao varchar(30) default null;',
            'ALTER TABLE registro_tefs ADD COLUMN finalizacao varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'descricao'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN descricao varchar(200) default null;',
            'ALTER TABLE item_nves ADD COLUMN descricao varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'manifesto_dves'
                  AND COLUMN_NAME = 'tpNF'
            ),
            'ALTER TABLE manifesto_dves MODIFY COLUMN tpNF integer default null;',
            'ALTER TABLE manifesto_dves ADD COLUMN tpNF integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'cobrar_apos_auto_cadastro'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN cobrar_apos_auto_cadastro boolean default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN cobrar_apos_auto_cadastro boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'descricao_curta'
            ),
            'ALTER TABLE planos MODIFY COLUMN descricao_curta varchar(200) default null;',
            'ALTER TABLE planos ADD COLUMN descricao_curta varchar(200) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'planos'
                  AND COLUMN_NAME = 'dias_teste'
            ),
            'ALTER TABLE planos MODIFY COLUMN dias_teste integer default null;',
            'ALTER TABLE planos ADD COLUMN dias_teste integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'plano_auto_cadastro'
            ),
            'ALTER TABLE users MODIFY COLUMN plano_auto_cadastro integer default null;',
            'ALTER TABLE users ADD COLUMN plano_auto_cadastro integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'mensagem_wpp_link'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN mensagem_wpp_link text;',
            'ALTER TABLE config_gerals ADD COLUMN mensagem_wpp_link text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'status_wpp_link'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN status_wpp_link boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN status_wpp_link boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'enviar_danfe_wpp_link'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN enviar_danfe_wpp_link boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN enviar_danfe_wpp_link boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'enviar_xml_wpp_link'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN enviar_xml_wpp_link boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN enviar_xml_wpp_link boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'enviar_pedido_a4_wpp_link'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN enviar_pedido_a4_wpp_link boolean default 0;',
            'ALTER TABLE config_gerals ADD COLUMN enviar_pedido_a4_wpp_link boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'nome_pagador'
            ),
            'ALTER TABLE mdves MODIFY COLUMN nome_pagador varchar(100) default null;',
            'ALTER TABLE mdves ADD COLUMN nome_pagador varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'documento_pagador'
            ),
            'ALTER TABLE mdves MODIFY COLUMN documento_pagador varchar(20) default null;',
            'ALTER TABLE mdves ADD COLUMN documento_pagador varchar(20) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'ind_pag'
            ),
            'ALTER TABLE mdves MODIFY COLUMN ind_pag varchar(2) default null;',
            'ALTER TABLE mdves ADD COLUMN ind_pag varchar(2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mdves'
                  AND COLUMN_NAME = 'valor_transporte'
            ),
            'ALTER TABLE mdves MODIFY COLUMN valor_transporte decimal(10,2) default null;',
            'ALTER TABLE mdves ADD COLUMN valor_transporte decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'configuracao_supers'
                  AND COLUMN_NAME = 'landing_page'
            ),
            'ALTER TABLE configuracao_supers MODIFY COLUMN landing_page boolean default 0;',
            'ALTER TABLE configuracao_supers ADD COLUMN landing_page boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'produtos_exibe_tabela'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN produtos_exibe_tabela boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN produtos_exibe_tabela boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'itens_por_pagina'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN itens_por_pagina integer default 30;',
            'ALTER TABLE config_gerals ADD COLUMN itens_por_pagina integer default 30;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'clientes'
                  AND COLUMN_NAME = 'imagem'
            ),
            'ALTER TABLE clientes MODIFY COLUMN imagem varchar(25) default null;',
            'ALTER TABLE clientes ADD COLUMN imagem varchar(25) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'clientes_exibe_tabela'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN clientes_exibe_tabela boolean default 1;',
            'ALTER TABLE config_gerals ADD COLUMN clientes_exibe_tabela boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'cst_ibscbs'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN cst_ibscbs varchar(3) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN cst_ibscbs varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'cclass_trib'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN cclass_trib varchar(10) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN cclass_trib varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'perc_ibs_uf'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN perc_ibs_uf decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN perc_ibs_uf decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'perc_ibs_mun'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN perc_ibs_mun decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN perc_ibs_mun decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'perc_cbs'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN perc_cbs decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN perc_cbs decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produtos'
                  AND COLUMN_NAME = 'perc_dif'
            ),
            'ALTER TABLE padrao_tributacao_produtos MODIFY COLUMN perc_dif decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produtos ADD COLUMN perc_dif decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'cst_ibscbs'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN cst_ibscbs varchar(3) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN cst_ibscbs varchar(3) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'cclass_trib'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN cclass_trib varchar(10) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN cclass_trib varchar(10) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'perc_ibs_uf'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN perc_ibs_uf decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN perc_ibs_uf decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'perc_ibs_mun'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN perc_ibs_mun decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN perc_ibs_mun decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'perc_cbs'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN perc_cbs decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN perc_cbs decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'padrao_tributacao_produto_supers'
                  AND COLUMN_NAME = 'perc_dif'
            ),
            'ALTER TABLE padrao_tributacao_produto_supers MODIFY COLUMN perc_dif decimal(10,2) default null;',
            'ALTER TABLE padrao_tributacao_produto_supers ADD COLUMN perc_dif decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'produtos'
                  AND COLUMN_NAME = 'prazo_garantia'
            ),
            'ALTER TABLE produtos MODIFY COLUMN prazo_garantia integer default null;',
            'ALTER TABLE produtos ADD COLUMN prazo_garantia integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_nves'
                  AND COLUMN_NAME = 'vICMSSubstituto'
            ),
            'ALTER TABLE item_nves MODIFY COLUMN vICMSSubstituto decimal(10,2) default null;',
            'ALTER TABLE item_nves ADD COLUMN vICMSSubstituto decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'natureza_operacaos'
                  AND COLUMN_NAME = 'movimentar_estoque'
            ),
            'ALTER TABLE natureza_operacaos MODIFY COLUMN movimentar_estoque boolean default 1;',
            'ALTER TABLE natureza_operacaos ADD COLUMN movimentar_estoque boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mensagem_padrao_crms'
                  AND COLUMN_NAME = 'mensagem_para_agendamento'
            ),
            'ALTER TABLE mensagem_padrao_crms MODIFY COLUMN mensagem_para_agendamento boolean default 0;',
            'ALTER TABLE mensagem_padrao_crms ADD COLUMN mensagem_para_agendamento boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'mensagem_padrao_crms'
                  AND COLUMN_NAME = 'dias_apos_agendamento'
            ),
            'ALTER TABLE mensagem_padrao_crms MODIFY COLUMN dias_apos_agendamento integer default 0;',
            'ALTER TABLE mensagem_padrao_crms ADD COLUMN dias_apos_agendamento integer default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'hash_link'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN hash_link varchar(30) default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN hash_link varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'garantias'
                  AND COLUMN_NAME = 'servico_id'
            ),
            'ALTER TABLE garantias MODIFY COLUMN servico_id integer default null;',
            'ALTER TABLE garantias ADD COLUMN servico_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table garantias modify column produto_id bigint(20) UNSIGNED null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'tipo_servico'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN tipo_servico varchar(30) default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN tipo_servico varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'diagnostico_cliente'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN diagnostico_cliente text;',
            'ALTER TABLE ordem_servicos ADD COLUMN diagnostico_cliente text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'diagnostico_tecnico'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN diagnostico_tecnico text;',
            'ALTER TABLE ordem_servicos ADD COLUMN diagnostico_tecnico text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'defeito_encontrado'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN defeito_encontrado text;',
            'ALTER TABLE ordem_servicos ADD COLUMN defeito_encontrado text;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'config_gerals'
                  AND COLUMN_NAME = 'tipo_ordem_servico'
            ),
            'ALTER TABLE config_gerals MODIFY COLUMN tipo_ordem_servico varchar(50) default \'normal\';',
            'ALTER TABLE config_gerals ADD COLUMN tipo_ordem_servico varchar(50) default \'normal\';'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'equipamento'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN equipamento varchar(100) default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN equipamento varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'numero_serie'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN numero_serie varchar(100) default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN numero_serie varchar(100) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'cor'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN cor varchar(30) default null;',
            'ALTER TABLE ordem_servicos ADD COLUMN cor varchar(30) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'ordem_servicos'
                  AND COLUMN_NAME = 'faturada'
            ),
            'ALTER TABLE ordem_servicos MODIFY COLUMN faturada boolean default 0;',
            'ALTER TABLE ordem_servicos ADD COLUMN faturada boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'servicos'
                  AND COLUMN_NAME = 'prazo_garantia'
            ),
            'ALTER TABLE servicos MODIFY COLUMN prazo_garantia integer default null;',
            'ALTER TABLE servicos ADD COLUMN prazo_garantia integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'conta_recebers'
                  AND COLUMN_NAME = 'ordem_servico_id'
            ),
            'ALTER TABLE conta_recebers MODIFY COLUMN ordem_servico_id integer default null;',
            'ALTER TABLE conta_recebers ADD COLUMN ordem_servico_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'garantias'
                  AND COLUMN_NAME = 'ordem_servico_id'
            ),
            'ALTER TABLE garantias MODIFY COLUMN ordem_servico_id integer default null;',
            'ALTER TABLE garantias ADD COLUMN ordem_servico_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'empresas'
                  AND COLUMN_NAME = 'substituto_tributario'
            ),
            'ALTER TABLE empresas MODIFY COLUMN substituto_tributario boolean default 0;',
            'ALTER TABLE empresas ADD COLUMN substituto_tributario boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'localizacaos'
                  AND COLUMN_NAME = 'substituto_tributario'
            ),
            'ALTER TABLE localizacaos MODIFY COLUMN substituto_tributario boolean default 0;',
            'ALTER TABLE localizacaos ADD COLUMN substituto_tributario boolean default 0;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

alter table item_inventarios modify column estado varchar(15) default null;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'trocas'
                  AND COLUMN_NAME = 'nfe_id'
            ),
            'ALTER TABLE trocas MODIFY COLUMN nfe_id integer default null;',
            'ALTER TABLE trocas ADD COLUMN nfe_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'trocas'
                  AND COLUMN_NAME = 'caixa_id'
            ),
            'ALTER TABLE trocas MODIFY COLUMN caixa_id BIGINT UNSIGNED NULL;',
            'ALTER TABLE trocas ADD COLUMN caixa_id BIGINT UNSIGNED NULL;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

ALTER TABLE trocas MODIFY COLUMN nfce_id BIGINT UNSIGNED NULL;
SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_trocas'
                  AND COLUMN_NAME = 'valor_unitario'
            ),
            'ALTER TABLE item_trocas MODIFY COLUMN valor_unitario decimal(10,2) default null;',
            'ALTER TABLE item_trocas ADD COLUMN valor_unitario decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'item_trocas'
                  AND COLUMN_NAME = 'sub_total'
            ),
            'ALTER TABLE item_trocas MODIFY COLUMN sub_total decimal(10,2) default null;',
            'ALTER TABLE item_trocas ADD COLUMN sub_total decimal(10,2) default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'credito_clientes'
                  AND COLUMN_NAME = 'troca_id'
            ),
            'ALTER TABLE credito_clientes MODIFY COLUMN troca_id integer default null;',
            'ALTER TABLE credito_clientes ADD COLUMN troca_id integer default null;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT
        IF(
            EXISTS(
                SELECT 1
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE()
                  AND TABLE_NAME = 'credito_clientes'
                  AND COLUMN_NAME = 'status'
            ),
            'ALTER TABLE credito_clientes MODIFY COLUMN status boolean default 1;',
            'ALTER TABLE credito_clientes ADD COLUMN status boolean default 1;'
        )
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS = 1;
