use social;

#For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C. 

select H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade
from likes L1, likes L2, highschooler H1, highschooler H2, highschooler H3
where L1.ID2 = L2.ID1 and L1.ID1 <> L2.ID2 and L1.ID1 = H1.ID and L1.ID2 = H2.ID and L2.ID2 = H3.ID;


#Find those students for whom all of their friends are in different grades from themselves. Return the students' names and grades. 

select name, grade
from highschooler 
where ID not in (select distinct ID1
                 from friend, highschooler H1, highschooler H2
				 where friend.ID1 = H1.ID and friend.ID2 = H2.ID and H2.grade = H1.grade) ;

#What is the average number of friends per student? (Your result should be just one number.) 

select avg(num_friends)
from (select ID1, Count(ID2) as num_friends
      from friend
      group by ID1) as A;
      
#Find the number of students who are either friends with Cassandra or are friends of friends of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend. 
select count(id2) 
from friend 
where id1 in (select id2 
              from friend
			  where id1 in (select id from highschooler where name='Cassandra'))
      and id1 not in (select id from highschooler where name='Cassandra');

#Find the name and grade of the student(s) with the greatest number of friends. 
select H.name, H.grade 
from friend F, highschooler H 
where F.ID1 = H.ID 
group by F.ID1 
having count(F.ID2) >= (select max(num_friends)                         
					   from (select Count(ID2) as num_friends
	                         from friend
	                         group by ID1) as B);
