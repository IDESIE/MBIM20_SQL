------------------------------------------------------------------------------------------------
-- SELECT con suncolsultas y JOINS
------------------------------------------------------------------------------------------------
-- 1
-- Nombre y apellido del empleado que más gana.
Select first_name, last_name
from employees
where salary = (select max(salary) from employees);
-- 2
-- Nombre, apellido y salario de los empleados que ganan más que la media de salarios.

-- 3
-- Nombre y apellido del jefe del departamento de Marketing
select department_name, manager_id
from departments
where department_name='Marketing';



select first_name, last_name
from employees
where employee_id=(select manager_id
                    from departments
                    where department_name='Marketing');
-- 4
-- Nombre y apellido  de los empleados del departamento de Marketing

-- 5
-- Nombre, apellido, salario, nombre del departamento y ciudad
-- del empleado que gana más y el que menos

-- 6
-- Número de empleados y número de departamentos por ciudad (nombre)
select count(first_name)"Numero de empleados", count(department_name)"Numero de departamentos", city "Ciudad"
from employees
    join departments on employees.department_id = departments.department_id
    join locations on locations.location_id = departments.location_id
    group by locations.city;
-- 7
-- Número de empleados y número de departamentos de todas las ciudades (nombre)
-- ordenado por número de empleados descendentemente

-- 8
-- Mostrar el número de empleado, nombre y apellido de los empleados
-- que sean jefes tanto como de departamento como de otro empleado
-- indicando en una sola columna con un literal 'DEP' si es jefe de departamento
-- y 'EMP' si es jefe de otro empleado. Ordenados por número de empleado.

-- 9
-- Listar el nombre, apellido y salario de los tres empleados que ganan más
SELECT first_name, last_name, salary FROM ( SELECT * FROM employees ORDER BY salary desc) WHERE rownum <= 3;
-- 10
-- Imaginad que queremos crear nombres de usuario para direcciones de correo.
-- Cuyo formato es la primera letra del nombre más el apellido.
-- Queremos saber si del listado de nombres y apellidos alguien coinciden

-- 11
-- Listar nombre, apellido y un literal que indique el salario.
-- 'BAJO' si el salario es menor a la mediabaja (media entre el salario mínimo y la media de salarios)
-- 'ALTO' si el salario es mayor a la mediaalta (media entre el salario máximo y la media de salarios)
-- 'MEDIO' si el salario está entre la mediabaja y medialata.

-- 12
-- Número de empleados dados de alta por día
-- entre dos fechas. Ej: entre 1997-10-10 y 1998-03-07
-- y para una o varias ciudades. Ej: Seattle, Rome
-- (Pensad que es una consulta que se va adaptar a variables
-- es decir, que las ciudades o el rango de fechas varia
-- en la parte visual de la aplicación se muestran desplegables
-- para escoger los valores, pero luego eso se reemplaza en la consulta)
-- Aquí usamos valores fijos de ejemplo.
SELECT employee_id, hire_Date, city
FROM employees 
    join departments on employees.department_id = departments.department_id
    join locations on departments.location_id = locations.location_id
        WHERE hire_date > to_date('16/06/01', 'DD/MM/YY') 
        AND hire_date < to_date('18/06/03', 'DD/MM/YY')
        AND (city = 'Seattle' or city = 'South San Francisco');
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

-- 15
-- Cuál es la fecha en la que más empleados
-- se han dado de alta

------------------------------------------------------------------------------------------------
