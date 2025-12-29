SELECT COUNT(*) FROM film;

/*******************************************************************************
 * 2. Muestra los nombres de todas las películas con una clasificación por 
 * edades de ‘R’.
 *******************************************************************************/

SELECT 
    title AS "Título de la Película"
FROM 
    film
WHERE 
    rating = 'R';

/*******************************************************************************
 * 3. Encuentra los nombres de los actores que tengan un "actor_id" 
 * entre 30 y 40.
 *******************************************************************************/

SELECT 
    first_name AS "Nombre",
    last_name AS "Apellido"
FROM 
    actor
WHERE 
    actor_id BETWEEN 30 AND 40;

/*******************************************************************************
 * 4. Obtén las películas cuyo idioma coincide con el idioma original.
 *******************************************************************************/

SELECT 
    title AS "Título de la Película"
FROM 
    film
WHERE 
    language_id = original_language_id;

/*******************************************************************************
 * 5. Ordena las películas por duración de forma ascendente.
 *******************************************************************************/

SELECT 
    title AS "Título de la Película",
    length AS "Duración"
FROM 
    film
ORDER BY 
    length ASC;

/*******************************************************************************
 * 6. Encuentra el nombre y apellido de los actores que tengan 'Allen' 
 * en su apellido.
 *******************************************************************************/

SELECT 
    first_name AS "Nombre", 
    last_name AS "Apellido"
FROM 
    actor
WHERE 
    last_name = 'ALLEN';

/*******************************************************************************
 * 7. Encuentra la cantidad total de películas en cada clasificación de la tabla 
 * "film" y muestra la clasificación junto con el recuento.
 *******************************************************************************/

SELECT 
    rating AS "Clasificación",
    COUNT(*) AS "Total de Películas"
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    rating ASC;

/*******************************************************************************
 * 8. Encuentra el título de todas las películas que son 'PG-13' o tienen una 
 * duración mayor a 3 horas en la tabla film.
 *******************************************************************************/

SELECT 
    title AS "Título",
    rating AS "Clasificación",
    length AS "Duración"
FROM 
    film
WHERE 
    rating = 'PG-13' 
    OR length > 180;

/*******************************************************************************
 * 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
 *******************************************************************************/

SELECT 
    VARIANCE(replacement_cost) AS "Variabilidad Coste Reemplazo"
FROM 
    film;

/*******************************************************************************
 * 10. Encuentra la mayor y menor duración de una película de nuestra BBDD.
 *******************************************************************************/

SELECT 
    MAX(length) AS "Duración Máxima",
    MIN(length) AS "Duración Mínima"
FROM 
    film;

/*******************************************************************************
 * 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
 *******************************************************************************/

SELECT 
    amount AS "Costo Alquiler"
FROM 
    payment
ORDER BY 
    payment_date DESC
LIMIT 1 OFFSET 2;


/*******************************************************************************
 * 12. Encuentra el título de las películas en la tabla "film" que no sean 
 * ni 'NC-17' ni 'G' en cuanto a su clasificación.
 *******************************************************************************/

SELECT 
    title AS "Título",
    rating AS "Clasificación"
FROM 
    film
WHERE 
    rating NOT IN ('NC-17', 'G')
ORDER BY 
    title ASC;


/*******************************************************************************
 * 13. Encuentra el promedio de duración de las películas para cada 
 * clasificación de la tabla "film" y muestra la clasificación junto con el 
 * promedio de duración.
 *******************************************************************************/

SELECT 
    rating AS "Clasificación",
    AVG(length) AS "Promedio Duración"
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    rating ASC;


/*******************************************************************************
 * 14. Encuentra el título de todas las películas que tengan una duración 
 * mayor a 180 minutos.
 *******************************************************************************/

SELECT 
    title AS "Título",
    length AS "Duración"
FROM 
    film
WHERE 
    length > 180
ORDER BY 
    title ASC;

/*******************************************************************************
 * 15. ¿Cuánto dinero ha generado en total la empresa?
 *******************************************************************************/

SELECT 
    SUM(amount) AS "Ingresos Totales"
FROM 
    payment;

/*******************************************************************************
 * 16. Muestra los 10 clientes con mayor valor de id.
 *******************************************************************************/

SELECT 
    customer_id,
    first_name AS "Nombre",
    last_name AS "Apellido"
FROM 
    customer
ORDER BY 
    customer_id DESC
LIMIT 10;

/*******************************************************************************
 * 17. Encuentra el nombre y apellido de los actores que aparecen en la 
 * película con título ‘Egg Igby’.
 *******************************************************************************/
SELECT 
    a.first_name AS "Nombre", 
    a.last_name AS "Apellido"
FROM 
    actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE 
    f.title = 'EGG IGBY';


/*******************************************************************************
 * 18. Selecciona todos los nombres de las películas únicos.
 *******************************************************************************/
SELECT DISTINCT 
    title AS "Título Único"
FROM 
    film;


/*******************************************************************************
 * 19. Encuentra el título de las películas que son comedias y tienen una 
 * duración mayor a 180 minutos en la tabla “film”.
 *******************************************************************************/
SELECT 
    f.title AS "Título"
FROM 
    film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Comedy' 
    AND f.length > 180;


/*******************************************************************************
 * 20. Encuentra las categorías de películas que tienen un promedio de 
 * duración superior a 110 minutos y muestra el nombre de la categoría 
 * junto con el promedio de duración.
 *******************************************************************************/
SELECT 
    c.name AS "Categoría", 
    AVG(f.length) AS "Promedio Duración"
FROM 
    category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY 
    c.name
HAVING 
    AVG(f.length) > 110;


/*******************************************************************************
 * 21. ¿Cuál es la media de duración del alquiler de las películas?
 *******************************************************************************/
SELECT 
    AVG(rental_duration) AS "Media Duración Alquiler"
FROM 
    film;


/*******************************************************************************
 * 22. Crea una columna con el nombre y apellidos de todos los actores y actrices.
 *******************************************************************************/
SELECT 
    CONCAT(first_name, ' ', last_name) AS "Nombre Completo"
FROM 
    actor;


/*******************************************************************************
 * 23. Números de alquiler por día, ordenados por cantidad de alquiler 
 * de forma descendente.
 *******************************************************************************/
SELECT 
    DATE(rental_date) AS "Día", 
    COUNT(*) AS "Total Alquileres"
FROM 
    rental
GROUP BY 
    "Día"
ORDER BY 
    "Total Alquileres" DESC;


/*******************************************************************************
 * 24. Encuentra las películas con una duración superior al promedio.
 *******************************************************************************/
SELECT 
    title AS "Título", 
    length AS "Duración"
FROM 
    film
WHERE 
    length > (SELECT AVG(length) FROM film);


/*******************************************************************************
 * 25. Averigua el número de alquileres registrados por mes.
 *******************************************************************************/
SELECT 
    TO_CHAR(rental_date, 'YYYY-MM') AS "Mes", 
    COUNT(*) AS "Total Alquileres"
FROM 
    rental
GROUP BY 
    "Mes"
ORDER BY 
    "Mes";


/*******************************************************************************
 * 26. Encuentra el promedio, la desviación estándar y varianza del total pagado.
 *******************************************************************************/
SELECT 
    AVG(amount) AS "Promedio", 
    STDDEV(amount) AS "Desviación Estándar", 
    VARIANCE(amount) AS "Varianza"
FROM 
    payment;


/*******************************************************************************
 * 27. ¿Qué películas se alquilan por encima del precio medio?
 *******************************************************************************/
SELECT 
    title AS "Título", 
    rental_rate AS "Precio Alquiler"
FROM 
    film
WHERE 
    rental_rate > (SELECT AVG(rental_rate) FROM film);

/*******************************************************************************
 * 28. Muestra el id de los actores que hayan participado en más de 40 películas.
 *******************************************************************************/
SELECT 
    actor_id, 
    COUNT(*) AS "Total Películas"
FROM 
    film_actor
GROUP BY 
    actor_id
HAVING 
    COUNT(*) > 40;


/*******************************************************************************
 * 29. Obtener todas las películas y, si están disponibles en el inventario, 
 * mostrar la cantidad disponible.
 *******************************************************************************/
SELECT 
    f.title AS "Título", 
    COUNT(i.inventory_id) AS "Cantidad Disponible"
FROM 
    film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY 
    f.title;


/*******************************************************************************
 * 30. Obtener los actores y el número de películas en las que ha actuado.
 *******************************************************************************/
SELECT 
    a.first_name AS "Nombre", 
    a.last_name AS "Apellido", 
    COUNT(fa.film_id) AS "Número de Películas"
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name;


/*******************************************************************************
 * 31. Obtener todas las películas y mostrar los actores que han actuado en 
 * ellas, incluso si algunas películas no tienen actores asociados.
 *******************************************************************************/
SELECT 
    f.title AS "Título Película", 
    a.first_name AS "Nombre Actor", 
    a.last_name AS "Apellido Actor"
FROM 
    film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id;


/*******************************************************************************
 * 32. Obtener todos los actores y mostrar las películas en las que han 
 * actuado, incluso si algunos actores no han actuado en ninguna película.
 *******************************************************************************/
SELECT 
    a.first_name AS "Nombre Actor", 
    a.last_name AS "Apellido Actor", 
    f.title AS "Título Película"
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;


/*******************************************************************************
 * 33. Obtener todas las películas que tenemos y todos los registros de alquiler.
 *******************************************************************************/
SELECT 
    f.title AS "Película", 
    r.rental_id AS "ID Alquiler", 
    r.rental_date AS "Fecha Alquiler"
FROM 
    film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id;


/*******************************************************************************
 * 34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
 *******************************************************************************/
SELECT 
    c.first_name AS "Nombre", 
    c.last_name AS "Apellido", 
    SUM(p.amount) AS "Total Gastado"
FROM 
    customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    "Total Gastado" DESC
LIMIT 5;


/*******************************************************************************
 * 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.
 *******************************************************************************/
SELECT 
    * FROM 
    actor 
WHERE 
    first_name = 'JOHNNY';


/*******************************************************************************
 * 36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.
 *******************************************************************************/
SELECT 
    first_name AS "Nombre", 
    last_name AS "Apellido"
FROM 
    actor;


/*******************************************************************************
 * 37. Encuentra el ID del actor más bajo y más alto en la tabla actor.
 *******************************************************************************/
SELECT 
    MIN(actor_id) AS "ID Mínimo", 
    MAX(actor_id) AS "ID Máximo"
FROM 
    actor;


/*******************************************************************************
 * 38. Cuenta cuántos actores hay en la tabla “actor”.
 *******************************************************************************/
SELECT 
    COUNT(*) AS "Total Actores"
FROM 
    actor;


/*******************************************************************************
 * 39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.
 *******************************************************************************/
SELECT 
    * FROM 
    actor
ORDER BY 
    last_name ASC;


/*******************************************************************************
 * 40. Selecciona las primeras 5 películas de la tabla “film”.
 *******************************************************************************/
SELECT 
    * FROM 
    film
LIMIT 5;


/*******************************************************************************
 * 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el 
 * mismo nombre. ¿Cuál es el nombre más repetido?
 *******************************************************************************/
SELECT 
    first_name AS "Nombre", 
    COUNT(*) AS "Repeticiones"
FROM 
    actor
GROUP BY 
    first_name
ORDER BY 
    "Repeticiones" DESC;


/*******************************************************************************
 * 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
 *******************************************************************************/
SELECT 
    r.rental_id, 
    c.first_name, 
    c.last_name
FROM 
    rental r
INNER JOIN customer c ON r.customer_id = c.customer_id;


/*******************************************************************************
 * 43. Muestra todos los clientes y sus alquileres si existen, incluyendo 
 * aquellos que no tienen alquileres.
 *******************************************************************************/
SELECT 
    c.first_name, 
    c.last_name, 
    r.rental_id
FROM 
    customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id;



/*******************************************************************************
 * 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor 
 * esta consulta? ¿Por qué?
 *******************************************************************************/
SELECT 
    f.title, 
    c.name AS "Categoría"
FROM 
    film f
CROSS JOIN category c;

-- No aporta valor real en este contexto. Un CROSS JOIN genera un producto cartesiano (todas las combinaciones posibles). 
-- En este caso, asocia cada película  con las 16 categorías existentes, independientemente de si pertenecen a ellas o no, creando datos ficticios.



/*******************************************************************************
 * 45. Encuentra los actores que han participado en películas de la categoría 'Action'.
 *******************************************************************************/
SELECT DISTINCT 
    a.first_name, 
    a.last_name
FROM 
    actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Action';


/*******************************************************************************
 * 46. Encuentra todos los actores que no han participado en películas.
 *******************************************************************************/
SELECT 
    a.first_name, 
    a.last_name
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE 
    fa.actor_id IS NULL;


/*******************************************************************************
 * 47. Selecciona el nombre de los actores y la cantidad de películas en las 
 * que han participado.
 *******************************************************************************/
SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS "Total Películas"
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name;


/*******************************************************************************
 * 48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres 
 * de los actores y el número de películas en las que han participado.
 *******************************************************************************/
CREATE OR REPLACE VIEW actor_num_peliculas AS
SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS "Num_Peliculas"
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name;



/*******************************************************************************
 * 49. Calcula el número total de alquileres realizados por cada cliente.
 *******************************************************************************/
SELECT 
    c.first_name, 
    c.last_name, 
    COUNT(r.rental_id) AS "Total_Alquileres"
FROM 
    customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name;


/*******************************************************************************
 * 50. Calcula la duración total de las películas en la categoría 'Action'.
 *******************************************************************************/
SELECT 
    SUM(f.length) AS "Duración Total Action"
FROM 
    film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Action';


/*******************************************************************************
 * 51. Crea una tabla temporal llamada “cliente_rentas_temporal” para 
 * almacenar el total de alquileres por cliente.
 *******************************************************************************/
CREATE TEMPORARY TABLE cliente_rentas_temporal AS
SELECT 
    customer_id, 
    COUNT(*) AS total_alquileres
FROM 
    rental
GROUP BY 
    customer_id;


/*******************************************************************************
 * 52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las 
 * películas que han sido alquiladas al menos 10 veces.
 *******************************************************************************/
CREATE TEMPORARY TABLE peliculas_alquiladas AS
SELECT 
    f.title, 
    COUNT(r.rental_id) AS veces_alquilada
FROM 
    film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id, f.title
HAVING 
    COUNT(r.rental_id) >= 10;


/*******************************************************************************
 * 53. Encuentra el título de las películas que han sido alquiladas por el 
 * cliente Tammy Sanders y que aún no se han devuelto.
 *******************************************************************************/
SELECT 
    f.title
FROM 
    film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE 
    c.first_name = 'TAMMY' 
    AND c.last_name = 'SANDERS' 
    AND r.return_date IS NULL
ORDER BY 
    f.title ASC;


/*******************************************************************************
 * 54. Encuentra los nombres de los actores que han actuado en al menos una 
 * película de la categoría ‘Sci-Fi’.
 *******************************************************************************/
SELECT DISTINCT 
    a.first_name, 
    a.last_name
FROM 
    actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Sci-Fi'
ORDER BY 
    a.last_name ASC;

/*******************************************************************************
 * 55. Actores en películas alquiladas después del primer alquiler de 
 * 'Spartacus Cheaper'.
 *******************************************************************************/
SELECT DISTINCT 
    a.first_name, 
    a.last_name
FROM 
    actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date > (
    SELECT MIN(r2.rental_date)
    FROM rental r2
    INNER JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
    INNER JOIN film f2 ON i2.film_id = f2.film_id
    WHERE f2.title = 'SPARTACUS CHEAPER'
)
ORDER BY a.last_name ASC;


/*******************************************************************************
 * 56. Actores que no han actuado en ninguna película de la categoría 'Music'.
 *******************************************************************************/
SELECT 
    a.first_name, 
    a.last_name
FROM 
    actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    INNER JOIN film_category fc ON fa.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Music'
);


/*******************************************************************************
 * 57. Título de todas las películas alquiladas por más de 8 días.
 *******************************************************************************/
SELECT DISTINCT 
    f.title
FROM 
    film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE 
    r.return_date - r.rental_date > INTERVAL '8 days';


/*******************************************************************************
 * 58. Películas que son de la misma categoría que 'Animation'.
 *******************************************************************************/
SELECT 
    f.title
FROM 
    film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id = (
    SELECT category_id 
    FROM category 
    WHERE name = 'Animation'
);


/*******************************************************************************
 * 59. Películas con la misma duración que 'Dancing Fever'.
 *******************************************************************************/
SELECT 
    title, 
    length
FROM 
    film
WHERE length = (
    SELECT length 
    FROM film 
    WHERE title = 'DANCING FEVER'
)
AND title <> 'DANCING FEVER'
ORDER BY title ASC;


/*******************************************************************************
 * 60. Clientes que han alquilado al menos 7 películas distintas.
 *******************************************************************************/
SELECT 
    c.first_name, 
    c.last_name, 
    COUNT(DISTINCT i.film_id) AS "Peliculas Distintas"
FROM 
    customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(DISTINCT i.film_id) >= 7
ORDER BY 
    c.last_name ASC;


/*******************************************************************************
 * 61. Cantidad total de películas alquiladas por categoría.
 *******************************************************************************/
SELECT 
    c.name AS "Categoría", 
    COUNT(r.rental_id) AS "Total Alquileres"
FROM 
    category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN inventory i ON fc.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    c.name
ORDER BY 
    "Total Alquileres" DESC;


/*******************************************************************************
 * 62. Número de películas por categoría estrenadas en 2006.
 *******************************************************************************/
SELECT 
    c.name AS "Categoría", 
    COUNT(f.film_id) AS "Total Películas 2006"
FROM 
    category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
WHERE 
    f.release_year = 2006
GROUP BY 
    c.name;


/*******************************************************************************
 * 63. Todas las combinaciones posibles de trabajadores con las tiendas.
 *******************************************************************************/
SELECT 
    s.first_name, 
    s.last_name, 
    st.store_id
FROM 
    staff s
CROSS JOIN store st;


/*******************************************************************************
 * 64. Cantidad total de películas alquiladas por cada cliente (con detalles).
 *******************************************************************************/
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(r.rental_id) AS "Total Alquileres"
FROM 
    customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    "Total Alquileres" DESC;

