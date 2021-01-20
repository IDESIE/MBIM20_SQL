
------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla employees
*/
desc employees;
/* 2
Describir la tabla departments
*/

/* 3
Describir la tabla locations
*/

/* 4
Datos de la tabla regions
*/
select *   
from regions;
/* 5
Datos de la tabla countries
*/

/* 6
Ciudad y estado de las localidades
*/

/* 7
Nombre, apellido, salario de los empleados
*/
select first_name, last_name, salary
from employees;
/* 8
Número de departamento, nombre, y manager_id de los departamentos
*/

/* 9
Número y nombre de departamento, además, el código del empleado jefe,
de la localidad 1700.
*/

/* 10
Nombre y número de departamento de los empleados.
*/
select department_id, department_name
from departments;
/* 11
Nombre y número de departamento de los empleados
ordenados por número de departamento ascendentemente.
*/

/* 12
Listar los distintos números de departamento en el que trabajan los empleados.
*/

/* 13
Listar los distintos números de departamento en el que trabajan los empleados
ordenados descendentemente.
*/
select department_id
from departments
order by department_id desc;
/* 14
Nombre, apellido y salario ordenados por id de empleado descendentemente
*/

/* 15
Nombre, apellido y salario ordenado por apellido ascendentemente y salario descendentemente
*/

/* 16
códigos de los distintos trabajos que existen en el departamento 30
*/
select job_id
from employees
where department_id=30;
/* 17
códigos de los distintos trabajos que existen en el departamento 60
ordenados descendentemente
*/

/* 18
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
*/

/* 19
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
o que sean del departamento 90
*/
select first_name, last_name, email, department_id, salary
from employees
where department_id = 30
and salary < 3000
or department_id = 90;
/* 20
nombre, apellido y número de departamento de los empleados
que no tengan comisión. Ordenados por número de departamento 
del mayor a menor y por apellido descendentemente.
*/

/* 21
nombre, apellido, número de departamento y salario de los empleados
que no tengan comisión o su salario sea menor a 6000 
y que se cumpla que son del departamento 60 o del 90
ordenados por número de departamento descendentemente
y por salario ascendentemente.
*/

/* 22
Número de empleado, nombre y apellido de los empleados
desde el apellido que empieza por L hasta los que su apellido
empieza por la R, incluidos.
*/
select employee_id, first_name, last_name
from employees;

select SUBSTR(last_name, 1, 1) "Inicial del Apellido"
from employees
where SUBSTR(last_name, 1, 1) BETWEEN 'L' AND 'R';

select  employee_id, first_name, last_name
from employees
where SUBSTR(last_name, 1, 1) BETWEEN 'L' AND 'R'
order by last_name asc;
/* 23
Lista de apellidos que su segunda letra sea una 'a'
*/

/* 24
Lista de apellidos de empleados donde el apellido empieza por alguna vocal
y que su salario es menor a 3000 o mayor a 9000
y debe cumplirse que su departamento es el 30, 60 o 90.
*/

/* 25
Nombre, apellido y el salario de los empleados
pero como salario una etiqueta que indique 
'BAJO' si es menor a 4280, 'ALTO' si es mayor a 15230
y 'MEDIO' si está entre medias
*/

/* 26
Listar los correos concatenados con el texto '@company.com'
*/

/* 27
Lista de nombres de las ciudades que su país es 'US'
*/

/* 28
Lista de nombre de las ciudades que su país no es Estados Unidos
*/

/* 29
Número y nombre de los departamentos que tienen un jefe.
*/

/* 30
Número y nombre de los departamentos que no tienen jefe.
*/

/* 31
Nombre de las columnas de la tabla de empleados 'Employees'
que no tienen un guión bajo en el nombre.
*/

--
------------------------------------------------------------------------------------------------
