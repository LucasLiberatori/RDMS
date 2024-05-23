
SELECT 
	  t.name [table]
	, t.object_id
	, t.schema_id
	, t.type_desc
	, t.create_date
	, t.max_column_id_used
	, p.index_id
	, p.partition_number
	, p.rows
	, v.boundary_id, v.value
FROM sys.tables t
JOIN sys.partitions p
On p.object_id = t.object_id
INNER JOIN	sys.partition_range_values v 
ON	v.boundary_id = p.partition_number 
WHERE is_ms_shipped = 0
and t.name = 'PartitionTable'

