create database sqlexam;
use sqlexam;

/*Q1. Write a query where it should contain all the data of the 
movies which were released after 1995 having their movie
duration greater than 120 and should be including A in their
movie title.
[10]*/
select * from movie;
select * from movie
where mov_year>1995 and mov_time>120 and mov_title like "%A%";

/*Q2. Write an SQL query to find the actors who played a role in the 
movie 'Chinatown'. Fetch all the fields of actor table. (Hint: Use 
the IN operator)
[10]*/
select act_id, act_fname, act_lname, act_gender from actor
join cast
using(act_id)
join movie
using(mov_id)
where mov_title in ("chinatown");


/*Q3. Write an SQL query for extracting the data from the ratings 
table for the movie who got the maximum number of ratings.
[10]*/
select * from ratings
where num_o_ratings=
(select max(num_o_ratings) from ratings);


/*Q4. Write an SQL query to determine the Top 7 movies which were 
released in United Kingdom. Sort the data in ascending order 
of the movie year.
[10*/
select * from movie 
where mov_rel_country="UK"
order by mov_year asc
limit 7;

/*Q5. Set the language of movie language as 'Chinese' for the movie 
which has its existing language as Japanese and their movie 
year was 2001.
[10]*/
select * from movie;
update movie
set mov_lang="Chinese"
where mov_lang="Japanese" and mov_year="2001";
/*Q6. Print genre title, maximum movie duration and the count the 
number of movies in each genre.
[10]*/
select * from movie_genres;
select * from movie;
select * from genres;
create view sush as(select * from genres
join movie_genres
using (gen_id)
join movie
using(mov_id));
select * from sush;
select gen_title,max(mov_time),Count(gen_title) from sush
group by gen_title;


/*Q7. Create a view which should contain the first name, last name, 
title of the movie & role played by particular actor.
[10]*/
select * from movie;
select * from actor;
select * from cast;
create view sush1 as (select a.act_fname,a.act_lname,m.mov_title,c.role
from actor as a
join cast as c 
using(act_id)
join movie as m
using(mov_id));
select * from sush1;

/*Q8. Display the movies that were released before 31st March 1995. [10]
Exam on SQL*/
select * from movie;
select str_to_date(mov_dt_rel,"%y-%m-%d") from movie;

alter table movie modify mov_dt_rel date ;

select * from movie
where mov_dt_rel < 1995-03-31 ;
delete from movie
where mov_dt_rel=" ";
/*Q9. Write a query which fetch the first name, last name & role 
played by the actor where output should all exclude Male 
actors.
[10]*/
select * from actor;
select * from cast;
select * from actor
join cast
using(act_id)
where act_gender not in("M");
/*Q10. Insert five rows into the cast table where the ids for movie 
should be 936,939,942,930,941 and their respective roles 
should be Darth Vader, Sarah Connor, Ethan Hunt, Travis 
Bickle, Antoine Doinel & their actor ids should be set up as 
126,140,135,131,144.*/
select * from cast;
insert into cast (act_id,mov_id,role)
values (126,936,"Darth Vader"),
(140,939,"Sarah Connor"),
(135,942,"Ethan Hunt"),
(131,930,"Travis Bickle"),
(144,941,"Antonie Doinel");


