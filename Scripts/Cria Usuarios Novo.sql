USE [CEP_BR]
GO

/****** Apaga os Usuário (DBATAK, DBCEP e DBCLIENTE da Tabela CEP_BR ******/

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBATAK')
DROP USER [DBATAK]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCEP')
DROP USER [DBCEP]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCLIENTE')
DROP USER [DBCLIENTE]
GO


USE [LOGSISATAK]
GO

/****** Object:  Schema [ICEUser]    Script Date: 01/11/2011 13:47:52 ******/

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'ICEUser')
DROP SCHEMA [ICEUser]
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DBATAK')
DROP SCHEMA [DBATAK]
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DBCEP')
DROP SCHEMA [DBCEP]
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DBCLIENTE')
DROP SCHEMA [DBCLIENTE]
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DBLOG')
DROP SCHEMA [DBLOG]

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBATAK')
DROP USER [DBATAK]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCEP')
DROP USER [DBCEP]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCLIENTE')
DROP USER [DBCLIENTE]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBLOG')
DROP USER [DBLOG]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ICEUser')
DROP USER [ICEUser]

GO

USE [SATKBASE]   ---Alterar o Nome da Base
GO

/****** Object:  User [DBATAK]    Script Date: 01/1/2011 13:51:40 ******/

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBATAK')
DROP USER [DBATAK]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCLIENTE')
DROP USER [DBCLIENTE]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBBACKUP')
DROP USER [DBBACKUP]
GO

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DBATAK')
DROP LOGIN [DBATAK]
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DBCEP')
DROP LOGIN [DBCEP]
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DBCLIENTE')
DROP LOGIN [DBCLIENTE]
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DBLOG')
DROP LOGIN [DBLOG]
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ICEUSer')
DROP LOGIN [ICEUser]
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DBBACKUP')
DROP LOGIN [DBBACKUP]
GO

--- Cria DBCLIENTE
--- MUDAR NOME DA BASE

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCLIENTE')
CREATE LOGIN DBCLIENTE WITH PASSWORD = '12345' 
,DEFAULT_DATABASE = [SATKBASE], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'bulkadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'dbcreator'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'diskadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'processadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'securityadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'serveradmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'setupadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBCLIENTE', @rolename = N'sysadmin'
USE [CEP_BR]
CREATE USER [DBCLIENTE] FOR LOGIN [DBCLIENTE]
EXEC sp_addrolemember N'db_owner', N'DBCLIENTE'
USE [LOGSISATAK]
CREATE USER [DBCLIENTE] FOR LOGIN [DBCLIENTE]
EXEC sp_addrolemember N'db_owner', N'DBCLIENTE'
USE [SATKBASE]
CREATE USER [DBCLIENTE] FOR LOGIN [DBCLIENTE]
EXEC sp_addrolemember N'db_owner', N'DBCLIENTE'
GO

---CRIA DBATAK

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBATAK')
CREATE LOGIN DBATAK WITH PASSWORD = 'sa_admin!npa' 
,DEFAULT_DATABASE = [SATKBASE], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'bulkadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'dbcreator'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'diskadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'processadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'securityadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'serveradmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'setupadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBATAK', @rolename = N'sysadmin'
USE [CEP_BR]
CREATE USER [DBATAK] FOR LOGIN [DBATAK]
EXEC sp_addrolemember N'db_owner', N'DBATAK'
USE [LOGSISATAK]
CREATE USER [DBATAK] FOR LOGIN [DBATAK]
EXEC sp_addrolemember N'db_owner', N'DBATAK'
USE [SATKBASE]
CREATE USER [DBATAK] FOR LOGIN [DBATAK]
EXEC sp_addrolemember N'db_owner', N'DBATAK'
GO


---CRIA DBREPLICA

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBREPLICA')
CREATE LOGIN DBREPLICA WITH PASSWORD = 'sa_admin!replica' 
,DEFAULT_DATABASE = [SATKBASE], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'bulkadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'dbcreator'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'diskadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'processadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'securityadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'serveradmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'setupadmin'
EXEC master..sp_addsrvrolemember @loginame = N'DBREPLICA', @rolename = N'sysadmin'
USE [CEP_BR]
CREATE USER [DBREPLICA] FOR LOGIN [DBREPLICA]
EXEC sp_addrolemember N'db_owner', N'DBREPLICA'
USE [LOGSISATAK]
CREATE USER [DBREPLICA] FOR LOGIN [DBREPLICA]
EXEC sp_addrolemember N'db_owner', N'DBREPLICA'
USE [SATKBASE]
CREATE USER [DBREPLICA] FOR LOGIN [DBREPLICA]
EXEC sp_addrolemember N'db_owner', N'DBREPLICA'
GO

---CRIA DBCEP

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBCEP')
CREATE LOGIN DBCEP WITH PASSWORD = '12345' 
,DEFAULT_DATABASE = [CEP_BR], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'DBCEP', @rolename = N'sysadmin'
USE [CEP_BR]
CREATE USER [DBCEP] FOR LOGIN [DBCEP]
EXEC sp_addrolemember N'db_owner', N'DBCEP'
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ICEUser')
CREATE LOGIN ICEUSer WITH PASSWORD = '12345' 
,DEFAULT_DATABASE = [master], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'ICEUSer', @rolename = N'sysadmin'
GO

---CRIA DBLOG

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DBLOG')
CREATE LOGIN DBLOG WITH PASSWORD = '12345' 
,DEFAULT_DATABASE = [CEP_BR], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF 
EXEC master..sp_addsrvrolemember @loginame = N'DBLOG', @rolename = N'sysadmin'
USE [LOGSISATAK]
CREATE USER [DBLOG] FOR LOGIN [DBLOG]
EXEC sp_addrolemember N'db_owner', N'DBLOG'
GO

--- ICEUSER

IF EXISTS(SELECT * FROM MASTER..SYSLOGINS WHERE UPPER(NAME)='ICEUSER')
BEGIN
  EXEC master..sp_dropsrvrolemember @loginame = N'ICEUser', @rolename = N'sysadmin'
  IF not exists(select u.sid from logsisatak..sysusers U
				inner join master.dbo.syslogins L
				on U.sid = L.sid
				where l.isntname = 0 and l.loginname = 'iceuser')
  BEGIN
    EXEC logsisatak..sp_grantdbaccess @loginame = N'ICEUser', @name_in_db = N'ICEUser'
  END
  IF EXISTS(SELECT SERVERPROPERTY('productversion') where cast(SERVERPROPERTY('productversion') as char(5)) >= '9')
    exec master..sp_executesql N'GRANT VIEW SERVER STATE TO ICEUser'
    EXEC master..sp_addsrvrolemember @loginame = N'ICEUSer', @rolename = N'sysadmin'
END

---- MUDA NOME DA BASE

USE [master]
CREATE LOGIN [DBBACKUP] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[SATKBASE], DEFAULT_LANGUAGE=[English], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
EXEC master..sp_addsrvrolemember @loginame = N'DBBACKUP', @rolename = N'sysadmin'



--- CRIA DBBACKUP

USE [SATKBASE]  
CREATE USER [DBBACKUP] FOR LOGIN [DBBACKUP]
EXEC sp_addrolemember N'db_backupoperator', N'DBBACKUP'
EXEC sp_addrolemember N'db_owner', N'DBBACKUP'
GO