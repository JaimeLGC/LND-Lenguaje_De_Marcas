Examen XQuery LND – 1ºDAW
Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

### 1. Escribe una consulta en XQuery para obtener todos los títulos de las películas en inglés.

    for $pelicula in //pelicula
    where $pelicula/titulo/@idioma = "es"
    return $pelicula/titulo/text()

### 2. Encuentra la cantidad de películas en la categoría "Acción".

    for $pelicula in //pelicula
    where $pelicula/género = "Acción"
    return $pelicula

### 3. Obtén el título y el director de la película más reciente.

    for $pelicula in //pelicula
    where $pelicula/año = max(//año)
    return $pelicula

### 4. Encuentra todas las películas que tengan una duración superior a 120 minutos.

    for $pelicula in //pelicula
    where $pelicula/duración > 120
    return $pelicula

### 5. Escribe una consulta para calcular el precio promedio de todas las películas.

    let $promedio := avg(//precio)
    return $promedio

### 6. Obtén el título de la película más cara.



### 7. Encuentra todas las películas dirigidas por Christopher Nolan.

    for $pelicula in //pelicula
    where $pelicula/director = 'Christopher Nolan'
    return $pelicula

### 8. Obtén el título y el año de lanzamiento de las películas que fueron lanzadas después de 2010 y tienen un precio inferior a 15.

    for $pelicula in //pelicula
    where $pelicula/año > 2010 
    and $pelicula/precio < 15
    return $pelicula

### 9. Encuentra el director de la película cuyo título es "Avengers: Endgame".

    for $pelicula in //pelicula
    where $pelicula/titulo = 'Avengers: Endgame'
    return $pelicula/director/text()

### 10. Escribe una consulta para obtener todas las películas en orden alfabético según su título.

    for $pelicula in //pelicula
    order by $pelicula/título
    return $pelicula

### 11. Encuentra todas las películas cuyo título comienza con la letra "L".



### 12. Obtén el número total de películas en la librería.

    let $total := count(//pelicula)
    return $total

### 13. Encuentra la película con la duración más larga y muestra su título, duración y año de lanzamiento.

    

### 14. Calcula el precio total de todas las películas en la librería y muestra el resultado.

### 15. Encuentra todos los géneros distintos presentes en la librería y muestra la cantidad de películas para cada género.

### 16. Crea una variable que almacene el número total de películas en la librería. Luego, muestra el título y el precio de las películas cuyo precio es mayor que el promedio de todos los precios.

### 17. Escribe una consulta para encontrar el género con la película más corta y muestra el título y la duración de esa película.

### 18. Encuentra todas las películas cuyo título contiene la palabra "der" y muestra el título y el director.

### 19. Escribe una consulta para obtener el título y el director de las tres películas más recientes en orden descendente de año de lanzamiento.

### 20. Encuentra todos los directores que han dirigido películas en más de un género y muestra el nombre de cada director junto con los géneros en los que ha trabajado