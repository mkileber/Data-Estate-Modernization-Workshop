sp_configure 'remote data archive',1
go
reconfigure
go

USE AdventureWorks2017
CREATE MASTER KEY ENCRYPTION BY PASSWORD= 'AzureLS1Setup!';

-- In the same query window where you created or opened the master key:
CREATE DATABASE SCOPED CREDENTIAL StretchArticlePassword
WITH 
  IDENTITY = 'mkileber'
  ,SECRET = 'AzureLS1Setup!';
GO

use [master]
GO
ALTER DATABASE [AdventureWorks2017]
    SET REMOTE_DATA_ARCHIVE = ON  
        (  
            SERVER = 'adventureworks2017stretchserver.database.windows.net' ,  
            CREDENTIAL = StretchArticlePassword  
        ) ;  
GO
