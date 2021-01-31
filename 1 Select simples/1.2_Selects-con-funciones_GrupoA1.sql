------------------------------------------------------------------------------------------------
-- SELECT CON FUNCIONES
------------------------------------------------------------------------------------------------
/* 1
Mostrar la fecha actual de la siguiente forma:
Fecha actual
------------------------------
Sábado, 11 de febrero de 2017. 16:06:06

El día en palabras con la primera letra en mayúsculas, seguida de una coma, el día en números,
la palabra "de", el mes en minúscula en palabras, la palabra "de", el año en cuatro dígitos
finalizando con un punto. Luego la hora en formato 24h con minutos y segundos.
Y de etiqueta del campo "Fecha actual".
*/
select to_char(sysdate, 'Day"," dd "de" month "de" yyyy"." hh:mi:ss')"Fecha actual" 
from dual;
/* 2
Día en palabras en el cual naciste
*/
select
rtrim(to_char(to_date('04/01/1994','dd/mm/yyyy'),'Day'))
from dual;

/* 3
La suma de salarios, cuál es el mínimo, el máximo y la media de salario
*/
select
   sum (salary) "Suma de salarios",
   min (salary)"Salario mínimo",
   max(salary)"Salario máximo",
   avg(salary)"Media de salario"
from employees;    
/* 4
Cuántos empleados hay, cuántos tienen salario y cuántos tienen comisión.
*/
select 
    count(employee_id)"Nº de empleados",
    count(salary)"Nº de empleados con salario",
    count(commission_pct)"Nº de empleados con comisión"
from employees;

/* 5
Por un lado la media entre la media de salarios y el mínimo salario
Y por otro lado, la media entre la media de salarios y el máximo salario
Solo la parte entera, sin decimales ni redondeo.
*/
select
trunc((avg(salary)+min(salary))/2) "Media Baja",
trunc((avg(salary)+max(salary))/2) "Media Alta"
from employees;

/* 6
Listar el número de departamento y el máximo salario en cada uno de ellos.
*/
select 
max (salary)"Máximo salario"
from employees
group by department_id;
   
/* 7
Mostrar los nombres de los empleados que se repiten indicando cuántos hay del mismo
en orden descendente.
*/
select first_name,count(employee_id)"Number of employees"
from employees
group by first_name
having count(employee_id)>1
order by count(employee_id) desc;
/* 8
Mostrar en una fila cuántos empleados son jefes de departamento
y en otra fila cuántos son jefes de otros empleados.
*/
select count(distinct manager_id) Nº_Jefe,
'DEPARTAMENTO'Tipo_Jefe
from departments
union
select count(distinct manager_id), 
'EMPLEADOS'
from employees;

/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/
select first_name,last_name
from employees
where first_name like '_%' and last_name like '_%';   /*ESTA NO ME SALE DEL TODO*/
/* 10
Número de empleados dados de alta por día
ordenados descendentemente por la fecha
*/
select hire_date fecha,count(employee_id)"Nº de empleados dados de alta"
from employees
group by hire_date
order by hire_date desc;
/* 11
Un listado por año de la media de salarios
de los empleados que ingresaron ese año
ordenados de forma descendente por año
*/
select to_char(hire_date,'yy'),avg(salary)
from employees
group by to_char(hire_date,'yy')
order by 1 DESC;

/* 12
Nombre del día en el que más empleados
se han dado de alta
*/
select count (to_char(hire_date,'day')),to_char(hire_date,'day')
from employees
    group by to_char(hire_date,'day')
    order by 1 desc;   
select count (to_char(hire_date,'day')),to_char(hire_date,'day')
from employees
    group by to_char(hire_date,'day')
    having count (to_char(hire_date,'day'))=19;                          /*ESTA PODRÍA ESTAR MEJOR*/

------------------------------------------------------------------------------------------------
