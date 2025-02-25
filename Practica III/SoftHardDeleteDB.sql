create database SoftHardDeleteDB;
use SoftHardDeleteDB;

create table usuarios(
ID int primary key auto_increment,
nombre varchar(100) not null,
email varchar(100) unique,
is_deleted boolean default false
);

create table ordenes (
id_orden int primary key auto_increment,
id_usuario int references usuarios(id_usuario),
producto varchar(100) not null,
cantidad int,
fecha timestamp default current_timestamp
);

insert into usuarios (nombre, email) values
('Juan Perez', 'juan@example.com'),
('Maria Lopez', 'maria@example.com');

insert into ordenes (id_usuario, producto, cantidad) values 
(1,'laptop',1),
(1, 'Mouse',2),
(2, 'Teclado',1);

-- ejemplo de hard delete
delete from ordenes where id_orden = 1;
select * from ordenes;

-- ejemplo de soft delete

update usuarios set is_deleted = true where ID = 1;
select * from usuarios;

-- quienes esten activos

select * from usuarios where is_deleted = false;

-- recuperando dato

update usuarios set is_deleted = false where ID = 1;
select * from usuarios