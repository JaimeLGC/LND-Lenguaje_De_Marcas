# Tarea 1 Xquery

## Ejercicio 1

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

### 1. Mostrar los títulos de los libros con la etiqueta "titulo".

    for $titulo in /bookstore/book/title/text() return <titulo>{$titulo}</titulo>

    <titulo>Everyday Italian</titulo>
    <titulo>Harry Potter</titulo>
    <titulo>XQuery Kick Start</titulo>
    <titulo>Learning XML</titulo>

### 2. Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.

    <book category="COOKING">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
    </book>
    <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
    </book>


### 3. Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.



### 4. Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.



### 5. Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".



### 6. Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".



### 7. Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.



### 8. Mostrar cuántos libros hay, y etiquetarlo con "total".



### 9. Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.



### 10. Mostrar el precio mínimo y máximo de los libros.



### 11. Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.



### 12. Mostrar la suma total de los precios de los libros con la etiqueta "total".



### 13. Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.



### 14. Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.



### 15. Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.



### 16. Mostrar los libros escritos en años que terminen en "3".



### 17. Mostrar los libros cuya categoría empiece por "C".



### 18. Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.



### 19. Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.



### 20. Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".



### 21. Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.



### 22. Mostrar los títulos en una tabla de HTML.