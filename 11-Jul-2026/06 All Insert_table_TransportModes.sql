INSERT INTO [dbo].[TransportModes]
([ModeName], [IsDeleted], [SchoolId])
VALUES
('School Transport', 0, 18);

INSERT INTO [dbo].[TransportModes]
([ModeName], [IsDeleted], [SchoolId])
VALUES
('Private Transport', 0, 18);

INSERT INTO [dbo].[TransportModes]
([ModeName], [IsDeleted], [SchoolId])
VALUES
('Self Pickup', 0, 18);
GO

ALTER TABLE StudentAdditionalDetails
ADD EmergencyContactNo NVARCHAR(15) NULL;
