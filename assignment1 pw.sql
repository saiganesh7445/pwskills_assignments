-- 1.Identify the primary keys and foreign keys in maven movies db. Discuss the differences /
-- primary keys: is the unique key, we can have only one primary key to acces the whole row of specific details of profile. 
 actor_id
 adddress_id
 advisor_id
 category_id
 country_id
 customer_id
 film_id
 film_categoory_id
-- foreign key: is also  a primary key but here  we can connect two table to decrease the fetching time. and to reduce the size of the table.
city_id
country_id
address_id
st0ore_id
language_id
originallanguage_id


-- 2. List all details of actors
 select * from actor;

-- 3.List all customer information from DB.
select * from customer;


-- 4.List different countries.
select * from country;

-- 5.Display all active customers.
 select * from customer;
 select * from customer WHERE active =1;


-- 6.list of all rental IDs for customer with ID 1. 
Select customer_id, rental_id from payment where customer_id = 1;




-- 7.Display all the films whose rental duration is greater than 5.
select * from film where rental_duration > 5;



-- 8. list  the total number of films whose replacement cost is greater than $15 and less than $20.
select count(*) as total_films from film where replacement_cost > 15 and replacement_cost < 20;


-- 9.Display the count of unique first names of actors.
select * from actor;
select count(first_name) as total_actors from actor;

-- 10. Display the first 10 records from the customer table.
 select * from customer;
 select * from customer where customer_id <=10;
-- OR
 select * from customer where customer_id limit 10;


-- 11. Display the first 3 records from the customer table whose first name starts with ‘b’. 
select * from customer where first_name like 'B%' limit  3;

-- 12 Display the names of the first 5 movies which are rated as ‘G’. 
select * from film where rating like 'G%' limit 5;



-- 13.Find all customers whose first name starts with "a". 
select * from customer where first_name like 'A%';

-- 14. Find all customers whose first name ends with "a".
select * from customer where first_name like '%A';


-- 15.Display the list of first 4 cities which start and end with ‘a’ . 
select * from city where city like 'A%' AND city like '%A';


-- 16.Find all customers whose first name have "NI" in any position.
select * FROM  customer where first_name like '%ni%';


-- 17. Find all customers whose first name have "r" in the second position.
select * from customer where first_name like '_r%';


-- 18.Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from customer where first_name like 'a%' and length(first_name) <> 5;


-- 19.Find all customers whose first name starts with "a" and ends with "o". 
select * from customer where first_name like 'a%' and first_name like '%o';


-- 20.Get the films with pg and pg-13 rating using IN operator. 
select * from film where rating in ('pg' ,'pg-13');


-- 21.Get the films with length between 50 to 100 using between operator.
select * from film where length between 50 and 100;


-- 22. Get the top 50 actors using limit operator.
 select * from actor order by actor_id  limit 50; 
 
 -- 23.Get the distinct film ids from inventory table

select distinct film_id from inventory; 









