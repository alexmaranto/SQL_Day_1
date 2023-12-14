--1. How many actors are there with the last name ‘Wahlberg’? Answer: 2
select * from actor;
select count(last_name) from actor where last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99? Answer: 0
select * from payment;
select count(amount) from payment where amount >= 3.99 and amount <= 5.99;

--3. What film does the store have the most of? (search in inventory) Answer: film_id 350 'Garden Island', there are 8 in stock
select * from inventory;
select film_id, count(*) as number_in_stock
from inventory
group by film_id 
order by number_in_stock desc limit 1;

--4. How many customers have the last name ‘William’? Answer: 0
select * from customer;
select count(last_name) from customer where last_name like 'William';

--5. What store employee (get the id) sold the most rentals? Answer: staff_id 1, 'Mike'
select * from rental;
select staff_id, count(*) as total_rentals
from rental
group by staff_id
order by total_rentals desc limit 1;

--6. How many different district names are there? Answer: 378 different districts
select * from address;
select count(distinct district) from address;

--7. What film has the most actors in it? (use film_actor table and get film_id) Answer: film_id 508 'Lambs Cincinatti' with 15 actors
select * from film_actor;
select film_id, count(*) as most_actors
from film_actor
group by film_id 
order by most_actors desc limit 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) Answer: 13
select * from customer;
select count(last_name) from customer where last_name like '%__es' and store_id = 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250) Answer: 1257 payment amounts
select * from payment; 
select count(amount)
from payment 
where rental_id > 250 and customer_id >= 380 and customer_id <= 430;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total? Answer: 5 rating categories, PG-13 has the most movies at 224.
select * from film; 
select count(distinct rating) from film;
select rating, count(*) as most_common_rating
from film 
group by rating 
order by most_common_rating desc limit 1;