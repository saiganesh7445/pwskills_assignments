use sakila;
show tables;

-- 1. Retrieve the total number of rentals made in the Sakila database.

SELECT * FROM rental;

SELECT COUNT(rental_id) AS total_rentals FROM rental;

-- 2. Find the average rental duration (in days) of movies rented from the Sakila database.

SELECT * FROM film;

SELECT AVG(rental_duration) AS days FROM film;
    
-- 3. Display the first name and last name of customers in uppercase.
 select * from  customer;
    
 select upper(first_name), lower(last_name) from customer;
-- it is already in upper_case so making as diffrence i did it for one upper and one is lower.
	
    -- 4.Extract the month from the rental date and display it alongside the rental ID.
    select * from rental;
    select rental_id, month(rental_date) as Month from rental;
   
   
   -- Group by
   -- 5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
    select * from payment;
    select  customer_id,count(rental_id) from rental group by(customer_id);

    -- 6. Find the total revenue generated by each store.
    show tables;
    select*from sales_by_store;
    desc customer;
    -- 6. Find the total revenue generated by each store.
select store.store_id,
       concat(staff.first_name,' ', staff.last_name) as store_manager,
       sum(payment.amount)as total_renvenue
from
    store-- 
join
   staff on store.manager_staff_id = staff.staff_id
join				
   customer on sote.store_id = customer.store_id4
join 
    payment on customer.customer_id = payment.customer_id
group by 
    store.store_id, store.manager_staff_id, staff.first_name, staff.last_name
order by 
    total_revenue desc;
   
   -- JOINS 
-- 7. Display the title of the movie, customer's first name, and last name who rented it. 
    
    select * from film;
    select * from inventory;
    select * from rental;
    select * from customer;
    
select title, concat(first_name, " ", last_name)as customer_name from film
 join inventory on  film.film_id = inventory.film_id
 join rental on inventory.inventory_id = rental.inventory_id
 join customer on rental.rental_id = customer.customer_id;

-- 8.retrive the names of all acotrs who have appeared in the film "Gone with the wind"    
 SELECT 
    first_name, last_name, title
FROM
    actor
        INNER JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN
    film ON film.film_id = film_actor.film_id
WHERE
    title LIKE 'Gone with the Wind';


--  Group by
 -- 1. Determine the total number of rentals for each category of movies.
  SELECT 
    COUNT(rental_id) AS Total_no_of_rentals, name
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film_category ON film_category.film_id = inventory.film_id
        JOIN
    category ON category.category_id = film_category.category_id
GROUP BY name
ORDER BY Total_no_of_rentals DESC;

 -- 2. find the average rental rate of movies in each language. 
  
select language_id, name, avg(rental_rate) as rental_avg  from film 
join
language on film.language_id = language.language_id
group by name;



-- joins
-- 3.retrieve the customer names along with the total amount they've spent on rentals. 
 /*select * from customer;
 select * from payment;
select * from rental;*/
 
 select concat(frist_name, ' ' , last_name) as customer_name, sum(amount) as total_amount from customer
 join rental on 
rental.customer_id = customer.cusotmer_id 
 join payment on 
 customer.customer_id = payment.customer_id group by customer.cusotmer_id;
 
 
 -- question4. list the titles of movies rented by each customer in a particular city (e.g., 'London'). 
 select * from film;
 select * from address;
 select * from city;
 select * from customer;
 
 select customer, title, city from film
 join
 address on address.city_id = address.city_id
 join 
 city on address.city_id = city.city_id
 
 -- Advanced Joins and GROUP BY:
 -- 1.Display the top 5 rented movies along with the number of times they've been rented. 
  SELECT 
    COUNT(rental.customer_id) AS Num_of_times,
    title AS Rented_movies
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
GROUP BY title
ORDER BY Num_of_times DESC
LIMIT 5;

-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). 
select * from customer;
 select * from rental;
 select * from inventory;
 
 select concat(first_name, last_name)as name from customer 
  join
 rental on customer.rental_id = customer.rental_id
  join
 film on inventory.film_id = film.film_id
 join
 store on inventory.store_id = store.store_id
 WHERE store.store_id in (1,2)
    GROUP BY customer.customer_id
    HAVING COUNT(DISTINCT store.store_id) = 2;
 

 
 