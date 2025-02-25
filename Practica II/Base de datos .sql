create database if not exists VideogameStore;
use VideogameStore;

create table Videogame(
	id_videogame int auto_increment primary key,
	name_videogame varchar(100) not null,
    plataform_videogame varchar(100) not null,
    genre_videogame varchar(100),
    developer_videogame varchar(50),
    price decimal(10,2) not null,
    release_date_videogame date,
    stock int not null default 0
    );
    
create table Customers(
	id_customer int auto_increment primary key,
    name_customer varchar(150) not null,
    email_customer varchar(100) unique,
    phone_customer varchar (20),
    address_customer varchar (200) not null,
    registrationDate_customer  date default(current_date()),
    membership_customer enum('Regular','Premiun', 'VIP') default 'regular'
    );
    
    create table Employee(
    id_employee int auto_increment primary key,
    name_employee varchar(150) not null,
    charge_employee enum('vendedor', 'supervisor', 'gerente') not null
    );
    
create table Sales(
	id_sale int auto_increment primary key,
    date_sale datetime default current_timestamp,
    total_sale decimal(10,2) not null,
    paymentMethod_sale enum('Efectivo', 'Tarjeta', 'Transferencia')not null,
    id_customer int not null,
    id_employee int not null,
    foreign key (id_customer) references Customers(id_customer),
    foreign key (id_employee) references Employee(id_employee)
    );

create table Sales_Details(
	id_saleDetail int auto_increment primary key,
    quantity int not null,
    unit_price_saleDetail decimal(10,2) not null,
    subtotal_saleDetail decimal(10,2) not null,
    id_sale int not null,
    id_videogame int not null,
	foreign key (id_sale) references Sales(id_sale),
    foreign key (id_videogame) references Videogame(id_videogame)
    );