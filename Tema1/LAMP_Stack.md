# ASIR2 - IMPLANTACIÓN DE APLICACIONES WEB

# TEMA 1

<span class="header-section-number">1</span> Práctica 1: LAMP Stack (Teoría)
============================================================================

**LAMP** es el acrónimo usado para describir un sistema de
infraestructura de Internet que usa las siguientes herramientas:

-   Linux (Sistema Operativo)
-   Apache (Servidor Web)
-   MySQL/MariaDB (Sistema Gestor de Bases de Datos)
-   PHP (Lenguaje de programación)

<span class="header-section-number">2</span> Linux
==================================================

Todas las prácticas de este módulo las vamos a realizar sobre **Xubuntu 18.04**.

<span class="header-section-number">2.1</span> Primeros pasos con: `apt`
------------------------------------------------------------------------

### <span class="header-section-number">2.1.1</span> `apt update`

Actualiza la lista de paquetes:

    sudo apt update

### <span class="header-section-number">2.1.2</span> `apt upgrade`

Actualiza los paquetes instalados a sus últimas versiones disponibles:

    sudo apt upgrade

### <span class="header-section-number">2.1.3</span> `apt full-upgrade`

Realiza actualizaciones que impliquen cambiar dependencias, agregar o
quitar nuevos paquetes según sea necesario.

    sudo apt full-upgrade

### <span class="header-section-number">2.1.4</span> `apt install`

Instala un paquete determinado:

    sudo apt install <package name>

### <span class="header-section-number">2.1.5</span> `apt remove`

Desinstala un paquete:

    sudo apt remove <package name>

### <span class="header-section-number">2.1.6</span> `apt purge`

Desinstala un paquete determinado y elimina los archivos de
configuración asociados:

    sudo apt purge <package name>

### <span class="header-section-number">2.1.7</span> `apt search`

Busca un paquete entre las descripciones de los paquetes:

    sudo apt search <package name>

### <span class="header-section-number">2.1.8</span> `apt show`

Muestra los detalles de un paquete:

    sudo apt show <package name> 

<span class="header-section-number">2.2</span> Instalación de un GUI Desktop
----------------------------------------------------------------------------

Unity desktop:

    sudo apt install ubuntu-desktop

GNOME desktop:

    sudo apt install ubuntu-gnome-desktop

KDE desktop:

    sudo apt install kubuntu-desktop

Otros escritorios que podemos instalar son: `xubuntu-desktop`,
`lubuntu-desktop`, `edubuntu-desktop`, etc.

<span class="header-section-number">2.3</span> Instalación de un servidor SSH
-----------------------------------------------------------------------------

    sudo apt install ssh

<span class="header-section-number">2.4</span> Cómo iniciar, parar y consultar el servicio de SSH
-------------------------------------------------------------------------------------------------

### <span class="header-section-number">2.4.1</span> Método 1. `systemctl`

    sudo systemctl start ssh
    sudo systemctl stop ssh
    sudo systemctl status ssh

### <span class="header-section-number">2.4.2</span> Método 2. `/etc/init.d/ssh`

    sudo /etc/init.d/ssh start
    sudo /etc/init.d/ssh stop
    sudo /etc/init.d/ssh status

<span class="header-section-number">2.5</span> Instalación de `git`
-------------------------------------------------------------------

    sudo apt install git

<span class="header-section-number">3</span> Apache
===================================================

<span class="header-section-number">3.1</span> Instalación de Apache
--------------------------------------------------------------------

    sudo apt install apache2

<span class="header-section-number">3.2</span> Cómo iniciar, parar y consultar el estado de Apache
--------------------------------------------------------------------------------------------------

### <span class="header-section-number">3.2.1</span> Método 1. `systemctl`

    sudo systemctl start apache2
    sudo systemctl stop apache2
    sudo systemctl restart apache2
    sudo systemctl reload apache2
    sudo systemctl status apache2

### <span class="header-section-number">3.2.2</span> Método 2. `/etc/init.d/apache`

    sudo /etc/init.d/apache2 start
    sudo /etc/init.d/apache2 stop
    sudo /etc/init.d/apache2 restart
    sudo /etc/init.d/apache2 reload
    sudo /etc/init.d/apache2 status

### <span class="header-section-number">3.2.3</span> Método 3. `service`

    sudo service apache2 start
    sudo service apache2 stop
    sudo service apache2 restart
    sudo service apache2 reload
    sudo service apache2 status

<span class="header-section-number">3.3</span> Archivos de configuración de Apache
----------------------------------------------------------------------------------

Los archivos de configuración de Apache se almacenan en el directorio:

    /etc/apache2/

En este directorio encontramos los siguientes archivos y directorios:

    /* Archivos */
    ├── apache2.conf
    ├── envvars
    ├── magic
    └── ports.conf
    
    /* Directorios */
    ├── conf-available
    ├── conf-enabled
    ├── mods-available
    ├── mods-enabled
    ├── sites-available
    └── sites-enabled

A continuación se describe brevemente cada uno de ellos:

-   `apache2.conf`: Es el archivo de configuración principal. En este archivo se incluyen todos los archivos de configuración adicionales.
-   `envvars`: Este archivo se definen las variables de entorno que hacen referencia al servidor web Apache y se utilizan en el archivo
    `apache2.conf`.
-   `magic`: Este archivo contiene instrucciones para determinar el tipo de contenido o tipo MIME (MUltipurpose Internet Mail Extensions) de un archivo en función de los primeros bytes de un archivo. Los navegadores a menudo usan el tipo MIME (y no la extensión de archivo) para determinar cómo procesará un documento; por lo tanto, es importante que los servidores estén configurados correctamente para adjuntar el tipo MIME correcto al encabezado del objeto de respuesta. Puede encontrar más información sobre los tipo MIME [aquí](https://developer.mozilla.org/es/docs/Web/HTTP/Basics_of_HTTP/MIME_types).
-   `ports.conf`: En este archivo se definen los puertos TCP donde el servidor Apache estará escuchando peticiones.
-   `conf-available`: Este directorio contiene archivos de configuración que se aplican a todos los hosts virtuales de forma global.
-   `conf-enabled`: Este directorio contiene enlaces simbólicos a los archivos de configuración del directorio `conf-available` que están activos.
-   `mods-available`: Este directorio contiene los archivos de configuración de los módulos que se pueden utilizar para añadir
    nuevas funcionalidades al servidor.
-   `mods-enabled`: Este directorio contiene enlaces simbólicos a los archivos de configuración del directorio `mod-available` que están activos.
-   `sites-available`: Este directorio contiene los archivos de configuración de los hosts virtuales.
-   `sites-enabled`: Este directorio contiene enlaces simbólicos a los archivos de configuración del directorio `sites-available` que están activos.

<span class="header-section-number">3.4</span> Archivos de log de Apache
------------------------------------------------------------------------

### <span class="header-section-number">3.4.1</span> `access.log`

El servidor almacena en el registro de acceso información sobre todas las peticiones que procesa.

    /var/log/apache2/access.log

### <span class="header-section-number">3.4.2</span> `error.log`

El registro de errores del servidor.

    /var/log/apache2/error.log

### <span class="header-section-number">3.4.3</span> Mensajes de error más detallados en Apache

Para poder localizar un error debemos configurar que los archivos de log sean más detallados. Para ello, debemos cambiar o añadir la línea `LogLevel`en el archivo `/etc/apache2/apache2.conf`. Los argumentos posibles se detallan a continuación. Por ejemplo:

    LogLevel debug

Existen varios niveles jerárquicos en los registros de error disponibles, cada uno de ellos identificado por su propia clave. El
valor por defecto de `LogLevel` es `warn`. A continuación se describen los valores posibles, ordenados de manera descendente según su grado de importancia.

-   `emerg`: Emergencias, no se puede utilizar el servidor.
-   `alert`: Require acción inmediata.
-   `crit`: Condiciones críticas.
-   `error`: Condiciones de error.
-   `warn`: Condiciones de advertencia.
-   `notice`: Condicón normal pero significativa.
-   `info`: Informativa.
-   `debug`: Mensajes de corrección de errores.

`emerg` es el valor que graba el menor número de información y `debug` el que más. El problema es que `debug` graba mucha información que no tiene nada que ver con el problema, por lo que es conveniente cambiar el valor una vez que hayamos resuelto dicho problema.

<span class="header-section-number">4</span> MySQL Server
=========================================================

<span class="header-section-number">4.1</span> Instalación de MySQL Server
--------------------------------------------------------------------------

    sudo apt install mysql-server

<span class="header-section-number">4.2</span> Cómo iniciar, parar y consultar el estado de MySQL Server
--------------------------------------------------------------------------------------------------------

### <span class="header-section-number">4.2.1</span> Método 1. `systemctl`

    sudo systemctl start mysql
    sudo systemctl stop mysql
    sudo systemctl restart mysql
    sudo systemctl status mysql

### <span class="header-section-number">4.2.2</span> Método 2. `/etc/init.d/mysql`

    sudo /etc/init.d/mysql start
    sudo /etc/init.d/mysql stop
    sudo /etc/init.d/mysql restart
    sudo /etc/init.d/mysql reload
    sudo /etc/init.d/mysql force-reload
    sudo /etc/init.d/mysql status

<span class="header-section-number">4.3</span> Archivos de configuración de MySQL Server
----------------------------------------------------------------------------------------

    /etc/mysql/mysql.cnf

También podemos encontrar archivos de configuración en los directorios:

    /etc/mysql/conf.d/
    /etc/mysql/mysql.conf.d/

<span class="header-section-number">4.4</span> Archivos de log de MySQL Server
------------------------------------------------------------------------------

    /var/log/mysql/error.log

<span class="header-section-number">4.5</span> Cómo acceder a MySQL Server desde consola con el usuario `root`
--------------------------------------------------------------------------------------------------------------

Una vez que hemos instalado MySQL Server en nuestro sistema vamos a acceder a la consola de MySQL. En primer lugar vamos a iniciar una sesión como `root`:

    sudo su

Una vez que hemos iniciado una sesión como `root` vamos a iniciar la consola de MySQL también como `root` sin necesidad de indicarle ningún password (no es necesario usar el modificaor `-p`).

    mysql -u root

Una vez hecho esto ya tendríamos acceso a la consola de MySQL como `root`.

<span class="header-section-number">4.6</span> Cómo cambiar la contraseña del usuario `root` (Método 1)
-------------------------------------------------------------------------------------------------------

En primer lugar accedemos a la consola de MySQL como `root` y seleccionamos la base de datos **mysql**.

    USE mysql;

Vamos a revisar los usuarios que existen en MySQL y qué método tienen establecido para autenticar.

    SELECT User, Host, plugin FROM user;
    
    +------------------+-----------+-----------------------+
    | User             | Host      | plugin                |
    +------------------+-----------+-----------------------+
    | root             | localhost | auth_socket           |
    | mysql.session    | localhost | mysql_native_password |
    | mysql.sys        | localhost | mysql_native_password |
    | debian-sys-maint | localhost | mysql_native_password |
    +------------------+-----------+-----------------------+
    4 rows in set (0.00 sec)

Podemos ver que para el usuario `root@localhost` el método de autenticación es `auth_socket`. Esto quiere decir que el usuario `root`1
usará las mismas credenciales que tiene en el sistema operativo.

Si queremos cambiar la contraseña de `root` tendremos que cambiar el método de autenticación a `mysql_native_password`. Tendrá que sustituir*`nueva_contraseña`* por la contraseña que desee.

    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'nueva_contraseña';

Después habrá que ejecutar el siguiente comando para que las actualizaciones realizadas tengan efecto.

    FLUSH PRIVILEGES;

### <span class="header-section-number">4.6.1</span> Para versiones de MySQL &lt;= 5.7

**Nota importante**: Para versiones de MySQL &lt;= 5.7 habrá que realizar los siguientes pasos que se muestran a continuación.

**Paso 1**

En primer lugar, tendremos que cambiar el método de autenticación a `mysql_native_password` para el usuario `root`.

    UPDATE user SET plugin='mysql_native_password' WHERE User='root';

**Paso 2**

Una vez que hemos actualizado el valor de la columna `plugin` a `mysql_native_password` actualizamos la columna `authentication_string` para asignar cuál será la nueva contraseña. Tendrá que sustituir *`nueva_contraseña`* por la contraseña que desee.

    UPDATE user SET authentication_string=PASSWORD('nueva_contraseña') WHERE user='root';

A partir de la versión de MySQL 8.0 no es posible utilizar la función `PASSWORD` [porque fue eliminada a partir de la versión de MySQL
5.7.6](https://dev.mysql.com/doc/refman/5.7/en/encryption-functions.html#function_password).

**Paso 3**

Después habrá que ejecutar el siguiente comando para que las actualizaciones realizadas tengan efecto.

    FLUSH PRIVILEGES;

<span class="header-section-number">4.7</span> Cómo cambiar la contraseña del usuario `root` (Método 2 `--skip-grant-tables`)
-----------------------------------------------------------------------------------------------------------------------------

Otra opción para modificar la contraseña del usuario `root` en MySQL es iniciar el servicio con la opción `--skip-grant-tables`, que permite que cualquier usuario se pueda conectar sin necesidad de realizar el proceso de autenticación.

En primer lugar detenemos el servicio de MySQL.

    sudo systemctl stop mysql

Como vamos a iniciar el proceso de MySQL de forma manual vamos a necesitar crear de forma manual el directorio `/var/run/mysqld` y asignarle que el propietario de este directorio es `mysql` del grupo `mysql`.

    sudo mkdir -p /var/run/mysqld
    sudo chown mysql:mysql /var/run/mysqld

Una vez que hemos detenido el servicio de MySQL, lo volvemos a iniciar pero haciendo uso del comando que está en la ruta `/usr/sbin/mysqld` y
pasándole como parámetro la opción `--skip-grant-tables` que permite conectarnos sin contraseña y con todos los privilegios. Esta opción
deshabilita la gestión de usuarios y por lo tanto, no es posible utilizar sentencias como `ALTER USER` y `SET PASSWORD`. Al utilizar la
opción `--skip-grant-tables` se habilita automáticamente la opción `--skip-networking` para desactivar las conexiones remotas como
mecanismo de seguridad. Observe que hemos añadido `&` al final del  comando para que el proceso se ejecute en segundo plano.

    sudo /usr/sbin/mysqld --skip-grant-tables &

Podemos comprobar que le proceso se está ejectuando de forma correcta haciendo un listado de todos los procesos que están en ejecución con
`ps aux` y buscando en la lista el nombre del proceso con `grep mysqld`.

    ps aux | grep mysqld

Una vez que hemos comprobado que el proceso está en ejecución, podemos conectarnos al servidor de MySQL. No es necesario indicar ningún usuario
ni contraseña, nos conectaremos automáticamente con todos los privilegios como `root`.

    mysql

Ahora tendremos que indicarle al servidor que tiene que recargar las tablas encargadas de la autenticación de los usuarios para poder activar
la gestión de usuarios. Recuerda que la opción `--skip-grant-tables` deshabilita esta funcionalidad.

    FLUSH PRIVILEGES;

Modificamos la contraseña del usuario ‘root’@‘localhost’, reemplazando `nueva_contraseña` por la contraseña que queramos asignar.

    ALTER USER 'root'@'localhost' IDENTIFIED BY 'nueva_contraseña';

Salimos del cliente de MySQL.

    exit;

Detenemos el proceso `mysqld`.

    sudo pkill mysqld

Reiniciamos el servicio de MySQL.

    sudo systemctl start mysql

<span class="header-section-number">4.8</span> Algunos comandos útiles para MySQL Server desde consola
------------------------------------------------------------------------------------------------------

### <span class="header-section-number">4.8.1</span> Listar todas las bases de datos disponibles

    SHOW DATABASES;

### <span class="header-section-number">4.8.2</span> Crear una nueva base de datos

    CREATE DATABASE <database>;

### <span class="header-section-number">4.8.3</span> Borrar una base de datos

    DROP DATABASE <database>;

### <span class="header-section-number">4.8.4</span> Seleccionar una base de datos

    USE <database>;

### <span class="header-section-number">4.8.5</span> Listar las tablas que contiene una base de datos

    SHOW TABLES;

### <span class="header-section-number">4.8.6</span> Mostrar la estructura de una tabla

    DESCRIBE <table>;

### <span class="header-section-number">4.8.7</span> Cerrar la sesión y salir

    exit
    
    quit

<span class="header-section-number">4.9</span> Ejecutar un script .sql desde la consola
---------------------------------------------------------------------------------------

Desde la consola de Linux:

    mysql -u root -p < script.sql

Desde la consola de MySQL:

    mysql> source script.sql

<span class="header-section-number">4.10</span> Usuarios y permisos en MySQL Server desde consola
-------------------------------------------------------------------------------------------------

### <span class="header-section-number">4.10.1</span> Tipos de permisos que podemos aplicar

-   `ALL PRIVILEGES`: permite a un usuario de MySQL acceder a todas las
    bases de datos asignadas en el sistema.
-   `CREATE`: permite crear nuevas tablas o bases de datos.
-   `DROP`: permite eliminar tablas o bases de datos
-   `DELETE`: permite eliminar registros de tablas.
-   `INSERT`: permite insertar registros en tablas.
-   `SELECT`: permite leer registros en las tablas.
-   `UPDATE`: permite actualizar registros seleccionados en tablas.
-   `GRANT OPTION`: permite remover privilegios de usuarios

### <span class="header-section-number">4.10.2</span> Crear un nuevo usuario

Habrá que reemplazar *nombre\_usuario* y *contraseña* por los datos del
nuevo usuario que desea crear:

    CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';

Una vez que hemos creado el usuario hay que asignarle permisos para que pueda acceder a la/s base/s de datos que queramos.

### <span class="header-section-number">4.10.3</span> Eliminar un usuario

    DROP USER 'nombre_usuario'@'localhost';

### <span class="header-section-number">4.10.4</span> Asignar permisos a un usuario

    GRANT [permiso] ON [nombre_base_de_datos].[nombre_tabla] TO 'nombre_usuario'@'localhost';

Por ejemplo:

    GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost';

En este comando, los asteriscos indican que estamos aplicando el permiso `ALL PRIVILEGES` al usuario `nombre_usuario` para todas las tablas de
cada una de las bases de datos. bases de datos y tablas.

Después de este comando habrá que ejecutar el siguiente comando para refrescar todos los privilegios a los usuarios.

    FLUSH PRIVILEGES;

### <span class="header-section-number">4.10.5</span> Eliminar permisos a un usuario

    REVOKE [permiso] ON [nombre_base_de_datos].[nombre_tabla] FROM 'nombre_usuario'@'localhost';

### <span class="header-section-number">4.10.6</span> Consultar los usuarios creados en MySQL Server

Los usuarios de MySQL se almacenan en la tabla `mysql.user`. La clave primaria de esta tabla está formada por los valores `user` y `host`, de
modo que cada fila vendrá identificada por un nombre de usuario y el host desde el que puede conectarse.

La siguiente consulta nos devuelve el listado de usuarios que tenemos en MySQL y desde qué host pueden conectarse:

    SELECT user,host FROM mysql.user;

En nuestra caso la consulta anterior devuelve el siguiente resultado:

    +------------------+--------------+
    | user             | host         |
    +------------------+--------------+
    | root             | %            |
    | root             | localhost    |
    | debian-sys-maint | localhost    |
    | phpmyadmin       | localhost    |
    | mysql.session    | localhost    |
    | mysql.sys        | localhost    |
    +------------------+--------------+

También podemos consultar qué permisos específicos tiene un determinado usuario. La siguiente consulta nos devuelve los permisos que tiene el
usuario `root`:

    SHOW GRANTS FOR root;
    
    +------------------------------------------------+
    | Grants for root@%                              |
    +------------------------------------------------+
    | GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'      |
    +------------------------------------------------+

<span class="header-section-number">5</span> PHP
================================================

<span class="header-section-number">5.1</span> Instalación de módulos PHP
-------------------------------------------------------------------------

    sudo apt install php libapache2-mod-php php-mysql

Para averiguar lo que hace el módulo `libapache2-mod-php`, podríamos
escribir esto:

    sudo apt show libapache2-mod-php

<span class="header-section-number">5.2</span> Comprobar que la instalación se ha realizado correctamente
---------------------------------------------------------------------------------------------------------

Crea un archivo llamado `info.php` en el directorio `/var/www/html`.

    sudo nano /var/www/html/info.php

Añade el siguiente contenido:

     <? php
    
    phpinfo ();
    
    ?>

Ahora accede desde un navegador a la URL: http://localhost/info.php

<span class="header-section-number">6</span> Otras herramientas relacionadas con la pila LAMP
=============================================================================================

<span class="header-section-number">6.1</span> Instalar phpMyAdmin para acceder vía web a MySQL
-----------------------------------------------------------------------------------------------

Para instalar `phpMyAdmin` es necesario tener instalado en nuestro
sistema `composer` que es un gestor de dependencias para PHP.

### <span class="header-section-number">6.1.1</span> Instalación de `composer` con `apt` y `phpMyAdmin`

Instalamos [`composer`](https://getcomposer.org/) (A dependency Manager
for PHP).

    sudo apt install composer

Clonamos el repositorio de [phpMyAdmin](https://www.phpmyadmin.net/)
usando Git.

    git clone https://github.com/phpmyadmin/phpmyadmin.git

Nos situamos dentro del directorio de `phpmyadmin` que es donde estará el archivo `composer.json` con todas las dependencias que necesitamos
instalar.

    cd phpmyadmin

Instalamos las dependencias con la herramienta `composer`.

    composer update

Podemos evitar instalar las herramamientas de desarrollo con el
modificador `--no-dev`.

    composer update --no-dev

Puede encontrar más información en la [documentación oficial de
phpMyAdmin](https://docs.phpmyadmin.net/es/latest/setup.html).

### <span class="header-section-number">6.1.2</span> Instalación de `composer` desde la web oficial y `phpMyAdmin`

**Paso 1**

Descargamos el instalador y lo renombramos como `composer-setup.php`.

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

**Paso 2**

Comprobamos que el hash SHA384 del archivo que acabamos de descargar de
la web es correcto.

    php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

**Paso 3**

Ejecutamos el instalador.

    php composer-setup.php

Una vez finalizado este paso deberemos tener un archivo llamado `composer.phar` en el directorio donde hemos ejecutado el instalador.

**Paso 4**

Eliminamos el instalador.

    php -r "unlink('composer-setup.php');"

**Paso 5**

Clonamos el repositorio de [phpMyAdmin](https://www.phpmyadmin.net/)
usando Git.

    git clone https://github.com/phpmyadmin/phpmyadmin.git

Nos situamos dentro del directorio de `phpmyadmin` que es donde estará el archivo `composer.json` con todas las dependencias que necesitamos
instalar.

    cd phpmyadmin

Instalamos las dependencias con la herramienta `composer`.

    php composer.phar update

Podemos evitar instalar las herramamientas de desarrollo con el modificador `--no-dev`.

    php composer.phar update --no-dev

Puede encontrar más información en la [documentación oficial de phpMyAdmin](https://docs.phpmyadmin.net/es/latest/setup.html).

<span class="header-section-number">6.2</span> Instalar Adminer para acceder vía web a MySQL
--------------------------------------------------------------------------------------------

[Adminer](https://www.adminer.org/) es una alternativa a [phpMyAdmin](https://www.phpmyadmin.net/). Tiene la ventaja que se distribuye en un único archivo .php. Sólo hay que descargarse el arhivo
[Adminer para MySQL](https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php)  que está disponible en la web del proyecto y guardarlo en el directorio `/var/www/html`.

<span class="header-section-number">6.3</span> Instalar un analizador de logs para Apache Server
------------------------------------------------------------------------------------------------

Investiga cuáles son los analizadores de logs que existen para Apache Server e instala uno de ellos.

Posibles soluciones:

-   [GoAccess](https://goaccess.io/)
-   [AWStats](http://www.awstats.org/)

### <span class="header-section-number">6.3.1</span> GoAccess

Para instalar la última versión de [GoAccess](https://goaccess.io/) añadimos los repositorios oficiales del proyecto:

#### <span class="header-section-number">6.3.1.1</span> Instalación de GoAccess

    echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
    
    wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key add -
    
    sudo apt-get update
    sudo apt-get install goaccess

#### <span class="header-section-number">6.3.1.2</span> Uso de GoAccess

Una vez que hemos instalado la utilidad podemos usarla para procesar los archivos de log `access.log` de Apache HTTP Server.

##### <span class="header-section-number">6.3.1.2.1</span> Desde el terminal

El siguiente comando parsea el archivo de log `access.log` y muestra la información del log en tiempo real en el terminal en modo texto.

    goaccess /var/log/apache2/access.log -c

##### <span class="header-section-number">6.3.1.2.2</span> Creación de un archivo HTML estático

El siguiente comando parsea el archivo de log `access.log` y genera un archivo HTML estático.

    goaccess /var/log/apache2/access.log -o /var/www/html/report.html --log-format=COMBINED

##### <span class="header-section-number">6.3.1.2.3</span> Creación de un archivo HTML en tiempo real

El siguiente comando parsea el archivo de log `access.log` y genera un archivo HTML en tiempo real.

    goaccess /var/log/apache2/access.log -o /var/www/html/report.html --log-format=COMBINED --real-time-html

<span class="header-section-number">6.4</span> Control de acceso a un directorio con autenticación básica
---------------------------------------------------------------------------------------------------------

Crea un directorio llamado `stats` dentro del directorio `/var/www/html` donde se podrán consultar los informes generados con `goaccess`. El
acceso a este directorio deberá estar controlado y solo se podrá acceder mediante un usuario y una contraseña.

**Paso 1**

Creamos el directorio `stats`.

    mkdir /var/www/html/stats

**Paso 2**

Lanzamos el proceso de `goaccess` en background para generar los informes en segundo plano.

    sudo goaccess /var/log/apache2/access.log -o /var/www/html/stats/index.html --log-format=COMBINED --real-time-html &

**Paso 3**

Creamos el archivo de contraseñas para el usuario que accederá al directorio `stats`. El archivo de contraseñas lo guardamos en un
directorio seguro que no sea accesible desde el exterior. En nuestro caso el archivo se llamará `.htpasswd` y lo vamos a guardar en el
directorio `/home/usuario`. El usuario que vamos a crear tiene como nombre de usuario: `usuario`.

    sudo htpasswd -c /home/usuario/.htpasswd usuario

**Paso 4**

Editamos el archivo configuración de Apache.

    sudo nano /etc/apache2/sites-enabled/000-default.conf

Añadimos la siguiente sección dentro de las etiquetas de
`<VirtualHost *:80>` y `</VirtualHost>`.

    <Directory "/var/www/html/stats">
      AuthType Basic
      AuthName "Acceso restringido"
      AuthBasicProvider file
      AuthUserFile "/home/usuario/.htpasswd"
      Require valid-user
    </Directory>

De modo que el archivo de configuración quedará de forma similar al siguiente ejemplo.

    <VirtualHost *:80>
            #ServerName www.example.com
            ServerAdmin webmaster@localhost
            DocumentRoot /var/www/html
    
            <Directory "/var/www/html/stats">
              AuthType Basic
              AuthName "Acceso restringido"
              AuthBasicProvider file
              AuthUserFile "/home/usuario/.htpasswd"
              Require valid-user
            </Directory>
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>

A continuación se describe en qué consiste cada una de las directivas:

-   `AuthType Basic`: Esta directiva indica que se va a utilizar el tipo de autenticación más básico, las opciones disponibles son `None`,
    `Basic`, `Digest` y `Form`. Este tipo de autenticación utiliza una codificación en Base64 y sólo se recomienda su uso en conexiones
    cifradas por SSL.
-   `AuthName`: Esta directiva nos permite condigurar la cadena de texto que le aparecerá al usuario en el cuadro de diálogo.
-   `AuthBasicProvider file`: En este caso es opcional, porque la opción `file` es el valor por defecto para esta directiva. Sólo será
    necesario utilizar esta directiva en caso de utilizar otro medio diferente para la autenticación.
-   `AuthUserFile`: Indica la ruta donde se encuentra el archivo de contraseñas que hemos generado.
-   `Require`: Esta directiva nos permite indicar el proveedor de autenticación que vamos a utilizar. Con la opción `Require user userid [userid] ...` podemos indicar la lista de usuarios a los que se le permite el acceso. También es posible indicar los nombres de los grupos de usuarios a los que se les permite el acceso con la opción `Require group group-name [group-name] ...`. La opción `Require valid-user` permite el acceso a cualquier usuario que aparezca en el archivo de contraseñas.

[Puede encontrar más información en la documentación oficial de Apache
HTTP Server](https://httpd.apache.org/docs/2.4/es/howto/auth.html).

**Paso 5**

Reiniciamos el servicio de Apache.

    sudo systemctl restart apache2

<span class="header-section-number">6.5</span> Control de acceso a un directorio con `.htaccess`
------------------------------------------------------------------------------------------------

En esta sección se explica cómo realizar el control de acceso a un directorio utilizando archivos `.htaccess`.

Los archivos `.htaccess` permiten realizar cambios en la configuración del servidor web Apache sin tener que modificar los archivos principales
de configuración. Los archivos `.htaccess` contienen las directivas de configuración que queremos aplicar sobre un directorio específico y
todos sus subdirectorios.

En la documentación oficial de Apache HTTP Server puede encontrar [más información sobre los archivos
`.htaccess`](https://httpd.apache.org/docs/2.4/es/howto/htaccess.html).

**Paso 1**

Creamos el directorio `stats`.

    mkdir /var/www/html/stats

**Paso 2**

Lanzamos el proceso de `goaccess` en background para generar los informes en segundo plano.

    sudo goaccess /var/log/apache2/access.log -o /var/www/html/stats/index.html --log-format=COMBINED --real-time-html &

**Paso 3**

Creamos el archivo de contraseñas para el usuario que accederá al directorio `stats`. El archivo de contraseñas lo guardamos en un directorio seguro que no sea accesible desde el exterior. En nuestro caso el archivo se llamará `.htpasswd` y lo vamos a guardar en el directorio `/home/usuario`. El usuario que vamos a crear tiene como nombre de usuario: `usuario`.

    sudo htpasswd -c /home/usuario/.htpasswd usuario

**Paso 4**

Creamos el archivo `.htaccess` dentro del directorio que queremos proteger con usuario y contraseña. En nuestro caso lo vamos a crear en el directorio `/var/www/html/stats/.htaccess`.

    sudo nano /var/www/html/stats/.htaccess

El contenido del archivo `.htaccess` será el siguiente:

    AuthType Basic
    AuthName "Acceso restringido"
    AuthBasicProvider file
    AuthUserFile "/home/usuario/.htpasswd"
    Require valid-user

A continuación se describe en qué consiste cada una de las directivas:

-   `AuthType Basic`: Esta directiva indica que se va a utilizar el tipo de autenticación más básico, las opciones disponibles son `None`, `Basic`, `Digest` y `Form`. Este tipo de autenticación utiliza una codificación en Base64 y sólo se recomienda su uso en conexiones cifradas por SSL.
-   `AuthName`: Esta directiva nos permite condigurar la cadena de texto que le aparecerá al usuario en el cuadro de diálogo.
-   `AuthBasicProvider file`: En este caso es opcional, porque la opción `file` es el valor por defecto para esta directiva. Sólo será necesario utilizar esta directiva en caso de utilizar otro medio diferente para la autenticación.
-   `AuthUserFile`: Indica la ruta donde se encuentra el archivo de contraseñas que hemos generado.
-   `Require`: Esta directiva nos permite indicar el proveedor de autenticación que vamos a utilizar. Con la opción `Require user userid [userid] ...` podemos indicar la lista de usuarios a los que se le permite el acceso. También es posible indicar los nombres de los grupos de usuarios a los que se les permite el acceso con la opción `Require group group-name [group-name] ...`. La opción `Require valid-user` permite el acceso a cualquier usuario que aparezca en el archivo de contraseñas.

[Puede encontrar más información en la documentación oficial de Apache HTTP Server](https://httpd.apache.org/docs/2.4/es/howto/auth.html).

**Paso 5**

Editamos el archivo configuración de Apache.

    sudo nano /etc/apache2/sites-enabled/000-default.conf

Añadimos la siguiente sección dentro de las etiquetas de
`<VirtualHost *:80>` y `</VirtualHost>`.

    <Directory "/var/www/html/stats">
      AllowOverride All
    </Directory>

De modo que el archivo de configuración quedará de forma similar al siguiente ejemplo.

    <VirtualHost *:80>
            #ServerName www.example.com
            ServerAdmin webmaster@localhost
            DocumentRoot /var/www/html
    
            <Directory "/var/www/html/stats">
          AllowOverride All
            </Directory>
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>

**Paso 6**

Reiniciamos el servicio de Apache.

    sudo systemctl restart apache2

<span class="header-section-number">7</span> Referencias
========================================================

-   [Cómo instalar en Ubuntu 18.04 la pila LAMP — Linux, Apache, MySQL y PHP](https://www.digitalocean.com/community/tutorials/como-instalar-en-ubuntu-18-04-la-pila-lamp-linux-apache-mysql-y-php-es)
-   «Apache: Soluciones y ejemplos para administradores de Apache».**Ken Coar y Rich Bowen**. O’Reilly.
-   [Aulas en red, aplicaciones y servicios. Linux](http://www.ite.educacion.es/formacion/materiales/85/cd/linux/m5/index.html).
    INTEF.
-   [Crear un nuevo usuario y otorgarle permisos en MySQL](https://www.digitalocean.com/community/tutorials/crear-un-nuevo-usuario-y-otorgarle-permisos-en-mysql-es)
-   [Instalación de phpMyAdmin](https://docs.phpmyadmin.net/es/latest/setup.html).
-   [Documentación oficial de Apache HTTP Server](https://httpd.apache.org/docs/trunk/es/).
-   [Autenticación y Autorización en Apache HTTP Server](https://httpd.apache.org/docs/2.4/es/howto/auth.html).
-   [How to Reset the Root Password. Documentación oficial de MySQL](https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html).
-   [How to reset root MySQL/MariaDB password on Ubuntu 20.04 Focal Fossa
    Linux](https://linuxconfig.org/how-to-reset-root-mysql-mariadb-password-on-ubuntu-20-04-focal-fossa-linux).

<span class="header-section-number">8</span> Licencia
=====================================================

[![Licencia de Creative
Commons](data:image/png;base64,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)](http://creativecommons.org/licenses/by-nc-sa/4.0/) El contenido de esta web está bajo una [licencia de Creative Commons
Reconocimiento-NoComercial-CompartirIgual 4.0
Internacional](http://creativecommons.org/licenses/by-nc-sa/4.0/).