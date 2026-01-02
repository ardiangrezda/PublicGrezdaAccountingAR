USE [GrezdaAccountingPublicDB]
GO

SET QUOTED_IDENTIFIER ON
GO

PRINT ''
PRINT '========================================='
PRINT 'Seeding Initial Data'
PRINT '========================================='
PRINT ''

-- ============================================
-- Insert AspNetRoles
-- ============================================
PRINT 'Inserting AspNetRoles...'
INSERT INTO [dbo].[AspNetRoles] (Id, Name, NormalizedName, ConcurrencyStamp)
VALUES 
    ('810a6b5d-3b5b-46da-96c2-d7a9e5264d7e', 'Accountant', 'ACCOUNTANT', NULL),
    ('b5211351-6de3-4045-bb3f-61901d1290f6', 'User', 'USER', NULL),
    ('d3901d87-a5a0-4c3e-b6f3-e05134a9b297', 'Admin', 'ADMIN', NULL)
PRINT '✓ AspNetRoles inserted (3 records)'

-- ============================================
-- Insert AspNetUsers
-- ============================================
PRINT 'Inserting AspNetUsers...'
INSERT INTO [dbo].[AspNetUsers] 
    (Id, FirstName, LastName, IsActive, CreatedAt, LastLoginAt, UserName, NormalizedUserName, 
     Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp, 
     PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount)
VALUES 
    ('cce4b8c2-d558-4073-97dc-81fe2aa420b0', 'Admin', 'User', 1, GETDATE(), NULL, 
     'admin', 'ADMIN', 'admin@accounting.com', 'ADMIN@ACCOUNTING.COM', 1, 
     'AQAAAAIAAYagAAAAEA5Mcw/zb7d4bXmDuwK/TJjYTCOEzceQghqbVfKdB3Um8DKjDYT/4V6Ti0QoUqNO5Q==', 
     'AMRVCAK7GZT5D5SWO7QOSZM5XDBICXSK', '5d27e6f6-d055-45ef-be93-4a18132b9bd1', 
     NULL, 0, 0, NULL, 1, 0)
PRINT '✓ AspNetUsers inserted (1 record - admin)'

-- ============================================
-- Insert AspNetUserRoles
-- ============================================
PRINT 'Inserting AspNetUserRoles...'
INSERT INTO [dbo].[AspNetUserRoles] (UserId, RoleId)
VALUES 
    ('cce4b8c2-d558-4073-97dc-81fe2aa420b0', 'd3901d87-a5a0-4c3e-b6f3-e05134a9b297')
PRINT '✓ AspNetUserRoles inserted (Admin = Admin role)'

-- ============================================
-- Insert Currencies (MUST BE BEFORE CompanySettings)
-- ============================================
PRINT 'Inserting Currencies...'
SET IDENTITY_INSERT [dbo].[Currencies] ON
INSERT INTO [dbo].[Currencies] (CurrencyId, Code, Name, Symbol)
VALUES 
    (1, 'EUR', 'Euro', '€'),
    (2, 'USD', 'US Dollar', '$'),
    (3, 'ALL', 'Albanian Lek', 'L')
SET IDENTITY_INSERT [dbo].[Currencies] OFF
PRINT '✓ Currencies inserted (3 records)'

-- ============================================
-- Insert Languages
-- ============================================
PRINT 'Inserting Languages...'
SET IDENTITY_INSERT [dbo].[Languages] ON
INSERT INTO [dbo].[Languages] (LanguageId, Code, Name, NativeName, IsDefault, IsActive)
VALUES 
    (1, 'ENG', 'English', 'English', 1, 1),
    (2, 'ALB', 'Albanian', 'Shqip', 0, 1),
    (3, 'SRB', 'Serbian', 'Српски', 0, 1)
SET IDENTITY_INSERT [dbo].[Languages] OFF
PRINT '✓ Languages inserted (3 records)'

-- ============================================
-- Insert CompanySettings (NOW currencies exist!)
-- ============================================
PRINT 'Inserting CompanySettings...'
SET IDENTITY_INSERT [dbo].[CompanySettings] ON
INSERT INTO [dbo].[CompanySettings] 
    (Id, CompanyName, TradeName, LogoPath, VATNumber, BusinessRegistrationNumber, NUI, 
     Address, City, PostalCode, Country, PhoneNumber, Email, Website, TaxOffice,
     DefaultCurrencyId, FiscalYearStartMonth, FiscalYearStartDay,
     BankAccountDetails, IBAN, SwiftBicCode, BankName,
     InvoiceFooterText, TermsAndConditions, DateFormat, NumberFormat,
     DefaultLanguageId, CreatedAt, UpdatedAt, LastModifiedByUserId)
VALUES 
    (1, 'Demo Company', 'Demo Company Ltd.', NULL, NULL, NULL, NULL,
     'Demo Address', 'Demo City', NULL, 'Kosovo', NULL, 'info@democompany.com', NULL, NULL,
     1, 1, 1,
     NULL, NULL, NULL, NULL,
     'Thank you for your business!', 'Payment terms: Net 30 days', 'dd/MM/yyyy', '#,##0.00',
     1, GETDATE(), NULL, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0')
SET IDENTITY_INSERT [dbo].[CompanySettings] OFF
PRINT '✓ CompanySettings inserted (1 record)'

-- ============================================
-- Insert LocalizationStrings (Copy from AccountingSystem)
-- ============================================
PRINT 'Inserting LocalizationStrings from AccountingSystem...'
SET IDENTITY_INSERT [dbo].[LocalizationStrings] ON

INSERT INTO [GrezdaAccountingPublicDB].[dbo].[LocalizationStrings] 
    (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt)
SELECT 
    StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt
FROM [AccountingSystem].[dbo].[LocalizationStrings]

SET IDENTITY_INSERT [dbo].[LocalizationStrings] OFF
PRINT '✓ LocalizationStrings copied from AccountingSystem'

-- ============================================
-- Insert BusinessUnits
-- ============================================
PRINT 'Inserting BusinessUnits...'
SET IDENTITY_INSERT [dbo].[BusinessUnits] ON
INSERT INTO [dbo].[BusinessUnits] (Id, Code, Name, Description, Address, IsActive, CreatedAt, LastModifiedAt)
VALUES 
    (4, '001', 'Test business unit 1', 'Test business unit 1', 'Test Address', 1, 
     GETDATE(), GETDATE())
SET IDENTITY_INSERT [dbo].[BusinessUnits] OFF
PRINT '✓ BusinessUnits inserted (1 record)'

-- ============================================
-- Insert Modules
-- ============================================
PRINT 'Inserting Modules...'
SET IDENTITY_INSERT [dbo].[Modules] ON
INSERT INTO [dbo].[Modules] (Id, Name, Description, RazorPage)
VALUES 
    (1, 'Subjects', 'Module for managing subjects', 'SubjectDetail.razor, SubjectForm.razor, Subjects.razor'),
    (2, 'Articles', 'Module for managing articles', 'ArticleDetail.razor, ArticleForm.razor, Articles.razor'),
    (3, 'Sales', 'Module for managing sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor'),
    (4, 'System Settings', 'Module for configuring system-wide settings', 'Settings.razor'),
    (5, 'Purchases', 'Module for managing purchases', 'Purchases.razor'),
    (6, 'Payments', 'Module for managing payments', NULL),
    (7, 'Accounting', 'Module for managing accounting', NULL),
    (8, 'InternalTransfers', 'Module for managing internal transfers', NULL)
SET IDENTITY_INSERT [dbo].[Modules] OFF
PRINT '✓ Modules inserted (8 records)'

-- ============================================
-- Insert Submodules
-- ============================================
PRINT 'Inserting Submodules...'
SET IDENTITY_INSERT [dbo].[Submodules] ON
INSERT INTO [dbo].[Submodules] (Id, Name, Description, RazorPage, VariantCode, ModuleId)
VALUES 
    (1, 'Domestic sales', 'Domestic sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'DOM', 3),
    (2, 'Cash sales', 'Cash sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'CASH', 3),
    (3, 'Export sales', 'Export sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'EXP', 3),
    (4, 'Delivery sales', 'Delivery sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'DEL', 3),
    (5, 'Service sales', 'Service sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'SERV', 3),
    (6, 'Credit note sales', 'Credit note sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'CN', 3),
    (7, 'Returns', 'Returns', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'RET', 3),
    (8, 'Other sales', 'Other sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'OTHER', 3),
    (9, 'User Management', 'Manage application users and their access', 'Users.razor, UserBusinessUnits.razor', NULL, 4),
    (10, 'Business Unit Management', 'Manage business units and their details', 'BusinessUnitForm.razor', NULL, 4),
    (11, 'System Settings', 'Configure system-wide settings', 'Settings.razor', NULL, 4),
    (14, 'Summary Invoice', 'Summary Invoice', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'SUM', 3),
    (15, 'Invoice Printing', 'Invoice Printing', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'PRINT', 3),
    (16, 'Barcode Sales', 'Barcode Sales', 'Sales.razor, SalesInvoice.razor, SalesInvoiceDetail.razor', 'BAR', 3),
    (17, 'Import Purchase', 'Import Purchase', 'Purchases.razor', 'P_IMP', 5),
    (18, 'Domestic Purchase', 'Domestic Purchase', 'Purchases.razor', 'P_DOM', 5),
    (19, 'Expense Purchase', 'Expense Purchase', 'Purchases.razor', 'P_EXP', 5),
    (20, 'Debit Note', 'Debit Note', 'Purchases.razor', 'P_DN', 5),
    (21, 'Purchase Return', 'Purchase Return', 'Purchases.razor', 'P_RET', 5),
    (22, 'Reverse Charge', 'Reverse Charge', 'Purchases.razor', 'P_REV', 5)
SET IDENTITY_INSERT [dbo].[Submodules] OFF
PRINT '✓ Submodules inserted (20 records)'

-- ============================================
-- Insert UserBusinessUnits
-- ============================================
PRINT 'Inserting UserBusinessUnits...'
INSERT INTO [dbo].[UserBusinessUnits] (UserId, BusinessUnitId, AssignedAt, IsActive)
VALUES 
    ('cce4b8c2-d558-4073-97dc-81fe2aa420b0', 4, GETDATE(), 1)
PRINT '✓ UserBusinessUnits inserted (1 record)'

-- ============================================
-- Insert UserModuleAccesses
-- ============================================
PRINT 'Inserting UserModuleAccesses...'
SET IDENTITY_INSERT [dbo].[UserModuleAccesses] ON
INSERT INTO [dbo].[UserModuleAccesses] (Id, UserId, ModuleId, SubmoduleId)
VALUES 
    (64, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0', 1, NULL),
    (65, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0', 2, NULL),
    (66, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0', 3, 1),
    (67, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0', 3, 2),
    (68, 'cce4b8c2-d558-4073-97dc-81fe2aa420b0', 3, 3)
SET IDENTITY_INSERT [dbo].[UserModuleAccesses] OFF
PRINT '✓ UserModuleAccesses inserted (5 records)'

-- ============================================
-- Insert UserSettings
-- ============================================
PRINT 'Inserting UserSettings...'
INSERT INTO [dbo].[UserSettings] (UserId, SelectedLanguageId, CreatedAt, UpdatedAt)
VALUES 
    ('cce4b8c2-d558-4073-97dc-81fe2aa420b0', 1, GETDATE(), NULL)
PRINT '✓ UserSettings inserted (1 record)'

GO

PRINT ''
PRINT '========================================='
PRINT '✅ ALL SEED DATA INSERTED SUCCESSFULLY!'
PRINT '========================================='
PRINT ''
PRINT 'Summary:'
SELECT 'Currencies' AS TableName, COUNT(*) AS RecordCount FROM Currencies
UNION ALL SELECT 'CompanySettings', COUNT(*) FROM CompanySettings
UNION ALL SELECT 'LocalizationStrings', COUNT(*) FROM LocalizationStrings
UNION ALL SELECT 'Languages', COUNT(*) FROM Languages
UNION ALL SELECT 'BusinessUnits', COUNT(*) FROM BusinessUnits
UNION ALL SELECT 'Modules', COUNT(*) FROM Modules
UNION ALL SELECT 'Submodules', COUNT(*) FROM Submodules
UNION ALL SELECT 'AspNetUsers', COUNT(*) FROM AspNetUsers
UNION ALL SELECT 'AspNetRoles', COUNT(*) FROM AspNetRoles
ORDER BY TableName

PRINT ''
PRINT 'Login Credentials:'
PRINT '  Username: admin'
PRINT '  Email: admin@accounting.com'
PRINT ''
