------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un empleado llamado James Dexter 
en el departamento de IT Innovation 
que se encuentra en la ciudad de Madrid, Spain
Y como tipo de trabajo: Software Engineering 
*/
insert into countries (country_id, country_name, region_id)
values ('SP', 'Spain', 1);
insert into locations (location_id, postal_code, city, country_id)
values (3300, 28032, 'Madrid', 'SP');
insert into departments (department_id,department_name, location_id)
values (280, 'IT Innovation', 3300);
insert into jobs (job_id,job_title, min_salary, max_salary)
values ('SF_ENGI', 'Software Engineering', 5000, 10000);
insert into employees (employee_id, first_name, last_name, email, hire_date, job_id, department_id)
values(207,'James','Dexter', 'JDEXTER', sysdate,'SF_ENGI', 280);
/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
*/
select first_name, last_name, department_name, city, country_name, job_title
from employees
    join departments on employees.department_id = departments.department_id
    join locations on departments.location_id = locations.location_id
    join jobs on employees.job_id = jobs.job_id
    join countries on locations.country_id = countries.country_id;
/* 2
Actualizarle el salario a 60000
*/
update jobs
  SET max_salary = 60000
where job_id='SF_ENGI';

update employees
  SET salary = 60000
where last_name='Dexter';
/* 3
Colocarle una comisión igual a la media de comisiones
Manteniendo dos centésimas como valor.
*/
update employees
set commission_pct =    (select round(avg(commission_pct),2)
                        from employees)
where last_name='Dexter';
/* 4
Anonimizar sus datos personales: nombre, apellido, email, teléfono
*/
