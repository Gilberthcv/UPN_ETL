--TABLA_PS_FACTURACION_
--USE ROLE ETL_PROD;
USE DATABASE BI_CDW_DEV;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

CREATE OR REPLACE TABLE PS_FACTURACION (
	BUSINESS_UNIT VARCHAR(8),
	PO_REF VARCHAR(8),
	PRODUCT VARCHAR(8),
	NIVEL VARCHAR(8),
	OPERATING_UNIT VARCHAR(8),
	CAMPUS VARCHAR(8),
	BILL_TO_CUST_ID VARCHAR(20),
	NOMBRE_COMPLETO VARCHAR(100),
	NOMBRE_COMPLETO_CORPORATE VARCHAR(100),
	BILL_TYPE_ID VARCHAR(8),
	INSTALL_NBR FLOAT,
	INVOICE VARCHAR(20),
	LINE_SEQ_NUM FLOAT,
	DESCR VARCHAR(100),
	SVRSVPR_SRVC_CODE VARCHAR(8),
	SVVSRVC_DESC VARCHAR(100),
	SVVSRVC_SRCA_CODE VARCHAR(20),
	PERIODO_CONTABLE VARCHAR(8),
	INVOICE_DT TIMESTAMP_NTZ(9),
	FECHA_VENCIMIENTO TIMESTAMP_NTZ(9),
	VAT_RGSTRN_ID VARCHAR(20),
	NET_EXTENDED_AMT FLOAT,
	INVOICE_AMOUNT FLOAT,
	ORIGINAL_INVOICE VARCHAR(100),
	ENTRY_TYPE_BI VARCHAR(8),
	ACCOUNT_BI VARCHAR(20),
	JOURNAL_ID_BI VARCHAR(20),
	JOURNAL_DATE_BI TIMESTAMP_NTZ(9),
	REV_RECOG_BASIS_DESC VARCHAR(50),
	MONTO_AFECTO FLOAT,
	MONTO_INAFECTO FLOAT,
	MONTO_IMPUESTO FLOAT,
	MONTO_TOTAL FLOAT,
	SUBCATEGORIA VARCHAR(50),
	CATEGORIA VARCHAR(50),
	PERIODO VARCHAR(20),
	START_DATE TIMESTAMP_NTZ(9),
	END_DATE TIMESTAMP_NTZ(9),
	CARTERA_ACTIVA VARCHAR(1),
	FECHA_SINCRONIZACION TIMESTAMP_NTZ(9)
);
