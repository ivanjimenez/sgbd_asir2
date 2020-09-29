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

yum install mysql-server

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