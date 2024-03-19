
-- Utilizamos el modelo de la práctica 1 (farmacia)
use farmacia;

-- consultas de unión (UNION)
-- las consultas de unión sirven para unir dos consultas distintas pero
-- que devuelven el mismo conjunto de campos. Usualmente las empleamos
-- para unir los resultados de consultas a tablas distintas. Si bien podrían emplearse para unir
-- resultsets de consultas distintas a la misma tabla, por lo general ello se resuelve mejor
-- por medio de un filtro adecuado en una única consulta.
-- Vamos a aumentar nuestro modelo con una tabla de pedidos y su detalle:

create table pedido(
	numero int primary key,
	fecha date not null,
	cliente_dni int not null,
	venta_numero int, 
	foreign key (cliente_dni) references cliente(dni),
	foreign key (venta_numero) references venta(numero)
);

create table detalle_pedido(
	pedido_numero int,
	producto_codigo int,
	cantidad int,
	primary key (pedido_numero, producto_codigo),
	foreign key (pedido_numero) references pedido(numero),
	foreign key (producto_codigo) references producto(codigo)
);

-- insertamos pedidos

INSERT INTO `farmacia`.`pedido` (`numero`, `fecha`, `cliente_dni`) VALUES ('1', '2018-04-17', '22222222');
INSERT INTO `farmacia`.`pedido` (`numero`, `fecha`, `cliente_dni`) VALUES ('2', '2018-04-18', '22222222');
INSERT INTO `farmacia`.`pedido` (`numero`, `fecha`, `cliente_dni`) VALUES ('3', '2018-04-19', '44444444');
INSERT INTO `farmacia`.`pedido` (`numero`, `fecha`, `cliente_dni`) VALUES ('4', '2018-04-19', '23456789');

INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('1', '2', '3');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('1', '3', '1');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('2', '1', '2');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('2', '4', '1');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('3', '5', '2');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('3', '2', '3');
INSERT INTO `farmacia`.`detalle_pedido` (`pedido_numero`, `producto_codigo`, `cantidad`) VALUES ('4', '2','2');

-- Ahora queremos realizar una consulta para traer todos los pedidos sin
-- facturar y las facturas de un cliente determinado:

select 
    'v' as tipo_operacion, v.numero, v.fecha
from
    venta v
where
    v.cliente_dni = 22222222 
union
select 
    'p' as tipo_operacion, p.numero, p.fecha
from
    pedido p
where
    p.cliente_dni = 22222222
        and p.venta_numero IS NULL;


-- Subqueries (subconsultas)
-- Las subqueries son consultas que se ejecutan en el ámbito de
-- otra consulta. A la consulta principal la llamamos externa y
-- del subquery decimos que es la consulta interna.

-- Caso 1:podemos tener un subquery en la cláusula WHERE, para filtrar los 
-- resultados de la consulta exterior de acuerdo a lo que nos devuelva la interior:

select 
    fecha, numero
from
    venta v
where
    v.cliente_dni in (select 
            c.dni
        from
            cliente c
        where
            c. localidad_idlocalidad = 1);

-- En este caso,el mismo resultado puede alcanzarse con un join:
select 
    v.fecha, v.numero
from
    venta v inner join cliente c 
	ON v.cliente_dni = c.dni
where
    c.localidad_idlocalidad = 1;

-- otro ejemplo, con operadores de comparación y funciones de agregación:
-- obtenemos las ventas con algún artículo cuyo precio unitario efectivamente cobrado
-- sea mayor que el precio promedio de lista de todos los productos:
select 
    d.venta_numero
from
    detalle_venta d
where
    d.precio_unitario > (select 
            avg(p.precio)
        from
            producto p)
group by d.venta_numero;

-- obtenemos los productos con precio mayor que el promedio de todos los artículos
-- vendidos. Tanto la  consulta externa como la interna se realizan sobre la misma 
-- tabla:
select 
    p.nombre, p.descripcion, p.precio
from
    producto p
where
    p.precio > (select 
            avg(p2.precio)
        from
            producto p2);


-- Subqueries utilizando EXISTS (o NOT EXISTS). 
-- El predicado EXISTS devuelve true cuando una consulta devuelve registros, por ejemplo:

select EXISTS(select * from cliente);

-- devuelve true (1)


-- Agreguemos un producto para que la siguiente consulta devuelva resultados:
INSERT INTO farmacia.producto (codigo, nombre, descripcion, precio, laboratorio_codigo) 
VALUES (6, 'Cafiaspirina', 'Aspirina con cafeína por tira de 10 unidades', '15', '1');

-- la siguiente consulta devuelve aquellos productos que nunca se vendieron:

select 
    *
from 
    producto p
where
    not exists( 
		select 
            d.venta_numero
        from
            detalle_venta d
        where
            d.producto_codigo = p.codigo);

-- La misma consulta, pero implementada con joins:
SELECT 
    p.*
FROM
    producto p
        LEFT JOIN
    detalle_venta d ON p.codigo = d.producto_codigo
WHERE
    ISNULL(d.producto_codigo);

-- más complejo: queremos conocer  qué clientes compraron más de cierto monto por factura:
select 
    c.dni, c.apellido, c.nombre
from
    cliente c
where
    exists (select 
            sum(d.precio_unitario * d.cantidad) as total
        from
            detalle_venta d
                inner join
            venta v ON v.numero = d.venta_numero
        where
            v.cliente_dni = c.dni
        group by v.numero
        having total > 200);


-- Caso 2: subquery en la cláusula FROM. Obtenemos el máximo, promedio y mínimo
-- de cantidad de items contenidos en las ventas.
-- en este caso, la consulta interior funciona como una tabla intermedia,
-- también llamada tabla derivada:
select 
    max(items.cantidad_items) as maximo,
    avg(items.cantidad_items) as promedio,
    min(items.cantidad_items) as minimo
from
    (select 
        d.venta_numero, count(d.venta_numero) as cantidad_items
    from
        detalle_venta d
    group by d.venta_numero) as items;

-- En este caso traemos los productos cuyo precio de lista
-- sea menor o igual que el promedio de los precios de los productos
-- del laboratorio que lo elabora:

select 
    p.nombre, p.precio, p.laboratorio_codigo
from
    producto p
where
    p.precio <= (select 
            avg(p2.precio)
        from
            producto p2
        where
            p2.laboratorio_codigo = p.laboratorio_codigo);

-- en este caso, la subconsulta se ejecuta para cada registro de la consulta principal.


-- Subqueries en INSERTs:
-- Podemos insertar en una tabla el resultado de un query: En este caso 
-- la consulta exterior será el insert y la interior la que devolverá 
-- el set de datos a insertar.
-- Supongamos que queremos tener una tabla con los clientes que 
-- compraron más de cierto monto por factura:


create table cliente_importante(
	dni int primary key,
	apellido varchar(45),
	nombre varchar(45)
);

insert into cliente_importante (select 
    c.dni, c.apellido, c.nombre
from
    cliente c
where
    exists( select 
            sum(d.precio_unitario * d.cantidad) as total
        from
            detalle_venta d
                inner join
            venta v ON v.numero = d.venta_numero
        where
            v.cliente_dni = c.dni
        group by v.numero
        having total > 200));

select * from cliente_importante;

-- También DELETE puede emplear subqueries. Eliminamos los productos
-- que no existen en ninguna venta:

delete
    p.*
from
    producto p
where
    not exists( 
		select 
            d.venta_numero
        from
            detalle_venta d
        where
            d.producto_codigo = p.codigo);



