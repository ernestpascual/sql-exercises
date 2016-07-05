-- insert
CREATE TRIGGER movieActivityInsert
ON Movies
AFTER INSERT
AS
BEGIN
       SET NOCOUNT ON;
       DECLARE @movieID NVARCHAR(255)
       SELECT @movieID = INSERTED.Title FROM inserted
       INSERT INTO movieActivityLog VALUES(@movieID, 'Inserted')
END

INSERT INTO Movies(Title, Distributor, Director) values ('JuliAo', 'Universal','Me')
select * from movieActivityLog


--update
CREATE TRIGGER movieActivityUpdate
ON Movies
AFTER UPDATE
AS
BEGIN
       SET NOCOUNT ON;
       DECLARE @Movie NVARCHAR(255)
       DECLARE @Action VARCHAR(50) 
       SELECT @Movie = INSERTED.Title FROM INSERTED
       


--delete
CREATE TRIGGER movieActivityDelete
ON Movies
AFTER DELETE
AS
BEGIN
       SET NOCOUNT ON; 
       DECLARE @Movies NVARCHAR(255) 
       SELECT @Movies = DELETED.Title  FROM DELETED
 
       INSERT INTO movieActivityLog  VALUES(@Movies, 'DELETED')
END

delete from Movies 
where director = 'You'

select * from movieActivityLog



       IF UPDATE(Title)
         BEGIN
				SET @Action = 'Updated the Title'
         END

       IF UPDATE(Distributor)
          BEGIN
            	SET @Action = 'Updated the Distributor'
           END

		IF UPDATE(Director)
         BEGIN
				SET @Action = 'Updated the Director'
         END

       IF UPDATE([MPAA Rating])
          BEGIN
            	SET @Action = 'Updated the MPAA Rating'
           END

		IF UPDATE([Critics Rating])
         BEGIN
				SET @Action = 'Updated the Critics Rating'
         END

       IF UPDATE([Users RT Rating])
          BEGIN
            	SET @Action = 'Updated the Users RT Rating'
           END

		IF UPDATE([Users IMDB Rating])
			BEGIN
					SET @Action = 'Updated the Users IMDB Rating'
		   END

       IF UPDATE([Release Date])
          BEGIN
            	SET @Action = 'Updated the Release Date'
           END


 	IF UPDATE([RunTime])
		BEGIN
			SET @Action = 'Updated the Run Time'
	     END

     IF UPDATE([ProductionBudget])
          BEGIN
            	SET @Action = 'Updated the Production Budget'
           END
	IF UPDATE([Domestic Gross])
		BEGIN
			SET @Action = 'Updated the Domestic Gross'
	     END

     IF UPDATE([Foreign Gross])
          BEGIN
            	SET @Action = 'Updated the Foreign Gross'
           END

	IF UPDATE([WorldWide Gross])
		BEGIN
			SET @Action = 'Updated the Worldwide Gross'
	     END

     IF UPDATE([Opening Weekend Gross])
          BEGIN
            	SET @Action = 'Updated the Opening Weekend Gross'
           END

	IF UPDATE([OW Theater Count])
		BEGIN
			SET @Action = 'Updated the OW Theater Count'
	     END

     IF UPDATE([Widest Release Theater Count])
          BEGIN
            	SET @Action = 'Updated the Widest Release Theater Count'
           END
	  IF UPDATE([DaysInRelease])
          BEGIN
            	SET @Action = 'Updated the Days In Release'
           END
           
       INSERT INTO movieActivityLog VALUES(@Movie, @Action) 
END

update Movies
set Director ='You'
WHERE Director ='Me'

select * from movieActivityLog

--