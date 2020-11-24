# Conexión remota 

### Acceso Remoto a mysql (NO SEGURO)

### Para poder conectarse remotamente a un equipo con servidor mysql

* Configuramos el fichero `/etc/my.cnf`

```bash
[mysqld]

#	bind-address = 127.0.0.1
        bind-address = 0.0.0.0

#	port = 5000
```

En el caso anterior debemos tener el parámetro **bind-address** desde cualquier host. También se puede reconfigurar el puerto, pero en este caso no lo haremos.

* Para el firewall

`sudo service firewalld stop`



* En la MYSQL

- Realizar un grant sobre el usuario el host desde cual accede: 
`grant all on db.* to 'user'@'IP_desde_cual_se_accede`

- Probamos a conectarnos mediante: `mysql -u user -p -h IP_Servidor_Mysql`

### Realizar túner SSH y conexión posterior a mysql utilizando el túnel (SEGURO)

* Ejecutar el comando de forwarding de puertos con ssh:

`ssh -N -L 3307:127.0.0.1:3306 admin@192.168.1.138`

- Opción N: para hacer forwarding de puertos, no ejecuta el comando completamente y permanece a la espera con el túnel.
- Opción L: ruteo de puertos.

Puerto Origen:HostDestino:PuertoDestino usuario@IP

- Se ejecuta el comando mysql para establecer conexión:

`mysql -u root -p -h 192.168.1.138`

Ya se pueden ejecutar comandos de manera remota y encriptada.
