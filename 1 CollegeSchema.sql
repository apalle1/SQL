use collegedata;

drop table if exists college;
drop table if exists student;
drop table if exists apply;

create table college(cName text, state text, enrollment int);
create table student(sID int, sName text, GPA real, sizeHS int);
create table apply(sID int, cName text, major text, decision text);
