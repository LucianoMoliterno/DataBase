use aeropuerto;
/**********************PUNTO A*************************/
select dni,nombre,apellido from pasajeros;
/**********************PUNTO B*************************/
select dni,nombre,apellido,calle,numero,localidad,provincia from pasajeros;
/**********************PUNTO C************************/
select dni,nombre,apellido,calle,numero,localidad,provincia from pasajeros where viajero_frecuente = "TRUE";
/**********************PUNTO D************************/
select marca,modelo,matricula,fecha_entrada_servicio,pais_origen from aviones;
/**********************PUNTO E***********************/
select marca,modelo,matricula,fecha_entrada_servicio,pais_origen from aviones where pais_origen = "alemania";
/*********************PUNTO  F************************/
select v.codigo, v.avion_vuelo, v.piloto_vuelo, v.aeropuerto_origen, v.aeropuerto_destino, v.fecha_partida, v.hora_partida, v.fecha_llegada, v.hora_llegada 
from vuelos v
inner join aviones av on v.avion_vuelo=av.matricula
inner join pilotos pil on v.piloto_vuelo=pil.cuil
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo;
/********************PUNTO G**************************/
select v.codigo, v.avion_vuelo, v.piloto_vuelo, v.aeropuerto_origen, v.aeropuerto_destino, v.fecha_partida, v.hora_partida, v.fecha_llegada, v.hora_llegada 
from vuelos v
inner join aviones av on v.avion_vuelo=av.matricula
inner join pilotos pil on v.piloto_vuelo=pil.cuil
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
where ae.codigo = "BUE" ;
/******************PUNTO H****************************/
select v.codigo, v.avion_vuelo, v.piloto_vuelo, v.aeropuerto_origen, v.aeropuerto_destino, v.fecha_partida, v.hora_partida, v.fecha_llegada, v.hora_llegada 
from vuelos v
inner join aviones av on v.avion_vuelo=av.matricula
inner join pilotos pil on v.piloto_vuelo=pil.cuil
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
where ae.codigo = "BUE"  and  v.aeropuerto_destino = "MDQ";
/*****************PUNTO I**********************************/
select v.codigo as vuelos, v.avion_vuelo, v.piloto_vuelo, v.aeropuerto_origen, v.aeropuerto_destino, v.fecha_partida, v.hora_partida, v.fecha_llegada, v.hora_llegada, pas.dni as pasajeros, pas.nombre, pas.apellido
from vuelos v
inner join aviones av on v.avion_vuelo=av.matricula
inner join pilotos pil on v.piloto_vuelo=pil.cuil
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
inner join pasajeros pas on v.dni=pas.dni;
/****************PUNTO J************************************/
select v.aeropuerto_origen, v.aeropuerto_destino, count(*) as cantidad_vuelos
from vuelos v
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
where ae.codigo = "BUE"  and  v.aeropuerto_destino = "BRC"
group by v.codigo;
/****************PUNTO K************************************/
select v.aeropuerto_origen, count(*) as cantidad_vuelos
from vuelos v
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
where ae.codigo = "MDQ"
group by v.codigo;
/****************PUNTO L*************************************/
select v.aeropuerto_origen as codigo_IATA, count(*) as cantidad_vuelos
from vuelos v
inner join aeropuertos ae on v.aeropuerto_origen=ae.codigo
group by v.codigo;
/****************PUNTO M*************************************/
select pas.dni as pasajero, pas.localidad, count(*) as cantidad_pasajeros
from pasajeros pas
group by pas.dni;
/***************PUNTO O**************************************/
select v.codigo as vuelo, pas.apellido, pas.nombre, pas.dni, count(*) as cantidad_pasajeros
from vuelos v
inner join pasajeros pas on v.dni=pas.dni
group by v.codigo;