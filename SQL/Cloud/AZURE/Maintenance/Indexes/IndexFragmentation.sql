
SELECT
    S.NAME AS 'SCHEMA'
    , T.Name AS 'TABLE'
    , I.Name AS 'Index'
    , DDIPS.Avg_Fragmentation_In_Percent
    , DDIPS.Page_Count
    , 'ALTER INDEX ' + I.Name + ' on ' + S.Name + '.' + T.Name + ' reorganize;'
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
JOIN SYS.TABLES AS T ON T.OBJECT_ID = DDIPS.OBJECT_ID
JOIN SYS.SCHEMAS AS S ON T.SCHEMA_ID = S.SCHEMA_ID
JOIN SYS.INDEXES AS I ON I.OBJECT_ID = DDIPS.OBJECT_ID
AND  DDIPS.INDEX_ID = I.INDEX_ID
WHERE 
    DDIPS.DATABASE_ID = DB_ID()
AND I.Name IS NOT NULL
AND DDIPS.Avg_Fragmentation_In_Percent > 30
AND S.SCHEMA_ID = SCHEMA_ID('DB Name') -- ('SOFTCOIN_DBA')
ORDER BY T.Name, I.Name DESC;
   
