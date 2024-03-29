use collegedata;

insert into student values (123, 'Amy', 3.9, 1000);
insert into student values (234, 'Bob', 3.6, 1500);
insert into student values (345, 'Craig', 3.5, 500);
insert into student values (456, 'Doris', 3.9, 1000);
insert into student values (567, 'Edward', 2.9, 2000);
insert into student values (678, 'Fay', 3.8, 200);
insert into student values (789, 'Gary', 3.4, 800);
insert into student values (987, 'Helen', 3.7, 800);
insert into student values (876, 'Irene', 3.9, 400);
insert into student values (765, 'Jay', 2.9, 1500);
insert into student values (654, 'Amy', 3.9, 1000);
insert into student values (543, 'Craig', 3.4, 2000);

insert into college values ('Stanford', 'CA', 15000);
insert into college values ('Berkeley', 'CA', 36000);
insert into college values ('MIT', 'MA', 10000);
insert into college values ('Cornell', 'NY', 21000);

insert into apply values (123, 'Stanford', 'CS', 'Y');
insert into apply values (123, 'Stanford', 'EE', 'N');
insert into apply values (123, 'Berkeley', 'CS', 'Y');
insert into apply values (123, 'Cornell', 'EE', 'Y');
insert into apply values (234, 'Berkeley', 'biology', 'N');
insert into apply values (345, 'MIT', 'bioengineering', 'Y');
insert into apply values (345, 'Cornell', 'bioengineering', 'N');
insert into apply values (345, 'Cornell', 'CS', 'Y');
insert into apply values (345, 'Cornell', 'EE', 'N');
insert into apply values (678, 'Stanford', 'history', 'Y');
insert into apply values (987, 'Stanford', 'CS', 'Y');
insert into apply values (987, 'Berkeley', 'CS', 'Y');
insert into apply values (876, 'Stanford', 'CS', 'N');
insert into apply values (876, 'MIT', 'biology', 'Y');
insert into apply values (876, 'MIT', 'marine biology', 'N');
insert into apply values (765, 'Stanford', 'history', 'Y');
insert into apply values (765, 'Cornell', 'history', 'N');
insert into apply values (765, 'Cornell', 'psychology', 'Y');
insert into apply values (543, 'MIT', 'CS', 'N');
