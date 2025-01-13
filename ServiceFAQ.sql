CREATE TABLE ServiceFAQs (
    FAQID INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment column
    ServiceID INT NOT NULL, -- Foreign key reference
    Question NVARCHAR(255) NOT NULL, -- Use NVARCHAR for Unicode support
    Answer NVARCHAR(MAX) NOT NULL, -- NVARCHAR(MAX) for large text fields
    CreatedAt DATETIME DEFAULT GETDATE(), -- Automatically set current timestamp
    UpdatedAt DATETIME DEFAULT GETDATE(), -- Will be updated via a trigger
    CONSTRAINT FK_ServiceFAQs_Services FOREIGN KEY (ServiceID)
        REFERENCES Services(ServiceID) ON DELETE CASCADE -- Enforce referential integrity
)
