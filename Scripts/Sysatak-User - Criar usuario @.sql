                declare @cmdmaster nvarchar(256);
                If not Exists (select * from master.dbo.syslogins where name = 'sisatak-user')                
                begin
                  set @cmdmaster = 'USE [master]; CREATE LOGIN [sisatak-user] WITH PASSWORD='+''''+'$!$@t@k-U$&r'+''''+', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;'
                  exec sp_executesql @cmdmaster;                  
                end
                set @cmdmaster = 'USE [master]; GRANT ADMINISTER BULK OPERATIONS TO [sisatak-user];'
                exec sp_executesql @cmdmaster;
                set @cmdmaster = 'EXEC master..sp_addsrvrolemember @loginame = '+''''+'sisatak-user'+''''+', @rolename = '+''''+'sysadmin'+'''';
                exec sp_executesql @cmdmaster;
                declare @cmd1 nvarchar(128);
                if not Exists (select * from sys.database_principals where name='sisatak-user')
                begin                  
                  set @cmd1='CREATE USER [sisatak-user] FOR LOGIN [sisatak-user];';                                                                  
                  exec sp_executesql @cmd1;                  
                end
                set @cmd1='EXEC sp_addrolemember N'+''''+'db_datareader'+''''+', N'+''''+'sisatak-user'+'''';
                exec sp_executesql @cmd1;
                set @cmd1='EXEC sp_addrolemember N'+''''+'db_datawriter'+''''+', N'+''''+'sisatak-user'+'''';
                exec sp_executesql @cmd1;
GO
