-- Créer la base de données si elle n'existe pas
IF DB_ID('PFAopticien') IS NULL
BEGIN
    CREATE DATABASE PFAopticien;
END
GO

-- Utiliser la base de données
USE PFAopticien;
GO

-- Créer l'utilisateur SQL (login) si non existant
IF NOT EXISTS (
    SELECT name FROM master.sys.sql_logins WHERE name = 'OuissalMrhar'
)
BEGIN
    CREATE LOGIN OuissalMrhar WITH PASSWORD = 'Pfa@2024Secure', CHECK_POLICY = OFF;
END
GO

-- Créer un utilisateur dans la base liée à ce login
IF NOT EXISTS (
    SELECT name FROM sys.database_principals WHERE name = 'OuissalMrhar'
)
BEGIN
    CREATE USER OuissalMrhar FOR LOGIN OuissalMrhar;
    EXEC sp_addrolemember 'db_owner', 'OuissalMrhar';
END
GO