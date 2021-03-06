USE ROLE ETL_PROD;
USE DATABASE BI_CDW_PROD;
USE SCHEMA UPN_STG_SIS_BNRODS_ODSMGR;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.GOBTPAC';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOBTPAC;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOBTPAC
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.GOBTPAC
FROM @UPN_STAGE_SIS_BNRODS/GOBTPAC_
PATTERN='.*GOBTPAC_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOBTPAC
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;    
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SCBCRSE';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCBCRSE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCBCRSE
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SCBCRSE
FROM @UPN_STAGE_SIS_BNRODS/SCBCRSE_
PATTERN='.*SCBCRSE_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCBCRSE
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKL';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKL;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKL
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKL
FROM @UPN_STAGE_SIS_BNRODS/SHRTCKL_
PATTERN='.*SHRTCKL_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKL
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKN';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKN;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKN
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKN
FROM @UPN_STAGE_SIS_BNRODS/SHRTCKN_
PATTERN='.*SHRTCKN_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTCKN
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SHRTRAM';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRAM;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRAM
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SHRTRAM
FROM @UPN_STAGE_SIS_BNRODS/SHRTRAM_
PATTERN='.*SHRTRAM_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRAM
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SHRTRCE';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRCE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRCE
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SHRTRCE
FROM @UPN_STAGE_SIS_BNRODS/SHRTRCE_
PATTERN='.*SHRTRCE_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRCE
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SLBBLDG';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SLBBLDG;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SLBBLDG
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SLBBLDG
FROM @UPN_STAGE_SIS_BNRODS/SLBBLDG_
PATTERN='.*SLBBLDG_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SLBBLDG
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SPBPERS';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPBPERS;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPBPERS
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SPBPERS
FROM @UPN_STAGE_SIS_BNRODS/SPBPERS_
PATTERN='.*SPBPERS_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPBPERS
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;


BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.SSRMEET';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRMEET;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRMEET
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SSRMEET
FROM @UPN_STAGE_SIS_BNRODS/SSRMEET_
PATTERN='.*SSRMEET_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRMEET
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.STVMEET';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVMEET;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVMEET
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVMEET
FROM @UPN_STAGE_SIS_BNRODS/STVMEET_
PATTERN='.*STVMEET_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVMEET
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;

BEGIN;     
ALTER SESSION SET QUERY_TAG = 'UPN_STG_SIS_BNRODS_ODSMGR.STVRATE';
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRATE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRATE
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVRATE
FROM @UPN_STAGE_SIS_BNRODS/STVRATE_
PATTERN='.*STVRATE_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRATE
DROP COLUMN ROWNUM;      
ALTER SESSION UNSET QUERY_TAG;
COMMIT;


BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRIT;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRIT
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SHRTRIT
FROM @UPN_STAGE_SIS_BNRODS/SHRTRIT_
PATTERN='.*SHRTRIT_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SHRTRIT
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBBESTU;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBBESTU
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.TBBESTU
FROM @UPN_STAGE_SIS_BNRODS/TBBESTU_
PATTERN='.*TBBESTU_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBBESTU
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRXLST;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRXLST
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SSRXLST
FROM @UPN_STAGE_SIS_BNRODS/SSRXLST_
PATTERN='.*SSRXLST_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRXLST
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVATTR;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVATTR
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVATTR
FROM @UPN_STAGE_SIS_BNRODS/STVATTR_
PATTERN='.*STVATTR_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVATTR
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVDEPT;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVDEPT
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVDEPT
FROM @UPN_STAGE_SIS_BNRODS/STVDEPT_
PATTERN='.*STVDEPT_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVDEPT
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVBLDG;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVBLDG
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVBLDG
FROM @UPN_STAGE_SIS_BNRODS/STVBLDG_
PATTERN='.*STVBLDG_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVBLDG
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSCHD;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSCHD
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SCRSCHD
FROM @UPN_STAGE_SIS_BNRODS/SCRSCHD_
PATTERN='.*SCRSCHD_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSCHD
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRDEF;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRDEF
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.STVRDEF
FROM @UPN_STAGE_SIS_BNRODS/STVRDEF_
PATTERN='.*STVRDEF_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.STVRDEF
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOREMAL;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOREMAL
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.GOREMAL
FROM @UPN_STAGE_SIS_BNRODS/GOREMAL_
PATTERN='.*GOREMAL_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.GOREMAL
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFBETRM;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFBETRM
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SFBETRM
FROM @UPN_STAGE_SIS_BNRODS/SFBETRM_
PATTERN='.*SFBETRM_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFBETRM
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRSTCR;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRSTCR
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SFRSTCR
FROM @UPN_STAGE_SIS_BNRODS/SFRSTCR_
PATTERN='.*SFRSTCR_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRSTCR
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRTELE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRTELE
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SPRTELE
FROM @UPN_STAGE_SIS_BNRODS/SPRTELE_
PATTERN='.*SPRTELE_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRTELE
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
    TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBRCDET;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBRCDET
    ADD COLUMN ROWNUM NUMBER;
    COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.TBRCDET
    FROM @UPN_STAGE_SIS_BNRODS/TBRCDET_
    PATTERN='.*TBRCDET_[0-9].*[.]csv'
    FILE_FORMAT=CSV_UPN_ODS
    ON_ERROR=CONTINUE;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.TBRCDET
    DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
    TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRRESV;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRRESV
    ADD COLUMN ROWNUM NUMBER;
    COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SSRRESV
    FROM @UPN_STAGE_SIS_BNRODS/SSRRESV_
    PATTERN='.*SSRRESV_[0-9].*[.]csv'
    FILE_FORMAT=CSV_UPN_ODS
    ON_ERROR=CONTINUE;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRRESV
    DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
    TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SORDEGR;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SORDEGR
    ADD COLUMN ROWNUM NUMBER;
    COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SORDEGR
    FROM @UPN_STAGE_SIS_BNRODS/SORDEGR_
    PATTERN='.*SORDEGR_[0-9].*[.]csv'
    FILE_FORMAT=CSV_UPN_ODS
    ON_ERROR=CONTINUE;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SORDEGR
    DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
    TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRREGP;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRREGP
    ADD COLUMN ROWNUM NUMBER;
    COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SFRREGP
    FROM @UPN_STAGE_SIS_BNRODS/SFRREGP_
    PATTERN='.*SFRREGP_[0-9].*[.]csv'
    FILE_FORMAT=CSV_UPN_ODS
    ON_ERROR=CONTINUE;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SFRREGP
    DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
    TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRHOLD;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRHOLD
    ADD COLUMN ROWNUM NUMBER;
    COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SPRHOLD
    FROM @UPN_STAGE_SIS_BNRODS/SPRHOLD_
    PATTERN='.*SPRHOLD_[0-9].*[.]csv'
    FILE_FORMAT=CSV_UPN_ODS
    ON_ERROR=CONTINUE;
    ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SPRHOLD
    DROP COLUMN ROWNUM;
COMMIT;

TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCREQIV;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCREQIV
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SCREQIV
FROM @UPN_STAGE_SIS_BNRODS/SCREQIV_
PATTERN='.*SCREQIV_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCREQIV
DROP COLUMN ROWNUM;
COMMIT;

TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRFEES;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRFEES
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SSRFEES
FROM @UPN_STAGE_SIS_BNRODS/SSRFEES_
PATTERN='.*SSRFEES_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SSRFEES
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMBAOGN;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMBAOGN
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SMBAOGN
FROM @UPN_STAGE_SIS_BNRODS/SMBAOGN_
PATTERN='.*SMBAOGN_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMBAOGN
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMRSSUB;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMRSSUB
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SMRSSUB
FROM @UPN_STAGE_SIS_BNRODS/SMRSSUB_
PATTERN='.*SMRSSUB_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SMRSSUB
DROP COLUMN ROWNUM;
COMMIT;

BEGIN;
TRUNCATE TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
ADD COLUMN ROWNUM NUMBER;
COPY INTO UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
FROM @UPN_STAGE_SIS_BNRODS/SCRSYLN_
PATTERN='.*SCRSYLN_[0-9].*[.]csv'
FILE_FORMAT=CSV_UPN_ODS
ON_ERROR=CONTINUE;
ALTER TABLE UPN_STG_SIS_BNRODS_ODSMGR.SCRSYLN
DROP COLUMN ROWNUM;
COMMIT;