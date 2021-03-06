--BdPeriodos_

--USE ROLE ADMIN_PROD;

USE DATABASE UPN_RPT_DM_PROD;
USE SCHEMA BLACKBOARD;

--CREATE OR REPLACE VIEW BdPeriodos AS
SELECT A.TERM_CODE AS EXTERNAL_TERM_KEY
    , B.STVTERM_DESC AS NAME
    , 'R' AS DURATION
    , CAST(TO_CHAR(A.START_DATE,'YYYYMMDD') AS VARCHAR(10)) AS START_DATE
    , CAST(TO_CHAR(A.END_DATE,'YYYYMMDD') AS VARCHAR(10)) AS END_DATE
    , 'UPN.Periodos.Banner' AS DATA_SOURCE_KEY --'UPN.<Instancia>.Banner.<Nivel>'
FROM ODSMGR.LOE_SECTION_PART_OF_TERM A
		INNER JOIN ODSMGR.LOE_STVTERM B ON A.TERM_CODE = B.STVTERM_CODE
WHERE A.TERM_CODE <> '999996'
    AND CURRENT_DATE BETWEEN TO_DATE(A.START_DATE)-14 AND TO_DATE(A.END_DATE)+10
;