# Ejercicio 1
Diseña el esquema XSD para el documento XML y las siguientes consideraciones

## Agenda.xml:
<?xml version="1.0" encoding="UTF-8"?>
<libreria xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="libreria.xsd">
  <codigo>1263</codigo>
  <direccion>Juan de Juni, 31</direccion>
  <telefono>987667943</telefono>
  <propietario>
    <nombre>Juanito</nombre>
    <telefono>234555677</telefono>
  </propietario>
  <libro>
    <titulo>Cien años de soledad</titulo>
    <autor>Gabriel García Márquez</autor>
    <formato>Rústica</formato>
    <publicacion>1967</publicacion>
    <precio>23,5</precio>
  </libro>
</libreria>

## Solución

<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:element name="libreria">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="codigo" type="xs:string" minOccurs="1" maxOccurs="1">
          <xs:simpletype>
            <xs:restriction>
              <xs:minInclusive value="1000"/>
              <xs:maxInclusive value="9999"/>
            </xs:restriction>
          </xs:simpletype>
        </xs:element>
        <xs:element name="direccion" type="xs:string" minOccurs="1" maxOccurs="1"/>
        <xs:element name="telefono" minOccurs="1" maxOccurs="1"/>
        <xs:element name="propietario" minOccurs="1" maxOccurs="1"/>
        <xs:element name="libro" minOccurs="1" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="telefono">
    <xs:simpleType>
      <xs:restriction base="xs:string">
        <xs:pattern value="[0-9]{9}"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:element>
  <xs:element name="propietario">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="nombre" type="xs:string" minOccurs="1" maxOccurs="1"/>
        <xs:element name="nombre" type="xs:integer" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="libro">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="titulo" type="xs:string" minOccurs="1" maxOccurs="1"/>
      <xs:element name="autor" type="xs:string" minOccurs="1" maxOccurs="1"/>
      <xs:element name="formato" minOccurs="0" maxOccurs="1">
        <xs:simpletype>
          <xs:restriction base="xs:string">
            <xs:enumeration value="Rustica"/>
            <xs:enumeration value="Tapa blanda"/>
            <xs:enumeration value="Tapa dura"/>
          </xs:restriction>
        </xs:simpletype>
      </xs:element>
      <xs:element name="publicacion" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="precio" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="cantidad" type="xs:string" minOccurs="0" maxOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
  </xs:element>
</xs:schema>
