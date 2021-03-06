------------------------------------------------------------------------------------------------
-- SELECT con suncolsultas y JOINS
------------------------------------------------------------------------------------------------
-- 1
-- Nombre y apellido del empleado que más gana.
select first_name,last_name
from employees
where 
salary = (select max(salary) from employees);
-- 2
-- Nombre, apellido y salario de los empleados que ganan más que la media de salarios.
select
first_name,last_name,salary
from 
employees
where 
salary > (select avg(salary) from employees);

-- 3
-- Nombre y apellido del jefe del departamento de Marketing
select first_name,last_name
from employees
where employee_id in (select manager_id
                      from departments
                      where department_id in (select department_id
                                             from departments
                                             where department_name='Marketing'
                                             group by department_id));
-- 4
-- Nombre y apellido  de los empleados del departamento de Marketing
select first_name,last_name
from employees
where department_id in (select department_id
                        from departments
                        where department_name = 'Marketing');
-- 5
-- Nombre, apellido, salario, nombre del departamento y ciudad
-- del empleado que gana más y el que menos
select
employees.first_name,employees.last_name,employees.salary,department_name,locations.city
    from
    employees
    join departments using(department_id)
    join locations using(location_id)
    where
    salary = (select max(salary) from employees)
    union
    select
    employees.first_name,employees.last_name,employees.salary,department_name,locations.city
        from
        employees
        join departments using(department_id)
        join locations using(location_id)
        where
        salary = (select min(salary) from employees);

-- 6
-- Número de empleados y número de departamentos por ciudad (nombre)
select city,count(employee_id),count(departments.department_id)
from locations
join departments on departments.location_id=locations.location_id
join employees on departments.department_id=employees.department_id
group by city;
-- 7
-- Número de empleados y número de departamentos de todas las ciudades (nombre)
-- ordenado por número de empleados descendentemente
select locations.city,count(distinct employees.employee_id)"Number of employees",count(distinct departments.department_id)"Number of departments"
from locations
full join departments on locations.location_id=departments.location_id
full join employees on departments.department_id=employees.department_id 
group by locations.city
order by count(employees.employee_id) desc;
-- 8
-- Mostrar el número de empleado, nombre y apellido de los empleados
-- que sean jefes tanto como de departamento como de otro empleado
-- indicando en una sola columna con un literal 'DEP' si es jefe de departamento
-- y 'EMP' si es jefe de otro empleado. Ordenados por número de empleado.
select distinct manager_id,
'DEP'Tipo_Jefe,employees.first_name,employees.last_name,employees.employee_id
from departments
join employees using(manager_id)
union
select distinct manager_id,'EMP',employees.first_name,employees.last_name,employees.employee_id
from employees
join departments using(manager_id)
order by employee_id asc;

-- 9
-- Listar el nombre, apellido y salario de los tres empleados que ganan más 
select rownum,first_name from  (select first_name,last_name,salary
from employees
where salary is not null order by salary DESC  ) where rownum <4 ;
-- 10
-- Imaginad que queremos crear nombres de usuario para direcciones de correo.
-- Cuyo formato es la primera letra del nombre más el apellido.
-- Queremos saber si del listado de nombres y apellidos alguien coinciden
Select 
concat(concat(substr (first_name,1,1),''),last_name)"Initial and last name",
count(employee_id)
from employees
group by (concat(substr (first_name,1,1),''),last_name)
having count(employee_id)>1;
-- 11
-- Listar nombre, apellido y un literal que indique el salario.
-- 'BAJO' si el salario es menor a la mediabaja (media entre el salario mínimo y la media de salarios)
-- 'ALTO' si el salario es mayor a la mediaalta (media entre el salario máximo y la media de salarios)
-- 'MEDIO' si el salario está entre la mediabaja y medialata.

Select 
first_name,Last_name,
CASE
    when salary < (trunc((select avg(salary) from employees)+(select min(salary) from employees)/2)) then
    'BAJO'
    when salary > (trunc((select avg(salary) from employees)+(select max(salary) from employees)/2)) then
    'ALTO'
    else
    'MEDIO'
    end SALARIO,salary
    FROM employees
    order by salary desc;

-- 12
-- Número de empleados dados de alta por día
-- entre dos fechas. Ej: entre 1997-10-10 y 1998-03-07
-- y para una o varias ciudades. Ej: Seattle, Rome
-- (Pensad que es una consulta que se va adaptar a variables
-- es decir, que las ciudades o el rango de fechas varia
-- en la parte visual de la aplicación se muestran desplegables
-- para escoger los valores, pero luego eso se reemplaza en la consulta)
-- Aquí usamos valores fijos de ejemplo.
select count(employee_id),hire_date
from employees
where hire_date between (to_date('1997/10/10','yyyy/mm/dd')) and (to_date('1998/03/07','yyyy/mm/dd'))
group by hire_date;    

join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id

select city
from locations
where city='Roma' or city= 'Seattle';
/*no se unirlas aun, WIP*/
-- 13
-- Un listado en el que se indique en líneas separadas
-- una etiqueda que describa el valor y como valor:
-- el número de empleados en Seattle, 
-- el número de departamentos con empleados en Seattle
-- el número de departamentos sin empleados en Seattle
-- el número de jefes de empleado en Seattle
-- el número de jefes de departamento en Seattle

-- 14
-- Nombre, apellido, email, department_name
-- de los empleados del departamento con más empleados

select 
first_name,last_name,email,departments.department_name
from employees
join departments on employees.department_id = departments.department_id
where departments.department_id = 
(select 
department_id
from
(select department_id,count(employee_id) empleados
from employees
group by department_id
order by 2 desc)
where rownum = 1);

-- 15
-- Cuál es la fecha en la que más empleados
-- se han dado de alta
select hire_date, count(employee_id)
from employees
group by hire_date
having count(employee_id)=(select max (count(employee_id))
                          from employees
                        group by hire_date);
------------------------------------------------------------------------------------------------
