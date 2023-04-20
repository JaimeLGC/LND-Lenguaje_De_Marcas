# XML: XPATH LND

## Ejercicio 1

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta
deseada.

    <?xml version="1.0" encoding="UTF-8"?>
    <ies>
        <nombre>IES Puerto de la Cruz - Telesforo Bravo</nombre>
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
    </ies>

Nombre del Instituto:
<nombre> IES Puerto de la Cruz - Telesforo Bravo </nombre>

    /ies/nombre

Página web del Instituto:
https://www3.gobiernodecanarias.org/medusa/edublog/iespuertodelacruztelesforobravo/

    /ies/web

**Nombre de los Ciclos Formativos:**

Administración de Sistemas Informáticos en Red Desarrollo de Aplicaciones Web Sistemas
Microinformáticos y Redes

    /ies/ciclos/ciclo/nombre

**Siglas por las que se conocen los Ciclos Formativos:**

id="ASIR" id="DAM" id="SMR"

    /ies/ciclos/ciclo/@id

**Años en los que se publicaron los decretos de título de los Ciclos Formativos:**

año="2009" año="2010" año="2008"

    /ies/ciclos/ciclo/decretoTitulo

**Ciclos Formativos de Grado Medio (se trata de obtener el elemento <ciclo> completo):**

<ciclo id="SMR"> <nombre>Sistemas Microinformáticos y Redes</nombre>
<grado>Medio</grado> <decretoTitulo año="2008"/> </ciclo>

    /ies/ciclos/ciclo[grado="Medio"]/*

**Nombre de los Ciclos Formativos de Grado Superior:**

<nombre>Administración de Sistemas Informáticos en Red</nombre> <nombre>Desarrollo de
Aplicaciones Multiplataforma</nombre>

    /ies/ciclos/ciclo[grado="Superior"]/nombre

**Nombre de los Ciclos Formativos anteriores a 2010:**

Administración de Sistemas Informáticos en Red Sistemas Microinformáticos y Redes

    /ies/ciclos/ciclo[decretoTitulo/@año<2010]/nombre

**Nombre de los Ciclos Formativos de 2008 o 2010:**

Desarrollo de Aplicaciones Multiplataforma Sistemas Microinformáticos y Redes

    /ies/ciclos/ciclo[decretoTitulo/@año=2010 or @año=2008]/nombre

