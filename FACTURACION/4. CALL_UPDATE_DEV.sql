--USE ROLE ETL_PROD;
USE DATABASE BI_CDW_DEV;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

CALL UPDATE_PS_FACTURACION();
CALL UPDATE_PS_ANULACION();
