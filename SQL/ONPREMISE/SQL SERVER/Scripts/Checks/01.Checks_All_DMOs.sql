
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Get a List of all DMOs (Views and Functions)
-----------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
	  [Name]
    , [Type]
    , [Type_desc]

FROM sys.system_objects
WHERE 
	NAME LIKE 'dm%'
-- AND TYPE = 'V'
-- AND TYPE = 'IF'
ORDER BY [name]
