SELECT first_name,last_name
FROM actor;

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS `Actor Name`
FROM actor;

SELECT actor_id, first_name,last_name
FROM actor
WHERE first_name ='joe';

SELECT actor_id, first_name,last_name
FROM actor
WHERE last_name like '%GEN%';

SELECT actor_id, last_name,first_name
FROM actor
Where last_name like '%LI%';

SELECT country_id, country
FROM country
Where country IN ('Afghanistan', 'Bangladesh', 'China');

Alter Table actor
ADD COLUMN middle_name VARCHAR(45) NULL AFTER first_name;

ALTER TABLE actor
DROP COLUMN description;

SELECT last_name, count(*) as 'num of actors' 
FROM actor
group by last_name;

SELECT last_name, COUNT(*) AS 'Number of Actors' 
FROM actor 
GROUP BY last_name 
HAVING count(*) >=2;

UPDATE actor
SET first_name ='Harpo'
WHERE First_name = "Groucho" AND last_name = "Williams";


UPDATE actor
SET first_name ='Groucho'
WHERE actor_id = 172;

DESCRIBE sakila.address;

SELECT first_name,last_name, address
FROM staff s JOIN address a
ON s.address_id = a.address_id; 

SELECT payment.staff_id,staff.first_name,staff.last_name,payment.amount,payment.payment_date
FROM staff inner join payment
ON staff.staff_id = payment.staff_id AND payment.payment_date like '2005-08%';

SELECT title, count(film_actor) AS number_of_actors
FROM film f inner join film_actor fa
ON f.film_id = fa.film_id
group by title;

SELECT title, count(inventory_id) as number_of_copies
FROM film inner join inventory 
on film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossibl';

SELECT first_name, last_name, sum(amount) AS total_paid
FROM customer join payment 
on customer.customer_id = payment.customer_id
group by payment.customer_id
order by last_name ASC;

SELECT title from film 
Where language_id IN 	
    (SELECT language_id 
	FROM language
	WHERE name = "English" )
AND (title LIKE "K%") OR (title LIKE "Q%");

SELECT last_name, first_name
FROM actor 
WHERE actor_id IN 
	  (select actor_id from film_actor
      where film_id in 
            (SELECT film_id FROM film
		WHERE title = "Alone Trip"));

SELECT cus.first_name, cus.last_name, cus.email 
FROM customer cus
JOIN address a 
ON (cus.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id)
WHERE country.country= 'Canada';

SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id IN (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    name = 'Family'));

SELECT film.title, COUNT(*) AS 'rent_count'
FROM
    film,
    inventory,
    rental
WHERE film.film_id = inventory.film_id
        AND rental.inventory_id = inventory.inventory_id
GROUP BY inventory.film_id
ORDER BY COUNT(*) DESC, film.title ASC;



SELECT 
    store.store_id, SUM(amount) AS revenue
FROM
    store
        INNER JOIN
    staff ON store.store_id = staff.store_id
        INNER JOIN
    payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id;

SELECT 
    store.store_id, city.city, country.country
FROM
    store
        INNER JOIN
    address ON store.address_id = address.address_id
        INNER JOIN
    city ON address.city_id = city.city_id
        INNER JOIN
    country ON city.country_id = country.country_id

SELECT name, SUM(p.amount) AS gross_revenue
FROM
    category c
        INNER JOIN
    film_category fc ON fc.category_id = c.category_id
        INNER JOIN
    inventory i ON i.film_id = fc.film_id
        INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
        RIGHT JOIN
    payment p ON p.rental_id = r.rental_id
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;


DROP VIEW IF EXISTS top_five_genres;

CREATE VIEW top_five_genres AS

SELECT 
    name, SUM(p.amount) AS gross_revenue
FROM
    category c
        INNER JOIN
    film_category fc ON fc.category_id = c.category_id
        INNER JOIN
    inventory i ON i.film_id = fc.film_id
        INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
        RIGHT JOIN
    payment p ON p.rental_id = r.rental_id
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;

SELECT * 
FROM top_five_genres;

DROP VIEW top_five_genres;


    
     
     
     




                    











