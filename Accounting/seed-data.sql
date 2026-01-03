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
     'AQAAAAIAAYagAAAAENbgvPn0Xhw5OeQWRd3pA5Zc1qULvmTyWuNWahHH8AkA7tbWDlQrSTH+MDoWb3KvoQ==', 
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
-- Insert LocalizationStrings (Direct - No Dependency)
-- ============================================
PRINT 'Inserting LocalizationStrings...'
SET IDENTITY_INSERT [dbo].[LocalizationStrings] ON

-- Paste ALL 1245 INSERT statements here from all-localizations-complete.sql
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1, 'STRING_00001', 1, N'Article Management', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (2, 'STRING_00002', 1, N'New Article', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (3, 'STRING_00003', 1, N'Search articles...', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (4, 'STRING_00004', 1, N'All Categories', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (5, 'STRING_00005', 1, N'Show Inactive', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (6, 'STRING_00006', 1, N'Total Articles', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (7, 'STRING_00007', 1, N'Active Articles', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (8, 'STRING_00008', 1, N'Low Stock', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (9, 'STRING_00009', 1, N'Total Value', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (10, 'STRING_00010', 1, N'Barcode', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (11, 'STRING_00011', 1, N'Name', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (12, 'STRING_00012', 1, N'Category', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (13, 'STRING_00013', 1, N'Unit', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (14, 'STRING_00014', 1, N'Price', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (15, 'STRING_00015', 1, N'VAT Rate', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (16, 'STRING_00016', 1, N'Stock', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (17, 'STRING_00017', 1, N'Status', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (18, 'STRING_00018', 1, N'Actions', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (19, 'STRING_00019', 1, N'Active', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (20, 'STRING_00020', 1, N'Inactive', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (21, 'STRING_00021', 1, N'Edit', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (22, 'STRING_00022', 1, N'Delete', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (23, 'STRING_00023', 1, N'View', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (24, 'STRING_00024', 1, N'Save', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (25, 'STRING_00025', 1, N'Cancel', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (26, 'STRING_00026', 1, N'Create Article', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (27, 'STRING_00027', 1, N'Edit Article', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (28, 'STRING_00028', 1, N'Description', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (29, 'STRING_00029', 1, N'Currency', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (30, 'STRING_00030', 1, N'Stock Quantity', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (31, 'STRING_00001', 2, N'Menaxhimi i Artikujve', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (32, 'STRING_00002', 2, N'Artikull i Ri', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (33, 'STRING_00003', 2, N'Kлrko artikuj...', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (34, 'STRING_00004', 2, N'Tл gjitha Kategoritл', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (35, 'STRING_00005', 2, N'Shfaq joaktivлt', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (36, 'STRING_00006', 2, N'Totali i Artikujve', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (37, 'STRING_00007', 2, N'Artikuj Aktivл', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (38, 'STRING_00008', 2, N'Stok i Ulлt', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (39, 'STRING_00009', 2, N'Vlera Totale', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (40, 'STRING_00010', 2, N'Barkodi', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (41, 'STRING_00011', 2, N'Emri', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (42, 'STRING_00012', 2, N'Kategoria', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (43, 'STRING_00013', 2, N'Njлsia', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (44, 'STRING_00014', 2, N'Зmimi', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (45, 'STRING_00015', 2, N'Norma TVSH', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (46, 'STRING_00016', 2, N'Stoku', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (47, 'STRING_00017', 2, N'Statusi', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (48, 'STRING_00018', 2, N'Veprimet', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (49, 'STRING_00019', 2, N'Aktiv', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (50, 'STRING_00020', 2, N'Joaktiv', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (51, 'STRING_00021', 2, N'Redakto', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (52, 'STRING_00022', 2, N'Fshi', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (53, 'STRING_00023', 2, N'Shiko', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (54, 'STRING_00024', 2, N'Ruaj', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (55, 'STRING_00025', 2, N'Anulo', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (56, 'STRING_00026', 2, N'Krijo Artikull', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (57, 'STRING_00027', 2, N'Redakto Artikull', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (58, 'STRING_00028', 2, N'Pлrshkrimi', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (59, 'STRING_00029', 2, N'Monedha', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (60, 'STRING_00030', 2, N'Sasia nл Stok', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (61, 'STRING_00001', 3, N'Upravljanje Artiklima', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (62, 'STRING_00002', 3, N'Novi Artikal', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (63, 'STRING_00003', 3, N'Pretraћi artikle...', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (64, 'STRING_00004', 3, N'Sve Kategorije', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (65, 'STRING_00005', 3, N'Prikaћi Neaktivne', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (66, 'STRING_00006', 3, N'Ukupno Artikala', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (67, 'STRING_00007', 3, N'Aktivni Artikli', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (68, 'STRING_00008', 3, N'Male Zalihe', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (69, 'STRING_00009', 3, N'Ukupna Vrednost', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (70, 'STRING_00010', 3, N'Barkod', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (71, 'STRING_00011', 3, N'Naziv', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (72, 'STRING_00012', 3, N'Kategorija', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (73, 'STRING_00013', 3, N'Jedinica', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (74, 'STRING_00014', 3, N'Cena', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (75, 'STRING_00015', 3, N'PDV Stopa', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (76, 'STRING_00016', 3, N'Zaliha', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (77, 'STRING_00017', 3, N'Status', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (78, 'STRING_00018', 3, N'Akcije', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (79, 'STRING_00019', 3, N'Aktivan', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (80, 'STRING_00020', 3, N'Neaktivan', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (81, 'STRING_00021', 3, N'Izmeni', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (82, 'STRING_00022', 3, N'Obriљi', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (83, 'STRING_00023', 3, N'Pregledaj', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (84, 'STRING_00024', 3, N'Sacuvaj', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (85, 'STRING_00025', 3, N'Otkaћi', 'Actions', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (86, 'STRING_00026', 3, N'Kreiraj Artikal', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (87, 'STRING_00027', 3, N'Izmeni Artikal', 'UI', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (88, 'STRING_00028', 3, N'Opis', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (89, 'STRING_00029', 3, N'Valuta', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (90, 'STRING_00030', 3, N'Kolicina na Zalihi', 'Labels', '2025-08-09 15:51:31.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (91, 'STRING_00031', 1, N'Subjects', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (92, 'STRING_00032', 1, N'Search subjects', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (93, 'STRING_00033', 1, N'Code', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (94, 'STRING_00034', 1, N'Subject Name', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (95, 'STRING_00035', 1, N'NUI/Fiscal Nr', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (96, 'STRING_00036', 1, N'Contact', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (97, 'STRING_00037', 1, N'Type', NULL, '2025-09-12 14:15:53.456', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (98, 'STRING_00038', 1, N'Status', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (99, 'STRING_00039', 1, N'Actions', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (100, 'STRING_00040', 1, N'New Subject', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (101, 'STRING_00041', 1, N'Basic Information', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (102, 'STRING_00042', 1, N'Description', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (103, 'STRING_00043', 1, N'NUI', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (104, 'STRING_00044', 1, N'Fiscal Number', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (105, 'STRING_00045', 1, N'Contact Information', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (106, 'STRING_00046', 1, N'Contact Person', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (107, 'STRING_00047', 1, N'Address', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (108, 'STRING_00048', 1, N'Telephone', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (109, 'STRING_00049', 1, N'Email', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (110, 'STRING_00050', 1, N'Website', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (111, 'STRING_00051', 1, N'Subject Type', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (112, 'STRING_00052', 1, N'Accounts Receivable', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (113, 'STRING_00053', 1, N'Accounts Payable', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (114, 'STRING_00054', 1, N'Buyer', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (115, 'STRING_00055', 1, N'Supplier', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (116, 'STRING_00056', 1, N'Cash Only Buyer', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (117, 'STRING_00057', 1, N'International', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (118, 'STRING_00058', 1, N'Mobile Sales', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (119, 'STRING_00059', 1, N'Without VAT', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (120, 'STRING_00060', 1, N'Farmer', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (121, 'STRING_00061', 1, N'Active', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (122, 'STRING_00031', 2, N'Subjektet', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (123, 'STRING_00032', 2, N'Kлrko subjektet', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (124, 'STRING_00033', 2, N'Kodi', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (125, 'STRING_00034', 2, N'Emri i Subjektit', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (126, 'STRING_00035', 2, N'NUI/Nr. Fiskal', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (127, 'STRING_00036', 2, N'Kontakti', NULL, '2025-09-12 14:15:53.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (128, 'STRING_00037', 2, N'Lloji', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (129, 'STRING_00038', 2, N'Statusi', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (130, 'STRING_00039', 2, N'Veprimet', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (131, 'STRING_00040', 2, N'Subjekt i Ri', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (132, 'STRING_00041', 2, N'Informacioni Bazл', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (133, 'STRING_00042', 2, N'Pлrshkrimi', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (134, 'STRING_00043', 2, N'NUI', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (135, 'STRING_00044', 2, N'Numri Fiskal', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (136, 'STRING_00045', 2, N'Informacioni i Kontaktit', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (137, 'STRING_00046', 2, N'Personi i Kontaktit', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (138, 'STRING_00047', 2, N'Adresa', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (139, 'STRING_00048', 2, N'Telefoni', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (140, 'STRING_00049', 2, N'Email', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (141, 'STRING_00050', 2, N'Faqja e internetit', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (142, 'STRING_00051', 2, N'Lloji i Subjektit', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (143, 'STRING_00052', 2, N'Llogaritл e Arkлtueshme', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (144, 'STRING_00053', 2, N'Llogaritл e Pagueshme', NULL, '2025-09-12 14:15:53.463', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (145, 'STRING_00054', 2, N'Blerлs', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (146, 'STRING_00055', 2, N'Furnitor', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (147, 'STRING_00056', 2, N'Blerлs Vetлm me Para tл Gatshme', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (148, 'STRING_00057', 2, N'Ndлrkombлtar', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (149, 'STRING_00058', 2, N'Shitje Mobile', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (150, 'STRING_00059', 2, N'Pa TVSH', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (151, 'STRING_00060', 2, N'Fermer', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (152, 'STRING_00061', 2, N'Aktiv', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (153, 'STRING_00031', 3, N'Subjekti', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (154, 'STRING_00032', 3, N'Pretraћi subjekte', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (155, 'STRING_00033', 3, N'Kod', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (156, 'STRING_00034', 3, N'Ime Subjekta', NULL, '2025-09-12 14:15:53.466', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (157, 'STRING_00035', 3, N'NUI/Fiskalni Br', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (158, 'STRING_00036', 3, N'Kontakt', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (159, 'STRING_00037', 3, N'Tip', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (160, 'STRING_00038', 3, N'Status', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (161, 'STRING_00039', 3, N'Akcije', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (162, 'STRING_00040', 3, N'Novi Subjekt', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (163, 'STRING_00041', 3, N'Osnovne Informacije', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (164, 'STRING_00042', 3, N'Opis', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (165, 'STRING_00043', 3, N'NUI', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (166, 'STRING_00044', 3, N'Fiskalni Broj', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (167, 'STRING_00045', 3, N'Kontakt Informacije', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (168, 'STRING_00046', 3, N'Kontakt Osoba', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (169, 'STRING_00047', 3, N'Adresa', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (170, 'STRING_00048', 3, N'Telefon', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (171, 'STRING_00049', 3, N'Email', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (172, 'STRING_00050', 3, N'Website', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (173, 'STRING_00051', 3, N'Tip Subjekta', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (174, 'STRING_00052', 3, N'Potraћivanja', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (175, 'STRING_00053', 3, N'Dugovanja', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (176, 'STRING_00054', 3, N'Kupac', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (177, 'STRING_00055', 3, N'Dobavljac', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (178, 'STRING_00056', 3, N'Samo Gotovinski Kupac', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (179, 'STRING_00057', 3, N'Medunarodni', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (180, 'STRING_00058', 3, N'Mobilna Prodaja', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (181, 'STRING_00059', 3, N'Bez PDV', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (182, 'STRING_00060', 3, N'Poljoprivrednik', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (183, 'STRING_00061', 3, N'Aktivan', NULL, '2025-09-12 14:15:53.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (184, 'STRING_00062', 1, N'Created', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (185, 'STRING_00063', 1, N'Updated', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (186, 'STRING_00064', 1, N'VAT Type', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (187, 'STRING_00065', 1, N'Price with VAT', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (188, 'STRING_00066', 1, N'VAT Amount', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (189, 'STRING_00067', 1, N'Stock Quantity', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (190, 'STRING_00068', 1, N'Stock Value', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (191, 'STRING_00069', 1, N'Stock Value with VAT', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (192, 'STRING_00070', 1, N'Pricing & Inventory', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (193, 'STRING_00071', 1, N'Descriptions', NULL, '2025-09-13 09:27:43.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (194, 'STRING_00062', 2, N'Krijuar', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (195, 'STRING_00063', 2, N'Pлrditлsuar', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (196, 'STRING_00064', 2, N'Lloji i TVSH', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (197, 'STRING_00065', 2, N'Зmimi me TVSH', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (198, 'STRING_00066', 2, N'Vlera e TVSH', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (199, 'STRING_00067', 2, N'Sasia nл Stok', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (200, 'STRING_00068', 2, N'Vlera e Stokut', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (201, 'STRING_00069', 2, N'Vlera e Stokut me TVSH', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (202, 'STRING_00070', 2, N'Зmimet & Inventari', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (203, 'STRING_00071', 2, N'Pлrshkrimet', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (204, 'STRING_00062', 3, N'Kreirano', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (205, 'STRING_00063', 3, N'Aћurirano', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (206, 'STRING_00064', 3, N'Tip PDV', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (207, 'STRING_00065', 3, N'Cena sa PDV', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (208, 'STRING_00066', 3, N'Iznos PDV', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (209, 'STRING_00067', 3, N'Kolicina na Stanju', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (210, 'STRING_00068', 3, N'Vrednost Zaliha', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (211, 'STRING_00069', 3, N'Vrednost Zaliha sa PDV', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (212, 'STRING_00070', 3, N'Cene & Inventar', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (213, 'STRING_00071', 3, N'Opisi', NULL, '2025-09-13 09:27:43.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (214, 'STRING_00072', 1, N'Description 2', NULL, '2025-09-13 09:39:13.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (215, 'STRING_00073', 1, N'Description 3', NULL, '2025-09-13 09:39:13.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (216, 'STRING_00074', 1, N'Currency', NULL, '2025-09-13 09:39:13.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (217, 'STRING_00075', 1, N'Active', NULL, '2025-09-13 09:39:13.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (218, 'STRING_00072', 2, N'Pлrshkrimi 2', NULL, '2025-09-13 09:39:13.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (219, 'STRING_00073', 2, N'Pлrshkrimi 3', NULL, '2025-09-13 09:39:13.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (220, 'STRING_00074', 2, N'Valuta', NULL, '2025-09-13 09:39:13.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (221, 'STRING_00075', 2, N'Aktiv', NULL, '2025-09-13 09:39:13.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (222, 'STRING_00072', 3, N'Opis 2', NULL, '2025-09-13 09:39:13.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (223, 'STRING_00073', 3, N'Opis 3', NULL, '2025-09-13 09:39:13.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (224, 'STRING_00074', 3, N'Valuta', NULL, '2025-09-13 09:39:13.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (225, 'STRING_00075', 3, N'Aktivan', NULL, '2025-09-13 09:39:13.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (226, 'STRING_00076', 1, N'Subject Details', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (227, 'STRING_00077', 1, N'Basic Information', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (228, 'STRING_00078', 1, N'Contact Information', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (229, 'STRING_00079', 1, N'Subject Types', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (230, 'STRING_00080', 1, N'NUI', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (231, 'STRING_00081', 1, N'Fiscal Number', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (232, 'STRING_00082', 1, N'Contact Person', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (233, 'STRING_00083', 1, N'Address', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (234, 'STRING_00084', 1, N'Telephone', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (235, 'STRING_00085', 1, N'Email', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (236, 'STRING_00086', 1, N'Website', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (237, 'STRING_00087', 1, N'Back to Subjects', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (238, 'STRING_00088', 1, N'Edit Subject', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (239, 'STRING_00089', 1, N'Restore Subject', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (240, 'STRING_00090', 1, N'Subject Not Found', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (241, 'STRING_00091', 1, N'The subject you''''re looking for doesn''''t exist or has been removed.', NULL, '2025-09-13 10:02:28.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (242, 'STRING_00076', 2, N'Detajet e Subjektit', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (243, 'STRING_00077', 2, N'Informacioni Bazл', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (244, 'STRING_00078', 2, N'Informacioni i Kontaktit', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (245, 'STRING_00079', 2, N'Llojet e Subjektit', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (246, 'STRING_00080', 2, N'NUI', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (247, 'STRING_00081', 2, N'Numri Fiskal', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (248, 'STRING_00082', 2, N'Personi i Kontaktit', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (249, 'STRING_00083', 2, N'Adresa', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (250, 'STRING_00084', 2, N'Telefoni', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (251, 'STRING_00085', 2, N'Email', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (252, 'STRING_00086', 2, N'Faqja e internetit', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (253, 'STRING_00087', 2, N'Kthehu tek Subjektet', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (254, 'STRING_00088', 2, N'Ndrysho Subjektin', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (255, 'STRING_00089', 2, N'Riaktivizo Subjektin', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (256, 'STRING_00090', 2, N'Subjekti nuk u gjet', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (257, 'STRING_00091', 2, N'Subjekti qл po kлrkoni nuk ekziston ose лshtл fshirл.', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (258, 'STRING_00076', 3, N'Detalji Subjekta', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (259, 'STRING_00077', 3, N'Osnovne Informacije', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (260, 'STRING_00078', 3, N'Kontakt Informacije', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (261, 'STRING_00079', 3, N'Tipovi Subjekta', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (262, 'STRING_00080', 3, N'NUI', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (263, 'STRING_00081', 3, N'Fiskalni Broj', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (264, 'STRING_00082', 3, N'Kontakt Osoba', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (265, 'STRING_00083', 3, N'Adresa', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (266, 'STRING_00084', 3, N'Telefon', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (267, 'STRING_00085', 3, N'Email', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (268, 'STRING_00086', 3, N'Web stranica', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (269, 'STRING_00087', 3, N'Nazad na Subjekte', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (270, 'STRING_00088', 3, N'Izmeni Subjekt', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (271, 'STRING_00089', 3, N'Obnovi Subjekt', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (272, 'STRING_00090', 3, N'Subjekt nije pronaden', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (273, 'STRING_00091', 3, N'Subjekt koji traћite ne postoji ili je uklonjen.', NULL, '2025-09-13 10:02:28.950', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (274, 'STRING_00092', 1, N'Last Updated', NULL, '2025-09-13 10:20:05.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (275, 'STRING_00093', 1, N'Accounting Information', NULL, '2025-09-13 10:20:05.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (276, 'STRING_00092', 2, N'Pлrditлsuar sл Fundi', NULL, '2025-09-13 10:20:05.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (277, 'STRING_00093', 2, N'Informacioni i Kontabilitetit', NULL, '2025-09-13 10:20:05.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (278, 'STRING_00092', 3, N'Poslednje Aћuriranje', NULL, '2025-09-13 10:20:05.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (279, 'STRING_00093', 3, N'Racunovodstvene Informacije', NULL, '2025-09-13 10:20:05.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (280, 'STRING_00094', 1, N'Create New Subject', NULL, '2025-09-13 10:30:36.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (281, 'STRING_00094', 2, N'Krijo Subjekt tл Ri', NULL, '2025-09-13 10:30:36.516', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (282, 'STRING_00094', 3, N'Kreiraj Novi Subjekt', NULL, '2025-09-13 10:30:36.516', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (283, 'STRING_00095', 1, N'Enabled', NULL, '2025-09-13 11:04:58.610', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (284, 'STRING_00096', 1, N'Disabled', NULL, '2025-09-13 11:04:58.610', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (285, 'STRING_00095', 2, N'Aktiv', NULL, '2025-09-13 11:04:58.616', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (286, 'STRING_00096', 2, N'Joaktiv', NULL, '2025-09-13 11:04:58.616', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (287, 'STRING_00095', 3, N'Omoguceno', NULL, '2025-09-13 11:04:58.616', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (288, 'STRING_00096', 3, N'Onemoguceno', NULL, '2025-09-13 11:04:58.616', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (289, 'sales.category.domestic', 1, N'Domestic Sales', 'SalesCategory', '2025-09-23 13:45:11.156', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (290, 'sales.category.domestic', 2, N'Shitja Vendore', 'SalesCategory', '2025-09-23 13:45:11.156', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (291, 'sales.category.domestic', 3, N'Domaca Prodaja', 'SalesCategory', '2025-09-23 13:45:11.156', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (292, 'sales.category.cash', 1, N'Cash Sales', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (293, 'sales.category.cash', 2, N'Shitjet me Para', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (294, 'sales.category.cash', 3, N'Gotovinska Prodaja', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (295, 'sales.category.export', 1, N'Export Sales', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (296, 'sales.category.export', 2, N'Shitjet e Eksportit', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (297, 'sales.category.export', 3, N'Izvozna Prodaja', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (298, 'sales.category.delivery', 1, N'Delivery Notes', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (299, 'sales.category.delivery', 2, N'Fletл Dлrgesat', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (300, 'sales.category.delivery', 3, N'Dostavnice', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (301, 'sales.category.service', 1, N'Service Sales', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (302, 'sales.category.service', 2, N'Shitjet e Shлrbimeve', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (303, 'sales.category.service', 3, N'Prodaja Usluga', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (304, 'sales.category.credit', 1, N'Credit Note', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (305, 'sales.category.credit', 2, N'Notл Krediti', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (306, 'sales.category.credit', 3, N'Kreditna Nota', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (307, 'sales.category.returns', 1, N'Sales Returns', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (308, 'sales.category.returns', 2, N'Kthimet e Shitjeve', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (309, 'sales.category.returns', 3, N'Povracaj Prodaje', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (310, 'sales.category.other', 1, N'Other Sales', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (311, 'sales.category.other', 2, N'Shitje tл Tjera', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (312, 'sales.category.other', 3, N'Ostala Prodaja', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (313, 'sales.category.summary', 1, N'Summary Invoice', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (314, 'sales.category.summary', 2, N'Faturл Pлrmbledhлse', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (315, 'sales.category.summary', 3, N'Zbirna Faktura', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (316, 'sales.category.printing', 1, N'Invoice Printing', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (317, 'sales.category.printing', 2, N'Printim i Faturave', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (318, 'sales.category.printing', 3, N'Љtampanje Faktura', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (319, 'sales.category.barcode', 1, N'Barcode Sales', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (320, 'sales.category.barcode', 2, N'Shitjet me Barkod', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (321, 'sales.category.barcode', 3, N'Barkod Prodaja', 'SalesCategory', '2025-09-23 13:45:11.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (322, 'sales.category.domestic.desc', 1, N'Regular sales within the country', 'SalesCategory', '2025-09-23 13:45:11.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (323, 'sales.category.domestic.desc', 2, N'Shitjet e rregullta brenda vendit', 'SalesCategory', '2025-09-23 13:45:11.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (324, 'sales.category.domestic.desc', 3, N'Redovna prodaja unutar zemlje', 'SalesCategory', '2025-09-23 13:45:11.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (325, 'sales.category.cash.desc', 1, N'Immediate payment sales', 'SalesCategory', '2025-09-23 13:57:38.810', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (326, 'sales.category.cash.desc', 2, N'Shitjet me pagesл tл menjлhershme', 'SalesCategory', '2025-09-23 13:57:38.810', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (327, 'sales.category.cash.desc', 3, N'Prodaja sa trenutnim placanjem', 'SalesCategory', '2025-09-23 13:57:38.810', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (328, 'sales.category.export.desc', 1, N'International sales outside the country', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (329, 'sales.category.export.desc', 2, N'Shitjet ndлrkombлtare jashtл vendit', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (330, 'sales.category.export.desc', 3, N'Medunarodna prodaja van zemlje', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (331, 'sales.category.delivery.desc', 1, N'Delivery documentation', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (332, 'sales.category.delivery.desc', 2, N'Dokumentacioni i dлrgesave', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (333, 'sales.category.delivery.desc', 3, N'Dokumentacija isporuke', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (334, 'sales.category.service.desc', 1, N'Sales of services', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (335, 'sales.category.service.desc', 2, N'Shitjet e shлrbimeve', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (336, 'sales.category.service.desc', 3, N'Prodaja usluga', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (337, 'sales.category.credit.desc', 1, N'Credit adjustments to invoices', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (338, 'sales.category.credit.desc', 2, N'Rregullimet kreditore tл faturave', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (339, 'sales.category.credit.desc', 3, N'Kreditna podeљavanja faktura', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (340, 'sales.category.returns.desc', 1, N'Return of sold items', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (341, 'sales.category.returns.desc', 2, N'Kthimi i artikujve tл shitur', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (342, 'sales.category.returns.desc', 3, N'Povracaj prodatih artikala', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (343, 'sales.category.other.desc', 1, N'Miscellaneous sales categories', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (344, 'sales.category.other.desc', 2, N'Kategori tл ndryshme tл shitjeve', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (345, 'sales.category.other.desc', 3, N'Razne kategorije prodaje', 'SalesCategory', '2025-09-23 13:57:38.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (346, 'sales.category.summary.desc', 1, N'Consolidated invoices', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (347, 'sales.category.summary.desc', 2, N'Fatura tл konsoliduara', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (348, 'sales.category.summary.desc', 3, N'Konsolidovane fakture', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (349, 'sales.category.printing.desc', 1, N'Special printing format invoices', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (350, 'sales.category.printing.desc', 2, N'Fatura me format special printimi', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (351, 'sales.category.printing.desc', 3, N'Fakture sa posebnim formatom љtampanja', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (352, 'sales.category.barcode.desc', 1, N'Sales using barcode scanning', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (353, 'sales.category.barcode.desc', 2, N'Shitjet duke pлrdorur skanimin e barkodeve', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (354, 'sales.category.barcode.desc', 3, N'Prodaja koriљcenjem skeniranja barkoda', 'SalesCategory', '2025-09-23 13:57:38.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (355, 'STRING_00097', 1, N'Create Invoice', 'SalesInvoice', '2025-10-11 12:36:35.556', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (356, 'STRING_00097', 2, N'Krijo Faturл', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (357, 'STRING_00097', 3, N'Kreiraj Fakturu', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (358, 'STRING_00098', 1, N'Edit Invoice', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (359, 'STRING_00098', 2, N'Edito Faturлn', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (360, 'STRING_00098', 3, N'Izmeni Fakturu', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (361, 'STRING_00099', 1, N'User is not authenticated', 'SalesInvoice', '2025-10-11 12:36:35.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (362, 'STRING_00099', 2, N'Pлrdoruesi nuk лshtл i autentifikuar', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (363, 'STRING_00099', 3, N'Korisnik nije autentifikovan', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (364, 'STRING_00100', 1, N'Invoice not found', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (365, 'STRING_00100', 2, N'Fatura nuk u gjet', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (366, 'STRING_00100', 3, N'Faktura nije pronadena', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (367, 'STRING_00101', 1, N'Error loading invoice', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (368, 'STRING_00101', 2, N'Gabim nл ngarkimin e faturлs', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (369, 'STRING_00101', 3, N'Greљka pri ucitavanju fakture', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (370, 'STRING_00102', 1, N'No business unit selected. Please log in again.', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (371, 'STRING_00102', 2, N'Asnjл njлsi biznesi e zgjedhur. Ju lutemi hyni pлrsлri.', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (372, 'STRING_00102', 3, N'Nijedna poslovna jedinica nije izabrana. Molimo prijavite se ponovo.', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (373, 'STRING_00103', 1, N'Invoice created successfully!', 'SalesInvoice', '2025-10-11 12:36:35.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (374, 'STRING_00103', 2, N'Fatura u krijua me sukses!', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (375, 'STRING_00103', 3, N'Faktura je uspeљno kreirana!', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (376, 'STRING_00104', 1, N'Invoice updated successfully!', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (377, 'STRING_00104', 2, N'Fatura u pлrditлsua me sukses!', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (378, 'STRING_00104', 3, N'Faktura je uspeљno aћurirana!', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (379, 'STRING_00105', 1, N'Error calculating totals', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (380, 'STRING_00105', 2, N'Gabim nл llogaritjen e totaleve', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (381, 'STRING_00105', 3, N'Greљka pri racunanju ukupnih iznosa', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (382, 'STRING_00106', 1, N'Error adding new item', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (383, 'STRING_00106', 2, N'Gabim nл shtimin e artikullit tл ri', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (384, 'STRING_00106', 3, N'Greљka pri dodavanju nove stavke', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (385, 'STRING_00107', 1, N'Error loading article', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (386, 'STRING_00107', 2, N'Gabim nл ngarkimin e artikullit', 'SalesInvoice', '2025-10-11 12:36:35.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (387, 'STRING_00107', 3, N'Greљka pri ucitavanju artikla', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (388, 'STRING_00108', 1, N'Error searching articles', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (389, 'STRING_00108', 2, N'Gabim nл kлrkimin e artikujve', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (390, 'STRING_00108', 3, N'Greљka pri pretrazi artikala', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (391, 'STRING_00109', 1, N'Please select a buyer.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (392, 'STRING_00109', 2, N'Ju lutemi zgjidhni njл blerлs.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (393, 'STRING_00109', 3, N'Molimo izaberite kupca.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (394, 'STRING_00110', 1, N'Business unit is required. Please log out and log in again.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (395, 'STRING_00110', 2, N'Njлsia e biznesit лshtл e detyrueshme. Ju lutemi dilni dhe hyni pлrsлri.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (396, 'STRING_00110', 3, N'Poslovna jedinica je obavezna. Molimo odjavite se i prijavite ponovo.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (397, 'STRING_00111', 1, N'Please add at least one item.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (398, 'STRING_00111', 2, N'Ju lutemi shtoni tл paktлn njл artikull.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (399, 'STRING_00111', 3, N'Molimo dodajte najmanje jednu stavku.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (400, 'STRING_00112', 1, N'All items must have a valid article.', 'SalesInvoice', '2025-10-11 12:36:35.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (401, 'STRING_00112', 2, N'Tл gjithл artikujt duhet tл kenл njл artikull tл vlefshлm.', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (402, 'STRING_00112', 3, N'Sve stavke moraju imati vaћeci artikal.', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (403, 'STRING_00113', 1, N'All items must have a quantity greater than zero.', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (404, 'STRING_00113', 2, N'Tл gjithл artikujt duhet tл kenл njл sasi mл tл madhe se zero.', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (405, 'STRING_00113', 3, N'Sve stavke moraju imati kolicinu vecu od nule.', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (406, 'STRING_00114', 1, N'Error loading category name', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (407, 'STRING_00114', 2, N'Gabim nл ngarkimin e emrit tл kategorisл', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (408, 'STRING_00114', 3, N'Greљka pri ucitavanju imena kategorije', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (409, 'STRING_00115', 1, N'Error selecting article', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (410, 'STRING_00115', 2, N'Gabim nл zgjedhjen e artikullit', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (411, 'STRING_00115', 3, N'Greљka pri izboru artikla', 'SalesInvoice', '2025-10-11 12:36:35.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (412, 'STRING_00116', 1, N'Invoice Items', 'SalesInvoice', '2025-10-12 17:24:32.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (413, 'STRING_00116', 2, N'Artikujt e faturлs', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (414, 'STRING_00116', 3, N'Stavke fakture', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (415, 'STRING_00117', 1, N'Save Invoice', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (416, 'STRING_00117', 2, N'Ruaj faturлn', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (417, 'STRING_00117', 3, N'Sacuvaj fakturu', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (418, 'STRING_00118', 1, N'New Invoice', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (419, 'STRING_00118', 2, N'Faturл e re', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (420, 'STRING_00118', 3, N'Nova faktura', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (421, 'STRING_00119', 1, N'Invoice Date', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (422, 'STRING_00119', 2, N'Data e faturлs', 'SalesInvoice', '2025-10-12 17:24:32.253', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (423, 'STRING_00119', 3, N'Datum fakture', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (424, 'STRING_00120', 1, N'Expiry Date', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (425, 'STRING_00120', 2, N'Data e skadimit', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (426, 'STRING_00120', 3, N'Datum isteka', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (427, 'STRING_00121', 1, N'Buyer Name', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (428, 'STRING_00121', 2, N'Emri i blerлsit', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (429, 'STRING_00121', 3, N'Ime kupca', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (430, 'STRING_00122', 1, N'Add Item', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (431, 'STRING_00122', 2, N'Shto artikull', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (432, 'STRING_00122', 3, N'Dodaj stavku', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (433, 'STRING_00123', 1, N'Article', 'SalesInvoice', '2025-10-12 17:24:32.256', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (434, 'STRING_00123', 2, N'Artikull', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (435, 'STRING_00123', 3, N'Artikal', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (436, 'STRING_00124', 1, N'Quantity', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (437, 'STRING_00124', 2, N'Sasia', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (438, 'STRING_00124', 3, N'Kolicina', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (439, 'STRING_00125', 1, N'Price Excl.', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (440, 'STRING_00125', 2, N'Зmimi pa TVSH', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (441, 'STRING_00125', 3, N'Cena bez PDV', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (442, 'STRING_00126', 1, N'Price Incl.', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (443, 'STRING_00126', 2, N'Зmimi me TVSH', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (444, 'STRING_00126', 3, N'Cena sa PDV', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (445, 'STRING_00127', 1, N'Disc. %', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (446, 'STRING_00127', 2, N'Zbritje %', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (447, 'STRING_00127', 3, N'Popust %', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (448, 'STRING_00128', 1, N'Disc. Amount', 'SalesInvoice', '2025-10-12 17:24:32.260', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (449, 'STRING_00128', 2, N'Shuma e zbritjes', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (450, 'STRING_00128', 3, N'Iznos popusta', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (451, 'STRING_00129', 1, N'Value Excl.', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (452, 'STRING_00129', 2, N'Vlera pa TVSH', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (453, 'STRING_00129', 3, N'Vrednost bez PDV', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (454, 'STRING_00130', 1, N'Value Incl.', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (455, 'STRING_00130', 2, N'Vlera me TVSH', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (456, 'STRING_00130', 3, N'Vrednost sa PDV', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (457, 'STRING_00131', 1, N'Totals:', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (458, 'STRING_00131', 2, N'Totali:', 'SalesInvoice', '2025-10-12 17:24:32.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (459, 'STRING_00131', 3, N'Ukupno:', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (460, 'STRING_00132', 1, N'INVOICE SUMMARY', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (461, 'STRING_00132', 2, N'PЛRMBLEDHJE E FATURЛS', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (462, 'STRING_00132', 3, N'PREGLED FAKTURE', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (463, 'STRING_00133', 1, N'Subtotal (before discount)', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (464, 'STRING_00133', 2, N'Nлntotali (para zbritjes)', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (465, 'STRING_00133', 3, N'Meduzbir (pre popusta)', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (466, 'STRING_00134', 1, N'Total Discounts', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (467, 'STRING_00134', 2, N'Zbritje totale', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (468, 'STRING_00134', 3, N'Ukupni popusti', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (469, 'STRING_00135', 1, N'Total VAT', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (470, 'STRING_00135', 2, N'TVSH totale', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (471, 'STRING_00135', 3, N'Ukupni PDV', 'SalesInvoice', '2025-10-12 17:24:32.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (472, 'STRING_00136', 1, N'TOTAL DUE', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (473, 'STRING_00136', 2, N'TOTALI PЛR PAGESЛ', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (474, 'STRING_00136', 3, N'UKUPNO ZA PLACANJE', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (475, 'STRING_00137', 1, N'Start typing buyer name...', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (476, 'STRING_00137', 2, N'Filloni tл shkruani emrin e blerлsit...', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (477, 'STRING_00137', 3, N'Pocnite da kucate ime kupca...', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (478, 'STRING_00138', 1, N'No items added yet.', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (479, 'STRING_00138', 2, N'Ende nuk janл shtuar artikuj.', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (480, 'STRING_00138', 3, N'Joљ uvek nema dodatih stavki.', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (481, 'STRING_00139', 1, N'Invoice #', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (482, 'STRING_00139', 2, N'Fatura #', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (483, 'STRING_00139', 3, N'Faktura #', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (484, 'STRING_00140', 1, N'Date', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (485, 'STRING_00140', 2, N'Data', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (486, 'STRING_00140', 3, N'Datum', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (487, 'STRING_00141', 1, N'Total', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (488, 'STRING_00141', 2, N'Totali', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (489, 'STRING_00141', 3, N'Ukupno', 'SalesInvoice', '2025-10-12 17:24:32.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (532, 'STRING_00142', 1, N'Back', 'SalesInvoice', '2025-10-13 14:39:22.210', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (533, 'STRING_00142', 2, N'Kthehu', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (534, 'STRING_00142', 3, N'Nazad', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (535, 'STRING_00143', 1, N'Start typing description...', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (536, 'STRING_00143', 2, N'Filloni tл shkruani pлrshkrimin...', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (537, 'STRING_00143', 3, N'Pocnite da kucate opis...', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (538, 'STRING_00144', 1, N'No sales invoices found for your account. Click the "New Sale" button to create one.', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (539, 'STRING_00144', 2, N'Nuk u gjetлn fatura shitjeje pлr llogarinл tuaj. Klikoni butonin "Shitje e Re" pлr tл krijuar njл.', 'SalesInvoice', '2025-10-13 14:39:22.213', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (540, 'STRING_00144', 3, N'Nema pronadenih faktura za vaљ nalog. Kliknite na dugme "Nova prodaja" da kreirate jednu.', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (541, 'STRING_00145', 1, N'New Sale', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (542, 'STRING_00145', 2, N'Shitje e Re', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (543, 'STRING_00145', 3, N'Nova prodaja', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (544, 'STRING_00146', 1, N'Invoice Information', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (545, 'STRING_00146', 2, N'Informacioni i faturлs', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (546, 'STRING_00146', 3, N'Informacije o fakturi', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (547, 'STRING_00147', 1, N'Buyer Information', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (548, 'STRING_00147', 2, N'Informacioni pлr blerлsin', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (549, 'STRING_00147', 3, N'Informacije o kupcu', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (550, 'STRING_00148', 1, N'Invoice Number', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (551, 'STRING_00148', 2, N'Numri i faturлs', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (552, 'STRING_00148', 3, N'Broj fakture', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (553, 'STRING_00149', 1, N'Created At', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (554, 'STRING_00149', 2, N'Krijuar mл', 'SalesInvoice', '2025-10-13 14:39:22.216', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (555, 'STRING_00149', 3, N'Kreirano', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (556, 'STRING_00150', 1, N'Net Amount', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (557, 'STRING_00150', 2, N'Shuma Neto', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (558, 'STRING_00150', 3, N'Neto iznos', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (559, 'STRING_00151', 1, N'Back to Sales', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (560, 'STRING_00151', 2, N'Kthehu te Shitjet', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (561, 'STRING_00151', 3, N'Nazad na prodaju', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (562, 'STRING_00152', 1, N'Post Invoice', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (563, 'STRING_00152', 2, N'Posto Faturлn', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (564, 'STRING_00152', 3, N'Proknjiћi fakturu', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (565, 'STRING_00153', 1, N'Cancel', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (566, 'STRING_00153', 2, N'Anulo', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (567, 'STRING_00153', 3, N'Otkaћi', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (568, 'STRING_00154', 1, N'Print', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (569, 'STRING_00154', 2, N'Printo', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (570, 'STRING_00154', 3, N'Љtampaj', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (571, 'STRING_00155', 1, N'All Sales', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (572, 'STRING_00155', 2, N'Tл gjitha shitjet', 'SalesInvoice', '2025-10-13 14:39:22.220', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (573, 'STRING_00155', 3, N'Sve prodaje', 'SalesInvoice', '2025-10-13 14:39:22.223', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (574, 'STRING_00156', 1, N'Cancelled', 'SalesInvoice', '2025-10-13 15:29:45.546', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (575, 'STRING_00156', 2, N'Anulluar', 'SalesInvoice', '2025-10-13 15:29:45.550', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (576, 'STRING_00156', 3, N'Otkazano', 'SalesInvoice', '2025-10-13 15:29:45.550', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (577, 'STRING_00157', 1, N'Posted', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (578, 'STRING_00157', 2, N'Postuar', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (579, 'STRING_00157', 3, N'Proknjiћeno', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (580, 'STRING_00158', 1, N'Draft', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (581, 'STRING_00158', 2, N'Draft', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (582, 'STRING_00158', 3, N'Nacrt', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (583, 'STRING_00159', 1, N'Last Modified', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (584, 'STRING_00159', 2, N'Ndryshuar sл fundmi', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (585, 'STRING_00159', 3, N'Poslednja izmena', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (586, 'STRING_00160', 1, N'Cancellation Reason', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (587, 'STRING_00160', 2, N'Arsyeja e anulimit', 'SalesInvoice', '2025-10-13 15:29:45.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (588, 'STRING_00160', 3, N'Razlog otkazivanja', 'SalesInvoice', '2025-10-13 15:29:45.556', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (589, 'STRING_00161', 1, N'Are you sure you want to cancel this invoice?', 'SalesInvoice', '2025-10-13 17:41:03.073', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (590, 'STRING_00161', 2, N'A jeni i sigurt qл dлshironi tл anuloni kлtл faturл?', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (591, 'STRING_00161', 3, N'Da li ste sigurni da ћelite da otkaћete ovu fakturu?', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (592, 'STRING_00162', 1, N'Please provide a reason for cancellation', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (593, 'STRING_00162', 2, N'Ju lutemi jepni njл arsye pлr anulim', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (594, 'STRING_00162', 3, N'Molimo navedite razlog otkazivanja', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (595, 'STRING_00163', 1, N'Invoice cancelled successfully.', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (596, 'STRING_00163', 2, N'Fatura u anulua me sukses.', 'SalesInvoice', '2025-10-13 17:41:03.076', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (597, 'STRING_00163', 3, N'Faktura je uspeљno otkazana.', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (598, 'STRING_00164', 1, N'Error cancelling invoice', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (599, 'STRING_00164', 2, N'Gabim gjatл anulimit tл faturлs', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (600, 'STRING_00164', 3, N'Greљka pri otkazivanju fakture', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (601, 'STRING_00165', 1, N'Error printing invoice', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (602, 'STRING_00165', 2, N'Gabim gjatл printimit tл faturлs', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (603, 'STRING_00165', 3, N'Greљka pri љtampanju fakture', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (604, 'STRING_00166', 1, N'Error posting invoice', 'SalesInvoice', '2025-10-13 17:41:03.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (605, 'STRING_00166', 2, N'Gabim gjatл postimit tл faturлs', 'SalesInvoice', '2025-10-13 17:41:03.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (606, 'STRING_00166', 3, N'Greљka pri knjiћenju fakture', 'SalesInvoice', '2025-10-13 17:41:03.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (607, 'STRING_00167', 1, N'Invoice posted successfully.', 'SalesInvoice', '2025-10-13 17:41:03.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (608, 'STRING_00167', 2, N'Fatura u postua me sukses.', 'SalesInvoice', '2025-10-13 17:41:03.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (609, 'STRING_00167', 3, N'Faktura je uspeљno proknjiћena.', 'SalesInvoice', '2025-10-13 17:41:03.086', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (610, 'STRING_00168', 1, N'Are you sure you want to post this invoice? This action cannot be undone.', 'SalesInvoice', '2025-10-13 17:41:03.086', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (611, 'STRING_00168', 2, N'A jeni i sigurt qл dлshironi tл postoni kлtл faturл? Ky veprim nuk mund tл zhbлhet.', 'SalesInvoice', '2025-10-13 17:41:03.086', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (612, 'STRING_00168', 3, N'Da li ste sigurni da ћelite da proknjiћite ovu fakturu? Ova radnja se ne moћe opozvati.', 'SalesInvoice', '2025-10-13 17:41:03.086', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (613, 'STRING_00169', 1, N'Error loading invoice', 'SalesInvoice', '2025-10-13 17:41:03.086', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (614, 'STRING_00169', 2, N'Gabim gjatл ngarkimit tл faturлs', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (615, 'STRING_00169', 3, N'Greљka pri ucitavanju fakture', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (616, 'STRING_00170', 1, N'Error setting category', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (617, 'STRING_00170', 2, N'Gabim gjatл vendosjes sл kategorisл', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (618, 'STRING_00170', 3, N'Greљka prilikom postavljanja kategorije', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (619, 'STRING_00171', 1, N'Invoice Not Found', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (620, 'STRING_00171', 2, N'Fatura nuk u gjet', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (621, 'STRING_00171', 3, N'Faktura nije pronadena', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (622, 'STRING_00172', 1, N'The invoice you are looking for does not exist or has been removed.', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (623, 'STRING_00172', 2, N'Fatura qл po kлrkoni nuk ekziston ose лshtл fshirл.', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (624, 'STRING_00172', 3, N'Faktura koju traћite ne postoji ili je uklonjena.', 'SalesInvoice', '2025-10-13 17:41:03.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (625, 'STRING_00173', 1, N'Purchases', 'SalesInvoice', '2025-11-04 19:54:32.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (626, 'STRING_00173', 2, N'Blerjet', 'SalesInvoice', '2025-11-04 19:54:32.410', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (627, 'STRING_00173', 3, N'Kupovine', 'SalesInvoice', '2025-11-04 19:54:32.410', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (628, 'STRING_00174', 1, N'Sales', 'SalesInvoice', '2025-11-04 19:59:29.540', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (629, 'STRING_00174', 2, N'Shitjet', 'SalesInvoice', '2025-11-04 19:59:29.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (630, 'STRING_00174', 3, N'Prodaja', 'SalesInvoice', '2025-11-04 19:59:29.573', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (631, 'STRING_00175', 1, N'Internal Transfers', 'SalesInvoice', '2025-11-04 20:03:10.650', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (632, 'STRING_00175', 2, N'Levizje interne', 'SalesInvoice', '2025-11-04 20:03:10.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (633, 'STRING_00175', 3, N'Interni transferi', 'SalesInvoice', '2025-11-04 20:03:10.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (634, 'STRING_00176', 1, N'Payments', 'SalesInvoice', '2025-11-04 20:08:23.473', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (635, 'STRING_00176', 2, N'Pagesa', 'SalesInvoice', '2025-11-04 20:08:23.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (636, 'STRING_00176', 3, N'Placanja', 'SalesInvoice', '2025-11-04 20:08:23.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (637, 'STRING_00177', 1, N'Accounting', 'SalesInvoice', '2025-11-04 20:11:20.020', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (638, 'STRING_00177', 2, N'Kontabiliteti', 'SalesInvoice', '2025-11-04 20:11:20.050', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (639, 'STRING_00177', 3, N'Racunovodstvo', 'SalesInvoice', '2025-11-04 20:11:20.050', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (640, 'STRING_00178', 1, N'Administration', 'NavMenu', '2025-11-04 20:14:36.923', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (641, 'STRING_00178', 2, N'Administrimi', 'NavMenu', '2025-11-04 20:14:36.956', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (642, 'STRING_00178', 3, N'Administracija', 'NavMenu', '2025-11-04 20:14:36.956', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (643, 'STRING_00179', 1, N'Business Units', 'NavMenu', '2025-11-04 20:17:10.923', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (644, 'STRING_00179', 2, N'Njлsitл e biznesit', 'NavMenu', '2025-11-04 20:17:10.923', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (645, 'STRING_00179', 3, N'Poslovne jedinice', 'NavMenu', '2025-11-04 20:17:10.926', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (646, 'STRING_00180', 1, N'User Access', 'NavMenu', '2025-11-04 20:20:44.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (647, 'STRING_00180', 2, N'Aksesi i pлrdoruesit', 'NavMenu', '2025-11-04 20:20:44.530', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (648, 'STRING_00180', 3, N'Pristup korisnika', 'NavMenu', '2025-11-04 20:20:44.530', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (649, 'STRING_00181', 1, N'User Modules', 'NavMenu', '2025-11-04 20:20:44.530', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (650, 'STRING_00181', 2, N'Modulet e pлrdoruesit', 'NavMenu', '2025-11-04 20:20:44.530', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (651, 'STRING_00181', 3, N'Korisnicki moduli', 'NavMenu', '2025-11-04 20:20:44.533', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (652, 'STRING_00182', 1, N'Invoice Number Format', 'NavMenu', '2025-11-04 20:24:02.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (653, 'STRING_00182', 2, N'Formati i numrit tл faturлs', 'NavMenu', '2025-11-04 20:24:02.850', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (654, 'STRING_00182', 3, N'Format broja fakture', 'NavMenu', '2025-11-04 20:24:02.853', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (655, 'STRING_00183', 1, N'Users', 'NavMenu', '2025-11-04 20:24:02.853', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (656, 'STRING_00183', 2, N'Pлrdoruesit', 'NavMenu', '2025-11-04 20:24:02.853', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (657, 'STRING_00183', 3, N'Korisnici', 'NavMenu', '2025-11-04 20:24:02.853', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (658, 'STRING_00184', 1, N'Articles', 'NavMenu', '2025-11-04 20:28:37.426', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (659, 'STRING_00184', 2, N'Artikujt', 'NavMenu', '2025-11-04 20:28:37.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (660, 'STRING_00184', 3, N'Artikli', 'NavMenu', '2025-11-04 20:28:37.460', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (661, 'STRING_00185', 1, N'Change Password', 'NavMenu', '2025-11-04 20:34:16.210', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (662, 'STRING_00185', 2, N'Ndrysho Fjalлkalimin', 'NavMenu', '2025-11-04 20:34:16.243', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (663, 'STRING_00185', 3, N'Promeni lozinku', 'NavMenu', '2025-11-04 20:34:16.243', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (664, 'STRING_00186', 1, N'Logout', 'NavMenu', '2025-11-04 20:34:16.243', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (665, 'STRING_00186', 2, N'Dil', 'NavMenu', '2025-11-04 20:34:16.243', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (666, 'STRING_00186', 3, N'Odjava', 'NavMenu', '2025-11-04 20:34:16.243', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (667, 'STRING_00187', 1, N'Error loading category from session storage', 'ErrorMessages', '2025-11-04 20:38:15.900', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (668, 'STRING_00187', 2, N'Gabim gjatл ngarkimit tл kategorisл nga ruajtja e sesionit', 'ErrorMessages', '2025-11-04 20:38:15.933', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (669, 'STRING_00187', 3, N'Greљka pri ucitavanju kategorije iz skladiљta sesije', 'ErrorMessages', '2025-11-04 20:38:15.933', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (670, 'STRING_00188', 1, N'Error handling location change', 'ErrorMessages', '2025-11-05 16:23:54.063', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (671, 'STRING_00188', 2, N'Gabim gjatл trajtimit tл ndryshimit tл vendndodhjes', 'ErrorMessages', '2025-11-05 16:23:54.063', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (672, 'STRING_00188', 3, N'Greљka pri obradi promene lokacije', 'ErrorMessages', '2025-11-05 16:23:54.066', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (673, 'STRING_00189', 1, N'Error getting category from session storage', 'ErrorMessages', '2025-11-05 16:26:50.336', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (674, 'STRING_00189', 2, N'Gabim i paraqitjes sл kategorisл nga ruajtja e sesionit', 'ErrorMessages', '2025-11-05 16:26:50.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (675, 'STRING_00189', 3, N'Greљka pri preuzimanju kategorije iz skladiљta sesije', 'ErrorMessages', '2025-11-05 16:26:50.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (676, 'STRING_00190', 1, N'Edit Business Unit', 'BusinessUnitForm', '2025-11-05 16:59:42.956', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (677, 'STRING_00190', 2, N'Ndrysho Njлsinл e Biznesit', 'BusinessUnitForm', '2025-11-05 16:59:42.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (678, 'STRING_00190', 3, N'Izmeni Poslovnu Jedinicu', 'BusinessUnitForm', '2025-11-05 16:59:42.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (679, 'STRING_00191', 1, N'Add Business Unit', 'BusinessUnitForm', '2025-11-05 16:59:42.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (680, 'STRING_00191', 2, N'Shto Njлsi Biznesi', 'BusinessUnitForm', '2025-11-05 16:59:42.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (681, 'STRING_00191', 3, N'Dodaj Poslovnu Jedinicu', 'BusinessUnitForm', '2025-11-05 16:59:42.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (682, 'STRING_00192', 1, N'Is Active', 'BusinessUnitForm', '2025-11-05 19:37:26.050', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (683, 'STRING_00192', 2, N'Лshtл Aktiv', 'BusinessUnitForm', '2025-11-05 19:37:26.080', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (684, 'STRING_00192', 3, N'Je Aktivan', 'BusinessUnitForm', '2025-11-05 19:37:26.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (685, 'STRING_00193', 1, N'Business unit updated successfully!', 'BusinessUnitForm', '2025-11-05 19:42:32.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (686, 'STRING_00193', 2, N'Njлsia e biznesit u pлrditлsua me sukses!', 'BusinessUnitForm', '2025-11-05 19:42:32.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (687, 'STRING_00193', 3, N'Poslovna jedinica je uspeљno aћurirana!', 'BusinessUnitForm', '2025-11-05 19:42:32.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (688, 'STRING_00194', 1, N'Business unit created successfully!', 'BusinessUnitForm', '2025-11-05 19:42:32.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (689, 'STRING_00194', 2, N'Njлsia e biznesit u krijua me sukses!', 'BusinessUnitForm', '2025-11-05 19:42:32.663', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (690, 'STRING_00194', 3, N'Poslovna jedinica je uspeљno kreirana!', 'BusinessUnitForm', '2025-11-05 19:42:32.663', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (691, 'STRING_00195', 1, N'Error saving business unit:', 'BusinessUnitForm', '2025-11-05 19:49:21.103', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (692, 'STRING_00195', 2, N'Gabim gjatл ruajtjes sл njлsisл sл biznesit:', 'BusinessUnitForm', '2025-11-05 19:49:21.106', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (693, 'STRING_00195', 3, N'Greљka pri cuvanju poslovne jedinice:', 'BusinessUnitForm', '2025-11-05 19:49:21.106', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (694, 'STRING_00196', 1, N'New Business Unit', 'BusinessUnits', '2025-11-05 20:03:15.540', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (695, 'STRING_00196', 2, N'Njлsi e Re e Biznesit', 'BusinessUnits', '2025-11-05 20:03:15.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (696, 'STRING_00196', 3, N'Nova Poslovna Jedinica', 'BusinessUnits', '2025-11-05 20:03:15.570', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (697, 'STRING_00197', 1, N'Are you sure you want to delete this business unit?', 'BusinessUnits', '2025-11-05 20:14:00.630', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (698, 'STRING_00197', 2, N'A jeni i sigurt qл dлshironi tл fshini kлtл njлsi biznesi?', 'BusinessUnits', '2025-11-05 20:14:00.663', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (699, 'STRING_00197', 3, N'Da li ste sigurni da ћelite da obriљete ovu poslovnu jedinicu?', 'BusinessUnits', '2025-11-05 20:14:00.663', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (700, 'STRING_00198', 1, N'No descriptions available.', 'ArticleDetail', '2025-11-05 20:33:11.953', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (701, 'STRING_00198', 2, N'Nuk ka pлrshkrime tл disponueshme.', 'ArticleDetail', '2025-11-05 20:33:11.986', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (702, 'STRING_00198', 3, N'Nema dostupnih opisa.', 'ArticleDetail', '2025-11-05 20:33:11.986', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (703, 'STRING_00199', 1, N'Low Stock Alert', 'ArticleDetail', '2025-11-05 20:35:14.196', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (704, 'STRING_00199', 2, N'Alarm pлr Stok tл Ulлt', 'ArticleDetail', '2025-11-05 20:35:14.196', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (705, 'STRING_00199', 3, N'Upozorenje o Niskom Stanju Zaliha', 'ArticleDetail', '2025-11-05 20:35:14.200', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (706, 'STRING_00200', 1, N'This article has low stock quantity', 'ArticleDetail', '2025-11-05 20:37:22.240', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (707, 'STRING_00200', 2, N'Ky artikull ka sasi tл ulлt stoku', 'ArticleDetail', '2025-11-05 20:37:22.240', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (708, 'STRING_00200', 3, N'Ovaj artikal ima nisku kolicinu zaliha', 'ArticleDetail', '2025-11-05 20:37:22.240', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (709, 'STRING_00201', 1, N'Back to Articles', 'ArticleDetail', '2025-11-06 10:00:43.816', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (710, 'STRING_00201', 2, N'Kthehu te Artikujt', 'ArticleDetail', '2025-11-06 10:00:43.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (711, 'STRING_00201', 3, N'Nazad na Artikle', 'ArticleDetail', '2025-11-06 10:00:43.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (712, 'STRING_00202', 1, N'Restore Article', 'ArticleDetail', '2025-11-06 10:02:47.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (713, 'STRING_00202', 2, N'Rikthe Artikullin', 'ArticleDetail', '2025-11-06 10:02:47.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (714, 'STRING_00202', 3, N'Vrati Artikal', 'ArticleDetail', '2025-11-06 10:02:47.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (715, 'STRING_00203', 1, N'Article Not Found', 'ArticleDetail', '2025-11-06 10:05:48.030', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (716, 'STRING_00203', 2, N'Artikulli Nuk U Gjet', 'ArticleDetail', '2025-11-06 10:05:48.030', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (717, 'STRING_00203', 3, N'Artikal Nije Pronaden', 'ArticleDetail', '2025-11-06 10:05:48.030', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (718, 'STRING_00204', 1, N'The article you are looking for does not exist or has been removed.', 'ArticleDetail', '2025-11-06 10:08:46.430', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (719, 'STRING_00204', 2, N'Artikulli qл po kлrkoni nuk ekziston ose лshtл hequr.', 'ArticleDetail', '2025-11-06 10:08:46.433', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (720, 'STRING_00204', 3, N'Artikal koji traћite ne postoji ili je uklonjen.', 'ArticleDetail', '2025-11-06 10:08:46.433', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (721, 'STRING_00205', 1, N'Accounting System', 'NavMenu', '2025-11-12 14:47:47.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (722, 'STRING_00205', 2, N'Sistemi i Kontabilitetit', 'NavMenu', '2025-11-12 14:47:47.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (723, 'STRING_00205', 3, N'Racunovodstveni sistem', 'NavMenu', '2025-11-12 14:47:47.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (724, 'STRING_00206', 1, N'Subject Form', 'SubjectForm', '2025-11-12 14:58:58.553', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (725, 'STRING_00206', 2, N'Formulari i Subjektit', 'SubjectForm', '2025-11-12 14:58:58.556', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (726, 'STRING_00206', 3, N'Forma za Subjekt', 'SubjectForm', '2025-11-12 14:58:58.560', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (727, 'STRING_00207', 1, N'Create User', 'CreateUser', '2025-11-12 20:19:23.900', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (728, 'STRING_00207', 2, N'Krijo Pлrdorues', 'CreateUser', '2025-11-12 20:19:23.903', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (729, 'STRING_00207', 3, N'Kreiraj Korisnika', 'CreateUser', '2025-11-12 20:19:23.906', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (730, 'STRING_00208', 1, N'First Name', 'CreateUser', '2025-11-12 20:23:49.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (731, 'STRING_00208', 2, N'Emri', 'CreateUser', '2025-11-12 20:23:49.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (732, 'STRING_00208', 3, N'Ime', 'CreateUser', '2025-11-12 20:23:49.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (733, 'STRING_00209', 1, N'Last Name', 'CreateUser', '2025-11-12 20:26:20.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (734, 'STRING_00209', 2, N'Mbiemri', 'CreateUser', '2025-11-12 20:26:20.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (735, 'STRING_00209', 3, N'Prezime', 'CreateUser', '2025-11-12 20:26:20.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (736, 'STRING_00210', 1, N'UserName', 'CreateUser', '2025-11-12 20:29:55.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (737, 'STRING_00210', 2, N'UserName', 'CreateUser', '2025-11-12 20:29:55.313', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (738, 'STRING_00210', 3, N'Korisnicko Ime', 'CreateUser', '2025-11-12 20:29:55.313', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (739, 'STRING_00211', 1, N'Password', 'CreateUser', '2025-11-12 20:36:08.543', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (740, 'STRING_00211', 2, N'Fjalлkalimi', 'CreateUser', '2025-11-12 20:36:08.546', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (741, 'STRING_00211', 3, N'Lozinka', 'CreateUser', '2025-11-12 20:36:08.546', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (745, 'STRING_00212', 1, N'Role', 'CreateUser', '2025-11-12 20:37:56.116', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (746, 'STRING_00212', 2, N'Roli', 'CreateUser', '2025-11-12 20:37:56.120', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (747, 'STRING_00212', 3, N'Uloga', 'CreateUser', '2025-11-12 20:37:56.120', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (748, 'STRING_00213', 1, N'Create', 'CreateUser', '2025-11-12 20:40:39.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (749, 'STRING_00213', 2, N'Krijo', 'CreateUser', '2025-11-12 20:40:39.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (750, 'STRING_00213', 3, N'Kreiraj', 'CreateUser', '2025-11-12 20:40:39.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (751, 'STRING_00214', 1, N'Success', 'CreateUser', '2025-11-12 20:49:50.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (752, 'STRING_00214', 2, N'Sukses', 'CreateUser', '2025-11-12 20:49:50.263', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (753, 'STRING_00214', 3, N'Uspeh', 'CreateUser', '2025-11-12 20:49:50.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (754, 'STRING_00215', 1, N'User created successfully.', 'CreateUser', '2025-11-12 20:51:00.283', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (755, 'STRING_00215', 2, N'Pлrdoruesi u krijua me sukses.', 'CreateUser', '2025-11-12 20:51:00.283', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (756, 'STRING_00215', 3, N'Korisnik je uspeљno kreiran.', 'CreateUser', '2025-11-12 20:51:00.283', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (757, 'STRING_00216', 1, N'First Name field is required.', 'CreateUser', '2025-11-12 21:06:14.620', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (758, 'STRING_00216', 2, N'Fusha Emri лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:06:14.623', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (759, 'STRING_00216', 3, N'Ime je obavezno.', 'CreateUser', '2025-11-12 21:06:14.623', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (760, 'STRING_00217', 1, N'Last Name field is required.', 'CreateUser', '2025-11-12 21:14:01.966', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (761, 'STRING_00217', 2, N'Fusha Mbiemri лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (762, 'STRING_00217', 3, N'Prezime je obavezno.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (763, 'STRING_00218', 1, N'User Name field is required.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (764, 'STRING_00218', 2, N'Fusha UserName лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (765, 'STRING_00218', 3, N'Korisnicko ime je obavezno.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (766, 'STRING_00219', 1, N'Email field is required.', 'CreateUser', '2025-11-12 21:14:01.970', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (767, 'STRING_00219', 2, N'Fusha Email-i лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (768, 'STRING_00219', 3, N'Email je obavezan.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (769, 'STRING_00220', 1, N'Password field is required.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (770, 'STRING_00220', 2, N'Fusha Fjalлkalimi лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (771, 'STRING_00220', 3, N'Lozinka je obavezna.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (772, 'STRING_00221', 1, N'Role field is required.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (773, 'STRING_00221', 2, N'Fusha Roli лshtл i detyrueshлm.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (774, 'STRING_00221', 3, N'Uloga je obavezna.', 'CreateUser', '2025-11-12 21:14:01.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (775, 'STRING_00222', 1, N'The email format is not valid.', 'CreateUser', '2025-11-12 21:16:49.336', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (776, 'STRING_00222', 2, N'Formati i email-it nuk лshtл i vlefshлm.', 'CreateUser', '2025-11-12 21:16:49.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (777, 'STRING_00222', 3, N'Format email-a nije valjan.', 'CreateUser', '2025-11-12 21:16:49.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (778, 'STRING_00223', 1, N'Password must be at least 6 characters.', 'CreateUser', '2025-11-12 21:16:49.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (779, 'STRING_00223', 2, N'Fjalлkalimi duhet tл jetл tл paktлn 6 karaktere.', 'CreateUser', '2025-11-12 21:16:49.340', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (780, 'STRING_00223', 3, N'Lozinka mora imati najmanje 6 karaktera.', 'CreateUser', '2025-11-12 21:16:49.343', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (781, 'STRING_00224', 1, N'User created, but failed to assign role', 'CreateUser', '2025-11-12 21:38:51.160', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (782, 'STRING_00224', 2, N'Pлrdoruesi u krijua, por dлshtoi caktimi i rolit', 'CreateUser', '2025-11-12 21:38:51.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (783, 'STRING_00224', 3, N'Korisnik je kreiran, ali dodela uloge nije uspela', 'CreateUser', '2025-11-12 21:38:51.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (784, 'STRING_00225', 1, N'Cash Payment', 'SalesInvoice', '2025-11-19 16:33:48.416', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (785, 'STRING_00225', 2, N'Pagesa me Para', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (786, 'STRING_00225', 3, N'Gotovinska Uplata', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (787, 'STRING_00226', 1, N'Amount', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (788, 'STRING_00226', 2, N'Shuma', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (789, 'STRING_00226', 3, N'Iznos', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (790, 'STRING_00227', 1, N'Cash', 'SalesInvoice', '2025-11-19 16:33:48.420', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (791, 'STRING_00227', 2, N'Kesh', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (792, 'STRING_00227', 3, N'Gotovina', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (793, 'STRING_00228', 1, N'Bank', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (794, 'STRING_00228', 2, N'Bankл', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (795, 'STRING_00228', 3, N'Banka', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (796, 'STRING_00229', 1, N'Change', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (797, 'STRING_00229', 2, N'Kusur', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (798, 'STRING_00229', 3, N'Kusur', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (799, 'STRING_00230', 1, N'OK', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (800, 'STRING_00230', 2, N'OK', 'SalesInvoice', '2025-11-19 16:33:48.423', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (801, 'STRING_00230', 3, N'OK', 'SalesInvoice', '2025-11-19 16:33:48.426', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (802, 'STRING_00231', 1, N'Print Receipt', 'SalesInvoice', '2025-11-19 16:33:48.426', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (803, 'STRING_00231', 2, N'Printo Faturлn', 'SalesInvoice', '2025-11-19 16:33:48.426', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (804, 'STRING_00231', 3, N'Љtampaj Racun', 'SalesInvoice', '2025-11-19 16:33:48.426', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (805, 'STRING_00232', 1, N'Return Reason', 'SalesInvoice', '2025-11-19 16:37:18.620', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (806, 'STRING_00232', 2, N'Arsyeja e Kthimit', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (807, 'STRING_00232', 3, N'Razlog Povratka', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (808, 'STRING_00233', 1, N'Original Invoice', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (809, 'STRING_00233', 2, N'Fatura Origjinale', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (810, 'STRING_00233', 3, N'Originalna Faktura', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (811, 'STRING_00234', 1, N'Select Original Invoice', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (812, 'STRING_00234', 2, N'Zgjidh Faturлn Origjinale', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (813, 'STRING_00234', 3, N'Izaberi Originalnu Fakturu', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (814, 'STRING_00235', 1, N'Search by invoice number or buyer...', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (815, 'STRING_00235', 2, N'Kлrko sipas numrit tл faturлs ose blerлsit...', 'SalesInvoice', '2025-11-19 16:37:18.653', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (816, 'STRING_00235', 3, N'Pretraћi po broju fakture ili kupcu...', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (817, 'STRING_00236', 1, N'Returnable', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (818, 'STRING_00236', 2, N'E Kthyeshme', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (819, 'STRING_00236', 3, N'Povratno', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (820, 'STRING_00237', 1, N'Original', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (821, 'STRING_00237', 2, N'Origjinale', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (822, 'STRING_00237', 3, N'Originalno', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (823, 'STRING_00238', 1, N'Maximum returnable quantity', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (824, 'STRING_00238', 2, N'Sasia maksimale e kthyeshme', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (825, 'STRING_00238', 3, N'Maksimalna povratna kolicina', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (826, 'STRING_00239', 1, N'Create Return', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (827, 'STRING_00239', 2, N'Krijo Kthim', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (828, 'STRING_00239', 3, N'Kreiraj Povracaj', 'SalesInvoice', '2025-11-19 16:37:18.656', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (829, 'STRING_00240', 1, N'Return created successfully!', 'SalesInvoice', '2025-11-19 16:37:18.660', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (830, 'STRING_00240', 2, N'Kthimi u krijua me sukses!', 'SalesInvoice', '2025-11-19 16:37:18.660', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (831, 'STRING_00240', 3, N'Povracaj uspeљno kreiran!', 'SalesInvoice', '2025-11-19 16:37:18.660', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (832, 'STRING_00241', 1, N'Search users...', 'Users', '2025-11-20 16:37:54.860', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (833, 'STRING_00241', 2, N'Kлrko pлrdoruesit...', 'Users', '2025-11-20 16:37:54.863', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (834, 'STRING_00241', 3, N'Pretraћi korisnike...', 'Users', '2025-11-20 16:37:54.863', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (835, 'STRING_00242', 1, N'Search user', 'Users', '2025-11-20 17:00:03.360', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (836, 'STRING_00242', 2, N'Kлrko pлrdoruesin', 'Users', '2025-11-20 17:00:03.363', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (837, 'STRING_00242', 3, N'Pretraћi korisnika', 'Users', '2025-11-20 17:00:03.363', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (838, 'STRING_00243', 1, N'The password change was successful.', 'Users', '2025-11-21 13:33:13.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (839, 'STRING_00243', 2, N'Ndryshimi i fjalлkalimit ishte i suksesshлm.', 'Users', '2025-11-21 13:33:13.390', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (840, 'STRING_00243', 3, N'Promena lozinke je bila uspeљna.', 'Users', '2025-11-21 13:33:13.390', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (841, 'STRING_00244', 1, N'New Password', 'Users', '2025-11-21 13:37:16.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (842, 'STRING_00244', 2, N'Fjalлkalimi i Ri', 'Users', '2025-11-21 13:37:16.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (843, 'STRING_00244', 3, N'Nova Lozinka', 'Users', '2025-11-21 13:37:16.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (844, 'STRING_00245', 1, N'Confirm Password', 'Users', '2025-11-21 13:39:44.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (845, 'STRING_00245', 2, N'Konfirmo Fjalлkalimin', 'Users', '2025-11-21 13:39:44.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (846, 'STRING_00245', 3, N'Potvrdi Lozinku', 'Users', '2025-11-21 13:39:44.566', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (847, 'STRING_00246', 1, N'Change Password for', 'Users', '2025-11-21 13:46:51.123', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (848, 'STRING_00246', 2, N'Ndrysho Fjalлkalimin pлr', 'Users', '2025-11-21 13:46:51.126', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (849, 'STRING_00246', 3, N'Promeni Lozinku za', 'Users', '2025-11-21 13:46:51.126', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (850, 'STRING_00247', 1, N'Passwords do not match.', 'Users', '2025-11-21 13:52:08.923', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (851, 'STRING_00247', 2, N'Fjalлkalimet nuk pлrputhen.', 'Users', '2025-11-21 13:52:08.953', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (852, 'STRING_00247', 3, N'Lozinke se ne podudaraju.', 'Users', '2025-11-21 13:52:08.953', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (853, 'STRING_00248', 1, N'Enable User', 'Users', '2025-11-21 14:06:34.300', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (854, 'STRING_00248', 2, N'Aktivizo Pлrdoruesin', 'Users', '2025-11-21 14:06:34.303', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (855, 'STRING_00248', 3, N'Aktiviraj Korisnika', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (856, 'STRING_00249', 1, N'Disable User', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (857, 'STRING_00249', 2, N'Зaktivizo Pлrdoruesin', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (858, 'STRING_00249', 3, N'Deaktiviraj Korisnika', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (859, 'STRING_00250', 1, N'User enabled successfully.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (860, 'STRING_00250', 2, N'Pлrdoruesi u aktivizua me sukses.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (861, 'STRING_00250', 3, N'Korisnik uspeљno aktiviran.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (862, 'STRING_00251', 1, N'User disabled successfully.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (863, 'STRING_00251', 2, N'Pлrdoruesi u зaktivizua me sukses.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (864, 'STRING_00251', 3, N'Korisnik uspeљno deaktiviran.', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (865, 'STRING_00252', 1, N'Status', 'Users', '2025-11-21 14:06:34.306', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (866, 'STRING_00252', 2, N'Statusi', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (867, 'STRING_00252', 3, N'Status', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (868, 'STRING_00253', 1, N'Active', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (869, 'STRING_00253', 2, N'Aktiv', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (870, 'STRING_00253', 3, N'Aktivan', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (871, 'STRING_00254', 1, N'Inactive', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (872, 'STRING_00254', 2, N'Joaktiv', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (873, 'STRING_00254', 3, N'Neaktivan', 'Users', '2025-11-21 14:06:34.310', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (874, 'STRING_00255', 1, N'Previous', 'Users', '2025-11-21 14:18:07.753', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (875, 'STRING_00255', 2, N'Paraardhлse', 'Users', '2025-11-21 14:18:07.756', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (876, 'STRING_00255', 3, N'Prethodno', 'Users', '2025-11-21 14:18:07.756', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (877, 'STRING_00256', 1, N'Next', 'Users', '2025-11-21 14:18:07.756', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (878, 'STRING_00256', 2, N'Tjetra', 'Users', '2025-11-21 14:18:07.756', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (879, 'STRING_00256', 3, N'Sledece', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (880, 'STRING_00257', 1, N'Showing {0} to {1} of {2} users', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (881, 'STRING_00257', 2, N'Duke shfaqur {0} deri nл {1} nga {2} pлrdorues', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (882, 'STRING_00257', 3, N'Prikazuje se {0} do {1} od {2} korisnika', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (883, 'STRING_00258', 1, N'Page', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (884, 'STRING_00258', 2, N'Faqe', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (885, 'STRING_00258', 3, N'Strana', 'Users', '2025-11-21 14:18:07.760', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (886, 'STRING_00259', 1, N'Manage User Module Access', 'UserModuleAccess', '2025-11-21 14:18:31.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (887, 'STRING_00259', 2, N'Menaxho Aksesin e Moduleve tл Pлrdoruesit', 'UserModuleAccess', '2025-11-21 14:18:31.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (888, 'STRING_00259', 3, N'Upravljanje pristupom korisnickih modula', 'UserModuleAccess', '2025-11-21 14:18:31.563', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (889, 'STRING_00260', 1, N'Loading users...', 'UserModuleAccess', '2025-11-21 14:28:27.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (890, 'STRING_00260', 2, N'Duke ngarkuar pлrdoruesit...', 'UserModuleAccess', '2025-11-21 14:28:27.410', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (891, 'STRING_00260', 3, N'Ucitavanje korisnika...', 'UserModuleAccess', '2025-11-21 14:28:27.410', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (892, 'STRING_00261', 1, N'Select a user on the left to configure module access.', 'UserModuleAccess', '2025-11-21 14:34:00.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (893, 'STRING_00261', 2, N'Zgjidhni njл pлrdorues nл tл majtл pлr tл konfiguruar aksesin e modulit.', 'UserModuleAccess', '2025-11-21 14:34:00.820', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (894, 'STRING_00261', 3, N'Izaberite korisnika sa leve strane da konfiguriљete pristup modulu.', 'UserModuleAccess', '2025-11-21 14:34:00.823', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (895, 'STRING_00262', 1, N'Loading modules...', 'UserModuleAccess', '2025-11-22 09:37:30.670', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (896, 'STRING_00262', 2, N'Duke ngarkuar modulet...', 'UserModuleAccess', '2025-11-22 09:37:30.673', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (897, 'STRING_00262', 3, N'Ucitavanje modula...', 'UserModuleAccess', '2025-11-22 09:37:30.673', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (898, 'STRING_00263', 1, N'Configuring access for:', 'UserModuleAccess', '2025-11-22 09:40:50.356', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (899, 'STRING_00263', 2, N'Konfigurimi i aksesit pлr:', 'UserModuleAccess', '2025-11-22 09:40:50.360', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (900, 'STRING_00263', 3, N'Konfiguracija pristupa za:', 'UserModuleAccess', '2025-11-22 09:40:50.360', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (901, 'STRING_00264', 1, N'Access for user saved successfully!', 'UserModuleAccess', '2025-11-22 09:54:31.000', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (902, 'STRING_00264', 2, N'Aksesi pлr pлrdoruesin u ruajt me sukses!', 'UserModuleAccess', '2025-11-22 09:54:31.000', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (903, 'STRING_00264', 3, N'Pristup za korisnika je uspeљno sacuvan!', 'UserModuleAccess', '2025-11-22 09:54:31.003', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (904, 'STRING_00265', 1, N'Business Unit Access Management', 'UserBusinessUnits', '2025-11-22 10:21:26.303', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (905, 'STRING_00265', 2, N'Menaxhimi i Aksesit tл Njлsive tл Biznesit', 'UserBusinessUnits', '2025-11-22 10:21:26.303', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (906, 'STRING_00265', 3, N'Upravljanje pristupom poslovnih jedinica', 'UserBusinessUnits', '2025-11-22 10:21:26.303', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (907, 'STRING_00266', 1, N'Loading...', 'UserBusinessUnits', '2025-11-22 10:25:44.053', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (908, 'STRING_00266', 2, N'Duke u ngarkuar...', 'UserBusinessUnits', '2025-11-22 10:25:44.056', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (909, 'STRING_00266', 3, N'Ucitavanje...', 'UserBusinessUnits', '2025-11-22 10:25:44.056', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (910, 'STRING_00267', 1, N'Business Units for', 'UserBusinessUnits', '2025-11-22 10:35:10.670', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (911, 'STRING_00267', 2, N'Njлsitл e Biznesit pлr', 'UserBusinessUnits', '2025-11-22 10:35:10.673', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (912, 'STRING_00267', 3, N'Poslovne jedinice za', 'UserBusinessUnits', '2025-11-22 10:35:10.673', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (913, 'STRING_00268', 1, N'Access', 'UserBusinessUnits', '2025-11-22 10:39:42.666', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (914, 'STRING_00268', 2, N'Aksesi', 'UserBusinessUnits', '2025-11-22 10:39:42.670', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (915, 'STRING_00268', 3, N'Pristup', 'UserBusinessUnits', '2025-11-22 10:39:42.670', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (916, 'STRING_00269', 1, N'Select a user to manage their business unit access.', 'UserBusinessUnits', '2025-11-22 10:42:09.870', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (917, 'STRING_00269', 2, N'Zgjidhni njл pлrdorues pлr tл menaxhuar aksesin e tij nл njлsitл e biznesit.', 'UserBusinessUnits', '2025-11-22 10:42:09.870', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (918, 'STRING_00269', 3, N'Izaberite korisnika da upravljate njihovim pristupom poslovnim jedinicama.', 'UserBusinessUnits', '2025-11-22 10:42:09.870', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (919, 'STRING_00270', 1, N'Access updated successfully!', 'UserBusinessUnits', '2025-11-22 10:44:48.083', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (920, 'STRING_00270', 2, N'Aksesi u pлrditлsua me sukses!', 'UserBusinessUnits', '2025-11-22 10:44:48.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (921, 'STRING_00270', 3, N'Pristup je uspeљno aћuriran!', 'UserBusinessUnits', '2025-11-22 10:44:48.090', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (922, 'STRING_00271', 1, N'Error updating access:', 'UserBusinessUnits', '2025-11-22 10:46:42.930', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (923, 'STRING_00271', 2, N'Gabim gjatл pлrditлsimit tл aksesit:', 'UserBusinessUnits', '2025-11-22 10:46:42.933', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (924, 'STRING_00271', 3, N'Greљka pri aћuriranju pristupa:', 'UserBusinessUnits', '2025-11-22 10:46:42.933', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (925, 'STRING_00272', 1, N'No business units assigned', 'BusinessUnitSelector', '2025-11-22 11:16:29.943', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (926, 'STRING_00272', 2, N'Nuk ka njлsi biznesi tл caktuara', 'BusinessUnitSelector', '2025-11-22 11:16:29.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (927, 'STRING_00272', 3, N'Nisu dodeljene poslovne jedinice', 'BusinessUnitSelector', '2025-11-22 11:16:29.946', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (928, 'STRING_00273', 1, N'Search business units...', 'BusinessUnits', '2025-11-22 11:33:28.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (929, 'STRING_00273', 2, N'Kлrko njлsitл e biznesit...', 'BusinessUnits', '2025-11-22 11:33:28.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (930, 'STRING_00273', 3, N'Pretraћi poslovne jedinice...', 'BusinessUnits', '2025-11-22 11:33:28.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (931, 'STRING_00274', 1, N'No business units found.', 'BusinessUnits', '2025-11-22 11:33:28.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (932, 'STRING_00274', 2, N'Nuk u gjetлn njлsi biznesi.', 'BusinessUnits', '2025-11-22 11:33:28.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (933, 'STRING_00274', 3, N'Nisu pronadene poslovne jedinice.', 'BusinessUnits', '2025-11-22 11:33:28.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (934, 'STRING_00275', 1, N'Search business units', 'BusinessUnits', '2025-11-22 11:39:12.586', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (935, 'STRING_00275', 2, N'Kлrko njлsitл e biznesit', 'BusinessUnits', '2025-11-22 11:39:12.590', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (936, 'STRING_00275', 3, N'Pretraћi poslovne jedinice', 'BusinessUnits', '2025-11-22 11:39:12.590', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (937, 'STRING_00276', 1, N'Search subjects...', 'Subjects', '2025-11-23 12:46:30.176', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (938, 'STRING_00276', 2, N'Kлrko subjektet...', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (939, 'STRING_00276', 3, N'Pretraћi subjekte...', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (940, 'STRING_00277', 1, N'All Types', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (941, 'STRING_00277', 2, N'Tл gjitha llojet', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (942, 'STRING_00277', 3, N'Svi tipovi', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (943, 'STRING_00278', 1, N'Buyers', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (944, 'STRING_00278', 2, N'Blerлsit', 'Subjects', '2025-11-23 12:46:30.180', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (945, 'STRING_00278', 3, N'Kupci', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (946, 'STRING_00279', 1, N'Suppliers', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (947, 'STRING_00279', 2, N'Furnitorлt', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (948, 'STRING_00279', 3, N'Dobavljaci', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (949, 'STRING_00280', 1, N'No subjects found.', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (950, 'STRING_00280', 2, N'Nuk u gjetлn subjekte.', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (951, 'STRING_00280', 3, N'Nisu pronadeni subjekti.', 'Subjects', '2025-11-23 12:46:30.183', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (952, 'STRING_00281', 1, N'All Categories', 'Articles', '2025-11-23 13:06:28.750', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (953, 'STRING_00281', 2, N'Tл gjitha Kategoritл', 'Articles', '2025-11-23 13:06:28.780', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (954, 'STRING_00281', 3, N'Sve kategorije', 'Articles', '2025-11-23 13:06:28.780', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (955, 'STRING_00282', 1, N'Showing {0} to {1} of {2} articles', 'Articles', '2025-11-23 13:06:28.780', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (956, 'STRING_00282', 2, N'Duke shfaqur {0} deri {1} nga {2} artikuj', 'Articles', '2025-11-23 13:06:28.780', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (957, 'STRING_00282', 3, N'Prikazuje se {0} do {1} od {2} artikala', 'Articles', '2025-11-23 13:06:28.780', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (958, 'STRING_00283', 1, N'No articles found.', 'Articles', '2025-11-23 13:06:28.783', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (959, 'STRING_00283', 2, N'Nuk u gjetлn artikuj.', 'Articles', '2025-11-23 13:06:28.783', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (960, 'STRING_00283', 3, N'Nisu pronadeni artikli.', 'Articles', '2025-11-23 13:06:28.783', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (961, 'STRING_00284', 1, N'Company Settings', 'CompanySettings', '2025-11-25 14:09:01.356', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (962, 'STRING_00284', 2, N'Cilлsimet e Kompanisл', 'CompanySettings', '2025-11-25 14:09:01.363', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (963, 'STRING_00284', 3, N'Podeљavanja kompanije', 'CompanySettings', '2025-11-25 14:09:01.363', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (964, 'STRING_00285', 1, N'Basic Information', 'CompanySettings', '2025-11-25 14:09:01.363', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (965, 'STRING_00285', 2, N'Informacione Bazл', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (966, 'STRING_00285', 3, N'Osnovne informacije', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (967, 'STRING_00286', 1, N'Company Name', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (968, 'STRING_00286', 2, N'Emri i Kompanisл', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (969, 'STRING_00286', 3, N'Naziv kompanije', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (970, 'STRING_00287', 1, N'Trade Name', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (971, 'STRING_00287', 2, N'Emri Tregtar', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (972, 'STRING_00287', 3, N'Trgovacki naziv', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (973, 'STRING_00288', 1, N'Tax & Registration', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (974, 'STRING_00288', 2, N'Taksat dhe Regjistrimi', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (975, 'STRING_00288', 3, N'Porezi i registracija', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (976, 'STRING_00289', 1, N'VAT Number', 'CompanySettings', '2025-11-25 14:09:01.366', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (977, 'STRING_00289', 2, N'Numri TVSH', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (978, 'STRING_00289', 3, N'PDV broj', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (979, 'STRING_00290', 1, N'Business Registration Number', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (980, 'STRING_00290', 2, N'Numri i Regjistrimit tл Biznesit', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (981, 'STRING_00290', 3, N'Broj registracije poslovanja', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (982, 'STRING_00291', 1, N'Tax Office', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (983, 'STRING_00291', 2, N'Zyra e Tatimeve', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (984, 'STRING_00291', 3, N'Poreska uprava', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (985, 'STRING_00292', 1, N'City', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (986, 'STRING_00292', 2, N'Qyteti', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (987, 'STRING_00292', 3, N'Grad', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (988, 'STRING_00293', 1, N'Postal Code', 'CompanySettings', '2025-11-25 14:09:01.370', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (989, 'STRING_00293', 2, N'Kodi Postar', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (990, 'STRING_00293', 3, N'Poљtanski broj', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (991, 'STRING_00294', 1, N'Country', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (992, 'STRING_00294', 2, N'Shteti', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (993, 'STRING_00294', 3, N'Drћava', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (994, 'STRING_00295', 1, N'Phone Number', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (995, 'STRING_00295', 2, N'Numri i Telefonit', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (996, 'STRING_00295', 3, N'Broj telefona', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (997, 'STRING_00296', 1, N'Banking Information', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (998, 'STRING_00296', 2, N'Informacione Bankare', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (999, 'STRING_00296', 3, N'Bankarske informacije', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1000, 'STRING_00297', 1, N'Bank Name', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1001, 'STRING_00297', 2, N'Emri i Bankлs', 'CompanySettings', '2025-11-25 14:09:01.373', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1002, 'STRING_00297', 3, N'Naziv banke', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1003, 'STRING_00298', 1, N'IBAN', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1004, 'STRING_00298', 2, N'IBAN', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1005, 'STRING_00298', 3, N'IBAN', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1006, 'STRING_00299', 1, N'SWIFT/BIC Code', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1007, 'STRING_00299', 2, N'Kodi SWIFT/BIC', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1008, 'STRING_00299', 3, N'SWIFT/BIC kod', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1009, 'STRING_00300', 1, N'Bank Account Details', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1010, 'STRING_00300', 2, N'Detajet e Llogarisл Bankare', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1011, 'STRING_00300', 3, N'Detalji bankovnog racuna', 'CompanySettings', '2025-11-25 14:09:01.376', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1012, 'STRING_00301', 1, N'Financial Settings', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1013, 'STRING_00301', 2, N'Cilлsimet Financiare', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1014, 'STRING_00301', 3, N'Finansijska podeљavanja', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1015, 'STRING_00302', 1, N'Default Currency', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1016, 'STRING_00302', 2, N'Monedha e Paracaktuar', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1017, 'STRING_00302', 3, N'Podrazumevana valuta', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1018, 'STRING_00303', 1, N'Fiscal Year Start Month', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1019, 'STRING_00303', 2, N'Muaji i Fillimit tл Vitit Fiskal', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1020, 'STRING_00303', 3, N'Mesec pocetka fiskalne godine', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1021, 'STRING_00304', 1, N'Fiscal Year Start Day', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1022, 'STRING_00304', 2, N'Dita e Fillimit tл Vitit Fiskal', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1023, 'STRING_00304', 3, N'Dan pocetka fiskalne godine', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1024, 'STRING_00305', 1, N'Invoice Settings', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1025, 'STRING_00305', 2, N'Cilлsimet e Faturлs', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1026, 'STRING_00305', 3, N'Podeљavanja fakture', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1027, 'STRING_00306', 1, N'Invoice Footer Text', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1028, 'STRING_00306', 2, N'Teksti i Fundit tл Faturлs', 'CompanySettings', '2025-11-25 14:09:01.380', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1029, 'STRING_00306', 3, N'Tekst podnoћja fakture', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1030, 'STRING_00307', 1, N'Terms and Conditions', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1031, 'STRING_00307', 2, N'Termat dhe Kushtet', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1032, 'STRING_00307', 3, N'Uslovi i odredbe', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1033, 'STRING_00308', 1, N'System Settings', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1034, 'STRING_00308', 2, N'Cilлsimet e Sistemit', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1035, 'STRING_00308', 3, N'Sistemska podeљavanja', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1036, 'STRING_00309', 1, N'Default Language', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1037, 'STRING_00309', 2, N'Gjuha e Paracaktuar', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1038, 'STRING_00309', 3, N'Podrazumevani jezik', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1039, 'STRING_00310', 1, N'Date Format', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1040, 'STRING_00310', 2, N'Formati i Datлs', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1041, 'STRING_00310', 3, N'Format datuma', 'CompanySettings', '2025-11-25 14:09:01.383', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1042, 'STRING_00311', 1, N'Number Format', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1043, 'STRING_00311', 2, N'Formati i Numrit', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1044, 'STRING_00311', 3, N'Format broja', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1045, 'STRING_00312', 1, N'Save Settings', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1046, 'STRING_00312', 2, N'Ruaj Cilлsimet', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1047, 'STRING_00312', 3, N'Sacuvaj podeљavanja', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1048, 'STRING_00313', 1, N'Settings saved successfully!', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1049, 'STRING_00313', 2, N'Cilлsimet u ruajtлn me sukses!', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1050, 'STRING_00313', 3, N'Podeљavanja su uspeљno sacuvana!', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1051, 'STRING_00314', 1, N'Error saving settings:', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1052, 'STRING_00314', 2, N'Gabim gjatл ruajtjes sл cilлsimeve:', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1053, 'STRING_00314', 3, N'Greљka pri cuvanju podeљavanja:', 'CompanySettings', '2025-11-25 14:09:01.386', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1057, 'STRING_00315', 1, N'Seller Information', 'SalesInvoice', '2025-12-15 18:50:40.693', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1058, 'STRING_00315', 2, N'Informacione tл Shitлsit', 'SalesInvoice', '2025-12-15 18:50:40.696', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1059, 'STRING_00315', 3, N'Informacije o prodavcu', 'SalesInvoice', '2025-12-15 18:50:40.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1060, 'STRING_00316', 1, N'Error checking cash category', 'Sales', '2025-12-22 21:03:06.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1061, 'STRING_00316', 2, N'Gabim gjatл kontrollit tл kategorisл sл parave tл gatshme', 'Sales', '2025-12-22 21:03:06.266', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1062, 'STRING_00316', 3, N'Greљka pri proveri kategorije gotovine', 'Sales', '2025-12-22 21:03:06.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1063, 'STRING_00317', 1, N'Could not load default buyer ''''Qytetari''''', 'Sales', '2025-12-22 21:03:06.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1064, 'STRING_00317', 2, N'Nuk mund tл ngarkohej blerлsi i paracaktuar ''''Qytetari''''', 'Sales', '2025-12-22 21:03:06.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1065, 'STRING_00317', 3, N'Nije moguce ucitati podrazumevanog kupca ''''Qytetari''''', 'Sales', '2025-12-22 21:03:06.270', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1066, 'STRING_00318', 1, N'Clear', 'Sales', '2025-12-23 20:28:36.883', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1067, 'STRING_00318', 2, N'Pastro', 'Sales', '2025-12-23 20:28:36.916', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1068, 'STRING_00318', 3, N'Ocisti', 'Sales', '2025-12-23 20:28:36.923', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1069, 'STRING_00319', 1, N'Are you sure you want to clear all items?', 'Sales', '2025-12-23 20:28:36.956', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1070, 'STRING_00319', 2, N'A jeni i sigurt qл dлshironi tл pastroni tл gjithл artikujt?', 'Sales', '2025-12-23 20:28:36.956', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1071, 'STRING_00319', 3, N'Da li ste sigurni da ћelite da obriљete sve stavke?', 'Sales', '2025-12-23 20:28:36.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1072, 'STRING_00320', 1, N'Confirm', 'Sales', '2025-12-23 20:28:36.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1073, 'STRING_00320', 2, N'Konfirmo', 'Sales', '2025-12-23 20:28:36.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1074, 'STRING_00320', 3, N'Potvrdi', 'Sales', '2025-12-23 20:28:36.960', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1075, 'STRING_00321', 1, N'Error searching barcodes', 'Sales', '2025-12-25 14:39:52.696', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1076, 'STRING_00321', 2, N'Gabim gjatл kлrkimit tл barkodeve', 'Sales', '2025-12-25 14:39:52.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1077, 'STRING_00321', 3, N'Greљka pri pretrazi bar kodova', 'Sales', '2025-12-25 14:39:52.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1078, 'STRING_00322', 1, N'Error checking return category', 'Sales', '2025-12-25 17:12:43.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1079, 'STRING_00322', 2, N'Gabim gjatл kontrollit tл kategorisл sл kthimit', 'Sales', '2025-12-25 17:12:43.163', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1080, 'STRING_00322', 3, N'Greљka pri proveri kategorije povrata', 'Sales', '2025-12-25 17:12:43.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1081, 'STRING_00323', 1, N'Error checking export category', 'Sales', '2025-12-25 17:12:43.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1082, 'STRING_00323', 2, N'Gabim gjatл kontrollit tл kategorisл sл eksportit', 'Sales', '2025-12-25 17:12:43.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1083, 'STRING_00323', 3, N'Greљka pri proveri izvozne kategorije', 'Sales', '2025-12-25 17:12:43.166', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1084, 'STRING_00324', 1, N'Error resetting invoice', 'Sales', '2025-12-27 19:42:00.230', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1085, 'STRING_00324', 2, N'Gabim gjatл rivendosjes sл faturлs', 'Sales', '2025-12-27 19:42:00.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1086, 'STRING_00324', 3, N'Greљka pri resetovanju fakture', 'Sales', '2025-12-27 19:42:00.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1087, 'STRING_00325', 1, N'This invoice was returned once.', 'Sales', '2025-12-27 19:42:00.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1088, 'STRING_00325', 2, N'Kjo faturл лshtл kthyer njл herл.', 'Sales', '2025-12-27 19:42:00.233', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1089, 'STRING_00325', 3, N'Ova faktura je vec jednom vracena.', 'Sales', '2025-12-27 19:42:00.236', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1090, 'STRING_00326', 1, N'Invoice ''''{0}'''' not found. Requirements: Must be posted, not cancelled, and not a return.', 'Sales', '2025-12-27 19:42:00.236', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1091, 'STRING_00326', 2, N'Fatura ''''{0}'''' nuk u gjet. Kлrkesat: Duhet tл jetл e postuar, jo e anuluar dhe jo kthim.', 'Sales', '2025-12-27 19:42:00.236', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1092, 'STRING_00326', 3, N'Faktura ''''{0}'''' nije pronadena. Zahtevi: Mora biti proknjiћena, ne poniљtena i ne povrat.', 'Sales', '2025-12-27 19:42:00.236', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1093, 'STRING_00327', 1, N'Import Purchase', 'Purchases', '2025-12-27 20:12:16.973', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1094, 'STRING_00327', 2, N'Blerja import', 'Purchases', '2025-12-27 20:12:16.976', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1095, 'STRING_00327', 3, N'Uvozna nabavka', 'Purchases', '2025-12-27 20:12:16.976', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1096, 'STRING_00328', 1, N'Domestic Purchase', 'Purchases', '2025-12-27 20:12:16.976', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1097, 'STRING_00328', 2, N'Blerja vendore', 'Purchases', '2025-12-27 20:12:16.976', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1098, 'STRING_00328', 3, N'Domaca nabavka', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1099, 'STRING_00329', 1, N'Expense Purchase', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1100, 'STRING_00329', 2, N'Blerja e shpenzimeve', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1101, 'STRING_00329', 3, N'Nabavka troљkova', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1102, 'STRING_00330', 1, N'Debit Note', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1103, 'STRING_00330', 2, N'Note debiti', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1104, 'STRING_00330', 3, N'Knjiћno zaduћenje', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1105, 'STRING_00331', 1, N'Purchase Return', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1106, 'STRING_00331', 2, N'Kthimi i blerjeve', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1107, 'STRING_00331', 3, N'Povrat nabavke', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1108, 'STRING_00332', 1, N'Reverse Charge', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1109, 'STRING_00332', 2, N'Ngarkesa e kundлrt', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1110, 'STRING_00332', 3, N'Obrnuto oporezivanje', 'Purchases', '2025-12-27 20:12:16.980', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1111, 'STRING_00333', 1, N'Trading Agents', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1112, 'STRING_00333', 2, N'Agjentлt Tregtarл', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1113, 'STRING_00333', 3, N'Trgovacki Agenti', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1114, 'STRING_00334', 1, N'Add New', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1115, 'STRING_00334', 2, N'Shto tл Ri', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1116, 'STRING_00334', 3, N'Dodaj Novi', 'TradingAgents', '2025-12-28 12:37:38.496', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1117, 'STRING_00335', 1, N'Edit Agent', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1118, 'STRING_00335', 2, N'Ndrysho Agjentin', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1119, 'STRING_00335', 3, N'Uredi Agenta', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1120, 'STRING_00336', 1, N'Are you sure you want to deactivate {0}?', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1121, 'STRING_00336', 2, N'A jeni i sigurt qл dлshironi tл зaktivizoni {0}?', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1122, 'STRING_00336', 3, N'Da li ste sigurni da ћelite deaktivirati {0}?', 'TradingAgents', '2025-12-28 12:37:38.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1123, 'STRING_00337', 1, N'New Purchase', 'Purchases', '2025-12-28 13:03:05.206', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1124, 'STRING_00337', 2, N'Blerje e Re', 'Purchases', '2025-12-28 13:03:05.206', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1125, 'STRING_00337', 3, N'Nova Kupovina', 'Purchases', '2025-12-28 13:03:05.206', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1126, 'PCAT_IMP', 1, N'Import Purchase', 'PurchaseCategory', '2025-12-28 13:36:11.096', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1127, 'PCAT_IMP', 2, N'Blerje Import', 'PurchaseCategory', '2025-12-28 13:36:11.096', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1128, 'PCAT_IMP', 3, N'Uvozna Kupovina', 'PurchaseCategory', '2025-12-28 13:36:11.096', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1129, 'PCAT_DOM', 1, N'Domestic Purchase', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1130, 'PCAT_DOM', 2, N'Blerje Vendore', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1131, 'PCAT_DOM', 3, N'Domaca Kupovina', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1132, 'PCAT_EXP', 1, N'Expense Purchase', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1133, 'PCAT_EXP', 2, N'Blerje Shpenzime', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1134, 'PCAT_EXP', 3, N'Troљkovi', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1135, 'PCAT_DN', 1, N'Debit Note', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1136, 'PCAT_DN', 2, N'Notл Debiti', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1137, 'PCAT_DN', 3, N'Knjiћno Odobrenje (Ulaz)', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1138, 'PCAT_RET', 1, N'Purchase Return', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1139, 'PCAT_RET', 2, N'Kthim Blerje', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1140, 'PCAT_RET', 3, N'Povrat Robe', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1141, 'PCAT_REV', 1, N'Reverse Charge', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1142, 'PCAT_REV', 2, N'Ngarkesл e Anasjelltл', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1143, 'PCAT_REV', 3, N'Obrnuto Oporezivanje', 'PurchaseCategory', '2025-12-28 13:36:11.100', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1144, 'PCAT_DESC_IMP', 1, N'Purchases from international suppliers', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1145, 'PCAT_DESC_IMP', 2, N'Blerje nga furnitorл ndлrkombлtarл', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1146, 'PCAT_DESC_IMP', 3, N'Kupovina od medunarodnih dobavljaca', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1147, 'PCAT_DESC_DOM', 1, N'Purchases from domestic suppliers', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1148, 'PCAT_DESC_DOM', 2, N'Blerje nga furnitorл vendorл', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1149, 'PCAT_DESC_DOM', 3, N'Kupovina od domacih dobavljaca', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1150, 'PCAT_DESC_EXP', 1, N'General business expenses', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1151, 'PCAT_DESC_EXP', 2, N'Shpenzime tл pлrgjithshme biznesi', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1152, 'PCAT_DESC_EXP', 3, N'Opљti poslovni troљkovi', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1153, 'PCAT_DESC_DN', 1, N'Debit notes for price adjustments', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1154, 'PCAT_DESC_DN', 2, N'Nota debiti pлr rregullime зmimi', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1155, 'PCAT_DESC_DN', 3, N'Knjiћna odobrenja za korekcije cena', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1156, 'PCAT_DESC_RET', 1, N'Return of purchased goods', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1157, 'PCAT_DESC_RET', 2, N'Kthim i mallrave tл blera', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1158, 'PCAT_DESC_RET', 3, N'Povrat kupljene robe', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1159, 'PCAT_DESC_REV', 1, N'Reverse charge mechanism purchases', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1160, 'PCAT_DESC_REV', 2, N'Blerje me mekanizmin e ngarkesлs sл anasjelltл', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1161, 'PCAT_DESC_REV', 3, N'Kupovina sa mehanizmom obrnutog oporezivanja', 'PurchaseCategory', '2025-12-28 13:42:30.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1162, 'STRING_00338', 1, N'Start typing supplier...', 'Purchases', '2025-12-30 14:55:07.533', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1163, 'STRING_00338', 2, N'Filloni tл shkruani furnitorin...', 'Purchases', '2025-12-30 14:55:07.533', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1164, 'STRING_00338', 3, N'Pocnite kucati dobavljaca...', 'Purchases', '2025-12-30 14:55:07.533', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1165, 'STRING_00339', 1, N'Shipment', 'Purchases', '2025-12-30 16:15:22.200', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1166, 'STRING_00339', 2, N'Dлrgesa', 'Purchases', '2025-12-30 16:15:22.200', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1167, 'STRING_00339', 3, N'Spedizione', 'Purchases', '2025-12-30 16:15:22.200', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1168, 'STRING_00340', 1, N'Purchase Details', 'Purchases', '2025-12-30 22:02:45.396', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1169, 'STRING_00340', 2, N'Detajet e Blerjes', 'Purchases', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1170, 'STRING_00340', 3, N'Detalji Kupovine', 'Purchases', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1171, 'STRING_00341', 1, N'Supplier Name', 'Purchases', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1172, 'STRING_00341', 2, N'Emri i Furnitorit', 'Purchases', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1173, 'STRING_00341', 3, N'Ime Dobavljaca', 'Purchases', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1174, 'STRING_00342', 1, N'Approved', 'Status', '2025-12-30 22:02:45.400', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1175, 'STRING_00342', 2, N'Miratuar', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1176, 'STRING_00342', 3, N'Odobreno', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1177, 'STRING_00343', 1, N'Received', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1178, 'STRING_00343', 2, N'Pranuar', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1179, 'STRING_00343', 3, N'Primljeno', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1180, 'STRING_00344', 1, N'Paid', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1181, 'STRING_00344', 2, N'Paguar', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1182, 'STRING_00344', 3, N'Placeno', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1183, 'STRING_00345', 1, N'On Hold', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1184, 'STRING_00345', 2, N'Nл Pritje', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1185, 'STRING_00345', 3, N'Na Cekanju', 'Status', '2025-12-30 22:02:45.403', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1186, 'STRING_00346', 1, N'VAT %', 'Invoice', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1187, 'STRING_00346', 2, N'TVSH %', 'Invoice', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1188, 'STRING_00346', 3, N'PDV %', 'Invoice', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1189, 'STRING_00347', 1, N'No items found', 'Purchases', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1190, 'STRING_00347', 2, N'Nuk u gjetлn artikuj', 'Purchases', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1191, 'STRING_00347', 3, N'Nije pronadena stavka', 'Purchases', '2025-12-30 22:02:45.406', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1192, 'STRING_00348', 1, N'PURCHASE INVOICE', 'Purchases', '2025-12-30 22:13:37.926', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1193, 'STRING_00348', 2, N'FATURЛ BLERJEJE', 'Purchases', '2025-12-30 22:13:37.930', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1194, 'STRING_00348', 3, N'FAKTURA ZA KUPOVINU', 'Purchases', '2025-12-30 22:13:37.930', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1195, 'STRING_00349', 1, N'Supplier Invoice #', 'Purchases', '2025-12-30 22:22:51.720', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1196, 'STRING_00349', 2, N'Faturл Furnitori #', 'Purchases', '2025-12-30 22:22:51.726', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1197, 'STRING_00349', 3, N'Broj Fakture Dobavljaca #', 'Purchases', '2025-12-30 22:22:51.726', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1198, 'STRING_00350', 1, N'Back to Purchases', 'Navigation', '2025-12-30 22:34:54.500', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1199, 'STRING_00350', 2, N'Kthehu te Blerjet', 'Navigation', '2025-12-30 22:34:54.503', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1200, 'STRING_00350', 3, N'Nazad na Kupovine', 'Navigation', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1201, 'STRING_00351', 1, N'Approve', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1202, 'STRING_00351', 2, N'Mirato', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1203, 'STRING_00351', 3, N'Odobri', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1204, 'STRING_00352', 1, N'Mark as Received', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1205, 'STRING_00352', 2, N'Shлno si tл Pranuar', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1206, 'STRING_00352', 3, N'Oznaci kao Primljeno', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1207, 'STRING_00353', 1, N'Put On Hold', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1208, 'STRING_00353', 2, N'Vendos Nл Pritje', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1209, 'STRING_00353', 3, N'Stavi Na Cekanje', 'Actions', '2025-12-30 22:34:54.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1210, 'STRING_00354', 1, N'Post to Accounting', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1211, 'STRING_00354', 2, N'Posto nл Kontabilitet', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1212, 'STRING_00354', 3, N'Proknjiћ? u Racunovodstvo', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1213, 'STRING_00355', 1, N'Mark as Paid', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1214, 'STRING_00355', 2, N'Shлno si tл Paguar', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1215, 'STRING_00355', 3, N'Oznaci kao Placeno', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1216, 'STRING_00356', 1, N'Resume', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1217, 'STRING_00356', 2, N'Vazhdo', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1218, 'STRING_00356', 3, N'Nastavi', 'Actions', '2025-12-30 22:34:54.510', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1219, 'STRING_00357', 1, N'Error loading purchase', 'Errors', '2025-12-30 22:39:39.640', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1220, 'STRING_00357', 2, N'Gabim gjatл ngarkimit tл blerjes', 'Errors', '2025-12-30 22:39:39.643', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1221, 'STRING_00357', 3, N'Greљka pri ucitavanju kupovine', 'Errors', '2025-12-30 22:39:39.643', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1222, 'STRING_00358', 1, N'Are you sure you want to change status to', 'Errors', '2025-12-31 09:09:37.676', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1223, 'STRING_00359', 1, N'Status successfully changed to', 'Errors', '2025-12-31 09:09:37.680', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1224, 'STRING_00360', 1, N'Error changing status', 'Errors', '2025-12-31 09:09:37.680', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1225, 'STRING_00361', 1, N'Are you sure you want to cancel this purchase?', 'Errors', '2025-12-31 09:09:37.680', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1226, 'STRING_00362', 1, N'Purchase cancelled successfully', 'Errors', '2025-12-31 09:09:37.680', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1227, 'STRING_00363', 1, N'Error cancelling purchase', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1228, 'STRING_00364', 1, N'Error printing invoice', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1229, 'STRING_00358', 2, N'Jeni tл sigurt qл dлshironi tл ndryshoni statusin nл', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1230, 'STRING_00359', 2, N'Statusi u ndryshua me sukses nл', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1231, 'STRING_00360', 2, N'Gabim gjatл ndryshimit tл statusit', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1232, 'STRING_00361', 2, N'Jeni tл sigurt qл dлshironi tл anuloni kлtл blerje?', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1233, 'STRING_00362', 2, N'Blerja u anulua me sukses', 'Errors', '2025-12-31 09:09:37.683', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1234, 'STRING_00363', 2, N'Gabim gjatл anulimit tл blerjes', 'Errors', '2025-12-31 09:09:37.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1235, 'STRING_00364', 2, N'Gabim gjatл printimit tл faturлs', 'Errors', '2025-12-31 09:09:37.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1236, 'STRING_00358', 3, N'Da li ste sigurni da ћelite da promenite status u', 'Errors', '2025-12-31 09:09:37.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1237, 'STRING_00359', 3, N'Status je uspeљno promenjen u', 'Errors', '2025-12-31 09:09:37.686', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1238, 'STRING_00360', 3, N'Greљka pri promeni statusa', 'Errors', '2025-12-31 09:09:37.690', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1239, 'STRING_00361', 3, N'Da li ste sigurni da ћelite da otkaћete ovu kupovinu?', 'Errors', '2025-12-31 09:09:37.690', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1240, 'STRING_00362', 3, N'Kupovina je uspeљno otkazana', 'Errors', '2025-12-31 09:09:37.690', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1241, 'STRING_00363', 3, N'Greљka pri otkazivanju kupovine', 'Errors', '2025-12-31 09:09:37.690', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1242, 'STRING_00364', 3, N'Greљka pri љtampanju fakture', 'Errors', '2025-12-31 09:09:37.690', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1243, 'STRING_00365', 1, N'Internal #', 'Purchase', '2025-12-31 11:38:50.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1244, 'STRING_00366', 1, N'No purchase invoices found for your account. Click the "New Purchase" button to create one.', 'Purchase', '2025-12-31 11:38:50.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1245, 'STRING_00365', 2, N'Nr. Intern', 'Purchase', '2025-12-31 11:38:50.470', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1246, 'STRING_00366', 2, N'Nuk u gjetлn fatura blerjeje pлr llogarinл tuaj. Klikoni butonin "Blerje e Re" pлr tл krijuar njл.', 'Purchase', '2025-12-31 11:38:50.473', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1247, 'STRING_00365', 3, N'Interni br.', 'Purchase', '2025-12-31 11:38:50.473', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1248, 'STRING_00366', 3, N'Nisu pronadene fakture nabavke za vaљ nalog. Kliknite na dugme "Nova nabavka" da kreirate jednu.', 'Purchase', '2025-12-31 11:38:50.473', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1249, 'STRING_00367', 1, N'All', 'Purchase', '2025-12-31 11:53:56.803', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1250, 'STRING_00367', 2, N'Tл gjitha', 'Purchase', '2025-12-31 11:53:56.806', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1251, 'STRING_00367', 3, N'Sve', 'Purchase', '2025-12-31 11:53:56.806', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1252, 'STRING_00368', 1, N'Location', 'Purchase', '2025-12-31 13:05:29.670', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1253, 'STRING_00369', 1, N'Enter the invoice number from the supplier', 'Purchase', '2025-12-31 13:05:29.700', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1254, 'STRING_00370', 1, N'Logistics', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1255, 'STRING_00371', 1, N'Invoice References', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1256, 'STRING_00372', 1, N'Purchase created successfully!', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1257, 'STRING_00373', 1, N'Purchase updated successfully!', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1258, 'STRING_00374', 1, N'Please select a supplier.', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1259, 'STRING_00375', 1, N'Please enter the supplier''''s invoice number.', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1260, 'STRING_00376', 1, N'This purchase cannot be edited because its status is ''''{0}''''. Only Draft purchases can be edited.', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1261, 'STRING_00377', 1, N'Error loading agents', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1262, 'STRING_00378', 1, N'An error occurred', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1263, 'STRING_00379', 1, N'Try Again', 'Purchase', '2025-12-31 13:05:29.703', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1264, 'STRING_00368', 2, N'Vendndodhja', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1265, 'STRING_00369', 2, N'Vendosni numrin e faturлs nga furnizuesi', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1266, 'STRING_00370', 2, N'Logjistika', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1267, 'STRING_00371', 2, N'Referencat e Faturлs', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1268, 'STRING_00372', 2, N'Blerja u krijua me sukses!', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1269, 'STRING_00373', 2, N'Blerja u pлrditлsua me sukses!', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1270, 'STRING_00374', 2, N'Ju lutem zgjidhni njл furnizues.', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1271, 'STRING_00375', 2, N'Ju lutem vendosni numrin e faturлs sл furnizuesit.', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1272, 'STRING_00376', 2, N'Kjo blerje nuk mund tл modifikohet sepse statusi i saj лshtл ''''{0}''''. Vetлm blerjat Draft mund tл modifikohen.', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1273, 'STRING_00377', 2, N'Gabim gjatл ngarkimit tл agjentлve', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1274, 'STRING_00378', 2, N'Ndodhi njл gabim', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1275, 'STRING_00379', 2, N'Provo Pлrsлri', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1276, 'STRING_00368', 3, N'Lokacija', 'Purchase', '2025-12-31 13:05:29.706', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1277, 'STRING_00369', 3, N'Unesite broj fakture od dobavljaca', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1278, 'STRING_00370', 3, N'Logistika', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1279, 'STRING_00371', 3, N'Reference fakture', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1280, 'STRING_00372', 3, N'Nabavka je uspeљno kreirana!', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1281, 'STRING_00373', 3, N'Nabavka je uspeљno aћurirana!', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1282, 'STRING_00374', 3, N'Molimo izaberite dobavljaca.', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1283, 'STRING_00375', 3, N'Molimo unesite broj fakture dobavljaca.', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1284, 'STRING_00376', 3, N'Ova nabavka ne moћe biti izmenjena jer je njen status ''''{0}''''. Samo Draft nabavke mogu biti izmenjene.', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1285, 'STRING_00377', 3, N'Greљka pri ucitavanju agenata', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1286, 'STRING_00378', 3, N'Doљlo je do greљke', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1287, 'STRING_00379', 3, N'Pokuљaj ponovo', 'Purchase', '2025-12-31 13:05:29.710', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1288, 'STRING_00380', 1, N'Transport Ref...', 'Purchase', '2025-12-31 13:24:56.060', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1289, 'STRING_00380', 2, N'Ref. Transporti...', 'Purchase', '2025-12-31 13:24:56.063', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1290, 'STRING_00380', 3, N'Ref. Transporta...', 'Purchase', '2025-12-31 13:24:56.066', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1291, 'STRING_00381', 1, N'-- Select Agent --', 'Purchase', '2025-12-31 13:28:35.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1292, 'STRING_00381', 2, N'-- Zgjidhni Agjent --', 'Purchase', '2025-12-31 13:28:35.506', NULL);
INSERT INTO [dbo].[LocalizationStrings] (StringId, StringKey, LanguageId, Text, Category, CreatedAt, UpdatedAt) VALUES (1293, 'STRING_00381', 3, N'-- Izaberite agenta --', 'Purchase', '2025-12-31 13:28:35.506', NULL);

SET IDENTITY_INSERT [dbo].[LocalizationStrings] OFF
PRINT '✓ LocalizationStrings inserted (1245 records)'

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
