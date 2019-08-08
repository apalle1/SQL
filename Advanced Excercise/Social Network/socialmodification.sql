use modifysocial;
SET SQL_SAFE_UPDATES = 0;

#It's time for the seniors to graduate. Remove all 12th graders from Highschooler. 
delete from Highschooler
where grade = 12;

#If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.


#For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself.

insert into Friend
select F1.ID1, F2.ID2
from Friend F1, Friend F2
where F1.ID2 = F2.ID1
  -- friends with oneself
  and F2.ID2 <> F1.ID1
  -- already exist friendship
except
select * from friend;                      
				