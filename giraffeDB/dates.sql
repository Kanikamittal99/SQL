use demo_mysql;

drop table dates;

create table dates(
id int primary key auto_increment,
day varchar(2) not null,
month varchar(10) not null,
year varchar(4) not null
);

truncate table dates;
select * from dates;

insert into dates(day,month,year) values('29','January','2011'),
('30','January','2011'),
('30','January','2011'),
('14','February','2017'),
('14','February','2018'),
('23','March','2018'),
('23','March','2018'),
('23','March','2019'),
('29','October','2019'),
('29','November','2019'),
('12','November','2017'),
('17','August','2018'),
('05','June','2016');

select * from dates order by year;

# DISPLAY DUPLICATE ROWS
select day, count(day), month, count(month), year, count(year)
from dates
group by day, month, year
having count(day) > 1 and count(month) > 1 and count(year) > 1;

# Removing duplicate rows
# option 1 : Using INNER JOIN
SET SQL_SAFE_UPDATES=0;
delete t1 from dates t1 inner join dates t2 
where t1.id < t2.id and 
t1.day = t2.day and 
t1.month = t2.month AND
t1.year = t2.year;
SET SQL_SAFE_UPDATES=1;

# option2: create an intermediate table - transfer only unique rows to it
create table copy_of_dates select distinct id, day, month, year from dates;
select * from copy_of_dates;
drop table dates;
alter table copy_of_dates rename to dates;

# option 3 : Using ROW_NUMBER()
delete from dates where id in(
select id from(
select *,row_number() over(partition by day,month,year order by day,month,year) as rowNum from dates order by id) as temp_table
where rowNum > 1
);

