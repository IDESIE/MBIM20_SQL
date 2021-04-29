--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1 LJ
Describir la tabla employees 
*/
DESC employees;
/* 2 L
Describir la tabla departments
*/
Desc departments;
/* 3 A
Describir la tabla locations
*/

/* 4 LJ
Datos de la tabla regions
*/

/* 5 L
Datos de la tabla countries
*/
select country_id,
    country_name
    region_id
from countries;
/* 6 A
Ciudad y estado de las localidades
*/

/* 7 LJ
Nombre, apellido, salario de los empleados
*/

/* 8 L
Número de departamento, nombre, y manager_id de los departamentos
*/
select departments.department_id,
       first_name,
       employees.manager_id
       
from employees 
     join departments on employees.department_id = departments.department_id;
/* 9 A
Número y nombre de departamento, además, el código del empleado jefe,
de la localidad 1700.
*/

/* 10 LJ 
Nombre y número de departamento de los empleados.
*/

/* 11 L 
Nombre y número de departamento de los empleados
ordenados por número de departamento ascendentemente.
*/
select departments.department_id,
       department_name
       
   
from employees 
     join departments on employees.department_id = departments.department_id
     order by department_name asc;
/* 12 A
Listar los distintos números de departamento en el que trabajan los empleados.
*/

/* 13 LJ 
Listar los distintos números de departamento en el que trabajan los empleados
ordenados descendentemente.
*/

/* 14 L
Nombre, apellido y salario ordenados por id de empleado descendentemente
*/
select first_name,
       last_name,
       salary
from employees
order by employee_id desc;
/* 15 A
Nombre, apellido y salario ordenado por apellido ascendentemente y salario descendentemente
*/

/* 16 LJ 
códigos de los distintos trabajos que existen en el departamento 30
*/

/* 17 L
códigos de los distintos trabajos que existen en el departamento 60
ordenados descendentemente
*/
select department_name
   from departments
   where department_id= 60;
/* 18 A
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
*/

/* 19 LJ
Nombre, apellido y correo de los empleados del departamento 30
cuyo salario es menor a 3000
o que sean del departamento 90
*/

/* 20 L
nombre, apellido y número de departamento de los empleados
que no tengan comisión. Ordenados por número de departamento 
del mayor a menor y por apellido descendentemente.
*/
select first_name,
       last_name,
       department_id,
       commission_pct
from employees
where commission_pct is null
order by  last_name desc,
         department_id asc
;
/* 21 A
nombre, apellido, número de departamento y salario de los empleados
que no tengan comisión o su salario sea menor a 6000 
y que se cumpla que son del departamento 60 o del 90
ordenados por número de departamento descendentemente
y por salario ascendentemente.
*/

/* 22 LJ
Número de empleado, nombre y apellido de los empleados
desde el apellido que empieza por L hasta los que su apellido
empieza por la R, incluidos.
*/

/* 23 L
Lista de apellidos que su segunda letra sea una 'a'
*/
select last_name
from employees
where last_name like '_a%';
/* 24 A
Lista de apellidos de empleados donde el apellido empieza por alguna vocal
y que su salario es menor a 3000 o mayor a 9000
y debe cumplirse que su departamento es el 30, 60 o 90.
*/

/* 25 LJ
Nombre, apellido y el salario de los empleados
pero como salario una etiqueta que indique 
'BAJO' si es menor a 4280, 'ALTO' si es mayor a 15230
y 'MEDIO' si está entre medias
*/

/* 26 L
Listar los correos concatenados con el texto '@company.com'
*/
select concat (email, '@company.com')
from employees
;
/* 27 A
Lista de nombres de las ciudades que su país es 'US'
*/

/* 28 LJ
Lista de nombre de las ciudades que su país no es Estados Unidos
*/

/* 29 L
Número y nombre de los departamentos que tienen un jefe.
*/
select department_id,
      department_name,
      manager_id
      from departments
where manager_id is not  null;
/* 30 A
Número y nombre de los departamentos que no tienen jefe.
*/

/* 31 LJ 
Nombre de las columnas de la tabla de empleados 'Employees'
que no tienen un guión bajo en el nombre.
*/

--
------------------------------------------------------------------------------------------------
