create schema if not exists aeropuerto;
use aeropuerto;
/*--------------------------------------------------------------------------------------------------------------*/
create table marcas(
codigo int primary key,
nombre varchar(45) not null,
pais varchar(100) not null
);
insert into marcas values(1,"cessna","estados unidos");
insert into marcas values(2,"beechcraft","estados unidos");
insert into marcas values(3,"fokker","alemania");
select * from marcas;
/******************************************************************************************************************/
create table aviones(
matricula varchar(50) primary key,
marca varchar(40) not null,
modelo varchar(40) not null,
fecha_entrada_servicio datetime not null,
pais_origen varchar(50) not null
);
drop table aviones;
insert into aviones values("LV-ABC","cessna","citation",'2010-12-12',"estados unidos");
insert into aviones values("LV-CDE","beechcraft","baron",'2011-10-01',"estados unidos");
insert into aviones values("LV-FGH","fokker","F-27",'2008-05-04',"alemania");
insert into aviones values("LV-IJK","cessna","citation",'2014-06-07',"estados unidos");
insert into aviones values("LV-LMN","beechcraft","king air",'2012-07-08',"estados unidos");
select * from aviones;
/*********************************************************************************************************************/
create table pasajeros(
nombre varchar(50) not null,
apellido varchar(45) not null,
dni int primary key,
viajero_frecuente boolean not null,
calle varchar(50) not null,
numero int not null,
localidad varchar(40) not null,
provincia varchar(40) not null
);
insert into pasajeros values("barragan","alejo",11111111,true,"ituzaingo",123,"lanus","buenos aires");
insert into pasajeros values("casas","andres alfredo",22222222,true,"roca",4561,"caba","caba");
insert into pasajeros values("chavez","barbara",33333333,false,"campichuelo",6532,"avellaneda","buenos aires");
insert into pasajeros values("chimbo","brisa",44444444,true,"meeks",562,"lomas de zamora","buenos aires");
insert into pasajeros values("chudoba","camila",55555555,false,"mamberti",2356,"lanus","buenos aires");
insert into pasajeros values("cires","carlos",66666666,true,"amenabar",2345,"caba","caba");
insert into pasajeros values("cusato","carlos sebastian",77777777,false,"capello",1589,"lomas de zamora","buenos aires");
insert into pasajeros values("dominguez","cristian",88888888,true,"amenabar",356,"caba","caba");
insert into pasajeros values("escullini","cristian",99999999,true,"meeks",1296,"lomas de zamora","buenos aires");
insert into pasajeros values("feijoo","cristian",10111213,true,"san martin",3652,"avellaneda","buenos aires");
select * from pasajeros;
/**************************************************************************************************************************/
create table pilotos(
nombre varchar(40) not null,
apellido varchar(40) not null,
dni int not null,
cuil varchar(100) primary key,
fecha_ingreso datetime not null,
calle varchar(50) not null,
numero int not null,
localidad varchar(40) not null,
provincia varchar(40) not null
);
insert into pilotos values("juarez","federico bernardo",12345678,"20-12345678-8",'1994,10,01',"san martin",2235,"caba","caba");
insert into pilotos values("lacoste","franco",34567890,"20-34567890-1",'2003,07,01',"azara",1254,"lomas de zamora","buenos aires");
insert into pilotos values("laime","mariana",45678901,"27-45678901-1",'2001,04,01',"sarmiento",500,"lanus","buenos aires");
insert into pilotos values("lopez","german ignacio",56789123,"20-56789123-3",'2013,05,01',"rivadavia",2351,"caba","caba");
insert into pilotos values("martinez","giuliano",67891234,"20-67891234-4",'2010,07,01',"martinto",663,"lanus","buenos aires");
insert into pilotos values("medina","adriana",78912345,"27-78912345-5",'2015,08,01',"bolaños",1256,"lanus","buenos aires");
insert into pilotos values("melgarejo","jair alberto",90123456,"20-90123456-6",'2011,03,01',"loria",333,"lomas de zamora","buenos aires");
select * from pilotos;
/***************************************************************************************************************************************/
create table aeropuertos(
codigo varchar(40) primary key,
nombre varchar(40) not null,
cuidad varchar(40) not null
);
insert into aeropuertos values("BUE","aeroparque jorge newbery","caba");
insert into aeropuertos values("MDQ","astor piazolla","mar del plata");
insert into aeropuertos values("BRC","teniente luis candelaria","san carlos de bariloche");
select * from aeropuertos;
/***************************************************************************************************************************************/
create table vuelos(
codigo varchar(40),
avion_vuelo varchar(40) not null,#matricula
piloto_vuelo varchar(50),#cuil
aeropuerto_origen varchar(40) not null,
aeropuerto_destino varchar(40) not null,
fecha_partida datetime not null,
hora_partida datetime not null,
fecha_llegada datetime not null,
hora_llegada datetime not null,
dni int not null,
primary key (codigo),
    foreign key (avion_vuelo) references aviones (matricula),
    foreign key (piloto_vuelo) references pilotos (cuil), 
    foreign key (aeropuerto_origen) references aeropuertos(codigo),
    foreign key (aeropuerto_destino) references aeropuertos(codigo),
    foreign key (dni) references pasajeros(dni)
);
drop table vuelos;
show tables;
INSERT INTO vuelos values("TT1234", "LV-ABC", "20-12345678-8", "BUE", "BRC", '2018-5-1', '20:00:00', '2018-5-1','23:00:00', 44444444);
INSERT INTO vuelos values("TT3456", "LV-CDE", "27-78912345-5", "BUE", "MDQ", '2018-5-2', '10:00:00', '2018-5-2','12:00:00', 77777777);
INSERT INTO vuelos values("TT1235", "LV-ABC", "20-12345678-8", "BRC", "BUE", '2018-5-2', '07:00:00', '2018-5-2','10:00:00', 44444444);
INSERT INTO vuelos values("TT1256", "LV-FGH", "27-45678901-1", "BUE", "MDQ", '2018-5-2', '08:00:00', '2018-5-2','10:00:00', 11111111);
INSERT INTO vuelos values("TT5632", "LV-IJK", "20-56789123-3", "MDQ", "BUE", '2018-5-3', '07:00:00', '2018-5-3','09:00:00', 66666666);
INSERT INTO vuelos values("TT3333", "LV-LMN", "20-12345678-8", "BUE", "BRC", '2018-5-3', '07:00:00', '2018-5-3','10:00:00', 55555555);
INSERT INTO vuelos values("TT1257", "LV-FGH", "27-45678901-1", "BUE", "MDQ", '2018-5-4', '08:00:00', '2018-5-4','10:00:00', 22222222);
INSERT INTO vuelos values("TT3457", "LV-CDE", "27-78912345-5", "MDQ", "BUE", '2018-5-4', '10:00:00', '2018-5-4','12:00:00', 99999999);
INSERT INTO vuelos values("TT5635", "LV-IJK", "20-12345678-8", "BUE", "MDQ", '2018-5-5', '07:00:00', '2018-5-5','09:00:00', 88888888);
select * from vuelos;




