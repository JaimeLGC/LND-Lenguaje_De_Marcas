## Ejercicio 3 XML: XPATH LND

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta
deseada.

    <?xml version="1.0" encoding="UTF-8"?>
    <ies>
        <nombre>IES Puerto de la Cruz – Telesforo Bravo</nombre>
        <web>
    https://www3.gobiernodecanarias.org/medusa/edublog/iespuertodelacruzte
    lesforobravo/</web>
        <ciclos>
            <ciclo id="ASIR">
                <nombre>Administración de Sistemas Informáticos en Red</nombre>
                <grado>Superior</grado>
                <decretoTitulo año="2009" />
            </ciclo>
            <ciclo id="DAM">
                <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
                <grado>Superior</grado>
                <decretoTitulo año="2010" />
            </ciclo>
            <ciclo id="SMR">
                <nombre>Sistemas Microinformáticos y Redes</nombre>
                <grado>Medio</grado>
                <decretoTitulo año="2008" />
            </ciclo>
        </ciclos>
        <modulos>
            <modulo id="0228">
                <nombre>Aplicaciones web</nombre>
                <curso>2</curso>
                <horasSemanales>4</horasSemanales>
                <ciclo>SMR</ciclo>
            </modulo>
            <modulo id="0372">
                <nombre>Gestión de bases de datos</nombre>
                <curso>1</curso>
                <horasSemanales>5</horasSemanales>
                <ciclo>ASIR</ciclo>
            </modulo>
            <modulo id="0373">
                <nombre>Lenguajes de marcas y sistemas de gestión de
        información</nombre>
                <curso>1</curso>
                <horasSemanales>3</horasSemanales>
                <ciclo>ASIR</ciclo>
                <ciclo>DAM</ciclo>
            </modulo>
            <modulo id="0376">
                <nombre>Implantación de aplicaciones web</nombre>
                <curso>2</curso>
                <horasSemanales>5</horasSemanales>
                <ciclo>ASIR</ciclo>
            </modulo>
        </modulos>
    </ies>


**Nombre de los módulos del ciclo "Sistemas Microinformáticos y Redes" (en la expresión final no deben aparecer las siglas SMR):**

Aplicaciones web

    /ies/modulos/modulo[ciclo='SMR']/nombre/text()

**Nombre de los ciclos que incluyen el módulo "Lenguajes de marcas y sistemas de gestión de información":**

Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Web

    /ies/ciclos/ciclo[@id = /ies/modulos/modulo[nombre = 'Lenguajes de marcas y sistemas de gestión de información']/ciclo]/nombre

**Nombre de los módulos de ciclos de Grado Superior:**

Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Implantación de aplicaciones web

    /ies/modulos/modulo[ciclo = /ies/ciclos/ciclo[grado = 'Superior']/@id]/nombre

**Nombre de los módulos de ciclos cuyo título se aprobó en 2008:**

Aplicaciones web

    /ies/modulos/modulo[ciclo = /ies/ciclos/ciclo[decretoTitulo/@año = '2008']/@id]/nombre/text()

**Grado de los ciclos con módulos de primer curso:**

Superior
Superior

    /ies/ciclos/ciclo[@id = /ies/modulos/modulo[curso = 1]/ciclo]/grado/text()