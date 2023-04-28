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
for $baile in bailes/baile where $baile/precio/@cuota

9. Mostrar el nombre de los bailes de la sala 1, que se pague con euros y el precio sea menor a 35.
for $baile in bailes/baile where $baile/sala = 1 and $baile/precio/@moneda = 'euro' and $baile/precio > 35 
return $baile/nombre/text

10. Obtener el precio del baile con el precio más caro.


11. Obtener el precio y el nombre del baile con el precio más caro.


12. Obtener el precio del baile con el precio más barato.


13. Obtener el precio y el nombre del baile con el precio más barato.


14. Obtener la suma del precio por el número de plazas de todas las clases. Resultado: 29250.


15. Obtener el dia, mes y año de los bailes mensuales, tanto del comienzo como del final.


16. Obtener los bailes que tengan mas de 100 dias de diferencia.


17. Obtener la diferencia de dias del comienzo del baile con la fecha actual.
