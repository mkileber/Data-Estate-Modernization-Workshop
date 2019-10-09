USE master
CREATE CREDENTIAL [https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer] WITH IDENTITY='Shared Access Signature', SECRET='sv=2018-03-28&sr=c&si=dataestatemodpolicy&sig=KtqkdAEIhQiU0VjKR8nDLFXMBLZ68sC%2F%2FwAMZ8OyVN4%3D'
GO

USE master;  
ALTER DATABASE AdventureWorks2017  
   SET RECOVERY FULL;

USE master
BACKUP DATABASE AdventureWorks2017   
   TO URL = 'https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer/AdventureWorks2017_fromonprem.bak'

USE master
RESTORE DATABASE AdventureWorks2017   
   FROM URL = 'https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer/AdventureWorks2017_fromonprem.bak'   
   WITH  REPLACE,
      MOVE 'AdventureWorks2017' to 'https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer/AdventureWorks2017.mdf'  
     ,MOVE 'AdventureWorks2017_log' to 'https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer/AdventureWorks2017_log.ldf'  

USE master
RESTORE DATABASE AdventureWorks2017   
   FROM URL = 'https://dataestatemoddemostorage.blob.core.windows.net/dataestatemodcontainer/AdventureWorks2017_fromonprem.bak'   
   WITH  REPLACE,
      MOVE 'AdventureWorks2017' to 'F:\Data\AdventureWorks2017.mdf'  
     ,MOVE 'AdventureWorks2017_log' to 'F:\Log\AdventureWorks2017_log.ldf'  
