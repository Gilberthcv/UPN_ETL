--BdMetacursos_

--USE ROLE ADMIN_PROD;

USE DATABASE UPN_RPT_DM_DEV;
USE SCHEMA BLACKBOARD;

CREATE OR REPLACE VIEW BdMetacursos AS
SELECT DISTINCT
    CASE WHEN F.SSBSECT_SCHD_CODE = 'VIR' OR F.SSBSECT_INSM_CODE = 'V'
		THEN F.SSBSECT_SUBJ_CODE ||'.'|| F.SSBSECT_CRSE_NUMB ||'.'|| F.SSBSECT_TERM_CODE ||'.'|| F.SSBSECT_CRN ||'.'|| 'V'
		ELSE F.SSBSECT_SUBJ_CODE ||'.'|| F.SSBSECT_CRSE_NUMB ||'.'|| F.SSBSECT_TERM_CODE ||'.'|| F.SSBSECT_CRN ||'.'|| 'P' END AS EXTERNAL_COURSE_KEY
    , CASE WHEN F.SSBSECT_SCHD_CODE = 'VIR' OR F.SSBSECT_INSM_CODE = 'V'
		THEN F.SSBSECT_SUBJ_CODE ||'.'|| F.SSBSECT_CRSE_NUMB ||'.'|| F.SSBSECT_TERM_CODE ||'.'|| F.SSBSECT_CRN ||'.'|| 'V'
		ELSE F.SSBSECT_SUBJ_CODE ||'.'|| F.SSBSECT_CRSE_NUMB ||'.'|| F.SSBSECT_TERM_CODE ||'.'|| F.SSBSECT_CRN ||'.'|| 'P' END AS COURSE_ID
    , CASE WHEN F.SSBSECT_SCHD_CODE = 'VIR' OR F.SSBSECT_INSM_CODE = 'V'
        THEN F.SCBCRSE_TITLE ||'(Virtual)'
        ELSE F.SCBCRSE_TITLE ||'(Presencial)' END AS COURSE_NAME
    , CASE WHEN F.SSBSECT_SSTS_CODE = 'A' THEN 'Y' ELSE 'N' END AS AVAILABLE_IND
    , CASE WHEN F.SSBSECT_SSTS_CODE = 'A' THEN 'ENABLED' ELSE 'DISABLED' END AS ROW_STATUS
    , 'R' AS DURATION
    , TO_CHAR(TO_DATE(F.START_DATE)-14,'YYYYMMDD') AS START_DATE
    , TO_CHAR(TO_DATE(F.END_DATE)+10,'YYYYMMDD') AS END_DATE
    , F.SSBSECT_TERM_CODE AS TERM_KEY
    , CASE SUBSTR(F.SSBSECT_TERM_CODE,4,1) --'UPN.<Instancia>.Banner.<Nivel>'
        WHEN '3' THEN 'UPN.Cursos.Banner.PDN'
        WHEN '4' THEN 'UPN.Cursos.Banner.UG'
        WHEN '5' THEN 'UPN.Cursos.Banner.WA'
        WHEN '7' THEN 'UPN.Cursos.Banner.Ingles'
        ELSE 'UPN.Cursos.Banner.EPEC' END AS DATA_SOURCE_KEY
    , 'PEPN01.UPN.' ||
        CASE SUBSTR(F.SSBSECT_TERM_CODE,4,1)
            WHEN '3' THEN 'PN'
            WHEN '4' THEN 'UG'
            WHEN '5' THEN 'WA'
            WHEN '7' THEN 'IN'
            ELSE 'EP' END ||'.'||
        CASE WHEN F.SSBSECT_CAMP_CODE IN ('TML','TSI') THEN 'TRU' ELSE F.SSBSECT_CAMP_CODE END ||'.'||
        F.SSRATTR_ATTR_CODE ||'.'|| F.SSBSECT_TERM_CODE AS PRIMARY_EXTERNAL_NODE_KEY
    , F.SSBSECT_CRN || '.PEPN01.UPN.' ||
        CASE SUBSTR(F.SSBSECT_TERM_CODE,4,1)
            WHEN '3' THEN 'PN'
            WHEN '4' THEN 'UG'
            WHEN '5' THEN 'WA'
            WHEN '7' THEN 'IN'
            ELSE 'EP' END ||'.'||
        CASE WHEN F.SSBSECT_CAMP_CODE IN ('TML','TSI') THEN 'TRU' ELSE F.SSBSECT_CAMP_CODE END ||'.'||
        F.SSRATTR_ATTR_CODE ||'.'|| F.SSBSECT_TERM_CODE AS EXTERNAL_ASSOCIATION_KEY
    , G.SSBSECT_SUBJ_CODE ||'.'|| G.SSBSECT_CRSE_NUMB ||'.'|| F.SSBSECT_TERM_CODE ||'.'|| F.NRC_PADRE ||'.'|| 'P' AS MASTER_COURSE_KEY
FROM ( SELECT DISTINCT
	        A.SSBSECT_TERM_CODE, A.SSBSECT_CRN, A.SSBSECT_SUBJ_CODE, A.SSBSECT_CRSE_NUMB, B.SCBCRSE_TITLE, A.SSBSECT_SCHD_CODE, A.SSBSECT_INSM_CODE
	        , A.SSBSECT_SSTS_CODE, A.SSBSECT_CAMP_CODE, D.START_DATE, D.END_DATE, C.SSRATTR_ATTR_CODE, E.SSRXLST_XLST_GROUP
	        , MIN(A.SSBSECT_CRN) OVER(PARTITION BY A.SSBSECT_TERM_CODE, E.ssrxlst_xlst_group) AS NRC_PADRE
	    FROM ODSMGR.LOE_SSBSECT A
	    		INNER JOIN ODSMGR.SCBCRSE B ON A.SSBSECT_SUBJ_CODE = B.SCBCRSE_SUBJ_CODE AND A.SSBSECT_CRSE_NUMB = B.SCBCRSE_CRSE_NUMB
	            								AND B.SCBCRSE_EFF_TERM = (SELECT MAX(B1.SCBCRSE_EFF_TERM) FROM ODSMGR.SCBCRSE B1
	            															WHERE B1.SCBCRSE_SUBJ_CODE = A.SSBSECT_SUBJ_CODE AND B1.SCBCRSE_CRSE_NUMB = A.SSBSECT_CRSE_NUMB
	            																AND B1.SCBCRSE_EFF_TERM <= A.SSBSECT_TERM_CODE)
	            INNER JOIN ODSMGR.SSRATTR C ON A.SSBSECT_TERM_CODE = C.SSRATTR_TERM_CODE AND A.SSBSECT_CRN = C.SSRATTR_CRN
	            INNER JOIN (SELECT DISTINCT SSRMEET_TERM_CODE, SSRMEET_CRN
	            				, MIN(SSRMEET_START_DATE) AS START_DATE, MAX(SSRMEET_END_DATE) AS END_DATE
							FROM ODSMGR.SSRMEET GROUP BY SSRMEET_TERM_CODE, SSRMEET_CRN
							) D ON A.SSBSECT_TERM_CODE = D.SSRMEET_TERM_CODE AND A.SSBSECT_CRN = D.SSRMEET_CRN
				INNER JOIN ODSMGR.SSRXLST E ON A.SSBSECT_TERM_CODE = E.SSRXLST_TERM_CODE AND A.SSBSECT_CRN = E.SSRXLST_CRN
	    WHERE A.SSBSECT_SSTS_CODE = 'A' AND A.SSBSECT_ENRL > 0 --AND A.SSBSECT_MAX_ENRL > 0
	        AND A.SSBSECT_SUBJ_CODE NOT IN ('ACAD','REPS','TEST','XPEN','XSER')
	        AND CURRENT_DATE BETWEEN TO_DATE(D.START_DATE)-14 AND TO_DATE(D.END_DATE)+10
	        AND A.SSBSECT_TERM_CODE IN (SELECT DISTINCT TERM_CODE FROM ODSMGR.LOE_SECTION_PART_OF_TERM
	                                    WHERE CURRENT_DATE BETWEEN TO_DATE(START_DATE)-14 AND TO_DATE(END_DATE)+10)
		) F
			INNER JOIN ODSMGR.LOE_SSBSECT G ON F.SSBSECT_TERM_CODE = G.SSBSECT_TERM_CODE AND F.NRC_PADRE = G.SSBSECT_CRN
WHERE F.SSBSECT_CRN <> F.NRC_PADRE
;