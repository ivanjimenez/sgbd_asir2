 # Administrador de Sistemas Gestores de Bases de Datos

# ASIR2

# Práctica 1



## 1 Instalación y Configuración de MySQL

### 2 Instalación desde el gestor de paquetes YUM

Se va a utilizar CentOS un sistema operativo tipo Linux basado en la distro de Red Hat. De hecho es una versión de la comunidad libre de desarrolladores y que mantiene la compatibilidad con REHL. 

Existe otra versión, entre otras, de Linux basada en RHEL y que es muy interesante de cara a utilizar Oracle DB. Esta versión es Oracle Linux o también llamda OL7 si queremos referirnos a la versión 7. 

No obstante, en este documento se usará CentOS.



EL *Yellow Dog Update, Modified* o YUM es el gestor de paquetes de los SS.OO. anteriores. Necesitaremos un usuario sudo o a root para la instalación.

Para mayor comodidad se puede poner en modo Bridge o Adaptador puenta la MV de VMWare y realizar cualquier comando siguiente para reiniciar los servicios de red:

```bash
sudo service network restart
sudo systemctl restart network
```

Después debemos revisar si efectivamente tenemos una dirección IP válida:

```bash
sudo ifconfig
sudo ip addr
```

También se puede hacer una nueva concesión por el DHCP interno de la MV apuntando al interfaz de red local para que toma una IP nueva o también se puede parar e iniciar los interfaces:

```b
sudo dhclient <nombre_interfaz_red>
sudo ifdown <nombre_interfaz_red>
sudo ifup <nobmre_interfaz_red>
```

Y posterioremente si tenemos acceso al exterior:

```bash
ping 1.1.1.1
ping 8.8.8.8

```

Si todo ha ido perfecto ya podemos actualizar los paquetes:

Podemos hacer con root o con el usuario devops:

```bahs
su -
yum update
```

Esto tardará unos minutos dependiendo de la conexión a Internet. Tenéis que confirmar con y para continuar e instalar actualizaciones.

Para instalar el MySQL, la empresa Oracle ha eliminado los repositorios por defecto de los estandarizados en CentOS, Debian, Ubuntu. Podéis buscar el paquete **mysql-server** que es el necesario para instalar este SGBD pero veréis que no está. Sí está **mariadb-server** y que podríamos instalar de forma equivalente.

Si buscamos el paquete no podremos localizarlo de manera estándar:

```bash 
sudo yum search mysql-server
[sudo] password for devops: 
Complementos cargados:fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: ftp.cica.es
 * extras: ftp.cica.es
 * updates: repo.nixval.com
========================== Concordante: mysql-server ===========================
akonadi-mysql.x86_64 : Akonadi MySQL backend support
```

Vamos a instalar MySQL5.7, aunque lleva poco tiempo la versión 8 que en esta guía no vamos a instalar. Utilizamos los sguientes comandos para instalar, actualizar y comprobar que está habilitado el repositorio.

```ba

wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

rpm -ivh mysql57-community-release-el7-9.noarch.rpm

yum update

yum install mysql-community-server

```



Después hay que iniciar el servicio de mysql e iniciar la consola de mysql:

```bash
service mysqld start

$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.31 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

```

### 3 Comprobación de la instalación correcta

* Directorio de instalación base ```/usr/bin```
* Directorio del servicio o procesos demonio: ```/usr/libexec/mysqld```
* Directorio de datos: ```/var/lib/mysql```
* Fichero configuración: ```/etc/my.cnf```

El directorio de instalación indica los ejecutables:

* mysqld: proceso daemon, aplicación servidora. Recibe las consultas y las ejecuta
* mysql: aplicación cliente, es el IU para el cliente
* mysqld_safe: script que se encarga de ejecutar el mysqld y reiniciarlo si da error.



### 4 Ficheros de Logs

#### 4.1 Log de errores

Son los suscesos anormales que se han producido a nivel de sistema en el servidor de BD, p. e, al arrancar el servicio de mysql. 

En el caso de Centos 7 instalado en el `my.cnf` tendríamos:

```bash
log-error=/var/log/mysqld.log

# Visualizando el fichero
tail -f /var/log/mysqld.log
2020-10-13T09:22:31.906972Z 0 [Warning] TIMESTAMP with implicit DEFAULT value i$
2020-10-13T09:22:31.908738Z 0 [Note] /usr/sbin/mysqld (mysqld 5.7.31) starting $
2020-10-13T09:22:31.918340Z 0 [Note] InnoDB: PUNCH HOLE support available
2020-10-13T09:22:31.918386Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomi$
2020-10-13T09:22:31.918393Z 0 [Note] InnoDB: Uses event mutexes
2020-10-13T09:22:31.918402Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence($
2020-10-13T09:22:31.918408Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.11
2020-10-13T09:22:31.918417Z 0 [Note] InnoDB: Using Linux native AIO
```

#### 4.2 Log de Consultas

**Configuramos mediante las siguientes líneas la activación de logs de consultas:**

- general_log : se activa con ON y desactiva con OFF
- salida a ficher: FILE.
- general_log_file: ubicamos el fichero log

```bash
[mysqld]
        general_log = on
        log_output = FILE
        general_log_file = '/var/lib/mysql/log_query.txt'

```

Creamos el fichero `log_query.txt` de la siguiente forma:

```bash
cd /var/log 
touch log_query.txt
chown mysql:mysql log_query.txt  # Se cambia el dueño y grupo del fichero 
sudo service mysqld restart
```

También podemos utilizar las directivas en la consola mysql sin hacerlo en `/etc/my.cnf` pero sólo serán activas en la sesión

```mysql
mysql> set global log_output = 'FILE';
Query OK, 0 rows affected (0.00 sec)

mysql> set global general_log_file='/var/lib/mysql/log_query.txt';
Query OK, 0 rows affected (0.02 sec)

mysql> set global general_log = 'ON';
Query OK, 0 rows affected (0.00 sec)

```

En este punto ya podríamos realizar queries y actualizarse el fichero con los logs. 

> **Cada vez que reiniciamos el servidor mysql este fichero de logs se vacía completamente**.

```bash
# tail -f /var/log/log_query.txt 
2020-10-13T20:42:24.417133Z	    2 Field List	slave_relay_log_info 
2020-10-13T20:42:24.417648Z	    2 Field List	slave_worker_info 
2020-10-13T20:42:24.418274Z	    2 Field List	slow_log 
2020-10-13T20:42:24.420714Z	    2 Field List	tables_priv 
2020-10-13T20:42:24.423119Z	    2 Field List	time_zone 
2020-10-13T20:42:24.423533Z	    2 Field List	time_zone_leap_second 
2020-10-13T20:42:24.423787Z	    2 Field List	time_zone_name 
2020-10-13T20:42:24.423973Z	    2 Field List	time_zone_transition 
2020-10-13T20:42:24.424225Z	    2 Field List	time_zone_transition_type 
2020-10-13T20:42:24.424548Z	    2 Field List	user 
2020-10-13T21:31:58.295169Z	    2 Query	SELECT DATABASE()
2020-10-13T21:31:58.296021Z	    2 Init DB	mysql
2020-10-13T21:32:00.846275Z	    2 Quit	
/usr/sbin/mysqld, Version: 5.7.31-log (MySQL Community Server (GPL)). started with:
Tcp port: 0  Unix socket: /var/lib/mysql/mysql.sock
Time                 Id Command    Argument
2020-10-13T21:33:21.256370Z	    2 Connect	root@localhost on  using Socket
2020-10-13T21:33:21.256951Z	    2 Query	select @@version_comment limit 1
2020-10-13T21:33:31.488629Z	    2 Query	SELECT DATABASE()
2020-10-13T21:33:31.489727Z	    2 Init DB	mysql

```

El parámetro `log_output` puede tener tres valores: FILE, que ya hemos visto. TABLE, que almacena los logs en una tabla y NONE, no se registra ninguna consulta aunque estén activados los logs.

```bash
mysql> SET global log_output = 'TABLE';
mysql> select * from mysql.general_log;
+----------------------------+---------------------------+-----------+-----------+--------------+--------------------------------------+
| event_time                 | user_host                 | thread_id | server_id | command_type | argument                             |
+----------------------------+---------------------------+-----------+-----------+--------------+--------------------------------------+
| 2020-10-13 23:37:12.400796 | root[root] @ localhost [] |         2 |         0 | Query        | select * from user                   |
| 2020-10-13 23:37:52.453250 | root[root] @ localhost [] |         2 |         0 | Query        | select * from mysql.general_log      |
| 2020-10-13 23:38:28.108584 | root[root] @ localhost [] |         2 |         0 | Query        | select * from mysql.general_log      |
| 2020-10-13 23:38:31.411007 | root[root] @ localhost [] |         2 |         0 | Query        | select * from mysql.general_log      |
| 2020-10-13 23:38:40.249299 | root[root] @ localhost [] |         2 |         0 | Query        | select * from mysql.general_log      |
| 2020-10-13 23:39:00.047571 | root[root] @ localhost [] |         2 |         0 | Query        | set global log_output = 'TABLE,FILE' |
| 2020-10-13 23:39:03.314014 | root[root] @ localhost [] |         2 |         0 | Query        | select * from mysql.general_log      |
+----------------------------+---------------------------+-----------+-----------+--------------+--------------------------------------+
7 rows in set (0.00 sec)

mysql> 

```

### 4.3 Log de consultas lentas

Es el log que almacena  consultas que pueden ser consideradas como pesadas en tiempo de ejecución. Tampoco viene activado de serie y debemos realizarlo en el my.cnf o con SET GLOBAL:

```bash
# my.cnf
slow_query_log = 1 # 1 = activado, 0 = desactivado
slow_query_log_file = /var/log/consultas_lentas.txt
long_query_time = 2 # si supera 2 segundos se captura el log
```

Ejemplo de uso en tiempo real:

```bash
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> set global slow_query_log = ON;
Query OK, 0 rows affected (0.00 sec)

mysql> set global slow_query_log_file = '/var/log/qlentas.txt';
Query OK, 0 rows affected (0.01 sec)

mysql> set global long_query_time = 2;
Query OK, 0 rows affected (0.00 sec)

mysql> select sleep(4), user from mysql.user;
+----------+---------------+
| sleep(4) | user          |
+----------+---------------+
|        0 | root          |
|        0 | root          |
|        0 |               |
|        0 | mysql.session |
|        0 | mysql.sys     |
|        0 | root          |
|        0 |               |
|        0 | root          |
+----------+---------------+
8 rows in set (32.01 sec)

mysql> 

# Y ahora vemos el fichero 

cat /var/log/qlentas.txt 
/usr/sbin/mysqld, Version: 5.7.31-log (MySQL Community Server (GPL)). started with:
Tcp port: 3306  Unix socket: /var/lib/mysql/mysql.sock
Time                 Id Command    Argument
# Time: 2020-10-13T22:31:51.177116Z
# User@Host: root[root] @ localhost []  Id:     3
# Query_time: 32.005410  Lock_time: 0.000397 Rows_sent: 8  Rows_examined: 8
use mysql;
SET timestamp=1602628311;
select sleep(4), user from mysql.user;

```

#### 4.4 Log binario

Sólo va almacenar información cuando se realicen modificaciones en los datos. Se llama binario porque se almacena en texto binario el log.

Vista del my.cnf:

```bash
[mysqld]
log-bin = /var/log/binario.log

# Creamos el fichoer
touch /var/log/binario.log
chown mysql:mysql /var/log/binario.

# Se puede probara a realizar una operación UPDATE en cualquier tabla

# Para ver el log
msqlbinlog /var/log/binario
```



### 5 Instalación de Mysql Workbench