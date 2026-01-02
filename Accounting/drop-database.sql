USE master
GO

-- Drop database if exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'GrezdaAccountingPublicDB')
BEGIN
    ALTER DATABASE GrezdaAccountingPublicDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE GrezdaAccountingPublicDB
    PRINT '✓ Database dropped'
END