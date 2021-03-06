------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un empleado llamado James Dexter 
en el departamento de IT Innovation 
que se encuentra en la ciudad de Madrid, Spain
Y como tipo de trabajo: Software Engineering 
*/

insert into jobs values('IT_SW_ENG','Software Engineer',6000,12000);
commit;

insert into countries values('SP','Spain',(select region_id from regions where region_name = 'Europe'));
commit;

insert into locations values (3300,'Calle Montalbán 3','28014','Madrid','Madrid',(select country_id from countries where country_name = 'Spain'));
commit;

insert into departments(department_id, department_name, location_id) values (280,'IT Innovation',3300);
commit;

insert into employees (employee_id,first_name,last_name,email,hire_date,job_id,department_id)
values (207,'James','Dexter','JDexter@gmail.com',(select current_date from dual),'IT_SW_ENG',280);
commit;

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
*/

select * from employees 
full join departments on employees.department_id=departments.department_id
full join jobs on employees.job_id=jobs.job_id
full join locations on departments.location_id=locations.location_id
full join countries on locations.country_id=countries.country_id
where first_name = 'James' and last_name = 'Dexter';

/* 2
Actualizarle el salario a 60000
*/
update employees
set
salary = 60000
where 
employee_id = 207;

to check
select first_name,last_name,departments.department_name,jobs.job_title,LOCATIONS.CITY,COUNTRIES.COUNTRY_NAME,salary
from employees
join departments on employees.department_id = departments.department_id
join jobs on employees.job_id = jobs.job_id
join locations on departments.LOCATION_id = locations.LOCATION_id
join COUNTRIES on LOCATIONS.COUNTRY_id = COUNTRIES.COUNTRY_id
where last_name = 'Dexter';

/* 3
Colocarle una comisión igual a la media de comisiones
Manteniendo dos centésimas como valor.
*/
update employees
set comission_pct= (select avg(comission_pct)    /*hay que meter la avg dentro de una select,WIP*/
where last_name='Dexter';
/* 4
Anonimizar sus datos personales: nombre, apellido, email, teléfono
*/

update employees
set
first_name = 'Anonimo'
where 
employee_id = 207;

update employees
set
last_name = 'Anonimo'
where 
employee_id = 207;
update employees
set
email = 'Null'
where 
employee_id = 207;
update employees
set
phone_number = 'Null'
where 
employee_id = 207;

To check
select first_name,last_name,email,Phone_number,departments.department_name,jobs.job_title,LOCATIONS.CITY,COUNTRIES.COUNTRY_NAME,
salary,commission_pct
from employees
join departments on employees.department_id = departments.department_id
join jobs on employees.job_id = jobs.job_id
join locations on departments.LOCATION_id = locations.LOCATION_id
join COUNTRIES on LOCATIONS.COUNTRY_id = COUNTRIES.COUNTRY_id
where employee_id = 207;