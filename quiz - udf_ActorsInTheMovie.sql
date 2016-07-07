create function udf_ActorsInTheMovie()
returns @actors table(
	[Movie Title] nvarchar(255),
	Actor nvarchar(255)
	)
begin
insert @actors
select * from MovieActors
return
end


select * from udf_ActorsInTheMovie()
order by [Movie Title] ASC


