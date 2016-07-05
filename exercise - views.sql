--- v1InnerJoin
create view v1InnerJoin
AS
select B.myTitle, B.MyGenre, A.Director, C.Writer  FROM Movies A
INNER JOIN dbo.getGenres('Animation') B ON A.Title = B.MyTitle
INNER JOIN MovieWriters C ON C.Title = A.Title

select * from v1InnerJoin

--- v2LeftJoin
create view v2LeftJoin
AS
select B.myTitle, B.MyGenre, A.Director, C.Writer  FROM Movies A
LEFT JOIN dbo.getGenres('Animation') B ON A.Title = B.MyTitle
LEFT JOIN MovieWriters C ON C.Title = A.Title

select * from v2LeftJoin

--- v3RightJoin
create view v3RightJoin
AS
select B.myTitle, B.MyGenre, A.Director, C.Writer  FROM Movies A
RIGHT JOIN dbo.getGenres('Animation') B ON A.Title = B.MyTitle
RIGHT JOIN MovieWriters C ON C.Title = A.Title

select * from v3RightJoin

--- v4FullJoin
create view v4FullJoin
AS
select B.myTitle, B.MyGenre, A.Director, C.Writer  FROM Movies A
FULL JOIN dbo.getGenres('Animation') B ON A.Title = B.MyTitle
FULL JOIN MovieWriters C ON C.Title = A.Title

select * from v4FullJoin

--- function 
create function getGenres
(
	@genre NVARCHAR(10)
) RETURNS @MyGenre TABLE (
		myTitle NVARCHAR(100),
		myGenre NVARCHAR(50)
		)
as
begin
	INSERT @MyGenre
	SELECT Title, Genre from MovieGenres
	WHERE Genre = @genre
return
end

select * from dbo.getGenres('Animation')


