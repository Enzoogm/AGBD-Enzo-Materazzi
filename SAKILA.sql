                        --Ejercicio 1--
SELECT film.title, address.address, city.city, country.country
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE rental.return_date IS NULL;

                        --Ejercicio 2--

SELECT film.title, category.name AS category, language.name AS language, film.rating, film.length AS duration
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
WHERE film.length BETWEEN 60 AND 120;

                        --Ejercicio 3--

SELECT staff.first_name, staff.last_name, address.address, city.city, country.country
FROM staff
JOIN store ON staff.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

                        --Ejercicio 4--

SELECT film.title, MIN(rental.return_date) AS min_return_date, MAX(rental.return_date) AS max_return_date
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title;

                        --Ejercicio 5--

SELECT film.title, category.name, language.name, film.rating, film.length,
	rental.rental_date, rental.return_date,
	customer.first_name, customer.last_name,
	address.address, city.city, country.country,
	staff.first_name, staff.last_name
FROM rental
INNER JOIN customer on rental.customer_id = customer.customer_id
INNER JOIN inventory on rental.inventory_id = inventory.inventory_id
INNER JOIN film on inventory.film_id = film.film_id
INNER JOIN film_category on film.film_id = film_category.film_id
INNER JOIN category on film_category.category_id = category.category_id
INNER JOIN language on film.language_id = language.language_id
INNER JOIN store on inventory.store_id = store.store_id
INNER JOIN staff on store.manager_staff_id = staff.staff_id
INNER JOIN address on customer.address_id = address.address_id
INNER JOIN city on address.city_id = city.city_id
INNER JOIN country on city.country_id = country.country_id

