select 
    first_name, 
    last_name, 
    salary,  
    department_id,
    HIRE_DATE,
    TO_CHAR(HIRE_DATE, 'day dd month yyyy hh24:mi:ss')ALIAS,
    to_date ('12/12/12','dd/mm/yy'),
    coalesce(commission_pct,0),
    salary*(1+coalesce(commission_pct,0)), 
    concat (concat(SUBSTR (FIRST_NAME,1,1),'.'), 
    last_name)PRUEBA,
    '14/01/2021'"Fecha de prueba", 4*3
    from hr.employees
    order by   1 ;
    
    desc employees

/* Ejercicio de la función COUNT = CONTAR hecho en clase el día 22/12/2020*/ 