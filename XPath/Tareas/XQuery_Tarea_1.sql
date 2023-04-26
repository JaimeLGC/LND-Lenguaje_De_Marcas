4. Mostrar los bailes ordenados por nombre.

    for $baile in /bailes/baile/nombre/text()
    order by $baile
    return $baile

5. Mostrar los nombres de los bailes que contienen una a.
    
    for $baile in /bailes/baile 
    where contains($baile, "a")
    return $baile/nombre

6. Mostrar el nombre de los bailes donde el apellido del profesor sea Lozano.


7. Mostrar todos los bailes, excepto el 3 y 5.


8. Mostrar profesores que den clases de bailes por una cuota mensual.


9. Mostrar el nombre de los bailes de la sala 1, que se pague con euros y el precio sea menor a 35.

