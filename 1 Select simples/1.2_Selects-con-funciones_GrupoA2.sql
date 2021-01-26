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

/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/

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

/* 12
Nombre del día en el que más empleados
se han dado de alta
*/

------------------------------------------------------------------------------------------------
