create table costo_boletoT(
	id serial,
	costo float unique not null,
	primary key(id)
);

create table tipoT(
	id serial unique,
	tipo varchar not null unique,
	id_costo integer not null,
	primary key(id,id_costo),
	FOREIGN KEY(id_costo) REFERENCES costo_boletoT (id) ON DELETE CASCADE
);

create table marcaT(
	id serial unique,
	marca varchar(25) not null unique,
	id_tipo integer  not null,
	primary key(id,id_tipo),
	FOREIGN KEY (id_tipo) REFERENCES tipoT (id) ON DELETE CASCADE
);

create table modeloT(
	id serial,
	id_marca integer not null,
	modelo varchar(30) unique,
	cantidad_puesto integer not null,
	primary key(id,id_marca),
	FOREIGN KEY (id_marca) REFERENCES marcaT (id) ON DELETE CASCADE
);

create table clientes(
	cedula int primary key not null unique,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	fecha_nacimiento date,
	genero varchar(5) not null
);

