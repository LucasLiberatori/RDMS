
/***************************************************************************************************************************
Script Name : Backup User Security
Date		: 2021/11/29
Exec		: EXEC sp_BackupSecurityUser NULL
			  EXEC sp_BackupSecurityUser 'StackOverflow2013'
History		: 2021/11/29 --> Create SP
						 --> Add Create Sysadmin User
Notes		: This scripts it's correct after restore database. Whe you restore a DB this copy the Logins
***************************************************************************************************************************/

DROP PROC IF EXISTS dbo.sp_BackupSecurityUser
GO

CREATE PROC dbo.sp_BackupSecurityUser (@p_DBName VARCHAR(120) = NULL)

AS

SET NOCOUNT ON

BEGIN

	-- Declare Var
	DECLARE   @varSQLStatement  VARCHAR(MAX)
			, @varDBName		VARCHAR(120)

	-- Check if temp table exists 'resguardo_seg'
	IF NOT EXISTS (SELECT * FROM tempdb.sys.objects WHERE Name = 'resguardo_seg')
	
	-- Create temp table
	CREATE TABLE [tempdb].[dbo].[resguardo_seg] 
	(
		  [id]	     [int]	 IDENTITY(1, 1) NOT NULL
		, [DBName]   [sysname]				NOT NULL 
		, [Command]  [nvarchar](500)		    NULL
		, [crdate]   [smalldatetime]			NULL DEFAULT GETDATE()
		
		, CONSTRAINT [IX_resguardo_seg] UNIQUE CLUSTERED ([id] ASC, [DBName] ASC )
		  WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
				 ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY] 
	) ON [PRIMARY]

	-- Truncate table to be empty
	TRUNCATE TABLE [tempdb].[dbo].[resguardo_seg]

	SET @varSQLStatement = '
	-- CREATE USER
	SELECT ''?'' AS DBName,''use [?] ;'' + ''CREATE USER ['' + name + ''] for login [''+ name + '']'' from [?].sys.database_principals where principal_id >4  and name <> ''dbo'' AND is_fixed_role=0;

	-- GET PERMISSIONS
	SELECT ''?'' AS DBName,''use [?] ;'' + ''GRANT '' + dp.permission_name collate latin1_general_cs_as
		+ '' ON '' + s.name + ''.'' + o.name + '' TO ['' + dpr.name + '']'' as ''-- text''
		FROM [?].sys.database_permissions AS dp
		INNER JOIN [?].sys.objects AS o ON dp.major_id=o.object_id
		INNER JOIN [?].sys.schemas AS s ON o.schema_id = s.schema_id
		INNER JOIN [?].sys.database_principals AS dpr ON dp.grantee_principal_id=dpr.principal_id
		WHERE dpr.name NOT IN (''public'',''guest'') AND ''?'' NOT IN (''master'',''msdb'',''model'',''tempdb'') ;

	-- ADD ROLE
	SELECT ''?'' AS DBName,''use [?] ;'' + ''EXECUTE sp_AddRoleMember '' + roles.name + '', [''+ users.name + '']''
		   from [?].sys.database_principals users
		   inner join [?].sys.database_role_members link
		   on link.member_principal_id = users.principal_id
		   inner join [?].sys.database_principals roles
		   on roles.principal_id = link.role_principal_id
		   where users.name NOT IN (''public'',''dbo'',''guest'') AND ''?'' NOT IN (''master'',''msdb'',''model'',''tempdb'')
		   '
	-- For testing
	-- PRINT @varSQLStatement

	-- INSERT RECORDS TO [tempdb].[dbo].[resguardo_seg] 
	INSERT [tempdb].[dbo].[resguardo_seg] ([DBName], [Command])
	EXEC sp_MSforeachdb @varSQLStatement

	-- Clear var
	SET @varSQLStatement = ''

	-- CREATE SYSADMIN USER
	SET @varSQLStatement = '
	-- CREATE USER
	SELECT ''master'' AS DBName, ''use [master] ;'' + ''CREATE USER ['' + p.name + ''] for login [''+ p.name + '']'' AS [Command] from [master].sys.server_principals p LEFT JOIN master.sys.syslogins l ON (l.name = p.name)
	WHERE p.type IN ( ''S'', ''G'', ''U'' ) AND p.name <> ''sa'' AND l.sysadmin = 1	AND p.name not like ''NT %''
	-- ADD ROLE
	SELECT ''master'' AS DBName, ''use [master] ;'' + ''EXECUTE sp_AddRoleMember [sysadmin], [''+ p.name + '']'' AS [Command] from [master].sys.server_principals p LEFT JOIN master.sys.syslogins l ON (l.name = p.name)
	WHERE p.type IN ( ''S'', ''G'', ''U'' ) AND p.name <> ''sa'' AND l.sysadmin = 1	AND p.name not like ''NT %''
	'
	-- For testing	
	-- PRINT @varSQLStatement

	INSERT [tempdb].[dbo].[resguardo_seg] ([DBName], [Command])
	EXEC (@varSQLStatement)
	
	-- PRINT RECORDS COMMAND ACCORDING TO @p_DBName
	IF @p_DBName IS NULL
		SET @varDBName = 'SELECT [id], [DBName], [Command], [crdate] FROM [tempdb].[dbo].[resguardo_seg]'
	ELSE
		SET @varDBName = 'SELECT [id], [DBName], [Command], [crdate] FROM [tempdb].[dbo].[resguardo_seg] WHERE [DBName] = ' + '''' + @p_DBName + ''''
	
	-- EXEC RESULT
	EXEC (@varDBName)
END;
