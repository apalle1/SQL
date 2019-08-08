#1

select distinct name
from reviewer, rating 
where mID in (select mID 
		      from movie
		      where title = 'Gone with the Wind') and reviewer.rID = rating.rID;

#2  
  
select name, title, stars
from reviewer, (select distinct rID, stars, movie.mID, title, director
                from movie, rating
                where movie.mID = rating.mID) as A
where reviewer.rID = A.rID and name = director;

#3

select A
from (select name as A
      from reviewer
	  union
      select title as A
	  from movie) as list
order by A; 

#4

select title
from movie
where movie.mID not in (select mID
					    from rating, (select rID
                                     from reviewer
			                         where name = 'Chris Jackson') as A
                        where rating.rID = A.rID);

#5               
               
select distinct Re1.name, Re2.name
from rating R1, rating R2, reviewer Re1, reviewer Re2
where R1.mID = R2.mID and R1.rID = Re1.rID and R2.rID = Re2.rID and Re1.name < Re2.name
order by Re1.name, Re2.name;

#6

select name, title, rating.stars
from movie, reviewer, rating, (select min(stars) as minstars
                               from rating) as A
where stars = minstars and rating.rID = reviewer.rID and rating.mID = movie.mID;                     
 
#7

select title, avg(stars) as avgstars
from movie, rating
where movie.mID = rating.mID
group by title
order by avgstars desc; 

#8

select name 
from (select name, count(stars) as countstars
       from reviewer, rating
	   where reviewer.rID = rating.rID
       group by reviewer.rID) as A
where countstars > 2; 

#9

select title, director
from movie 
where director in (select director 
                   from (select director, count(title) as count
			             from movie
                         group by director) as A 
                   where count > 1)
order by director, title; 

#10

select A1.title, A1.avgstars
from (select movie.mID, title, avg(stars) as avgstars
	  from movie, rating
	  where movie.mID = rating.mID
	  group by movie.mID) as A1, 
	 (select max(avgstars) as max_avgstars
	  from (select movie.mID, title, avg(stars) as avgstars
			from movie, rating
			where movie.mID = rating.mID
			group by movie.mID) as B) as A2
where A1.avgstars = A2.max_avgstars;

#11

select A1.title, A1.avgstars
from (select movie.mID, title, avg(stars) as avgstars
	  from movie, rating
	  where movie.mID = rating.mID
	  group by movie.mID) as A1, 
	 (select min(avgstars) as min_avgstarsf
	  from (select movie.mID, title, avg(stars) as avgstars
			from movie, rating
			where movie.mID = rating.mID
			group by movie.mID) as B) as A2
where A1.avgstars = A2.min_avgstars;


#12

select B.director, B.title, max(maxstars)
from (select A.mID, A.title, A.director, A.maxstars
      from (select movie.mID, title, director, max(stars) as maxstars
            from movie, rating
			where movie.mID = rating.mID
			group by movie.mID) as A
	  where A.director is not null) as B
group by B.director;










 
