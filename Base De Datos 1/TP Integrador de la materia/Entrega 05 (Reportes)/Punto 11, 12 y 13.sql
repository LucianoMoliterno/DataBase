USE `terminalautomotriz`;
DROP procedure IF EXISTS `Reporte 11`;
DROP procedure IF EXISTS `Reporte 12`;
DROP procedure IF EXISTS `Reporte 13`;
DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE `Reporte 11` (
in idPedidoParametro int)
BEGIN
if not exists(select idPedido from pedido where idPedido = idPedidoParametro)then
 select 'No existe Pedido' as nMensaje;
else 
 select v.NumeroChasis,'Si' as Terminado from vehiculo as v where v.idPedido = idPedidoParametro and v.fechaFin is not null
 union
 select e.NumeroChasis,concat('NO, Estacion Actual: ', e.EstacionTrabajo_Orden) as Terminado from estadovehiculo as e 
 inner join vehiculo as v where v.idPedido = idPedidoParametro and v.NumeroChasis = e.NumeroChasis and e.fechaEgreso is null; 
end if;
END$$

DELIMITER ;

-- 12) Dado un número de pedido, se requiere listar los insumos que será necesario solicitar,
--     indicando código de insumo y cantidad requerida para ese pedido.
DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE `Reporte 12` (
in idPedidoParametro int)
BEGIN
	if not exists(select idPedido from pedido where idPedido = idPedidoParametro)then
		select 'No existe Pedido' as nMensaje;
	ELSE
		SELECT 
			CI.idInsumo, DP.cantidad * SUM(CI.cantidad)
		FROM
			ModeloVehiculo MV
				INNER JOIN
			DetallePedido DP ON MV.idModeloVehiculo = DP.idModeloVehiculo
				INNER JOIN
			LineaMontaje LM ON MV.idModeloVehiculo = LM.idModeloVehiculo
				INNER JOIN
			EstacionTrabajo ET ON LM.idLineaMontaje = ET.idLineaMontaje
				INNER JOIN
			CantidadInsumo CI ON ET.Orden = CI.Orden
		WHERE
			DP.idPedido = idPedidoParametro
		GROUP BY CI.idInsumo 
		;
    end if;

END$$
DELIMITER ;

/*13) Dada una línea de montaje, indicar el tiempo promedio de construcción de los
vehículos (tener en cuenta sólo los vehículos terminados).*/
DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE `Reporte 13` (
in idLineaMontajeParametro int)
BEGIN
	declare idModelo int;
    declare diff long;
	if not exists(select idLineaMontaje from lineamontaje where idLineaMontaje = idLineaMontajeParametro)then
		select 'No existe Linea de Montaje' as nMensaje;
	ELSE
		select idModeloVehiculo into idModelo from lineamontaje where idLineaMontaje = idLineaMontajeParametro;
        select avg(timediff(fechaFin,fechaInicio))
        into diff
		from vehiculo
		where fechaFin is not null;
		SELECT CONCAT(
		   FLOOR(HOUR(diff) / 24), ' dias, ',
		   MOD(HOUR(diff), 24), ' horas, ',
		   MINUTE(diff), ' minutos, ',
		   SECOND(diff), ' segundos')
		AS TimeDiff;
	end if;

END$$
DELIMITER ;