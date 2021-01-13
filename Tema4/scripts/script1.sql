-- Script que muestra información sobre el servidor de base de datos

-- versión del servidor
select version() into @ver;
select concat('La versión del servidor es la ',@var) as '';

-- información de ejecución
select 'script ejecutado desde: ' as '';
system pwd
select concat('por el usuario de base de datos ''',user(),'''') as'';
select concat('el día ', current_date(), ' a las ' current_time()) as '';

-- muestra las tablas que tiene cada base de datos
select 'NÚMERO DE TABLAS POR BASE DE DATOS';
select '----------------------------------';
select count(tables.table_name), table_schema from information_schema.tables group by table_schema;

-- obtiene el número de filas de la consulta anterior para saber cuántas bases de datos
-- tienen tablas
select found_rows()into @num_db_con_tablas;

-- cuenta el número de base de datos que hay
select count(*) into @num_db from information_schema.schemata;

-- muestra información de las bases de datos que contiene el servidor
select concat('El servidor tiene ',@num_db, ' bases de datos, ',' pero solo ',@num_db_con_tablas, ' tienen tablas') as '';
