--BdRoles_

--USE ROLE ADMIN_PROD;

USE DATABASE UPN_RPT_DM_DEV;
USE SCHEMA BLACKBOARD;

CREATE OR REPLACE VIEW BdRoles AS
SELECT DISTINCT
    A.SFRSTCR_PIDM AS EXTERNAL_PERSON_KEY
    , 'PEPN01.UPN.Estudiante.' ||
    	CASE SUBSTR(A.SFRSTCR_TERM_CODE,4,1)
	        WHEN '3' THEN 'PN'
	        WHEN '4' THEN 'UG'
	        WHEN '5' THEN 'WA'
	        WHEN '7' THEN 'IN'
	        ELSE 'EP' END ||'.'||
		CASE WHEN B.SSBSECT_CAMP_CODE IN ('TML','TSI') THEN 'TRU' ELSE B.SSBSECT_CAMP_CODE END AS ROLE_ID
    , CASE SUBSTR(A.SFRSTCR_TERM_CODE,4,1) --'UPN.<Instancia>.Banner.<Nivel>'
        WHEN '3' THEN 'UPN.Rol.Banner.PDN'
        WHEN '4' THEN 'UPN.Rol.Banner.UG'
        WHEN '5' THEN 'UPN.Rol.Banner.WA'
        WHEN '7' THEN 'UPN.Rol.Banner.Ingles'
        ELSE 'UPN.Rol.Banner.EPEC' END AS DATA_SOURCE_KEY
FROM ODSMGR.SFRSTCR A
		INNER JOIN ODSMGR.LOE_SSBSECT B ON A.SFRSTCR_TERM_CODE = B.SSBSECT_TERM_CODE AND A.SFRSTCR_CRN = B.SSBSECT_CRN
		INNER JOIN (SELECT DISTINCT SSRMEET_TERM_CODE, SSRMEET_CRN
						, MIN(SSRMEET_START_DATE) AS START_DATE, MAX(SSRMEET_END_DATE) AS END_DATE
					FROM ODSMGR.SSRMEET GROUP BY SSRMEET_TERM_CODE, SSRMEET_CRN
					) C ON B.SSBSECT_TERM_CODE = C.SSRMEET_TERM_CODE AND B.SSBSECT_CRN = C.SSRMEET_CRN
WHERE A.SFRSTCR_RSTS_CODE IN ('RW','RE','RA')
    AND B.SSBSECT_SSTS_CODE = 'A' AND B.SSBSECT_ENRL > 0 --AND B.SSBSECT_MAX_ENRL > 0
    AND B.SSBSECT_SUBJ_CODE NOT IN ('ACAD','REPS','TEST','XPEN','XSER')
    AND CURRENT_DATE BETWEEN TO_DATE(C.START_DATE)-14 AND TO_DATE(C.END_DATE)+10
    AND B.SSBSECT_TERM_CODE IN (SELECT DISTINCT TERM_CODE FROM ODSMGR.LOE_SECTION_PART_OF_TERM
                                WHERE CURRENT_DATE BETWEEN TO_DATE(START_DATE)-14 AND TO_DATE(END_DATE)+10)
UNION
SELECT DISTINCT
    A.SFRSTCR_PIDM
    , 'PEPN01.UPN.Estudiante.VIRTUAL'
    , CASE SUBSTR(A.SFRSTCR_TERM_CODE,4,1) --'UPN.<Instancia>.Banner.<Nivel>'
        WHEN '3' THEN 'UPN.Rol.Banner.PDN'
        WHEN '4' THEN 'UPN.Rol.Banner.UG'
        WHEN '5' THEN 'UPN.Rol.Banner.WA'
        WHEN '7' THEN 'UPN.Rol.Banner.Ingles'
        ELSE 'UPN.Rol.Banner.EPEC' END
FROM ODSMGR.SFRSTCR A
		INNER JOIN ODSMGR.LOE_SSBSECT B ON A.SFRSTCR_TERM_CODE = B.SSBSECT_TERM_CODE AND A.SFRSTCR_CRN = B.SSBSECT_CRN
		INNER JOIN (SELECT DISTINCT SSRMEET_TERM_CODE, SSRMEET_CRN
						, MIN(SSRMEET_START_DATE) AS START_DATE, MAX(SSRMEET_END_DATE) AS END_DATE
					FROM ODSMGR.SSRMEET GROUP BY SSRMEET_TERM_CODE, SSRMEET_CRN
					) C ON B.SSBSECT_TERM_CODE = C.SSRMEET_TERM_CODE AND B.SSBSECT_CRN = C.SSRMEET_CRN
WHERE A.SFRSTCR_RSTS_CODE IN ('RW','RE','RA')
	AND (B.SSBSECT_SCHD_CODE = 'VIR' OR B.SSBSECT_INSM_CODE = 'V')
    AND B.SSBSECT_SSTS_CODE = 'A' AND B.SSBSECT_ENRL > 0 --AND B.SSBSECT_MAX_ENRL > 0
    AND B.SSBSECT_SUBJ_CODE NOT IN ('ACAD','REPS','TEST','XPEN','XSER')
    AND CURRENT_DATE BETWEEN TO_DATE(C.START_DATE)-14 AND TO_DATE(C.END_DATE)+10
    AND B.SSBSECT_TERM_CODE IN (SELECT DISTINCT TERM_CODE FROM ODSMGR.LOE_SECTION_PART_OF_TERM
                                WHERE CURRENT_DATE BETWEEN TO_DATE(START_DATE)-14 AND TO_DATE(END_DATE)+10)
UNION
SELECT DISTINCT
    C.SIRASGN_PIDM
    , 'PEPN01.UPN.Docente.' ||
	    CASE SUBSTR(C.SIRASGN_TERM_CODE ,4,1)
	        WHEN '3' THEN 'PN'
	        WHEN '4' THEN 'UG'
	        WHEN '5' THEN 'WA'
	        WHEN '7' THEN 'IN'
	        ELSE 'EP' END
    , CASE SUBSTR(C.SIRASGN_TERM_CODE,4,1) --'UPN.<Instancia>.Banner.<Nivel>'
        WHEN '3' THEN 'UPN.Rol.Banner.PDN'
        WHEN '4' THEN 'UPN.Rol.Banner.UG'
        WHEN '5' THEN 'UPN.Rol.Banner.WA'
        WHEN '7' THEN 'UPN.Rol.Banner.Ingles'
        ELSE 'UPN.Rol.Banner.EPEC' END
FROM ODSMGR.SIRASGN C
		INNER JOIN ODSMGR.LOE_SSBSECT D ON C.SIRASGN_TERM_CODE = D.SSBSECT_TERM_CODE AND C.SIRASGN_CRN = D.SSBSECT_CRN
		INNER JOIN (SELECT DISTINCT SSRMEET_TERM_CODE, SSRMEET_CRN
						, MIN(SSRMEET_START_DATE) AS START_DATE, MAX(SSRMEET_END_DATE) AS END_DATE
					FROM ODSMGR.SSRMEET GROUP BY SSRMEET_TERM_CODE, SSRMEET_CRN
					) E ON D.SSBSECT_TERM_CODE = E.SSRMEET_TERM_CODE AND D.SSBSECT_CRN = E.SSRMEET_CRN
WHERE D.SSBSECT_SSTS_CODE = 'A' AND D.SSBSECT_ENRL > 0 --AND D.SSBSECT_MAX_ENRL > 0
    AND D.SSBSECT_SUBJ_CODE NOT IN ('ACAD','REPS','TEST','XPEN','XSER')
    AND CURRENT_DATE BETWEEN TO_DATE(E.START_DATE)-14 AND TO_DATE(E.END_DATE)+10
    AND D.SSBSECT_TERM_CODE IN (SELECT DISTINCT TERM_CODE FROM ODSMGR.LOE_SECTION_PART_OF_TERM
                                WHERE CURRENT_DATE BETWEEN TO_DATE(START_DATE)-14 AND TO_DATE(END_DATE)+10)
UNION
SELECT DISTINCT
    C.SIRASGN_PIDM
    , 'PEPN01.UPN.Docente.VIRTUAL'
    , CASE SUBSTR(C.SIRASGN_TERM_CODE,4,1) --'UPN.<Instancia>.Banner.<Nivel>'
        WHEN '3' THEN 'UPN.Rol.Banner.PDN'
        WHEN '4' THEN 'UPN.Rol.Banner.UG'
        WHEN '5' THEN 'UPN.Rol.Banner.WA'
        WHEN '7' THEN 'UPN.Rol.Banner.Ingles'
        ELSE 'UPN.Rol.Banner.EPEC' END
FROM ODSMGR.SIRASGN C
		INNER JOIN ODSMGR.LOE_SSBSECT D ON C.SIRASGN_TERM_CODE = D.SSBSECT_TERM_CODE AND C.SIRASGN_CRN = D.SSBSECT_CRN
		INNER JOIN (SELECT DISTINCT SSRMEET_TERM_CODE, SSRMEET_CRN
						, MIN(SSRMEET_START_DATE) AS START_DATE, MAX(SSRMEET_END_DATE) AS END_DATE
					FROM ODSMGR.SSRMEET GROUP BY SSRMEET_TERM_CODE, SSRMEET_CRN
					) E ON D.SSBSECT_TERM_CODE = E.SSRMEET_TERM_CODE AND D.SSBSECT_CRN = E.SSRMEET_CRN
WHERE (D.SSBSECT_SCHD_CODE = 'VIR' OR D.SSBSECT_INSM_CODE = 'V')
	AND D.SSBSECT_SSTS_CODE = 'A' AND D.SSBSECT_ENRL > 0 --AND D.SSBSECT_MAX_ENRL > 0
    AND D.SSBSECT_SUBJ_CODE NOT IN ('ACAD','REPS','TEST','XPEN','XSER')
    AND CURRENT_DATE BETWEEN TO_DATE(E.START_DATE)-14 AND TO_DATE(E.END_DATE)+10
    AND D.SSBSECT_TERM_CODE IN (SELECT DISTINCT TERM_CODE FROM ODSMGR.LOE_SECTION_PART_OF_TERM
                                WHERE CURRENT_DATE BETWEEN TO_DATE(START_DATE)-14 AND TO_DATE(END_DATE)+10)
;