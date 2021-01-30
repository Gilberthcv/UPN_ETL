--SCRSYLN

--USE ROLE ETL_PROD;
USE DATABASE BI_CDW_DEV;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

CREATE OR REPLACE TABLE SCRSYLN (
	SCRSYLN_SUBJ_CODE VARCHAR(4),
	SCRSYLN_CRSE_NUMB VARCHAR(5),
	SCRSYLN_TERM_CODE_EFF VARCHAR(6),
	SCRSYLN_ACTIVITY_DATE TIMESTAMP_NTZ(9),
	SCRSYLN_USER_ID VARCHAR(30),
	SCRSYLN_TERM_CODE_END VARCHAR(6),
	SCRSYLN_LONG_COURSE_TITLE VARCHAR(100),
	SCRSYLN_COURSE_URL VARCHAR(100),
	SCRSYLN_SURROGATE_ID FLOAT,
	SCRSYLN_VERSION FLOAT,
	SCRSYLN_DATA_ORIGIN VARCHAR(30),
	SCRSYLN_VPDI_CODE VARCHAR(6)
);

GRANT DELETE,INSERT,REFERENCES,SELECT,TRUNCATE,UPDATE ON TABLE SCRSYLN TO ROLE ADMIN_PROD;
GRANT SELECT ON TABLE SCRSYLN TO ROLE UPN_BI;
GRANT ALL ON TABLE SCRSYLN TO ROLE ETL_PROD;

-------------------------------------------------

--USE ROLE ADMIN_PROD;

USE DATABASE UPN_RPT_DM_DEV;
USE SCHEMA SATURN;

CREATE OR REPLACE VIEW SCRSYLN AS SELECT * FROM BI_CDW_DEV.UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN;

GRANT ALL ON VIEW SCRSYLN TO ROLE ETL_PROD;
GRANT SELECT ON VIEW SCRSYLN TO ROLE COGNOS_PROD;
GRANT SELECT ON VIEW SCRSYLN TO ROLE UPN_BI;
GRANT SELECT ON VIEW SCRSYLN TO ROLE UPN_READ_PROD;

-------------------------------------------------

--USE ROLE ADMIN_PROD;

USE DATABASE UPN_RPT_DM_DEV;
USE SCHEMA ODSMGR;

CREATE OR REPLACE VIEW SCRSYLN AS SELECT * FROM UPN_RPT_DM_DEV.SATURN.SCRSYLN;

GRANT ALL ON VIEW SCRSYLN TO ROLE ETL_PROD;
GRANT SELECT ON VIEW SCRSYLN TO ROLE COGNOS_PROD;
GRANT SELECT ON VIEW SCRSYLN TO ROLE UPN_BI;
GRANT SELECT ON VIEW SCRSYLN TO ROLE UPN_READ_PROD;

--------------------------------------------------

--USE ROLE ADMIN_PROD;

USE DATABASE BI_CDW_DEV;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
FROM @my_s3_stage/SCRSYLN_
PATTERN='.*SCRSYLN_[0-9].*[.]csv'
FILE_FORMAT=my_csv_format
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
DROP COLUMN ROWNUM;
COMMIT;
