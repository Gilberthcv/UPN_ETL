--TABLA_PS_ANULACION_
--USE ROLE ETL_PROD;
USE DATABASE BI_CDW_DEV;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

CREATE OR REPLACE TABLE PS_ANULACION (
	BUSINESS_UNIT VARCHAR(8),
	ITEM VARCHAR(20),
	ITEM_LINE FLOAT,
	ITEM_SEQ_NUM FLOAT,
	ENTRY_TYPE VARCHAR(8),
	ENTRY_REASON VARCHAR(8),
	ENTRY_AMT FLOAT,
	ACCOUNTING_DT TIMESTAMP_NTZ(9),
	PERIODO_CONTABLE VARCHAR(8),
	JOURNAL_ID_AR VARCHAR(20),
	JOURNAL_DATE_AR TIMESTAMP_NTZ(9),
	FECHA_SINCRONIZACION TIMESTAMP_NTZ(9)
);
