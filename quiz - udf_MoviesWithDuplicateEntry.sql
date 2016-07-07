create function udf_MoviesWithDuplicateEntry()
returns @MovieDuplicatesTable table(
	title NVARCHAR(100),
	[# of Copies] int
	)
as
begin
insert @MovieDuplicatesTable
SELECT Title, COUNT(Title) 
FROM Movies
group by Title
return 
end

select * from udf_MoviesWithDuplicateEntry()


