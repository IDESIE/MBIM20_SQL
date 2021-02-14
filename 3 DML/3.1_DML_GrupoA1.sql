------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un empleado llamado James Dexter 
en el departamento de IT Innovation 
que se encuentra en la ciudad de Madrid, Spain
Y como tipo de trabajo: Software Engineering 
*/
/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
*/

/* 2
Actualizarle el salario a 60000
*/

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
