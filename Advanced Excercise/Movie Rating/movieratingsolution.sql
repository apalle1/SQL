use movierating;

select title
from movie
where director = 'Steven Spielberg';

# If a table A has m rows and table B has n rows then after cross product you have m*n rows.
# https://www.tutorialspoint.com/sql/sql-cartesian-joins.htm
# https://www.geeksforgeeks.org/sql-join-cartesian-join-self-join/
# select mID, year, director, rID, name 
# from reviewer, movie;

select distinct year
from movie, rating
where movie.mID = rating.mID and stars >=4
order by year; 

select title
from movie
where mID not in (select distinct mID
			      from rating);

select name
from reviewer, rating
where reviewer.rID = rating.rID and ratingDate is null;

select name, title, stars, ratingDate
from movie, reviewer, rating
where reviewer.rID = rating.rID and rating.mID = movie.mID
order by name, title, stars;

select name, title
from reviewer, movie, (select R1.rID, R1.mID
                       from rating R1, rating R2
                       where R1.rID = R2.rID and R1.mID = R2.mID and R1.stars < R2.stars and R1.ratingDate < R2.ratingDate) as A
where A.rID = reviewer.rID and A.mID = movie.mID;

select title, maxstars
from movie, (select mID, max(stars) as maxstars
             from rating
			 group by mID) as A
where movie.mID = A.mId
order by title;

select title, (maxstars - minstars) as ratingspread
from movie, (select mID, max(stars) as maxstars, min(stars) as minstars
             from rating
             group by mID) as A
where movie.mID = A.mID
order by ratingspread desc, title;

select abs(avg(avg_above1980)-avg(avg_below1980))
from (select movie.mID, avg(stars) as avg_above1980
      from movie, rating
      where movie.mID = rating.mID and year > 1980
	  group by movie.mID) as A, 
      (select movie.mID, avg(stars) as avg_below1980
       from movie, rating
       where movie.mID = rating.mID and year < 1980
       group by movie.mID) as B;












