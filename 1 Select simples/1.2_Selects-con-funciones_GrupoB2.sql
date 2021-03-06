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


/* 2
Día en palabras en el cual naciste
*/

/* 3
La suma de salarios, cuál es el mínimo, el máximo y la media de salario
*/

/* 4
Cuántos empleados hay, cuántos tienen salario y cuántos tienen comisión.
*/

select 
    count(*),
    count (employee_id),
    count (salary),
    count (commission_pct)  
from employees;

/* 5
Por un lado la media entre la media de salarios y el mínimo salario
Y por otro lado, la media entre la media de salarios y el máximo salario
Solo la parte entera, sin decimales ni redondeo.
*/

/* 6
Listar el número de departamento y el máximo salario en cada uno de ellos.
*/

/* 7
Mostrar los nombres de los empleados que se repiten indicando cuántos hay del mismo
en orden descendente.
*/

/* 8
Mostrar en una fila cuántos empleados son jefes de departamento
y en otra fila cuántos son jefes de otros empleados.
*/

   select  
    
    count (distinct employees.manager_id)" Jefes de otros empleados",
    
      count (distinct departments.manager_id) " Jefes de departamentos"
    
 from employees, departments;


/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/

/* 10
Número de empleados dados de alta por día
ordenados descendentemente por la fecha
*/

/* 11
Un listado por año de la media de salarios
de los empleados que ingresaron ese año
ordenados de forma descendente por año
*/

/* 12
Nombre del día en el que más empleados
se han dado de alta
*/


      /* Nombre del día específico*/
  
select  TO_CHAR (HIRE_DATE, 'Day') "Nombre del día con más altas"
from ( select  
    count (distinct employee_id)
        employee_id, hire_date
 from employees 
  group by (hire_date))
  where EMPLOYEE_ID = (select max (employee_id) from ( select  
    count (distinct employee_id)
        employee_id, hire_date
 from employees 
  group by (hire_date)));
  



  /* COMPROBACIÓN. Listando las altas en orden de mayor a menor con las fechas 

     select  
    count (distinct employee_id)
        employee_id, hire_date, to_char (hire_date, 'Day')
 from employees 
  group by (hire_date)
  order by employee_id desc; 


  */



      
               /* prueba para EL NOMBRE DEL DÍA CON DÍAS DE LA SEMANA
  



select  TO_CHAR (HIRE_DATE, 'Day') "Nombre del día con más altas"
from ( select  
    count (distinct employee_id)
        employee_id, hire_date
 from employees 
  group by (hire_date))
  where EMPLOYEE_ID = 
  
                (select max (employee_id) 
                    from ( select  
                        count (distinct employee_id)
                            employee_id, TO_CHAR (hire_date, 'Day')
                     from employees 
                      group by to_char (hire_date, 'Day'))); */
------------------------------------------------------------------------------------------------
