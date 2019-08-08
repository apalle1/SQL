use modifymovie;
SET SQL_SAFE_UPDATES = 0;

#1
insert into reviewer values (209, 'Roger Ebert');

#Insert 5-star ratings by James Cameron for all movies in the database. Leave the review date as NULL. 

insert into rating 
select rid, mid, 5, null
from reviewer, movie
where name='James Cameron';

#For all movies that have an average rating of 4 stars or higher, add 25 to the release year. (Update the existing tuples; don't insert new tuples.) 

update movie
set year = year + 25
where mid in (select mid 
              from rating 
              group by mid 
              having avg(stars) >=4);

#Remove all ratings where the movie's year is before 1970 or after 2000, and the rating is fewer than 4 stars. 

delete from rating
where mID in (select mID from movie where year <1970 or year > 2000)
and stars < 4;
