
/***********************************************************************************************************
Ref:
    https://docs.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql?view=sql-server-ver15
***********************************************************************************************************/

-- Scrip 1
SELECT 'BuildClrVersion' AS Property, SERVERPROPERTY('BuildClrVersion') AS Value
UNION ALL
SELECT 'Collation', SERVERPROPERTY('Collation')
UNION ALL
SELECT 'CollationID', SERVERPROPERTY('CollationID')
UNION ALL
SELECT 'ComparisonStyle', SERVERPROPERTY('ComparisonStyle')
UNION ALL
SELECT 'ComputerNamePhysicalNetBIOS', SERVERPROPERTY('ComputerNamePhysicalNetBIOS')
UNION ALL
SELECT 'Edition', SERVERPROPERTY('Edition')
UNION ALL
SELECT 'EditionID', SERVERPROPERTY('EditionID')
UNION ALL
SELECT 'EngineEdition', SERVERPROPERTY('EngineEdition')
UNION ALL
SELECT 'HadrManagerStatus', SERVERPROPERTY('HadrManagerStatus')
UNION ALL
SELECT 'InstanceDefaultDataPath', SERVERPROPERTY('InstanceDefaultDataPath')
UNION ALL
SELECT 'InstanceDefaultLogPath', SERVERPROPERTY('InstanceDefaultLogPath')
UNION ALL
SELECT 'InstanceName', SERVERPROPERTY('InstanceName')
UNION ALL
SELECT 'IsAdvancedAnalyticsInstalled', SERVERPROPERTY('IsAdvancedAnalyticsInstalled')
UNION ALL
SELECT 'IsClustered', SERVERPROPERTY('IsClustered')
UNION ALL
SELECT 'IsFullTextInstalled', SERVERPROPERTY('IsFullTextInstalled')
UNION ALL
SELECT 'IsHadrEnabled', SERVERPROPERTY('IsHadrEnabled')
UNION ALL
SELECT 'IsIntegratedSecurityOnly', SERVERPROPERTY('IsIntegratedSecurityOnly')
UNION ALL
SELECT 'IsLocalDB', SERVERPROPERTY('IsLocalDB')
UNION ALL
SELECT 'IsPolyBaseInstalled', SERVERPROPERTY('IsPolyBaseInstalled')
UNION ALL
SELECT 'IsSingleUser', SERVERPROPERTY('IsSingleUser')
UNION ALL
SELECT 'IsXTPSupported', SERVERPROPERTY('IsXTPSupported')
UNION ALL
SELECT 'LCID', SERVERPROPERTY('LCID')
UNION ALL
SELECT 'LicenseType', SERVERPROPERTY('LicenseType')
UNION ALL
SELECT 'MachineName', SERVERPROPERTY('MachineName')
UNION ALL
SELECT 'NumLicenses', SERVERPROPERTY('NumLicenses')
UNION ALL
SELECT 'ProcessID', SERVERPROPERTY('ProcessID')
UNION ALL
SELECT 'ProductBuild', SERVERPROPERTY('ProductBuild')
UNION ALL
SELECT 'ProductBuildType', SERVERPROPERTY('ProductBuildType')
UNION ALL
SELECT 'ProductLevel', SERVERPROPERTY('ProductLevel')
UNION ALL
SELECT 'ProductMajorVersion', SERVERPROPERTY('ProductMajorVersion')
UNION ALL
SELECT 'ProductMinorVersion', SERVERPROPERTY('ProductMinorVersion')
UNION ALL
SELECT 'ProductUpdateLevel', SERVERPROPERTY('ProductUpdateLevel')
UNION ALL
SELECT 'ProductUpdateReference', SERVERPROPERTY('ProductUpdateReference')
UNION ALL
SELECT 'ProductVersion', SERVERPROPERTY('ProductVersion')
UNION ALL
SELECT 'ResourceLastUpdateDateTime', SERVERPROPERTY('ResourceLastUpdateDateTime')
UNION ALL
SELECT 'ResourceVersion', SERVERPROPERTY('ResourceVersion')
UNION ALL
SELECT 'ServerName', SERVERPROPERTY('ServerName')
UNION ALL
SELECT 'SqlCharSet', SERVERPROPERTY('SqlCharSet')
UNION ALL
SELECT 'SqlCharSetName', SERVERPROPERTY('SqlCharSetName')
UNION ALL
SELECT 'SqlSortOrder', SERVERPROPERTY('SqlSortOrder')
UNION ALL
SELECT 'SqlSortOrderName', SERVERPROPERTY('SqlSortOrderName')
UNION ALL
SELECT 'FilestreamShareName', SERVERPROPERTY('FilestreamShareName')
UNION ALL
SELECT 'FilestreamConfiguredLevel', SERVERPROPERTY('FilestreamConfiguredLevel')
UNION ALL
SELECT 'FilestreamEffectiveLevel', SERVERPROPERTY('FilestreamEffectiveLevel');

-- Script 2
declare @dbname varchar(max)='adventureworks2016ctp3' 
select 'name' as feature, cast(name as sql_variant) as " value" from sys.databases where name=@dbname 
union select 'database_id', cast(database_id as sql_variant) as " value" from sys.databases where name=@dbname 
union select 'source_database_id', cast(source_database_id as sql_variant) as " value" from sys.databases where name=@dbname
union select 'owner_sid', cast(user_name(owner_sid) as sql_variant) as " value" from sys.databases where name=@dbname
union select 'create_date', cast(create_date as sql_variant) as " value" from sys.databases where name=@dbname
union select 'compatibility_level', cast(compatibility_level as sql_variant) as " value" from sys.databases where name=@dbname
union select 'collation_name', cast(collation_name as sql_variant) as " value" from sys.databases where name=@dbname 
union select 'user_access', cast(user_access as sql_variant) as " value" from sys.databases where name=@dbname 
union select 'user_access_desc', cast(user_access_desc as sql_variant) as " value" from sys.databases where name=@dbname 
union select 'is_read_only', cast(is_read_only as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_close_on', cast(is_auto_close_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_shrink_on', cast(is_auto_shrink_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'state', cast(state as sql_variant) as " value" from sys.databases where name=@dbname
union select 'state_desc', cast(state_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_in_standby', cast(is_in_standby as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_cleanly_shutdown', cast(is_cleanly_shutdown as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_supplemental_logging_enabled', cast(is_supplemental_logging_enabled as sql_variant) as " value" from sys.databases where name=@dbname
union select 'snapshot_isolation_state', cast(snapshot_isolation_state as sql_variant) as " value" from sys.databases where name=@dbname
union select 'snapshot_isolation_state_desc', cast(snapshot_isolation_state_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_read_committed_snapshot_on', cast(is_read_committed_snapshot_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'recovery_model', cast(recovery_model as sql_variant) as " value" from sys.databases where name=@dbname
union select 'recovery_model_desc', cast(recovery_model_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'page_verify_option', cast(page_verify_option as sql_variant) as " value" from sys.databases where name=@dbname
union select 'page_verify_option_desc', cast(page_verify_option_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_create_stats_on', cast(is_auto_create_stats_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_create_stats_incremental_on', cast(is_auto_create_stats_incremental_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_update_stats_on', cast(is_auto_update_stats_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_auto_update_stats_async_on', cast(is_auto_update_stats_async_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_ansi_null_default_on', cast(is_ansi_null_default_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_ansi_nulls_on', cast(is_ansi_nulls_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_ansi_padding_on', cast(is_ansi_padding_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_ansi_warnings_on', cast(is_ansi_warnings_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_arithabort_on', cast(is_arithabort_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_concat_null_yields_null_on', cast(is_concat_null_yields_null_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_numeric_roundabort_on', cast(is_numeric_roundabort_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_quoted_identifier_on', cast(is_quoted_identifier_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_recursive_triggers_on', cast(is_recursive_triggers_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_cursor_close_on_commit_on', cast(is_cursor_close_on_commit_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_local_cursor_default', cast(is_local_cursor_default as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_fulltext_enabled', cast(is_fulltext_enabled as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_trustworthy_on', cast(is_trustworthy_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_db_chaining_on', cast(is_db_chaining_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_parameterization_forced', cast(is_parameterization_forced as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_master_key_encrypted_by_server', cast(is_master_key_encrypted_by_server as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_query_store_on', cast(is_query_store_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_published', cast(is_published as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_subscribed', cast(is_subscribed as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_merge_published', cast(is_merge_published as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_distributor', cast(is_distributor as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_sync_with_backup', cast(is_sync_with_backup as sql_variant) as " value" from sys.databases where name=@dbname
union select 'service_broker_guid', cast(service_broker_guid as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_broker_enabled', cast(is_broker_enabled as sql_variant) as " value" from sys.databases where name=@dbname
union select 'log_reuse_wait', cast(log_reuse_wait as sql_variant) as " value" from sys.databases where name=@dbname
union select 'log_reuse_wait_desc', cast(log_reuse_wait_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_date_correlation_on', cast(is_date_correlation_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_cdc_enabled', cast(is_cdc_enabled as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_encrypted', cast(is_encrypted as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_honor_broker_priority_on', cast(is_honor_broker_priority_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'replica_id', cast(replica_id as sql_variant) as " value" from sys.databases where name=@dbname
union select 'group_database_id', cast(group_database_id as sql_variant) as " value" from sys.databases where name=@dbname
union select 'resource_pool_id', cast(resource_pool_id as sql_variant) as " value" from sys.databases where name=@dbname
union select 'default_language_lcid', cast(default_language_lcid as sql_variant) as " value" from sys.databases where name=@dbname
union select 'default_language_name', cast(default_language_name as sql_variant) as " value" from sys.databases where name=@dbname
union select 'default_fulltext_language_lcid', cast(default_fulltext_language_lcid as sql_variant) as " value" from sys.databases where name=@dbname
union select 'default_fulltext_language_name', cast(default_fulltext_language_name as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_nested_triggers_on', cast(is_nested_triggers_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_transform_noise_words_on', cast(is_transform_noise_words_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'two_digit_year_cutoff', cast(two_digit_year_cutoff as sql_variant) as " value" from sys.databases where name=@dbname
union select 'containment', cast(containment as sql_variant) as " value" from sys.databases where name=@dbname
union select 'containment_desc', cast(containment_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'target_recovery_time_in_seconds', cast(target_recovery_time_in_seconds as sql_variant) as " value" from sys.databases where name=@dbname
union select 'delayed_durability', cast(delayed_durability as sql_variant) as " value" from sys.databases where name=@dbname
union select 'delayed_durability_desc', cast(delayed_durability_desc as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_memory_optimized_elevate_to_snapshot_on', cast(is_memory_optimized_elevate_to_snapshot_on as varchar(60)) as " value" from sys.databases where name=@dbname
union select 'is_federation_member', cast(is_federation_member as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_remote_data_archive_enabled', cast(is_remote_data_archive_enabled as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_mixed_page_allocation_on', cast(is_mixed_page_allocation_on as sql_variant) as " value" from sys.databases where name=@dbname
union select 'is_temporal_history_retention_enabled', cast(is_temporal_history_retention_enabled as varchar(70)) as " value" from sys.databases where name=@dbname
