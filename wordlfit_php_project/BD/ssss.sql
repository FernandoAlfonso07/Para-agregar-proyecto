create schema worldfitsbd;
use worldfitsbd; 


SET sql_safe_updates = 0;	

 -- ESTA ES LA TABLA DE GENERO
create table genero(
	id_genero boolean not null,
    genero varchar(100) not null,
    
    primary key(id_genero)
);

insert into genero (id_genero, genero) values (1, "masculino");
insert into genero (id_genero, genero) values (0, "femenino");

 -- ESTA ES LA TABLA DE ROLES
CREATE TABLE roles (
	id_rol int not null,
    rol varchar(100) not null,
    
    primary key (id_rol)
);

INSERT INTO roles (id_rol, rol) VALUES (0, 'Invitado');
INSERT INTO roles (id_rol, rol) VALUES (1, 'Administrador');
INSERT INTO roles (id_rol, rol) VALUES (3, 'Super-Admin');

-- ESTA ES LA TABLA DE USUARIOS
create table usuarios(
	id_usuario int not null auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) null,
    correo varchar(100) not null,
	password varchar(100) not null,
    peso_actual float not null,
    altura_actual float not null,
    id_genero boolean null,
    telefono varchar(20) not null,
    pr int null,
    fecha_registro datetime null,
    id_rol int null,
    imgPerfil varchar(200) null,
    
    primary key (id_usuario),
    foreign key (id_genero) references genero(id_genero)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (id_rol) references roles(id_rol)
    ON DELETE CASCADE
    ON UPDATE CASCADE
); 
-- delete from usuarios;

-- ingresar un usuario;

SELECT * FROM usuarios;


-- UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 3;

select t1.id_usuario, t1.nombre, t1.apellido, t1.correo, t1.telefono, t2.genero, t1.fecha_registro, t3.rol from usuarios t1 
JOIN genero t2 ON t1.id_genero = t2.id_genero 
JOIN roles t3 ON t1.id_rol = t3.id_rol;


select count(*) from usuarios t1 JOIN genero t2 ON t1.id_genero = t2.id_genero;
select COUNT(*) FROM usuarios;
-- Creación llave foranea para id_rol en usuarios.
/*
ALTER TABLE usuarios 
ADD CONSTRAINT KF_id_rol_usuario
foreign key (id_rol) REFERENCES roles(id_rol); 
*/

-- ------------------------------------------------ Informacion de usurio;
-- select t1.nombre, t1.apellido, t1.correo, t1.contraseña, t1.peso_actual, t1.altura_actual, t1.pr, t1.telefono, t2.genero
-- FROM usuarios t1 JOIN genero t2 ON t1.id_genero = t2.id_genero WHERE id_usuario = 3;


-- Esta es la tabla de GENERO



-- Creación llave foranea de la tabla USUARIOS y la tabla GENERO
/*
ALTER TABLE usuarios
ADD CONSTRAINT FK_usuario_genero
foreign key (id_genero) references genero(id_genero);
*/


-- ESTA ES LA TABLA DE EJERCICIOS
create table ejercicios(

	id_ejercicio int not null auto_increment,
    nombre varchar(100) not null,
    Instrucctiones varchar(200) not null,
    equipoNecesario varchar(300) null,
    repeticiones varchar(10) not null,
    seires varchar(10) not null,
    tiempo_descanso int null,
    fecha_registro datetime not null,
    direccion_media varchar(200) null,
    
    primary key(id_ejercicio)

); 
/*
select
t1.id_ejercicio, t1.nombre, t1.Instrucctiones, t1.equipoNecesario, t1.seires, t1.repeticiones, t1.tiempo_descanso, t1.fecha_registro, t3.nombreRutina, t3.id_rutina, t1.direccion_media
FROM ejercicios t1
LEFT JOIN ejercicio_rutinas t2 ON t1.id_ejercicio = t2.id_ejercicio
LEFT JOIN rutinas t3 ON t2.id_rutina = t3.id_rutina;
*/

-- insert INTO ejercicios (nombre, Instrucctiones, equipoNecesario, repeticiones, seires, tiempo_descanso, fecha_registro, direccion_media) VALUES ('Curl de Martillo', 'Curl de Martillo', 'Curl de Martillo', '4', '2', '', now(), '');


-- ESTA ES LA TABLA DE LAS RUTINAS
create table rutinas(

	id_rutina int not null auto_increment,
    nombreRutina varchar(100) not null,
    descripcion varchar(200) not null,
    objetivo varchar(100) not null,
	fecha_registro datetime not null,
	primary key(id_rutina)
    
);


-- ESTA ES LA TABLA QUE RELACIONA RUTINAS Y EJERCICIOS
create table ejercicio_rutinas(
	
    id_relacion int not null auto_increment,
	id_rutina int null,
    id_ejercicio int null,
    
    primary key(id_relacion),
    foreign key(id_rutina) references rutinas(id_rutina) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    foreign key(id_ejercicio) references ejercicios(id_ejercicio) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
    
);


-- creacion llaves foraneas para la relacion M:M de las tablas ejercicio y relacion...
/*
ALTER TABLE ejercicio_rutinas
ADD constraint FK_ejercicio_rutinas_tb_ejerciciostb
foreign key (id_ejercicio) references ejercicios(id_ejercicio);

-- creacion llaves foraneas para la relacion M:M de las tablas rutinas y relacion...

ALTER TABLE ejercicio_rutinas
ADD constraint FK_ejercicio_rutinas_tb_rutinastb
foreign key (id_rutina) references rutinas(id_rutina);
*/


-- ESTA ES LA TABLA DE DIAS DE LA SEMANA que se trabajaran en worldfit
create table dias_semana (

	id_dia int not null,
    nombre varchar(80),
    
    primary key(id_dia)

);
select * from dias_semana;
insert into dias_semana (id_dia, nombre) values (0, 'Domingo');
insert into dias_semana (id_dia, nombre) values (1, 'Lunes');
insert into dias_semana (id_dia, nombre) values (2, 'Martes');
insert into dias_semana (id_dia, nombre) values (3, 'Miercoles');
insert into dias_semana (id_dia, nombre) values (4, 'Jueves');
insert into dias_semana (id_dia, nombre) values (5, 'Viernes');
insert into dias_semana (id_dia, nombre) values (6, 'Sabado');


-- ESTA ES LA TABLA QUE RELACIONA DIAS Y RUTINAS
create table relacion_dia_rutina(

	id_rdias_semanaelacion_d_r int not null auto_increment,
    id_dia int null,
    id_rutina int null,
    
    primary key(id_relacion_d_r),
    foreign key (id_dia) REFERENCES dias_semana(id_dia) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_rutina) REFERENCES rutinas(id_rutina) ON DELETE CASCADE ON UPDATE CASCADE

);



-- select * from relacion_dia_rutina;

-- creacion de las llaves foraneas para el id de la tabla DIA SEMANAS
/*
ALTER TABLE relacion_dia_rutina 
ADD CONSTRAINT FK_relacion_dia_rutina_Dia
foreign key (id_dia) REFERENCES dias_semana(id_dia);

-- creacion de las llaves foraneas para el id de la tabla RELACION DE LAS RUTINAS CON EJERCICIOS

ALTER TABLE relacion_dia_rutina 
ADD CONSTRAINT FK_relacion_dia_rutina_RUTINAS_relacion
foreign key (id_rutina) REFERENCES rutinas(id_rutina);
*/
/* 
select
t1.id_ejercicio, t1.nombre, t1.fecha_registro, t1.tiempo_descanso, t3.nombreRutina, t4.direccion
FROM ejercicios t1
LEFT JOIN ejercicio_rutinas t2 ON t1.id_ejercicio = t2.id_ejercicio
LEFT JOIN rutinas t3 ON t2.id_rutina = t3.id_rutina
LEFT JOIN media t4 ON t4.id_media = t1.id_media;
/* 
-- Ejercicios Joins.

-- Insertar datos-

-- INSERT INTO ejercicios (nombre, fecha_registro, tiempo_descanso) VALUES('Curl de martillo', now(), 2);
-- INSERT INTO rutinas (nombre, fecha_registro, tiempo_descanso) VALUES('Curl de martillo', now(), 2);
/* 
select count(*) FROM ejercicios t1 JOIN ejercicio_rutinas t2 ON t1.id_ejercicio = t2.id_ejercicio
LEFT JOIN rutinas t3 ON t2.id_rutina = t3.id_rutina 
LEFT JOIN media t4 ON t4.id_media = t1.id_media;


select count(*) FROM ejercicios;

select * from usuarios;
*/ 

 create table calendario_rutinario(
 ID_calendarioR int not null auto_increment,
 nombre_personalizado varchar (100) not null,
 id_usuario int null,
 id_relacion_d_r int null,
 
 primary key (ID_calendarioR),
 
 foreign key (id_usuario) references usuarios (id_usuario) on delete cascade on update cascade,
  foreign key (id_relacion_d_r) references relacion_dia_rutina (id_relacion_d_r) on delete cascade on update cascade
 );

select*from rutinas;



insert into rutinas (nombreRutina,descripcion,objetivo,fecha_registro) values ('femoral','rutina de pierna y gluteo','crecer musculo en isquitiviales',now());

insert into ejercicio_rutinas (id_rutina,id_ejercicio) values (1,2);



select * from rutinas t1 join ejercicio_rutinas t2 on t1.id_rutina=t2.id_rutina 
join ejercicios t3 on t2.id_ejercicio=t3.id_ejercicio;

select count(*) from ejercicios t1 join ejercicio_rutinas t2 on t1.id_ejercicio = t2.id_ejercicio 
join rutinas t3 on t2.id_rutina = t3.id_rutina;


select * from usuarios t1 left join calendario_rutinario t2 on t1.id_usuario=t2.id_usuario;


create table gimnasios (
id_gimnasio int not null auto_increment,
nombre varchar (50) not null,
categoria varchar (200) not null,
descripcion text (500) not null,
horario varchar (200) not null,
telefono varchar (20) not null,
direccion varchar (100) not null,
instalaciones_y_servicios varchar (500) not null,
fotos varchar (200),
politicas_y_normativas varchar (500) not null,
formas_de_pago varchar (250) not null,
ofertas_y_promociones varchar (300) not null,
datos_gerente varchar (250) null,
primary key (id_gimnasio)
);

drop table gimnasios;

select * from gimnasios;