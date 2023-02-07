#What are the names of all the languages in the database 
#(Sorted Alphabetically)

Select name from sakila.language order by Name;

#Return the full names (first and last) of actors with “SON” in 
#their last name, ordered by their first name.
SELECT * from sakila.actor;

Select concat(first_name, ' ', last_name) AS full_name
FROM sakila.actor where last_name LIKE '%SON%' order by
first_name;

#Find all the addresses where the second address is not empty 
#(i.e., contains some text), and return
#these second addresses sorted.
SELECT * FROM sakila.address;

SELECT address2 FROM sakila.address 
WHERE address2 IS NOT NULL AND address2 != '' ORDER BY address2;

SELECT *
FROM sakila.address
WHERE address2 = ("")
ORDER BY address2 ASC;

#To select the number of films that involve both crocodiles and sharks in the "sakila" database, 
#you can use the following MySQL query:
SELECT * from sakila.film_actor;
SELECT * from sakila.film_text;
Select * from sakila.film;

SELECT first_name, last_name, release_year, title 
FROM film f 
INNER JOIN film_actor fc USING (film_id)
INNER JOIN actor a USING (actor_id)
WHERE description LIKE "%Crocodile%" AND description LIKE "%Shark%"
ORDER BY last_name;

#How many films involve a “Crocodile” and a “Shark”?
SELECT COUNT(*)
FROM sakila.film f 
WHERE description LIKE "%Crocodile%" AND description LIKE "%Shark%"
ORDER BY last_name;

#Find all the film categories in which there are between 55 and 65 films. Return the names of these
#categories and the number of films per category, sorted by the number of films.
SELECT name, COUNT(film_id) as Number_of_films
FROM sakila.film_category INNER JOIN category USING (category_id)
GROUP BY category_id 
HAVING Number_of_films > 55 AND Number_of_films < 65
ORDER BY Number_of_films;

#In how many film categories is the average difference between the film replacement cost and the
#rental rate larger than 17?
SELECT name AS category_name , AVG(rental_rate) AS Avg_rental_price, AVG(replacement_cost) AS Avg_replacement_price, (AVG(replacement_cost) - AVG(rental_rate)) AS replace_sub_rental
FROM sakila.film_category 
INNER JOIN film USING (film_id)
INNER JOIN category USING (category_id)
GROUP BY category_id 
HAVING replace_sub_rental > 17 ;


#Find the address district(s) name(s) such that the minimal postal code in the district(s) is maximal
#over all the districts. Make sure your query ignores empty postal codes and district names.
SELECT district, postal_code from sakila.address;

SELECT district
FROM sakila.address
WHERE postal_code != '' AND district != ''
GROUP BY district
HAVING MIN(postal_code) = (SELECT MAX(min_postal_code)
                           FROM (SELECT district, MIN(postal_code) AS min_postal_code
                                 FROM sakila.address
                                 WHERE postal_code != '' AND district != ''
                                 GROUP BY district) as temp_table);

                             
#Find the names (first and last) of all the actors and costumers whose first name is the same as the
#first name of the actor with ID 8. Do not return the actor with ID 8 himself. Note that you cannot
#use the name of the actor with ID 8 as a constant (only the ID). There is more than one way to solve
#this question, but you need to provide only one solution.

SELECT a.first_name, a.last_name
FROM sakila.actor a
WHERE a.first_name = (SELECT first_name
                      FROM sakila.actor
                      WHERE actor_id = 8)
AND a.actor_id != 8

UNION

SELECT c.first_name, c.last_name
FROM sakila.customer c
WHERE c.first_name = (SELECT first_name
                      FROM sakila.actor
                      WHERE actor_id = 8);
########################################################
SELECT  Caption, first_name, last_name
FROM
        (
            SELECT  'customer' Caption, first_name, last_name
            FROM    customer
            UNION  
            SELECT  'actor' Caption, first_name, last_name
            FROM    actor
            WHERE actor_id != 8
        ) subquery
WHERE first_name IN (SELECT first_name
					 FROM actor 
                     WHERE actor_id = 8) 
ORDER BY first_name, FIELD(Caption, 'customer', 'actor');

###Interestin Query (1)
#Query that calculates the average length of films in each category, 
#and returns the categories with the average film length 
#greater than the overall average film length of the database

SELECT 
    c.name, AVG(f.length) as avg_length
FROM 
    film f 
    INNER JOIN film_category fc ON f.film_id = fc.film_id 
    INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY 
    c.category_id
HAVING 
    AVG(f.length) > (SELECT AVG(length) FROM film);

###Interesting Query (2) 
###This query returns the customer_id, first_name, and last_name of all customers 
###who have rented more films than the average number of films rented by all customers.

SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE customer_id IN (SELECT customer_id
                      FROM sakila.rental
                      GROUP BY customer_id
                      HAVING COUNT(rental_id) >= (SELECT AVG(total_rentals)
                                                  FROM (SELECT COUNT(rental_id) as total_rentals
                                                        FROM sakila.rental
                                                        GROUP BY customer_id) as temp_table));
















