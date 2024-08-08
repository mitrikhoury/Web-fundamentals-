use sakila;
-- 1. What query would you run to get all the customers inside city_id = 312?
--  Your query should return customer first name, last name, email, and address.
select c.first_name ,
c.last_name,
c.email,
a.address
from customer c
join address a on a.address_id = c.address_id
join city ci on ci.city_id = a.city_id
where ci.city_id=312;
-- 2) What query would you run to get all comedy films? 
-- Your query should return film title, description, release year,
--  rating, special features, and genre (category).

select f.title,
f.description,
f.release_year,
f.rating,
f.special_features,
c.name as category
from film f
join film_category fc on  fc.film_id= f.film_id
join category c on c.category_id = fc.category_id;


-- 3. What query would you run to get all the films joined by actor_id=5?
--  Your query should return the actor id, actor name, film title, description,
--  and release year.  ,,, join with film table ,, film actor , and ator table .... 

select ac.actor_id,
concat(ac.first_name ,'   ' , ac.last_name ) as Actor_name ,
f.title,
f.description,
f.release_year
from film f
join film_actor fc on  fc.film_id= f.film_id
join actor ac on ac.actor_id = fc.actor_id
where ac.actor_id =5;
-- 4. What query would you run to get all the customers in 
-- store_id = 1 and inside these cities (1, 42, 312 and 459)? 
-- Your query should return customer first name, last name, email, and address.

SELECT customer.first_name, 
customer.last_name, 
customer.email, 
address.address
from customer
join address on customer.address_id = address.address_id
where customer.store_id = 1
and address.city_id IN (1, 42, 312, 459);

--  5. What query would you run to get all the films with a "rating = G" and "
-- special feature = behind the scenes", 
-- joined by actor_id = 15? Your query should return the film title, description,
--  release year, rating, and special feature.
--  Hint: You may use LIKE function in getting the 'behind the scenes' part.

SELECT film.title, 
film.description, 
film.release_year, 
film.rating, 
film.special_features
from film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.rating = 'G'
and film.special_features LIKE '%behind the scenes%'
and film_actor.actor_id = 15;

--  6. What query would you run to get all the actors that joined in the film_id = 369?
--  Your query should return the film_id, title, actor_id, and actor_name.


SELECT f.film_id, 
f.title, 
actor.actor_id, 
CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name
from film f
JOIN film_actor fc ON f.film_id = fc.film_id
JOIN actor ON fc.actor_id = actor.actor_id
WHERE f.film_id = 369;

--  7. What query would you run to get all drama films with a rental rate of 2.99? 
-- Your query should return film title, description, release year,
--  rating, special features, and genre (category).

SELECT f.title, 
f.description, 
f.release_year, 
f.rating, 
f.special_features, 
category.name AS genre
from film f
JOIN film_category ON f.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Drama'
AND f.rental_rate = 2.99;


--  8. What query would you run to get all the action films which are joined by SANDRA KILMER?
--  Your query should return film title, description, 
-- release year, rating, special features, genre (category),and actor's first name and last name.


SELECT film.title, 
film.description, 
film.release_year, 
film.rating, 
film.special_features, 
category.name AS genre, 
actor.first_name, 
actor.last_name
from film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'Action'
AND actor.first_name = 'Sandra'
AND actor.last_name = 'Kilmer';
