-- Add Status column to PurchaseInvoices table
ALTER TABLE [dbo].[PurchaseInvoices]
ADD [Status] NVARCHAR(20) NOT NULL DEFAULT 'Draft';
GO

-- Update existing records based on current flags
UPDATE [dbo].[PurchaseInvoices]
SET [Status] = CASE 
    WHEN [IsCancelled] = 1 THEN 'Cancelled'
    WHEN [IsPosted] = 1 THEN 'Posted'
    ELSE 'Draft'
END;
GO

-- Create index for better query performance
CREATE INDEX IX_PurchaseInvoices_Status 
ON [dbo].[PurchaseInvoices]([Status]);
GO