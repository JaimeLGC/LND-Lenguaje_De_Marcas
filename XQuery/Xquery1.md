# Tarea 1 Xquery

## Ejercicio 1

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

### 1. Mostrar los títulos de los libros con la etiqueta "titulo".

    for $title in //title/text() return 
    <titulo>{$title}</titulo>

    <titulo>Everyday Italian</titulo>
    <titulo>Harry Potter</titulo>
    <titulo>XQuery Kick Start</titulo>
    <titulo>Learning XML</titulo>

### 2. Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.

    for $book in //book
    where $book/price <= 30
    return $book

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

    for $book in //book
    where $book/price <= 30
    return $book/title

    <title lang="en">Everyday Italian</title>
    <title lang="en">Harry Potter</title>

### 4. Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.

    for $book in //book
    where $book/price <= 30
    return $book/title/text()

    Everyday Italian
    Harry Potter


### 5. Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".

    for $book in //book
    where $book/year = 2005
    return <lib2005>{$book/title | $book/author}</lib2005>

    <lib2005>
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    </lib2005>
    <lib2005>
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    </lib2005>

### 6. Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".

    for $year in //year
    return <publicacion>{$year/text()}</publicacion>

    <publicacion>2005</publicacion>
    <publicacion>2005</publicacion>
    <publicacion>2003</publicacion>
    <publicacion>2003</publicacion>

    let $year := //year
    return <publicacion>{$year}</publicacion>
    
    <publicacion>
    <year>2005</year>
    <year>2005</year>
    <year>2003</year>
    <year>2003</year>
    </publicacion>

### 7. Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.

    for $book in //book
    order by $book/@category, $book/title
    return $book

    <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
    </book>
    <book category="COOKING">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
    </book>
    <book category="WEB">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
    </book>
    <book category="WEB">
    <title lang="en">XQuery Kick Start</title>
    <author>James McGovern</author>
    <author>Per Bothner</author>
    <author>Kurt Cagle</author>
    <author>James Linn</author>
    <author>Vaidyanathan Nagarajan</author>
    <year>2003</year>
    <price>49.99</price>
    </book>
        
### 8. Mostrar cuántos libros hay, y etiquetarlo con "total".

    let $book := count(//book)
    return <total>{$book}</total>

    <total>4</total>

### 9. Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.

    let $book := count(//book),
        $title := //title
    return 
    <libros>
        <titulo>{$title}</titulo>
        <num>{$book}</num> 
    </libros>

    <libros>
    <titulo>
        <title lang="en">Everyday Italian</title>
        <title lang="en">Harry Potter</title>
        <title lang="en">XQuery Kick Start</title>
        <title lang="en">Learning XML</title>
    </titulo>
    <num>4</num>
    </libros>

### 10. Mostrar el precio mínimo y máximo de los libros.

    let $maxprice := max(//price),
    $minprice := min(//price)
    return 
    <precios>
        <minimo>{$minprice}</minimo>
        <maximo>{$maxprice}</maximo> 
    </precios>

    <precios>
        <minimo>29.99</minimo>
        <maximo>49.99</maximo>
    </precios>

### 11. Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.

    for $book in //book
    order by $book/price * 1.21
    return 
    <libro>
        <titulo>{$book/title/text()}</titulo>
        <precio>{$book/price/text()} €</precio>
        <precio_iva>{$book/price * 1.21} €</precio_iva>
    </libro>

    <libro>
    <titulo>Harry Potter</titulo>
    <precio>29.99 €</precio>
    <precio_iva>36.2879 €</precio_iva>
    </libro>
    <libro>
    <titulo>Everyday Italian</titulo>
    <precio>30.00 €</precio>
    <precio_iva>36.3 €</precio_iva>
    </libro>
    <libro>
    <titulo>Learning XML</titulo>
    <precio>39.95 €</precio>
    <precio_iva>48.3395 €</precio_iva>
    </libro>
    <libro>
    <titulo>XQuery Kick Start</titulo>
    <precio>49.99 €</precio>
    <precio_iva>60.4879 €</precio_iva>
    </libro>

### 12. Mostrar la suma total de los precios de los libros con la etiqueta "total".

    let $price := //price
    return <total>{sum($price)}</total>

    <total>149.93</total>


### 13. Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.

    <libros>
    {
    for $price in //price
    return $price
    }
    {
    let $book := //book
    return <total>{sum($book/price)}</total>
    }
    </libros>

    <libros>
        <price>30.00</price>
        <price>29.99</price>
        <price>49.99</price>
        <price>39.95</price>
        <total>149.93</total>
    </libros>

### 14. Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.

    for $book in //book
    return 
    <libro>
        <título>{$book/title/text()}</título>
        <autores>{count($book/author)}</autores>
    </libro>

    <libro>
    <título>Everyday Italian</título>
    <autores>1</autores>
    </libro>
    <libro>
    <título>Harry Potter</título>
    <autores>1</autores>
    </libro>
    <libro>
    <título>XQuery Kick Start</título>
    <autores>5</autores>
    </libro>
    <libro>
    <título>Learning XML</título>
    <autores>1</autores>
    </libro>

### 15. Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.

    for $book in //book
    return <libro>{$book/title/text()}({count($book/author)})</libro>

    <libro>Everyday Italian(1)</libro>
    <libro>Harry Potter(1)</libro>
    <libro>XQuery Kick Start(5)</libro>
    <libro>Learning XML(1)</libro>

### 16. Mostrar los libros escritos en años que terminen en "3".

    for $book in //book
    where ends-with($book/year, '3')
    return $book

    <book category="WEB">
    <title lang="en">XQuery Kick Start</title>
    <author>James McGovern</author>
    <author>Per Bothner</author>
    <author>Kurt Cagle</author>
    <author>James Linn</author>
    <author>Vaidyanathan Nagarajan</author>
    <year>2003</year>
    <price>49.99</price>
    </book>
    <book category="WEB">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
    </book

### 17. Mostrar los libros cuya categoría empiece por "C".

    for $book in //book
    where starts-with($book/@category, 'C')
    return $book

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
    <price>29.99</pr

### 18. Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.

    for $book in //title
    where contains($book, 'X') or contains($book, 'x')
    return $book

    <title lang="en">XQuery Kick Start</title>
    <title lang="en">Learning XML</title>


### 19. Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.

    for $title in //title/text()
    return
    <libros>
    <titulo>{$title}</titulo>
    <carácteres>{string-length($title)}</carácteres>
    </libros>

    <libros>
    <titulo>Everyday Italian</titulo>
    <carácteres>16</carácteres>
    </libros>
    <libros>
    <titulo>Harry Potter</titulo>
    <carácteres>12</carácteres>
    </libros>
    <libros>
    <titulo>XQuery Kick Start</titulo>
    <carácteres>17</carácteres>
    </libros>
    <libros>
    <titulo>Learning XML</titulo>
    <carácteres>12</carácteres>
    </libros>

### 20. Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".

    for $year in distinct-values(//year)
    return <año>{$year}</año>

    <año>2005</año>
    <año>2003</año>

### 21. Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.

    for $author in distinct-values(//author)
    order by string-length($author)
    return <autor>{$author}</autor>

    <autor>Kurt Cagle</autor>
    <autor>James Linn</autor>
    <autor>Per Bothner</autor>
    <autor>Erik T. Ray</autor>
    <autor>J K. Rowling</autor>
    <autor>James McGovern</autor>
    <autor>Giada De Laurentiis</autor>
    <autor>Vaidyanathan Nagarajan</autor>


### 22. Mostrar los títulos en una tabla de HTML.

    <table>
    {
    for $libros in /bookstore/book
    return 
        <tr>
        <td>{$libros/title/text()}</td>
        </tr>
    }
    </table>

    <table>
    <tr>
        <td>Everyday Italian</td>
    </tr>
    <tr>
        <td>Harry Potter</td>
    </tr>
    <tr>
        <td>XQuery Kick Start</td>
    </tr>
    <tr>
        <td>Learning XML</td>
    </tr>
    </table>
