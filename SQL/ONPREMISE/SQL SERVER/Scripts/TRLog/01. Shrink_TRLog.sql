
USE [DB_NAME]
GO

-- CHECK TRLOG SIZE
SELECT Database_Id, Name, Size, Max_size, Physical_Name 
FROM   sys.master_files 
WHERE  type_desc = 'LOG'
AND    Name LIKE '%dbTRLogName%'

-- SHRINK TRLOG
ALTER DATABASE DB_NAME
SET RECOVERY SIMPLE
GO

	DBCC SHRINKFILE (dbTRLogName, 1) -- 1 In MB
	GO

ALTER DATABASE DB_NAME
SET RECOVERY FULL

------------------------------------------------------------------------------
------------------------------------------------------------------------------

ALTER DATABASE DBNAME
SET RECOVERY SIMPLE
GO
DBCC SHRINKFILE (FILENAME, 1)
GO
ALTER DATABASE DBNAME
SET RECOVERY FULL
GO

------------------------------------------------------------------------------
------------------------------------------------------------------------------

USE TEMPDB
GO

DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS
CHECKPOINT;

DBCC SHRINKFILE(templog, 1)
DBCC SHRINKFILE(tempdev, 1)


