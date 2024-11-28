CREATE TYPE Contact AS TABLE
(
	  	ContactID int          NOT NULL,
  	FirstName nvarchar(50) NOT NULL,
  	LastName  nvarchar(50) NOT NULL
)
GO


declare @mytab as dbo.contact

--mit IM


CREATE TYPE Contact AS TABLE
(
	  	ContactID int          NOT NULL,
  	FirstName nvarchar(50) NOT NULL,
  	LastName  nvarchar(50) NOT NULL
)
WITH
(MEMORY_OPTIMIZED = ON
);

GO
