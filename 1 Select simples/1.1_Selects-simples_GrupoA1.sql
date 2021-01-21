------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla employees
*/
desc employees;
/* 2
Describir la tabla departments
*/desc departments;

/* 3
Describir la tabla locations
*/
desc locations;
/* 4
Datos de la tabla regions
*/
select *
from regions;
/* 5
Datos de la tabla countries
*/select country_id,country_name,region_id
from countries;

/* 6
Ciudad y estado de las localidades
*/
select city,state_province
from locations;
/* 7
Nombre, apellido, salario de los empleados
*/
select first_name,last_name,salary
from employees;
/* 8
Número de departamento, nombre, y manager_id de los departamentos
*/select department_id,department_name,manager_id
from departments;

/* 9
Número y nombre de departamento, además, el código del empleado jefe,
de la localidad 1700.
*/
select department_id,department_name,manager_id
from departments
where location_id=1700;
/* 10
Nombre y número de departamento de los empleados.
*/
select first_name,department_id
from employees;
/* 11
Nombre y número de departamento de los empleados
ordenados por número de departamento ascendentemente.
*/select department_id,department_name
from departments
order by
department_id ASC;

/* 12
Listar los distintos números de departamento en el que trabajan los empleados.
*/
select department_id
from employees;
/* 13
Listar los distintos números de departamento en el que trabajan los empleados
ordenados descendentemente.
*/
select department_id
    from employees
    where department_id is not null
    group by department_id
    order by department_id desc;
/* 14
Nombre, apellido y salario ordenados por id de empleado descendentemente
*/select first_name,last_name,salary
from employees
order by
employee_id DESC;

/* 15
Nombre, apellido y salario ordenado por apellido ascendentemente y salario descendentemente
*/
select first_name,last_name,salary
from employees
order by last_name ASC,salary DESC;
/* 16
códigos de los distintos trabajos que existen en el departamento 30
*/
select job_id
from employees
where department_id=30
group by job_id;
/* 17
códigos de los distintos trabajos que existen en el departamento 60
ordenados descendentemente
*/select job_id, department_id
from employees
WHERE
department_id = 60
order by
job_id DESC;

/* 18
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
*/
select first_name,last_name,email
from employees
where department_id=30 and salary <3000;

/* 19
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
o que sean del departamento 90
*/
select first_name,last_name,email
from employees
where (department_id=30 and salary<3000)or department_id=90;
/* 20
nombre, apellido y número de departamento de los empleados
que no tengan comisión. Ordenados por número de departamento 
del mayor a menor y por apellido descendentemente.
*/select department_id, last_name, first_name
from employees
WHERE
commission_pct IS NULL
order by
1 DESC,
2 DESC;

/* 21
nombre, apellido, número de departamento y salario de los empleados
que no tengan comisión o su salario sea menor a 6000 
y que se cumpla que son del departamento 60 o del 90
ordenados por número de departamento descendentemente
y por salario ascendentemente.
*/
select first_name,last_name,department_id,salary
from employees
where (commission_pct is null or salary< 6000) and (department_id=60 or department_id=90)
order by 3 DESC, 4 ASC;
/* 22
Número de empleado, nombre y apellido de los empleados
desde el apellido que empieza por L hasta los que su apellido
empieza por la R, incluidos.
*/
select employee_id,first_name,last_name
from employees
where
    last_name like 'L%'
    or last_name like 'M%'
    or last_name like 'N%'
    or last_name like 'Ñ%'
    or last_name like 'O%'
    or last_name like 'P%'
    or last_name like 'Q%'
    or last_name like 'R%'
order by last_name asc; 
/* 23
Lista de apellidos que su segunda letra sea una 'a'
*/select last_name
from employees
Where 
last_name LIKE'_a%'
order by
1 ASC;

/* 24
Lista de apellidos de empleados donde el apellido empieza por alguna vocal
y que su salario es menor a 3000 o mayor a 9000
y debe cumplirse que su departamento es el 30, 60 o 90.
*/
select last_name
from employees
where (last_name like 'A%' 
   or last_name like 'E%'
   or last_name like 'I%'
   or last_name like 'O%'
   or last_name like 'U%')
   and (salary <3000 or salary > 9000)
   and (department_id=30 or department_id=60 or department_id=90);   
/* 25
Nombre, apellido y el salario de los empleados
pero como salario una etiqueta que indique 
'BAJO' si es menor a 4280, 'ALTO' si es mayor a 15230
y 'MEDIO' si está entre medias
*/

/* 26
Listar los correos concatenados con el texto '@company.com'
*/ select concat(email,'@company.com')
from employees;

/* 27
Lista de nombres de las ciudades que su país es 'US'
*/
select city
from locations
where country_id='US';
/* 28
Lista de nombre de las ciudades que su país no es Estados Unidos
*/
select city, country_id
from locations
where country_id not in ('US');
/* 29
Número y nombre de los departamentos que tienen un jefe.
*/select department_id,department_name
from departments
WHERE
manager_id IS NOT NULL;

/* 30
Número y nombre de los departamentos que no tienen jefe.
*/
select department_id,department_name
from departments
WHERE manager_id IS NULL;
/* 31
Nombre de las columnas de la tabla de empleados 'Employees'
que no tienen un guión bajo en el nombre.
*/

--
------------------------------------------------------------------------------------------------
