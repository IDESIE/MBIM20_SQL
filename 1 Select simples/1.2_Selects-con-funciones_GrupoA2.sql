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
select current_date 
from dual;

select current_timestamp "Fecha actual"
from dual;

select to_char(sysdate, 'DD/MON/YYYY')"Fecha actual"
from dual;

select to_char(sysdate, 'Day, DD "de" month "de" YYYY "." HH:MI:SS')"Fecha actual"
from dual;

/* 2
Día en palabras en el cual naciste
*/
select '30/09/1994' "Dia que nací"
from dual;

select 'Treina de setiembre de mil novecientos noventa y cuatro' "Dia que nací"
from dual;

select TO_DATE('30/09/1994','DD/MM/YYYY')
from dual;

select to_char((TO_DATE('30/09/1994','DD/MM/YYYY')), 'Day, DD "de" month "de" YYYY')"Dia que nací"
from dual;

/* 3
La suma de salarios, cuál es el mínimo, el máximo y la media de salario
*/
select sum(salary),min(salary),max(salary),round(avg(salary),2)
from employees;
/* 4
Cuántos empleados hay, cuántos tienen salario y cuántos tienen comisión.
*/
select count(employee_id), count(salary), count(commission_pct)
from employees;
/* 5
Por un lado la media entre la media de salarios y el mínimo salario
Y por otro lado, la media entre la media de salarios y el máximo salario
Solo la parte entera, sin decimales ni redondeo.
*/
select sum(salary) "Suma de salarios", min(salary) "Mínimo de salario", max(salary) "Máximo de salario", round(avg(salary),2) "Media de salario"
from employees;

select avg(salary) "Media salarial" , min(salary) "Mínimo salarial"
from employees;
            
select round(avg(salary),0) "Media de la media y mínimo"
from employees
where salary<(select avg(salary)
            from employees);

 select round(avg(salary),0) "Media de la media y máximo"
from employees
where salary>(select avg(salary)
            from employees);  
/* 6
Listar el número de departamento y el máximo salario en cada uno de ellos.
*/
select max(salary),department_id
from employees
group by department_id
order BY 2 ASC;
/* 7
Mostrar los nombres de los empleados que se repiten indicando cuántos hay del mismo
en orden descendente.
*/
select first_name
from employees
group by first_name
HAVING COUNT(first_name) > 1
order by first_name desc;
/* 8
Mostrar en una fila cuántos empleados son jefes de departamento
y en otra fila cuántos son jefes de otros empleados.
*/
select employee_id, manager_id
from employees;

select manager_id, department_id
from departments;

select manager_id, employee_id
from employees;

select count(manager_id)
from departments;

select count(manager_id)
from employees;

select count(employees.manager_id), count(departments.manager_id)
from employees, departments;

select count(employees.manager_id), count(departments.manager_id)
from employees, departments
where departments.manager_id=employees.manager_id;

select count(employees.manager_id), count(departments.manager_id)
from employees, departments;

select count(manager_id)
from departments
union all
select count(manager_id)
from employees;

select distinct manager_id
from employees
where manager_id is not null;

select count (distinct manager_id)
from employees;

select count(manager_id)
from departments
union all
select count (distinct manager_id)
from employees;
/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/

select first_name, last_name
from employees
where substr(first_name, 1,1) = substr(last_name, 1,1);

/* 10
Número de empleados dados de alta por día
ordenados descendentemente por la fecha
*/
select count(employee_id)"Numero de empleados", hire_date"Fecha de Alta"
from employees
group by hire_date
order by hire_date desc;
/* 11
Un listado por año de la media de salarios
de los empleados que ingresaron ese año
ordenados de forma descendente por año
*/
select avg(salary), hire_date 
from employees
group by hire_date;

select extract(YEAR from sysdate)
from dual;

select distinct extract(YEAR from hire_date)
from employees
group by hire_date;

select distinct extract(YEAR from hire_date)
from employees
group by hire_date;

select avg(salary), hire_date
from employees
group by hire_date
order by hire_date asc;

select avg(salary), to_char(hire_date, 'YYYY')
from employees
group by to_char(hire_date, 'YYYY')
order by to_char(hire_date, 'YYYY') desc;
/* 12
Nombre del día en el que más empleados
se han dado de alta
*/
HAVING count(employee_id) = (select max(count(employee_id))
from employees
group by hire_date)
group by hire_date
order by count(employee_id) desc;
------------------------------------------------------------------------------------------------
