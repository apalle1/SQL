use social;


#Highschooler ( ID, name, grade ) 
#English: There is a high school student with unique ID and a given first name in a certain grade. 

#Friend ( ID1, ID2 ) 
#English: The student with ID1 is friends with the student with ID2. Friendship is mutual, so if (123, 456) is in the Friend table, so is (456, 123). 

#Likes ( ID1, ID2 ) 
#English: The student with ID1 likes the student with ID2. Liking someone is not necessarily mutual, so if (123, 456) is in the Likes table, there is no guarantee that (456, 123) is also present.

#1 
select name
from highschooler
where ID in (select friend.ID2
             from friend, (select id
                           from highschooler
                           where name = 'Gabriel') as A
             where friend.ID1 = A.id);
             
 


#2

select Name1, Grade1, Name2, Grade2
from (select likes.ID1, likes.ID2, H1.name as Name1, H2.name as Name2, H1.grade as Grade1, H2.grade as Grade2, (H1.grade - H2.grade) as dif
      from likes, highschooler H1, highschooler H2
	  where likes.ID1 = H1.ID and likes.ID2 = H2.ID) as A
where dif > 1;

#3

select H1.name as Name1, H1.grade as Grade1, H2.name as Name2, H2.grade as Grade2
from likes L1, likes L2, highschooler H1, highschooler H2
where L1.ID1 = L2.ID2 and L1.ID2 = L2.ID1 and L1.ID1 = H1.ID and L1.ID2 = H2.ID and H1.name < H2.name;

#4

select name, grade
from highschooler
where ID not in (select ID1 as ID
                 from likes
                 union
                 select ID2 as ID
                 from likes);
 
#5

select H1.name as Name1, H1.grade as Grade1, H2.name as Name2, H2.grade as Grade2
from (select L1.ID1, L1.ID2
      from likes L1
	  where L1.ID2 not in (select ID1
					       from likes)) as A, highschooler H1, highschooler H2
where A.ID1 = H1.ID and A.ID2 = H2.ID;


#6
#Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. 


select name, grade
from Highschooler
where ID not in (
  select ID1 
  from friend, highschooler H1, highschooler H2
  where friend.ID1 = H1.ID and friend.ID2 = H2.ID and H1.grade <> H2.grade)
order by grade, name;

#7

select distinct H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade
from Highschooler H1, Likes, Highschooler H2, Highschooler H3, Friend F1, Friend F2
where H1.ID = Likes.ID1 and H2.ID = Likes.ID2 and
  H2.ID not in (select ID2 from Friend where ID1 = H1.ID) and
  H1.ID = F1.ID1 and H3.ID = F1.ID2 and
  H3.ID = F2.ID1 and H2.ID = F2.ID2;

#8
select count(*) - count(distinct name)
from Highschooler;

#9

select name, grade
from highschooler 
where ID in (select ID2
			 from (select ID2, count(ID1) as count
                   from likes 
                   group by ID2) as A
             where count > 1);







