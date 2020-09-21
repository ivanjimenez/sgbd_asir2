# Presentación Módulo Profesional: ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS (ASGBD)

### 2º ASIR

### Docencia: Iván J.U.

### Curso 2020/2021

---

## Secuenciación

* 60 horas

* 3 sesiones a la semana

## Objetivos del Módulo

* La preparación de los sistemas para la ejecución de aplicaciones Web
* La explotación de sistemas gestores de contenido.
* La integración de las funcionalidades ofrecidas por las aplicaciones de ofimática Web.
* La utilización de lenguajes de «script» de servidor para la adaptación de soluciones Web

## Material a utilizar

### SS.OO.

* Centos 7
* Oracle Linux 7
* Windows Server 2016

### GBD
* Mysql 5.7
* ODB 12


## Gestión de Versiones, Documental y de Aulas

* github: http://https://github.com/IESLuisBraille/sgbd_asir2

* github classroom

* Aula Virtual Moodle

* Google Apps / Docs

  

```
1. Instalación y configuración de MySQL
1.1. El SGBD MySQL
1.1.1. Funciones de MySQL
1.1.2. Arquitectura de MySQL
1.2. Instalación desde el gestor de paquetes yum
1.2.1. Comprobar la instalación correcta a través de yum
1.3. Instalación compilando el código fuente
1.4. Instalación de una versión 5.1 de MySQL a través del código fuente
1.4.1. Arranque del servidor MySQL
1.4.2. Configuración del autoarranque del servidor MySQL
1.4.3. Incorporación de las herramientas clientes al PATH
1.4.4. Configuración del lenguaje de los mensajes SGBD
1.5. Instalación de una versión 5.6 de MySQL desde código fuente
1.6. Configuración de la seguridad post-instalación
1.7. Ficheros Log en MySQL
1.7.1. El log de errores
1.7.2. El log general de consultas
1.7.3. El registro de consultas lentas
1.7.4. El log binario
1.8. Instalación de phpMyAdmin
1.9. Prácticas

2. Acceso a la información en MySQL
2.1. El acceso a la información
2.2. Creación de usuarios
2.2.1. Los nombres de cuenta
2.2.2. Borrado de usuarios
2.2.3. Modificación de usuarios
2.3. Los privilegios
2.3.1. El sistema de privilegios de MySQL
2.3.2. Gestión de permisos con phpMyAdmin
2.3.3. Uso de conexiones cifradas mediante SSL
2.4. El catálogo de metadatos de MySQL
2.5. Las vistas
2.6. Prácticas

3. Automatización de tareas en MySQL. Scripts de administración
3.1. Los scripts o guiones
3.2. Script SQL en MySQL
3.2.1. Ejecución de scripts SQL en MySQL
3.3. Scripts de Sistema Operativo para el DBA de MySQL
3.4. Server Side Scripting. Otro tipo de scripts
3.5. Herramientas gráficas para scripts. MySQL Workbench
3.5.1. Creación automática de scripts SQL con MySQL Workbench
3.5.2. Creación automática de scripts de servidor Python con MySQLWorkbench
3.6. Métodos de ejecución de scripts
3.6.1. Elección del método de ejecución adecuado
3.7. Scripts para el DBA
3.7.1. Los scripts y las notificaciones a través del correo electrónico
3.7.2. Scripts para backups
3.7.3. Scripts de mantenimiento
3.7.4. Scripts para Logs
3.8. Prácticas

4. Tuning de MySQL
4.1. Introducción al tuning de bases de datos
4.1.1. ¿Cómo se optimiza MySQL Server?
4.2. Elementos susceptibles de ser optimizados
4.2.1. El motor de almacenamiento
4.2.2. El software
4.2.3. La caché y la tasa de aciertos
4.2.4. Los buffers
4.2.5. La red
4.2.6. Plantillas de parámetros preconfiguradas
4.3. El planificador. Análisis de consultas
4.3.1. Las consultas lentas. SLOW QUERY LOG
4.4. Los índices
4.4.1. El script mysqlisxchk
4.4.2. El comando ANALYZE TABLE
4.5. La fragmentación de la tablas
4.5.1. El comando OPTIMIZE TABLE
4.6. El script mysqltuner
4.7. Consejos para optimizar
4.8. Prácticas

5. Bases de datos Distribuidas y Replicadas con MySQL
5.1. SGBD distribuidos
5.1.1. Componentes de una BBDD distribuida
5.2. Creación de bases de datos distribuidas: MySQL Cluster
5.3. Instalación de un cluster MySQL
5.4. Mantenimiento y gestión de un cluster MySQL
5.4.1. Control de un nodo de gestión
5.4.2. Parada y arranque de un nodo
5.4.3. Control de un nodo SQL
5.4.4. Control de un nodo de datos
5.5. La replicación de los datos
5.6. Configuración de la replicación en MySQL
5.7. Herramientas de gestión: MySQL Monitor
5.7.1. Descarga de MySQL Monitor Service Manager y sus agentes
5.7.2. Instalación y configuración del Service Manager
5.7.3. Puesta en marcha del Service Manager
5.7.4. Instalación y configuración de los agentes
5.8. Prácticas

6. Instalación y configuración de Oracle
6.1. Funciones de Oracle
6.2. Instalación y configuración de Oracle
6.2.1. Prerrequisitos de la instalación de Oracle
6.2.2. El asistente para la instalación de Oracle
6.2.3. La postinstalación
6.3. Puesta en marcha: Un poco de arquitectura
6.3.1. Estructura de una instancia en Oracle
6.3.2. Configuración manual de la instancia
6.3.3. Creación de la base de datos
6.3.4. Estados de una instancia
6.3.5. Ficheros que componen la base de datos
6.4. Configuración de la red: El listener
6.4.1. El fichero tnsnames
6.5. Apagado de una base de datos
6.6. Configuración automática de la instancia a través del asistente DBCA
6.7. Prácticas

7. Estructura de la información y acceso en Oracle
7.1. Los métodos de autentificación en Oracle
7.2. La gestión de los usuarios en Oracle
7.2.1. El sistema de privilegios de Oracle
7.2.2. El fichero de passwords orapwd
7.3. Los roles
7.4. Los perfiles
7.5. Gestión del espacio de almacenamiento
7.6. Sentencias SQL para la gestión de almacenamiento
7.7. El catálogo de metadatos
7.7.1. Las vistas estáticas
7.7.2. Las vistas dinámicas
7.8. Oracle Enterprise Manager Database Control
7.8.1. El servicio dbconsole
7.9. Prácticas

8. Automatización de tareas y creación de scripts en Oracle
8.1. Herramientas para creación de scripts
8.1.1. Herramientas de texto
8.2. Planificación de tareas de administración con scripts
8.3. Scripts en BASH para Oracle
8.3.1. Script para inicio y parada automática de Oracle
8.3.2. Arranque de más de una instancia
8.3.3. Ejemplo de script avanzado
8.4. Scripts para backups
8.4.1. Ejemplo de script para backup físico en frío
8.4.2. Scripts para backups lógicos. El datapump
8.5. El Recovery Manager (rman)
8.5.1. Funcionamiento de rman
8.5.2. Instalación del catálogo de recuperación de rman
8.5.3. Scripts con RMAN. Backups y Restores
8.5.4. Script para backup completo con rman
8.5.5. Consulta de los backups disponibles
8.5.6. Script con RMAN para recuperación
8.6. Eventos de sistema
8.7. Excepciones servererror
8.8. Prácticas

9. Tuning en Oracle
9.1. Herramientas de monitorización de Oracle
9.1.1. Consolas gráficas: Enterprise Manager, Grid Control, Toad
9.1.2. Vistas dinámicas
9.1.3. dbms_monitor
9.1.4. La traza 10046: alter session, oradebug, sql_trace
9.1.5. Informes AWR
9.2. Elementos y parámetros susceptibles de ser monitorizados
9.2.1. Caso práctico 1
9.2.2. Caso práctico 2
9.3. Optimización en Oracle
9.3.1. Instancia
9.3.2. Recursos
9.3.3. Estadísticas
9.3.4. Particionamiento y paralelización
9.3.5. Consultas
9.4. Herramientas y sentencias para la gestión de índices
9.5. Herramientas para la creación de alertas de rendimiento
9.6. Prácticas

10.Oracle y las BBDD distribuidas
10.1. Bases de datos e instancias distribuidas en Oracle
10.2. Técnicas de fragmentación
10.3. Consultas distribuidas
10.3.1. DB Links
10.3.2. Ejecución de consultas distribuidas
10.4. Transacciones distribuidas
10.4.1. TWO-PHASE COMMIT
10.4.2. Ejemplo de transacción distribuida
10.5. Optimización de consultas sobre bases de datos distribuidas
10.5.1. Optimización mediante consultas derivadas
10.5.2. Optimización mediante hints
10.6. Prácticas
```

### Metodología

* Clases divididas en dos Subgrupos 1 y 2
* Se impartián las clases expositivas de los temas  para ambos subgrupos
* Los contenidos serán los mismos impartidos a cada subgrupo durante la semana, dejando el resto para prácticas y ejercicios.
* Se fomentará el trabajo individual y el trabajo colectivo en pequeños grupos de trabajo
* Se van a utlizar herramientas como Meet, github, etc. que permitirán el trabajo colaborativo entre docencia/alumno , alumno/alumno.
* Aunque un Subgrupo vaya a clase también habrá trabajo impuesto al otro Subgrupo 



## Proceso de Evaluación/Calificación del Módulo

* Exisitirán una serie de ejercicios, prácticas, etc. que serán recomendables realizar pero no obligatorios para calificación. Dichos trabajos serán revsisados por el docente mediante un APTO o NO APTO para que el alumno pueda ir verificando su proceso de enseñanza aprendizaje a lo largo del curso.

* Se realizarán **laboratorios prácticos** con una calificación de 0 a 10 y con un porcentaje sobre la nota trimestral aún por determinar. Dichos labs serán realizados de manera presencial y telemática simultáneamente con las medidas pertinentes para verificación de las pruebas. 

* Al final del trimestre se raelizará una prueba práctica escrita/computador sobre los contenidos vistos durante el trimestre con porcentaje a determinar.

* Si la suma de ambas ponderaciones es 5 ó más el trimestre estará superado en caso contrario será no superado y se deberá presentar a la prueba **Ordinaria de Marzo**.

* La prueba Ordinaria de Marzo está compuesta de dos partes divididas en trimestres. Esa prueba para se superada deben de calificar un 5 en cada parte. 

* En caso de no superar la Prueba Ordinaria se realizará la recuperación de la/s parte/s pendiente/s en el Extraordinario de Junio.

  

## Bibliografía

* **Administración de Sistemas Gestores de Bases de Datos**, Iván López Montalbán. Garceta 2ª Ed.
