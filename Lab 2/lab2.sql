Q1
select name from actors where birthyear < 1960;

Q2
select * from actors
left join
movieroles on actors.actorid = movieroles.actorid
where movieroles.role is not NULL and actors.actorid between 4 and 8;

Q3
select name from actors
where exists (select * from movieroles 
where actors.actorid = movieroles.actorid and 
movieroles.actorid between 4 and 8);

Q4
select reviews.movieid from reviews 
join
imdb on reviews.movieid = imdb.movieid
where reviews.rating > 7.5 and imdb.imdb_rating > 7.5;

-- select movieid from reviews 
-- where rating > 7.5 and exists 
-- (select * from imdb where imdb.imdb_rating > 7.5 and reviews.movieid = imdb.movieid);

Q5
select movies.title from movies
join
reviews on movies.movieid = reviews.movieid
where reviews.review_text ~ movies.title;
--where position (movies.title in reviews.review_text)>0;

Q6
select actors.name, movies.director from movies
join
movieroles on movies.movieid = movieroles.movieid
join 
actors on movieroles.actorid = actors.actorid 
where movies.director in 
(select movies.director from movies 
join
movieroles on movies.movieid = movieroles.movieid 
group by movies.director having count(movies.director)>1);

-- select actors.name, movies.director from movies
-- join
-- movieroles on movies.movieid = movieroles.movieid
-- join 
-- actors on movieroles.actorid = actors.actorid
-- where movieroles.movieid in (select movieid from movieroles group by movieid having count(movieid)>1);

Q7
select actors.name, movies.title from actors
join
movieroles on movieroles.actorid = actors.actorid
join
movies on movieroles.movieid = movies.movieid
where movieroles.role = actors.name;

Q8
select genre from movies where title = 'Sherlock Holmes: A Game of Shadows';
select title from movies where genre ~ 'Action' or genre ~ 'Adventure' or genre ~ 'Crime';

--select split_part (genre::TEXT,',',1) from movies;

Q9
select title from movies where genre ~ 'Horror' and genre ~ 'Comedy';

Q10
select name from actors where name ~ ' H';
--select name from actors where position ('H' in split_part(name, ' ', 2)) = 1;

Q11
select name from actors
join
movieroles on movieroles.actorid = actors.actorid
join
movies on movies.movieid = movieroles.movieid
where movies.title = 'The Terminator';

Q12
select title from movies
join 
imdb on imdb.movieid = movies.movieid
order by imdb.imdb_rating;

Q13
select role from movieroles
where movieid in 
(select movieroles.movieid from movieroles 
join 
movies on movies.movieid = movieroles.movieid
join
actors on actors.actorid = movieroles.actorid
where movies.year < 2000 and actors.gender = 'Male')
order by movieroles.role;





