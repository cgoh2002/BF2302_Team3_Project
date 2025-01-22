CREATE TABLE Risk_Assessment (
    RiskId INT IDENTITY(1,1) PRIMARY KEY,       -- Auto-incrementing primary key
    AssetName NVARCHAR(100) NOT NULL,      -- Name of the asset (e.g., Real Estate)
    RiskScore INT NOT NULL, 
	RiskLevel NVARCHAR(50) NOT NULL
	);