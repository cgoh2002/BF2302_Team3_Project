CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment column
    Name NVARCHAR(100) NOT NULL, -- Use NVARCHAR for Unicode support
    Description NVARCHAR(MAX) NOT NULL, -- NVARCHAR(MAX) for large text fields
    PricingDetails NVARCHAR(MAX), -- Optional field for pricing tiers
    IsActive BIT DEFAULT 1, -- BIT data type for boolean values
    CreatedAt DATETIME DEFAULT GETDATE(), -- Automatically set the current timestamp
    UpdatedAt DATETIME DEFAULT GETDATE() -- Will be updated via a trigger
);

