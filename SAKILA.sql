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

                        --Ejercicio 6--

SELECT film.rating, COUNT(film.film_id) AS total_peliculas
FROM film
GROUP BY film.rating
ORDER BY total_peliculas DESC;

                        --Ejercicio 7--

SELECT c.name AS categoria, COUNT(f.film_id) AS Cantidad_Pelis
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

                        --Ejercicio 8--

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS CAntidad_Peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY CAntidad_Peliculas DESC
LIMIT 10; ----
                        
                        --Ejercicio 9--

SELECT a.address, c.city, co.country, COUNT(i.inventory_id) AS Ejemplares
FROM inventory i
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
GROUP BY a.address, c.city, co.country;

                        --Ejercicio 10--

SELECT a.address, c.city, co.country, COUNT(DISTINCT i.film_id) AS Total_de_Peliculas
FROM inventory i
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
GROUP BY a.address, c.city, co.country;


                        --Ejercicio 11--
                        
SELECT c.name AS categoria, AVG(f.rental_rate) AS costo_promedio
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;


                        --Ejercicio 12--

SELECT 
    r.rental_date, 
    r.return_date, 
    (JULIANDAY(r.return_date) - JULIANDAY(r.rental_date)) AS dias_alquiler,
    f.rental_rate * (JULIANDAY(r.return_date) - JULIANDAY(r.rental_date)) AS costo_total,
    f.rental_rate AS costo_por_dia
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'ALABAMA DEVIL'
ORDER BY r.rental_date;




