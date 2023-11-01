-- CREATE DATABASE, TABLES, TRIGGERS, STORED PROCEDURES, FUNCTIONS, INDEX
-- Execute all to create/ refresh DB with empty tables

-- Create Database BAODIENTU if not exist
IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'BAODIENTU') 
	CREATE DATABASE BAODIENTU
GO

USE BAODIENTU
GO

-- Drop all tables and create again
-- try several times until all tables are deleted
DECLARE @Count INT = 0
WHILE (@Count < 3)
BEGIN
	PRINT 'Undeleted:'
	EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
	SET @Count +=1
END 
GO 

-- CREATE TABLE
CREATE TABLE GUEST
(
    Guest_ID INT PRIMARY KEY IDENTITY,  
    Guest_Name NVARCHAR(20) NOT NULL,
	Guest_BD DATE NOT NULL
)
GO

CREATE TABLE REPORTER
(
    Rept_ID INT PRIMARY KEY IDENTITY, 
    Rept_Name NVARCHAR(20) NOT NULL,
	Rept_Phone NVARCHAR(11) NOT NULL
)
GO

CREATE TABLE EDITOR
(
    Edt_ID INT PRIMARY KEY IDENTITY, 
    Edt_Name NVARCHAR(20) NOT NULL,
	Edt_Phone NVARCHAR(11) NOT NULL,
)
GO

CREATE TABLE GENRE
(
	Genre_ID INT PRIMARY KEY,
    Genre_Name NVARCHAR(20)
)
GO

CREATE TABLE PRIVTYPE
(
    Priv_ID INT PRIMARY KEY, 
	Priv_Detail NVARCHAR(20) NOT NULL
)
GO

CREATE TABLE ARTICLE
(
    Art_ID INT PRIMARY KEY IDENTITY, 
    Art_Title NVARCHAR(100) NOT NULL,
	Art_Sum NVARCHAR(300) NOT NULL,
	Art_Main NVARCHAR(MAX) NOT NULL,
	Art_Status BIT, -- NULL: hidden, waiting publish; 0: deleted; 1: published/visible
	Rept_ID INT FOREIGN KEY REFERENCES dbo.REPORTER(Rept_ID) NOT NULL,
	Genre_ID INT FOREIGN KEY REFERENCES dbo.GENRE(Genre_ID)
)
GO

CREATE TABLE PHOTO
(
    Art_ID INT FOREIGN KEY REFERENCES dbo.ARTICLE(Art_ID),
	Photo_ID INT NOT NULL,
	Photo_Bitmap VARBINARY(MAX),
	PRIMARY KEY (Art_ID, Photo_ID)
)
GO

CREATE TABLE COMMENT
(
    Cmt_Time DATETIME DEFAULT GETUTCDATE(), 
	Guest_ID INT FOREIGN KEY REFERENCES dbo.GUEST(Guest_ID),
    Art_ID INT FOREIGN KEY REFERENCES dbo.ARTICLE(Art_ID),
	Cmt_Text NVARCHAR(100) NOT NULL,
	PRIMARY KEY (Cmt_Time, Guest_ID, Art_ID)
)
GO

CREATE TABLE PRIVILEGE
(
    Rept_ID INT FOREIGN KEY REFERENCES dbo.REPORTER(Rept_ID) NOT NULL,
    Priv_ID INT FOREIGN KEY REFERENCES dbo.PRIVTYPE(Priv_ID) NOT NULL,
	PRIMARY KEY (Rept_ID, Priv_ID)
)
GO

CREATE TABLE PRIVCHANGES
(
	PrivChg_Time DATETIME DEFAULT GETUTCDATE(),
    Rept_ID INT FOREIGN KEY REFERENCES dbo.REPORTER(Rept_ID) NOT NULL,
    Priv_ID INT FOREIGN KEY REFERENCES dbo.PRIVTYPE(Priv_ID) NOT NULL,
	PrivChg_Detail BIT NOT NULL, -- 0: delete; 1: add
	PrivChg_Reason NVARCHAR(100),
	Edt_ID INT FOREIGN KEY REFERENCES dbo.EDITOR(Edt_ID) NOT NULL,
	PRIMARY KEY (PrivChg_Time, Rept_ID, Priv_ID)
)
GO

CREATE TABLE PUBLICATION
(
	Request_Time DATETIME DEFAULT GETUTCDATE(),
    Art_ID INT FOREIGN KEY REFERENCES dbo.ARTICLE(Art_ID),
    Public_Time DATETIME,
	Deny_Reason NVARCHAR(100),
	Edt_ID INT FOREIGN KEY REFERENCES dbo.EDITOR(Edt_ID),
	PRIMARY KEY (Request_Time, Art_ID),
	CONSTRAINT CHK_PublicTime CHECK (Public_Time >= Request_Time),
	CONSTRAINT CHK_Editor CHECK ((Edt_ID IS NOT NULL AND (Public_Time IS NOT NULL OR Deny_Reason IS NOT NULL)) 
		OR (Edt_ID IS NULL AND Public_Time IS NULL AND Deny_Reason IS NULL))
)
GO

CREATE TABLE DELETION
(
	Del_Time DATETIME DEFAULT GETUTCDATE(),
    Art_ID INT FOREIGN KEY REFERENCES dbo.ARTICLE(Art_ID),
	Del_Reason NVARCHAR(100) NOT NULL,
	Edt_ID INT FOREIGN KEY REFERENCES dbo.EDITOR(Edt_ID) NOT NULL,
	PRIMARY KEY (Del_Time, Art_ID)
)
GO

CREATE TABLE EDITION
(
	Edit_Time DATETIME DEFAULT GETUTCDATE(),
    Art_ID INT FOREIGN KEY REFERENCES dbo.ARTICLE(Art_ID),
	Edit_Detail NVARCHAR(100) NOT NULL,
	Edt_ID INT FOREIGN KEY REFERENCES dbo.EDITOR(Edt_ID) NOT NULL,
	PRIMARY KEY (Edit_Time, Art_ID)
)
GO

-- TRIGGER //////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- add row Photo
-- trigger: auto generate Photo_ID: increment independently for each individual Art_ID (Eg: 1.1, 1.2, 1.3, 2.1, 2.2, 2.3)
CREATE OR ALTER TRIGGER tg_Insert_Photo
ON dbo.PHOTO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Art_ID INT = (SELECT Art_ID FROM Inserted)	
	DECLARE @Photo_ID INT = (SELECT MAX(Photo_ID) FROM dbo.PHOTO WHERE Art_ID = @Art_ID)	
	DECLARE @Photo_Bitmap VARBINARY(MAX) = (SELECT Photo_Bitmap FROM Inserted)

	IF (@Photo_ID IS NULL) SET @Photo_ID = 1
	ELSE SET @Photo_ID += 1;

	INSERT dbo.PHOTO VALUES(@Art_ID, @Photo_ID, @Photo_Bitmap)
END
GO

-- trigger: update Art_Status to '0' when add row Deletion tbl
CREATE OR ALTER TRIGGER tg_Insert_Deletion
ON dbo.DELETION
FOR INSERT
AS
BEGIN
	DECLARE @Art_ID INT = (SELECT Art_ID FROM Inserted)	
	UPDATE dbo.ARTICLE 
	SET Art_Status = 0 
	WHERE Art_ID = @Art_ID	
END
GO

-- trigger: check when insert Edition : only proceed if: article is submitted/ article is not deleted
CREATE OR ALTER TRIGGER tg_CHK_insert_Edition
ON dbo.EDITION
FOR INSERT
AS
BEGIN
	DECLARE @Art_ID INT = (SELECT Art_ID FROM Inserted)	
	IF (SELECT Art_Status FROM dbo.ARTICLE WHERE Art_ID = @Art_ID) = 1
	RETURN

	IF (SELECT Art_Status FROM dbo.ARTICLE WHERE Art_ID = @Art_ID) = 0 -- rollback if article is deleted
	ROLLBACK

	IF EXISTS(	-- rollback if article is not submitted
		SELECT Art_ID FROM dbo.PUBLICATION 
		WHERE Art_ID = @Art_ID)
	RETURN
    ELSE ROLLBACK
END
GO



-- STORED PROCEDURES ////////////////////////////////////////////////////////////////////////////
-- add row: Privilege & PrivChanges

CREATE OR ALTER PROCEDURE sp_add_Priv
    @Rept_ID INT,
    @Priv_ID INT,
	@Edt_ID INT,
	@Add_Reason NVARCHAR(100)
AS
BEGIN
	BEGIN TRAN
		IF (@Priv_ID = 3) -- If add Priv = Void: delete all other Priv
		BEGIN
			DECLARE @TopPriv INT = (SELECT TOP 1 Priv_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID <> 3)	-- first row among those will be deleted
			WHILE (@TopPriv IS NOT NULL)
			BEGIN
				DELETE dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = @TopPriv	-- delete first row
				INSERT dbo.PRIVCHANGES
				VALUES(GETUTCDATE(), @Rept_ID, @TopPriv, 0, 'Delete priv due Void', @Edt_ID) -- insert new record on PrivChanges tbl
				SET @TopPriv = (SELECT TOP 1 Priv_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID) -- Update new first row
			END
		END

		IF (@Priv_ID = 1) -- If add Priv = Active: delete Priv = Suspended OR Void
		BEGIN
			DECLARE @Deleted_Priv INT = (SELECT Priv_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND (Priv_ID = 2 OR Priv_ID = 3))
			IF (@Deleted_Priv IS NOT NULL)
			BEGIN
				DELETE dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = @Deleted_Priv
				INSERT dbo.PRIVCHANGES
				VALUES(GETUTCDATE(), @Rept_ID, @Deleted_Priv, 0, 'Change to Active', @Edt_ID) -- insert new record on PrivChanges tbl
			END
		END

		IF (@Priv_ID = 2) -- If add Priv = Suspended: delete Priv = Active, if Void: do not add Suspended
			BEGIN
				IF EXISTS (SELECT Priv_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = 3) -- Do not add if already Void
					RETURN
				IF EXISTS(SELECT Priv_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = 1) -- Delete Active if already has
				BEGIN
					DELETE dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = 1
					INSERT dbo.PRIVCHANGES
					VALUES(GETUTCDATE(), @Rept_ID, 1, 0, 'Change to Suspended', @Edt_ID) -- insert new record on PrivChanges tbl	
				END
			END

		-- If try to add Priv other than Active/Suspended/ Void
		-- only add if already Active
		IF (@Priv_ID > 3 AND NOT EXISTS (
			SELECT Rept_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = 1))
			RETURN

		WAITFOR DELAY '00:00:00.010'	-- Delay to ensure above operations are recorded with earlier time 

		INSERT dbo.PRIVILEGE	-- insert new Priv
		VALUES
		(   @Rept_ID, -- Rept_ID - int
			@Priv_ID  -- Priv_ID - int
		)

		INSERT dbo.PRIVCHANGES -- add new record PrivChange
		VALUES(GETUTCDATE(), @Rept_ID, @Priv_ID, 1, @Add_Reason, @Edt_ID) 
	COMMIT
END 
GO

-- Procedure: delete row:Privilege tbl/ add row: PrivChanges
CREATE OR ALTER PROCEDURE sp_delete_Priv
    @Rept_ID INT,
    @Priv_ID INT,
	@Edt_ID INT,
	@Delete_Reason NVARCHAR(100) 
AS
BEGIN
	IF (@Priv_ID <= 3) RETURN
	IF NOT EXISTS (SELECT Rept_ID FROM dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = @Priv_ID) RETURN
    DELETE dbo.PRIVILEGE WHERE Rept_ID = @Rept_ID AND Priv_ID = @Priv_ID
	INSERT dbo.PRIVCHANGES
	VALUES(GETUTCDATE(), @Rept_ID, @Priv_ID, 0, @Delete_Reason, @Edt_ID)
END
GO

-- submit article for publication: add row Publication 
CREATE OR ALTER PROCEDURE sp_submit_Publication
	@Art_ID INT
AS
BEGIN
	-- only insert if not yet appear in PUBLICATION tbl
	IF EXISTS (SELECT Art_ID FROM dbo.PUBLICATION WHERE Art_ID = @Art_ID) RETURN
	INSERT dbo.PUBLICATION (Art_ID) VALUES (@Art_ID)
END
GO

-- grant article submitted for publication: update row Publication 
CREATE OR ALTER PROCEDURE sp_grant_Publication
	@Art_ID INT,
	@Public_Time DATETIME,
	@Deny_Reason NVARCHAR(100),
	@Edt_ID INT
AS
BEGIN
	-- only update if not granted in PUBLICATION tbl
	IF EXISTS (SELECT Art_ID FROM dbo.PUBLICATION WHERE Art_ID = @Art_ID AND Edt_ID IS NOT NULL) RETURN
	IF (@Edt_ID IS NULL OR (@Public_Time IS NOT NULL AND @Deny_Reason IS NOT NULL)) RETURN -- cannot allow public & deny at same time
	IF (@Public_Time < (
			SELECT Request_Time FROM dbo.PUBLICATION WHERE Art_ID = @Art_ID)) RETURN -- do not proceed if public time < rq time
	IF (@Public_Time IS NULL AND @Deny_Reason IS NULL) RETURN -- do not proceed if no decision is made

    BEGIN TRAN	-- update Publication tbl/ insert Deletion tbl
		UPDATE dbo.PUBLICATION -- update submitted article
		SET Public_Time = @Public_Time, Deny_Reason = @Deny_Reason, Edt_ID = @Edt_ID
		WHERE Art_ID = @Art_ID

		IF (@Deny_Reason IS NOT NULL)	-- insert Deletion tbl if article is denied
			INSERT dbo.DELETION
			VALUES
			(   GETUTCDATE(), -- Del_Time - datetime
				@Art_ID,         -- Art_ID - int
				@Deny_Reason,       -- Del_Reason - nvarchar(100)
				@Edt_ID          -- Edt_ID - int
			)
	COMMIT
END
GO

-- update Art_Status: Article tbl (of newly published Articles with Public_Time between range of time)
CREATE OR ALTER PROCEDURE sp_set_Article_Status_true
	@Begin_Time DATETIME,
	@End_Time DATETIME
AS
BEGIN	
	UPDATE dbo.ARTICLE SET Art_Status = 1 
	FROM dbo.ARTICLE AR JOIN dbo.PUBLICATION PB
	ON PB.Art_ID = AR.Art_ID 
	WHERE Art_Status IS NULL AND
		Public_Time >= @Begin_Time AND
		Public_Time <= @End_Time
END
GO


-- FUNCTION ////////////////////////////////////////////////////////////////////////////////////////////////////
-- FUNCTION CHECK IF REPORTER IS SUSPENDED
CREATE OR ALTER FUNCTION fc_CHK_Suspended (@Rept_ID INT)
RETURNS BIT
AS
BEGIN
	IF EXISTS (
		SELECT Rept_ID 
		FROM dbo.PRIVILEGE
		WHERE Rept_ID = @Rept_ID AND Priv_ID = 2
	) RETURN 1 -- is suspended
	RETURN 0 -- not suspended
END
GO


-- INDEX //////////////////////////////////////////////////////////////////////////////////////////////
-- most search operation should be searching for articles where Art_Status = 1 and an another criteria

-- -- Index for article art_status for status search
CREATE INDEX IX_Article_Status
ON dbo.ARTICLE(Art_Status)
GO

-- -- Index for article art_title for title search
CREATE INDEX IX_Article_Title
ON dbo.ARTICLE(Art_Status, Art_Title)
GO

-- Index for article art_sum for summary search
CREATE INDEX IX_Article_Sum
ON dbo.ARTICLE(Art_Status, Art_Sum)
GO

-- Index for article genre_id for genre search
CREATE INDEX IX_Article_Genre
ON dbo.ARTICLE(Art_Status, Genre_ID)
GO

-- Index for article rept_id for reporter search
CREATE INDEX IX_Article_Rept
ON dbo.ARTICLE(Art_Status, Rept_ID)
GO

-- Index for publication public_time for publish time search
CREATE INDEX IX_Publication_Time
ON dbo.PUBLICATION(Art_ID, Public_Time)
GO

