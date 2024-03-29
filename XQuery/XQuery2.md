# Ejercicio 2 XQuery

### 1. Muestra el título del videojuego.

    for $titulo in /videojuego/titulo 
    return $titulo

### 2. Muestra la plataforma del videojuego.

    for $plataforma in /videojuego/plataforma 
    return $plataforma

    <plataforma>PC</plataforma>

### 3. Muestra el nombre de todos los agentes.

    for $nombre in //nombre 
    return $nombre

    <nombre>Jett</nombre>
    <nombre>Brimstone</nombre>
    <nombre>Viper</nombre>
    <nombre>Phoenix</nombre>
    <nombre>Sage</nombre>
    <nombre>Cypher</nombre>

### 4. Muestra el nombre y la habilidad ultimate de todos los agentes.

    for $agente in //nombre/text() | //habilidadUltimate/text() return $agente

    Jett
    Tormenta de Cuchillos
    Brimstone
    Incendiario Orbital
    Viper
    Recolección Táctica
    Phoenix
    Explosión Cósmica
    Sage
    Resurrección
    Cypher
    Ataque de Neurona

### 5. Muestra los nombres de los agentes cuya habilidad primaria es "Incendiario".

    for $agente in //agente 
    where $agente/habilidadPrimaria = 'Incendiario' 
    return $agente/nombre

### 6. Muestra los nombres de los agentes cuya habilidad ultimate es "Fénix".

    for $agente in //agente 
    where $agente/habilidadUltimate = 'Fénix'
    return $agente/nombre

### 7. Muestra las habilidades primarias de los agentes cuyo nombre empieza por "J".

    for $nombre in //agente/nombre 
    where starts-with($nombre, 'J') 
    return $nombre 

    <nombre>Jett</nombre>

### 8. Muestra los nombres de los agentes cuyas habilidades primarias empiezan por "Bola".

    for $agente in //agente 
    where starts-with($agente/habilidadPrimaria, 'Bola') 
    return $agente/nombre

    <nombre>Phoenix</nombre>

### 9. Muestra los nombres de todos los agentes en orden alfabético.

    for $nombre in //nombre order by $nombre return $nombre

    <nombre>Brimstone</nombre>
    <nombre>Cypher</nombre>
    <nombre>Jett</nombre>
    <nombre>Phoenix</nombre>
    <nombre>Sage</nombre>
    <nombre>Viper</nombre>

### 10. Muestra las habilidades primarias y secundarias de los agentes cuyo nombre contiene la letra "y".

    for $agente in //agente 
    where contains($agente/nombre, 'y') 
    return $agente/habilidadPrimaria/text() | 
    $agente/habilidadSecundaria/text

    Trampa Cibernética
    Cámara Espía

### 11. Muestra los nombres de los agentes cuya habilidad ultimate contiene la palabra "cuchillos".

    for $agente in //agente 
    where contains($agente/habilidadUltimate, 'Cuchillos') 
    return $agente/nombre/text()

    Jett

### 12. Muestra las habilidades primarias de los agentes cuyo nombre contiene la letra "o" y la habilidad secundaria contiene la palabra "humo".

    for $agente in //agente 
    where contains($agente/habilidadPrimaria, 'o') 
    and contains($agente/habilidadSecundaria, 'humo')
    return $agente/nombre

### 13. Muestra los nombres de los agentes que tienen exactamente tres habilidades.

    for $agente in //agente 
    where count($agente/*[contains(local-name(), 'habilidad')]) = 3 
    return $agente/nombre

    <nombre>Jett</nombre>
    <nombre>Brimstone</nombre>
    <nombre>Viper</nombre>
    <nombre>Phoenix</nombre>
    <nombre>Sage</nombre>
    <nombre>Cypher</nombre>

### 14. Muestra los nombres de los agentes cuya habilidad secundaria no es "Granada Cegadora".

    for $agente in //agente 
    where $agente/habilidadSecundaria [not (= "Granada Cegadora")] return $agente/nombre


### 15. Muestra las habilidades primarias de los agentes cuyos nombres no contienen la letra "e".

    for $agente in //agente 
    where $agente [not(contains(nombre, 'e'))] return $agente/habilidadPrimaria


### 16. Muestra los nombres de los agentes cuyas habilidades primarias contienen la palabra "muro" o la palabra "barrera".

    for $agente in //agente 
    where contains($agente/habilidadPrimaria, 'muro') 
    or contains($agente/habilidadPrimaria, 'barrera')
    return $agente/nombre

### 17. Muestra las habilidades ultimates de los agentes en orden alfabético inverso.



### 18. Muestra los nombres de los agentes cuya habilidad ultimate tiene una duración mayor a 8 segundos.

    for $ultimate in //habilidadUltimate 
    where $ultimate/@duracion > 8 
    return $ultimate

    <habilidadUltimate tipo="Curación" duracion="12">Recolección Táctica</habilidadUltimate>

### 19. Muestra el nombre del agente con la habilidad ultimate más corta.

    let $ultimate := min(//habilidadUltimate/@duracion)
    return <minimo>{$ultimate}</minimo>

    <minimo>0</minimo>

### 20. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias con la misma duración.

    for $agente in //agente
    where $agente/habilidadPrimaria/@duracion = $agente/habilidadSecundaria/@duracion
    return $agente/nombre


### 21. Muestra el nombre de los agentes que tienen habilidades primarias y secundarias que pertenecen al mismo tipo.

    for $agente in //agente
    where $agente/habilidadPrimaria/@tipo = $agente/habilidadSecundaria/@tipo
    return $agente/nombre

    <nombre>Viper</nombre>
    <nombre>Cypher</nombre>

### 22. Muestra los nombres de los agentes cuyas habilidades primarias son de tipo "Daño" y sus habilidades secundarias son de tipo "Curación".

    for $agente in //agente
    where $agente/habilidadPrimaria/@tipo = "Daño" and $agente/habilidadSecundaria/@tipo = "Curación"
    return $agente/nombre

    <nombre>Jett</nombre>
    <nombre>Brimstone</nombre>
    <nombre>Phoenix</nombre>