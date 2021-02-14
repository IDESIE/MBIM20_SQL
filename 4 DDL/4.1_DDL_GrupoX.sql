------------------------------------------------------------------------------------------------
-- DDL
------------------------------------------------------------------------------------------------
/* 
Se desea tener una base de datos con la información de instalaciones/edificios (falicities).
-Información acerca de las plantas, nombre, categoria, descripción, GUID (Global Unique identifier), altura.
-Sobre los espacios, nombre, categoria, descripción, altura usable, area, GUID
-componentes, nombre, descripción, GUID, numero de serie, fecha de instalación
-tipo de componentes, nombre, descripción, modelo, GUID, material, color, años de garantia

1-Generar las siguientes tablas
FACILITIES
id
guid
name
description
category
address

FLOORS
id
guid
name
category
description
height
facilityId

SPACES
id
guid
name
category
description
usableHeight
area
floorId

COMPONENTS
id
guid
name
description
serialNumber
installatedOn
spaceId
typeId

TYPES
id
guid
name
description
modelNumber
color
warrantyYears


En las definiciones establacer las siguientes restricciones
-Los guid deben ser únicos.
-No es posible dar de alta un componente sin un tipo.
-No es posible dar de alta un espacio sin una planta.
-No es posiblde dar de alta una planta sin un facility.
-Dos componentes no pueden llamarse igual, lo mismo pasa con el resto de entidades.
-La fecha de instalación de un componente por defecto es la actual.
-Los nombres no pueden estar vacíos en todas las entidades.
-Los años de garantia no pueden ser cero ni negativos.
-Se debe mantener la integridad referencial.

NOTA: Algunos ejercicios provocan errores que deben probar (para ver el error) y corregir.
*/

/*poner hr.facilities si queremos que se genere en nuestra base de datos?*/
create table facilities (
        facility_id NUMBER(6,0), 
        guid VARCHAR2(32 BYTE),
        facility_name VARCHAR2(20 BYTE)not null,
        description VARCHAR2(60 BYTE),
        category VARCHAR2(60 BYTE),
        address VARCHAR2(60 BYTE),
        
        constraint facilities_pk primary key (facility_id),
        constraint facility_name_uk UNIQUE (facility_name),
        constraint facility_guid_uk UNIQUE (guid)
);

/*poner hr.types_2 si queremos que se genere en nuestra base de datos y que no de error con la otra tabla de types?*/
create table types (
        type_id NUMBER(6,0), 
        guid VARCHAR2(32 BYTE),
        type_name VARCHAR2(20 BYTE)not null,
        description VARCHAR2(60 BYTE),
        modelNumber NUMBER(15,0),
        color VARCHAR2(15 BYTE),
        warrantyYears NUMBER(2,0),
        
        constraint types_pk primary key (type_id),
        constraint type_name_uk UNIQUE (type_name),
        constraint type_guid_uk UNIQUE (guid),
        constraint valid_warranty_years CHECK (warrantyYears > 0)
);