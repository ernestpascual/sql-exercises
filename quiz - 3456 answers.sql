/* Create a view(view_LOWESTRatedMovies) that will list the year of the release, title and IMDB rating of the lowest rated movie
 (IMDB rating less than 5 )for each years in the period 1995-present, inclusive, in ascending year order */
create view view_LOWESTRatedMovies
AS
 select Title, [Users IMDB Rating], Year([Release Date]) as 'Release Date' from Movies
 where YEAR([Release Date]) >= 1995 AND [Users IMDB Rating] < 5

 select * from view_LOWESTRatedMovies
 order by [Release Date] ASC

 /* Create a view(view_HIGHESTRatedMovies) that will list the year of the release, title and IMDB rating of the highest rated movie
 (IMDB rating greater than 6 )for each years in the period 1995-present, inclusive, in ascending year order. */

create view view_HIGHESTRatedMovies
AS
 select Title, [Users IMDB Rating], Year([Release Date]) as 'Release Date' from Movies
 where YEAR([Release Date]) >= 1995 AND [Users IMDB Rating] > 6

 select * from view_HIGHESTRatedMovies
 order by [Release Date] ASC

 
/* Print the combined output (movie year, title and rating), for both the lowest (view_LOWESTRatedMovies) 
and highest rated movies (view_HIGHESTRatedMovies) per year from 1995 to present,
 in ascending year order. As before, break ties by printing them in ascending alpha order on the title. */

select * from view_LOWESTRatedMovies
UNION 
select * from view_HIGHESTRatedMovies
order by Title ASC

/* Create a stored procedure (usp_DisplayActorsInFloppedMovie) that will display the name of the actor(s)
 that is in the movies that flops (less than or equal to 8). The movie list is in a view (view_FloppedMovie)
 that is matched in the actors table. Display the actor(s) name and the movie title in ascending order */

 create procedure usp_DisplayActorsInFloppedMovie
 as
 select * from flopMovie
 order by Title ASC

exec usp_DisplayActorsInFloppedMovie


create view flopMovie 
 as
 select A.Title, B.Actor from Movies A
 inner join MovieActors B on A.Title = B.Title
 where A.Title = B.Title AND A.[Users IMDB Rating] <= 8


