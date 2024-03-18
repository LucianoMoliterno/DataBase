USE `terminalautomotriz`;
DROP procedure IF EXISTS `Alta Vehiculo`;

/*
Se requiere crear un procedimiento que dada la información de un pedido en
particular, se generan los automóviles con la patente asignada al azar en la tabla
correspondiente según el modelo. La idea es que se deben generar los automóviles y
dejarlos en el estado inicial, es decir, con la línea de montaje asignada, pero sin
ingresar a la primer estación de dicha línea. 

*/

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE `Alta Vehiculo`(
in IDPedidoParametro int,
out nMensaje varchar(50),
out nResultado varchar(50))
BEGIN
declare finished int default 0;
declare idChasis int default 1;
declare idModeloParametro int;
declare nCantidad int;
declare nInsertados int;
declare curDetallePedido cursor for 
select idModeloVehiculo,cantidad from detallepedido where idPedido = IDPedidoParametro;
declare continue handler for not found set finished = 1;
if not exists(select idPedido from detallepedido where idPedido = IDPedidoParametro)then
   select -1 into nResultado;
   select 'No existe Pedido' into nMensaje;
else
if exists(select v.idPedido from vehiculo as v where v.idPedido = IDPedidoParametro)then
   select -1 into nResultado;
   select 'Pedido ya ingresado' into nMensaje;
else   
SELECT 
    MAX(numeroChasis) + 1
INTO idChasis FROM
    vehiculo;
if (idChasis) is null then 
	set idchasis=1;
end if;
open curDetallePedido;
 getDetalle:loop
  fetch curDetallePedido into idModeloParametro,nCantidad;
  if finished = 1 then
   leave getDetalle;
  end if;
  set nInsertados = 0;
  while nInsertados < nCantidad do
   insert into vehiculo(NumeroChasis,idPedido,idModeloVehiculo) values(idChasis,IDPedidoParametro,idModeloParametro);
   set idChasis = idChasis + 1;
   set nInsertados = nInsertados + 1;
   select 0 into nResultado;
   select 'Ingreso exitoso' into nMensaje;
  end while; 
 end loop getDetalle;  
close curDetallePedido;
end if;
end if;
END$$

DELIMITER ;