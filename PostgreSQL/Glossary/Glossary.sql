
-- Glossary

-- https://www.postgresql.org/docs/13/glossary.html

This is a list of terms and their meaning in the context of PostgreSQL and relational database systems in general.

ACID
Atomicity, Consistency, Isolation, and Durability. This set of properties of database transactions is intended to guarantee validity in concurrent operation and even in event of errors, power failures, etc.

Aggregate function (routine)
A function that combines (aggregates) multiple input values, for example by counting, averaging or adding, yielding a single output value.

For more information, see Section 9.21.

See Also Window function (routine).

Analytic function
See Window function (routine).

Analyze (operation)
The process of collecting statistics from data in tables and other relations to help the query planner to make decisions about how to execute queries.

(Don't confuse this term with the ANALYZE option to the EXPLAIN command.)

For more information, see ANALYZE.

Atomic
In reference to a datum: the fact that its value cannot be broken down into smaller components.

In reference to a database transaction: see atomicity.

Atomicity
The property of a transaction that either all its operations complete as a single unit or none do. In addition, if a system failure occurs during the execution of a transaction, no partial results are visible after recovery. This is one of the ACID properties.

Attribute
An element with a certain name and data type found within a tuple.

Autovacuum (process)
A set of background processes that routinely perform vacuum and analyze operations.

For more information, see Section 24.1.6.

Backend (process)
Process of an instance which acts on behalf of a client session and handles its requests.

(Don't confuse this term with the similar terms Background Worker or Background Writer).

Background worker (process)
Process within an instance, which runs system- or user-supplied code. Serves as infrastructure for several features in PostgreSQL, such as logical replication and parallel queries. In addition, Extensions can add custom background worker processes.

For more information, see Chapter 47.

Background writer (process)
A process that writes dirty data pages from shared memory to the file system. It wakes up periodically, but works only for a short period in order to distribute its expensive I/O activity over time to avoid generating larger I/O peaks which could block other processes.

For more information, see Section 19.4.5.

Bloat
Space in data pages which does not contain current row versions, such as unused (free) space or outdated row versions.

Cast
A conversion of a datum from its current data type to another data type.

For more information, see CREATE CAST.

Catalog
The SQL standard uses this term to indicate what is called a database in PostgreSQL's terminology.

(Don't confuse this term with system catalog).

For more information, see Section 22.1.

Check constraint
A type of constraint defined on a relation which restricts the values allowed in one or more attributes. The check constraint can make reference to any attribute of the same row in the relation, but cannot reference other rows of the same relation or other relations.

For more information, see Section 5.4.

Checkpoint
A point in the WAL sequence at which it is guaranteed that the heap and index data files have been updated with all information from shared memory modified before that checkpoint; a checkpoint record is written and flushed to WAL to mark that point.

A checkpoint is also the act of carrying out all the actions that are necessary to reach a checkpoint as defined above. This process is initiated when predefined conditions are met, such as a specified amount of time has passed, or a certain volume of records has been written; or it can be invoked by the user with the command CHECKPOINT.

For more information, see Section 29.4.

Checkpointer (process)
A specialized process responsible for executing checkpoints.

Class (archaic)
See Relation.

Client (process)
Any process, possibly remote, that establishes a session by connecting to an instance to interact with a database.

Column
An attribute found in a table or view.

Commit
The act of finalizing a transaction within the database, which makes it visible to other transactions and assures its durability.

For more information, see COMMIT.

Concurrency
The concept that multiple independent operations happen within the database at the same time. In PostgreSQL, concurrency is controlled by the multiversion concurrency control mechanism.

Connection
An established line of communication between a client process and a backend process, usually over a network, supporting a session. This term is sometimes used as a synonym for session.

For more information, see Section 19.3.

Consistency
The property that the data in the database is always in compliance with integrity constraints. Transactions may be allowed to violate some of the constraints transiently before it commits, but if such violations are not resolved by the time it commits, such a transaction is automatically rolled back. This is one of the ACID properties.

Constraint
A restriction on the values of data allowed within a table, or in attributes of a domain.

For more information, see Section 5.4.

Data area
See Data directory.

Database
A named collection of local SQL objects.

For more information, see Section 22.1.

Database cluster
A collection of databases and global SQL objects, and their common static and dynamic metadata. Sometimes referred to as a cluster.

In PostgreSQL, the term cluster is also sometimes used to refer to an instance. (Don't confuse this term with the SQL command CLUSTER.)

Database server
See Instance.

Data directory
The base directory on the file system of a server that contains all data files and subdirectories associated with a database cluster (with the exception of tablespaces, and optionally WAL). The environment variable PGDATA is commonly used to refer to the data directory.

A cluster's storage space comprises the data directory plus any additional tablespaces.

For more information, see Section 69.1.

Data page
The basic structure used to store relation data. All pages are of the same size. Data pages are typically stored on disk, each in a specific file, and can be read to shared buffers where they can be modified, becoming dirty. They become clean when written to disk. New pages, which initially exist in memory only, are also dirty until written.

Datum
The internal representation of one value of an SQL data type.

Delete
An SQL command which removes rows from a given table or relation.

For more information, see DELETE.

Durability
The assurance that once a transaction has been committed, the changes remain even after a system failure or crash. This is one of the ACID properties.

Epoch
See Transaction ID.

Extension
A software add-on package that can be installed on an instance to get extra features.

For more information, see Section 37.17.

File segment
A physical file which stores data for a given relation. File segments are limited in size by a configuration value (typically 1 gigabyte), so if a relation exceeds that size, it is split into multiple segments.

For more information, see Section 69.1.

(Don't confuse this term with the similar term WAL segment).

Foreign data wrapper
A means of representing data that is not contained in the local database so that it appears as if were in local table(s). With a foreign data wrapper it is possible to define a foreign server and foreign tables.

For more information, see CREATE FOREIGN DATA WRAPPER.

Foreign key
A type of constraint defined on one or more columns in a table which requires the value(s) in those columns to identify zero or one row in another (or, infrequently, the same) table.

Foreign server
A named collection of foreign tables which all use the same foreign data wrapper and have other configuration values in common.

For more information, see CREATE SERVER.

Foreign table (relation)
A relation which appears to have rows and columns similar to a regular table, but will forward requests for data through its foreign data wrapper, which will return result sets structured according to the definition of the foreign table.

For more information, see CREATE FOREIGN TABLE.

Fork
Each of the separate segmented file sets in which a relation is stored. The main fork is where the actual data resides. There also exist two secondary forks for metadata: the free space map and the visibility map. Unlogged relations also have an init fork.

Free space map (fork)
A storage structure that keeps metadata about each data page of a table's main fork. The free space map entry for each page stores the amount of free space that's available for future tuples, and is structured to be efficiently searched for available space for a new tuple of a given size.

For more information, see Section 69.3.

Function (routine)
A type of routine that receives zero or more arguments, returns zero or more output values, and is constrained to run within one transaction. Functions are invoked as part of a query, for example via SELECT. Certain functions can return sets; those are called set-returning functions.

Functions can also be used for triggers to invoke.

For more information, see CREATE FUNCTION.

Grant
An SQL command that is used to allow a user or role to access specific objects within the database.

For more information, see GRANT.

Heap
Contains the values of row attributes (i.e., the data) for a relation. The heap is realized within one or more file segments in the relation's main fork.

Host
A computer that communicates with other computers over a network. This is sometimes used as a synonym for server. It is also used to refer to a computer where client processes run.

Index (relation)
A relation that contains data derived from a table or materialized view. Its internal structure supports fast retrieval of and access to the original data.

For more information, see CREATE INDEX.

Insert
An SQL command used to add new data into a table.

For more information, see INSERT.

Instance
A group of backend and auxiliary processes that communicate using a common shared memory area. One postmaster process manages the instance; one instance manages exactly one database cluster with all its databases. Many instances can run on the same server as long as their TCP ports do not conflict.

The instance handles all key features of a DBMS: read and write access to files and shared memory, assurance of the ACID properties, connections to client processes, privilege verification, crash recovery, replication, etc.

Isolation
The property that the effects of a transaction are not visible to concurrent transactions before it commits. This is one of the ACID properties.

For more information, see Section 13.2.

Join
An operation and SQL keyword used in queries for combining data from multiple relations.

Key
A means of identifying a row within a table or other relation by values contained within one or more attributes in that relation.

Lock
A mechanism that allows a process to limit or prevent simultaneous access to a resource.

Log file
Log files contain human-readable text lines about events. Examples include login failures, long-running queries, etc.

For more information, see Section 24.3.

Logged
A table is considered logged if changes to it are sent to the WAL. By default, all regular tables are logged. A table can be specified as unlogged either at creation time or via the ALTER TABLE command.

Logger (process)
If activated, the process writes information about database events into the current log file. When reaching certain time- or volume-dependent criteria, a new log file is created. Also called syslogger.

For more information, see Section 19.8.

Log record
Archaic term for a WAL record.

Master (server)
See Primary (server).

Materialized
The property that some information has been pre-computed and stored for later use, rather than computing it on-the-fly.

This term is used in materialized view, to mean that the data derived from the view's query is stored on disk separately from the sources of that data.

This term is also used to refer to some multi-step queries to mean that the data resulting from executing a given step is stored in memory (with the possibility of spilling to disk), so that it can be read multiple times by another step.

Materialized view (relation)
A relation that is defined by a SELECT statement (just like a view), but stores data in the same way that a table does. It cannot be modified via INSERT, UPDATE, or DELETE operations.

For more information, see CREATE MATERIALIZED VIEW.

Multi-version concurrency control (MVCC)
A mechanism designed to allow several transactions to be reading and writing the same rows without one process causing other processes to stall. In PostgreSQL, MVCC is implemented by creating copies (versions) of tuples as they are modified; after transactions that can see the old versions terminate, those old versions need to be removed.

Null
A concept of non-existence that is a central tenet of relational database theory. It represents the absence of a definite value.

Optimizer
See Query planner.

Parallel query
The ability to handle parts of executing a query to take advantage of parallel processes on servers with multiple CPUs.

Partition
One of several disjoint (not overlapping) subsets of a larger set.

In reference to a partitioned table: One of the tables that each contain part of the data of the partitioned table, which is said to be the parent. The partition is itself a table, so it can also be queried directly; at the same time, a partition can sometimes be a partitioned table, allowing hierarchies to be created.

In reference to a window function in a query, a partition is a user-defined criterion that identifies which neighboring rows of the query's result set can be considered by the function.

Partitioned table (relation)
A relation that is in semantic terms the same as a table, but whose storage is distributed across several partitions.

Postmaster (process)
The very first process of an instance. It starts and manages the other auxiliary processes and creates backend processes on demand.

For more information, see Section 18.3.

Primary key
A special case of a unique constraint defined on a table or other relation that also guarantees that all of the attributes within the primary key do not have null values. As the name implies, there can be only one primary key per table, though it is possible to have multiple unique constraints that also have no null-capable attributes.

Primary (server)
When two or more databases are linked via replication, the server that is considered the authoritative source of information is called the primary, also known as a master.

Procedure (routine)
A type of routine. Their distinctive qualities are that they do not return values, and that they are allowed to make transactional statements such as COMMIT and ROLLBACK. They are invoked via the CALL command.

For more information, see CREATE PROCEDURE.

Query
A request sent by a client to a backend, usually to return results or to modify data on the database.

Query planner
The part of PostgreSQL that is devoted to determining (planning) the most efficient way to execute queries. Also known as query optimizer, optimizer, or simply planner.

Record
See Tuple.

Recycling
See WAL file.

Referential integrity
A means of restricting data in one relation by a foreign key so that it must have matching data in another relation.

Relation
The generic term for all objects in a database that have a name and a list of attributes defined in a specific order. Tables, sequences, views, foreign tables, materialized views, composite types, and indexes are all relations.

More generically, a relation is a set of tuples; for example, the result of a query is also a relation.

In PostgreSQL, Class is an archaic synonym for relation.

Replica (server)
A database that is paired with a primary database and is maintaining a copy of some or all of the primary database's data. The foremost reasons for doing this are to allow for greater access to that data, and to maintain availability of the data in the event that the primary becomes unavailable.

Replication
The act of reproducing data on one server onto another server called a replica. This can take the form of physical replication, where all file changes from one server are copied verbatim, or logical replication where a defined subset of data changes are conveyed using a higher-level representation.

Result set
A relation transmitted from a backend process to a client upon the completion of an SQL command, usually a SELECT but it can be an INSERT, UPDATE, or DELETE command if the RETURNING clause is specified.

The fact that a result set is a relation means that a query can be used in the definition of another query, becoming a subquery.

Revoke
A command to prevent access to a named set of database objects for a named list of roles.

For more information, see REVOKE.

Role
A collection of access privileges to the instance. Roles are themselves a privilege that can be granted to other roles. This is often done for convenience or to ensure completeness when multiple users need the same privileges.

For more information, see CREATE ROLE.

Rollback
A command to undo all of the operations performed since the beginning of a transaction.

For more information, see ROLLBACK.

Routine
A defined set of instructions stored in the database system that can be invoked for execution. A routine can be written in a variety of programming languages. Routines can be functions (including set-returning functions and trigger functions), aggregate functions, and procedures.

Many routines are already defined within PostgreSQL itself, but user-defined ones can also be added.

Row
See Tuple.

Savepoint
A special mark in the sequence of steps in a transaction. Data modifications after this point in time may be reverted to the time of the savepoint.

For more information, see SAVEPOINT.

Schema
A schema is a namespace for SQL objects, which all reside in the same database. Each SQL object must reside in exactly one schema.

All system-defined SQL objects reside in schema pg_catalog.

More generically, the term schema is used to mean all data descriptions (table definitions, constraints, comments, etc) for a given database or subset thereof.

For more information, see Section 5.9.

Segment
See File segment.

Select
The SQL command used to request data from a database. Normally, SELECT commands are not expected to modify the database in any way, but it is possible that functions invoked within the query could have side effects that do modify data.

For more information, see SELECT.

Sequence (relation)
A type of relation that is used to generate values. Typically the generated values are sequential non-repeating numbers. They are commonly used to generate surrogate primary key values.

Server
A computer on which PostgreSQL instances run. The term server denotes real hardware, a container, or a virtual machine.

This term is sometimes used to refer to an instance or to a host.

Session
A state that allows a client and a backend to interact, communicating over a connection.

Shared memory
RAM which is used by the processes common to an instance. It mirrors parts of database files, provides a transient area for WAL records, and stores additional common information. Note that shared memory belongs to the complete instance, not to a single database.

The largest part of shared memory is known as shared buffers and is used to mirror part of data files, organized into pages. When a page is modified, it is called a dirty page until it is written back to the file system.

For more information, see Section 19.4.1.

SQL object
Any object that can be created with a CREATE command. Most objects are specific to one database, and are commonly known as local objects.

Most local objects belong to a specific schema in their containing database, such as relations (all types), routines (all types), data types, etc. The names of such objects of the same type in the same schema are enforced to be unique.

There also exist local objects that do not belong to schemas; some examples are extensions, data type casts, and foreign data wrappers. The names of such objects of the same type are enforced to be unique within the database.

Other object types, such as roles, tablespaces, replication origins, subscriptions for logical replication, and databases themselves are not local SQL objects since they exist entirely outside of any specific database; they are called global objects. The names of such objects are enforced to be unique within the whole database cluster.

For more information, see Section 22.1.

SQL standard
A series of documents that define the SQL language.

Standby (server)
See Replica (server).

Stats collector (process)
This process collects statistical information about the instance's activities.

For more information, see Section 27.2.

System catalog
A collection of tables which describe the structure of all SQL objects of the instance. The system catalog resides in the schema pg_catalog. These tables contain data in internal representation and are not typically considered useful for user examination; a number of user-friendlier views, also in schema pg_catalog, offer more convenient access to some of that information, while additional tables and views exist in schema information_schema (see Chapter 36) that expose some of the same and additional information as mandated by the SQL standard.

For more information, see Section 5.9.

Table
A collection of tuples having a common data structure (the same number of attributes, in the same order, having the same name and type per position). A table is the most common form of relation in PostgreSQL.

For more information, see CREATE TABLE.

Tablespace
A named location on the server file system. All SQL objects which require storage beyond their definition in the system catalog must belong to a single tablespace. Initially, a database cluster contains a single usable tablespace which is used as the default for all SQL objects, called pg_default.

For more information, see Section 22.6.

Temporary table
Tables that exist either for the lifetime of a session or a transaction, as specified at the time of creation. The data in them is not visible to other sessions, and is not logged. Temporary tables are often used to store intermediate data for a multi-step operation.

For more information, see CREATE TABLE.

TOAST
A mechanism by which large attributes of table rows are split and stored in a secondary table, called the TOAST table. Each relation with large attributes has its own TOAST table.

For more information, see Section 69.2.

Transaction
A combination of commands that must act as a single atomic command: they all succeed or all fail as a single unit, and their effects are not visible to other sessions until the transaction is complete, and possibly even later, depending on the isolation level.

For more information, see Section 13.2.

Transaction ID
The numerical, unique, sequentially-assigned identifier that each transaction receives when it first causes a database modification. Frequently abbreviated as xid. When stored on disk, xids are only 32-bits wide, so only approximately four billion write transaction IDs can be generated; to permit the system to run for longer than that, epochs are used, also 32 bits wide. When the counter reaches the maximum xid value, it starts over at 3 (values under that are reserved) and the epoch value is incremented by one. In some contexts, the epoch and xid values are considered together as a single 64-bit value.

For more information, see Section 8.19.

Transactions per second (TPS)
Average number of transactions that are executed per second, totaled across all sessions active for a measured run. This is used as a measure of the performance characteristics of an instance.

Trigger
A function which can be defined to execute whenever a certain operation (INSERT, UPDATE, DELETE, TRUNCATE) is applied to a relation. A trigger executes within the same transaction as the statement which invoked it, and if the function fails, then the invoking statement also fails.

For more information, see CREATE TRIGGER.

Tuple
A collection of attributes in a fixed order. That order may be defined by the table (or other relation) where the tuple is contained, in which case the tuple is often called a row. It may also be defined by the structure of a result set, in which case it is sometimes called a record.

Unique constraint
A type of constraint defined on a relation which restricts the values allowed in one or a combination of columns so that each value or combination of values can only appear once in the relation — that is, no other row in the relation contains values that are equal to those.

Because null values are not considered equal to each other, multiple rows with null values are allowed to exist without violating the unique constraint.

Unlogged
The property of certain relations that the changes to them are not reflected in the WAL. This disables replication and crash recovery for these relations.

The primary use of unlogged tables is for storing transient work data that must be shared across processes.

Temporary tables are always unlogged.

Update
An SQL command used to modify rows that may already exist in a specified table. It cannot create or remove rows.

For more information, see UPDATE.

User
A role that has the LOGIN privilege.

User mapping
The translation of login credentials in the local database to credentials in a remote data system defined by a foreign data wrapper.

For more information, see CREATE USER MAPPING.

Vacuum
The process of removing outdated tuple versions from tables or materialized views, and other closely related processing required by PostgreSQL's implementation of MVCC. This can be initiated through the use of the VACUUM command, but can also be handled automatically via autovacuum processes.

For more information, see Section 24.1 .

View
A relation that is defined by a SELECT statement, but has no storage of its own. Any time a query references a view, the definition of the view is substituted into the query as if the user had typed it as a subquery instead of the name of the view.

For more information, see CREATE VIEW.

Visibility map (fork)
A storage structure that keeps metadata about each data page of a table's main fork. The visibility map entry for each page stores two bits: the first one (all-visible) indicates that all tuples in the page are visible to all transactions. The second one (all-frozen) indicates that all tuples in the page are marked frozen.

WAL
See Write-ahead log.

WAL archiver (process)
A process that saves copies of WAL files for the purpose of creating backups or keeping replicas current.

For more information, see Section 25.3.

WAL file
Also known as WAL segment or WAL segment file. Each of the sequentially-numbered files that provide storage space for WAL. The files are all of the same predefined size and are written in sequential order, interspersing changes as they occur in multiple simultaneous sessions. If the system crashes, the files are read in order, and each of the changes is replayed to restore the system to the state it was in before the crash.

Each WAL file can be released after a checkpoint writes all the changes in it to the corresponding data files. Releasing the file can be done either by deleting it, or by changing its name so that it will be used in the future, which is called recycling.

For more information, see Section 29.5.

WAL record
A low-level description of an individual data change. It contains sufficient information for the data change to be re-executed (replayed) in case a system failure causes the change to be lost. WAL records use a non-printable binary format.

For more information, see Section 29.5.

WAL segment
See WAL file.

WAL writer (process)
A process that writes WAL records from shared memory to WAL files.

For more information, see Section 19.5.

Window function (routine)
A type of function used in a query that applies to a partition of the query's result set; the function's result is based on values found in rows of the same partition or frame.

All aggregate functions can be used as window functions, but window functions can also be used to, for example, give ranks to each of the rows in the partition. Also known as analytic functions.

For more information, see Section 3.5.

Write-ahead log
The journal that keeps track of the changes in the database cluster as user- and system-invoked operations take place. It comprises many individual WAL records written sequentially to WAL files.