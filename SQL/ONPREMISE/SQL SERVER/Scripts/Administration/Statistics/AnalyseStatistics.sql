/************************************************************************************************************

Ref:

************************************************************************************************************/

-- 1. 
SELECT
    stats.NAME
    , stats.filter_definition
    , last_updated
    , ROWS
    , rows_sampled
    , steps
    , unfilteres_rows
    , modification_counter
FROM SYS.STATS AS stats
CROSS APPLY SYS.DM_DB_STATS_PROPIERTIES(stats.OBJECT_ID, stats.STATS_ID) AS SPACE

WHERE stats.OBJECT_ID = OBJECT_ID('Name')
ORDER BY last_updated


-- To update all statistics in a table
-- The following example updates the statistics for all indexes on the SalesOrderDetail table.
UPDATE STATISTICS Sales.SalesOrderDetail;   
GO  

-- To update all statistics in a database
-- The following example updates the statistics for all tables in the database.   
EXEC sp_updatestats; 

-- Update the statistics for an index
UPDATE STATISTICS Sales.SalesOrderDetail AK_SalesOrderDetail_rowguid;  
GO 

-- Update statistics by using 50 percent sampling
UPDATE STATISTICS Production.Product(Products)   
    WITH SAMPLE 50 PERCENT;  

-- Update statistics by using FULLSCAN and NORECOMPUTE
-- NORECOMPUTE
-- Disable the automatic statistics update option, AUTO_UPDATE_STATISTICS, for the specified statistics. If this option is specified, the query optimizer completes this statistics update and disables future updates.
-- To re-enable the AUTO_UPDATE_STATISTICS option behavior, run UPDATE STATISTICS again without the NORECOMPUTE option or run sp_autostats.

UPDATE STATISTICS Production.Product(Products)  
    WITH FULLSCAN, NORECOMPUTE;  
GO  

-- Update statistics by using a full scan
UPDATE STATISTICS Customer (CustomerStats1) WITH FULLSCAN;  