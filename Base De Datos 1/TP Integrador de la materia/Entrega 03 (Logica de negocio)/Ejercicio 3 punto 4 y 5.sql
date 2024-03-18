USE `terminalautomotriz`;
DROP procedure IF EXISTS `AltaEstadoVehiculoOrden1`;

/*

Se requiere crear un procedimiento que al recibir como parámetro la patente del
automóvil, se le dé inicio al montaje del mismo, es decir, que al ejecutar dicho
procedimiento el automóvil con la patente indicada es “posicionado” en la primer
estación de la línea de montaje que le fue asignada al crear el vehículo con el
procedimiento (8)

--Importante--

No puede ingresarse el vehículo en la estación de trabajo si es que hay otro
automóvil en dicho lugar.

*/

DELIMITER $$
USE `terminalautomotriz`$$

CREATE PROCEDURE `AltaEstadoVehiculoOrden1` (
in _NumeroChasis int,
out nResultado int,
out nMensaje varchar(50),
out patente int)
BEGIN
declare idModeloParametro int;
declare idLinea int;
declare FechaI datetime;
declare isnull int;
   
SELECT 
    v.idModeloVehiculo
FROM
    vehiculo AS v
WHERE
    v.NumeroChasis = _NumeroChasis INTO idModeloParametro;
    
SELECT 
    l.idLineaMontaje
FROM
    lineamontaje AS l
WHERE
    l.idModeloVehiculo = idModeloParametro INTO idLinea;


 -- para condicionar si existe algun vehiculo en la estacion de trabajo.


SELECT 
    COUNT(*)
INTO isnull FROM
    terminalautomotriz.estadovehiculo
WHERE
    fechaEgreso IS NULL
AND
	EstacionTrabajo_Orden = 1
AND
	EstacionTrabajo_idLineaMontaje = idLinea;
    
-- (1, now(), null, 1, 1)
if (isnull = 0) then -- si hay registros con fecha de egreso 
					 -- significa que ya salieron de ese order de la estacion de trabajo
	insert into estadovehiculo values (_NumeroChasis, now(), null, 1, idLinea);
    select e.fechaIngreso from estadovehiculo as e where e.NumeroChasis = _NumeroChasis into fechaI; 
    update vehiculo  as v set v.fechaInicio = fechaI where v.NumeroChasis = _NumeroChasis;
    select 0 into nResultado;
    select 'Ingreso exitoso' into nMensaje;
else 
  select -1 into nResultado;
  select 'No se pudo ingresar el vehiculo 'into nMensaje;
  select numeroChasis FROM estadovehiculo WHERE fechaEgreso IS NULL AND
		EstacionTrabajo_Orden = 1
	AND
		EstacionTrabajo_idLineaMontaje = idLinea into patente;
        
/*
En caso de no ser posible la inserción del vehículo en la primer estación por
encontrarse ocupada, deberá retornar un resultado informando esta situación,

además del chasis del vehículo que está ocupando dicha estación.
*/

end if;

/*verificar si la estacion de trabajo tuvo algun vehiculo en el orden 1 en algun momento lo 
hariamos con un count() si nos devuelve 0 o null es que nunca paso un vehiculo asi que 
creamos el estado para este chasis.

si el COUNT nos devuelve mayor a 0 tenemos que ver en las ordenes que ninguna tenga fecha de egreso null.
*/
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `AltaEstadoVehiculoSiguienteOrden`;
DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE `AltaEstadoVehiculoSiguienteOrden` (
in _NumeroChasis int,
out nResultado int,
out nMensaje varchar(50))

BEGIN

declare OrdenActual int;
declare OrdenSiguiente int;
declare Orden1 int;
declare idModeloParametro int;
declare idLinea int;
declare fechaFin datetime;
declare isnull int;

SELECT v.idModeloVehiculo FROM vehiculo AS v WHERE v.NumeroChasis = _NumeroChasis INTO idModeloParametro;
SELECT l.idLineaMontaje FROM lineamontaje AS l WHERE l.idModeloVehiculo = idModeloParametro INTO idLinea;
select max(ev.EstacionTrabajo_Orden) from estadovehiculo as ev where ev.NumeroChasis = _NumeroChasis into Orden1;
if (orden1 is null) then
 select -1 into nResultado;
 select 'Automovil no paso por orden 1'into nMensaje;
else 
 select max(ev.EstacionTrabajo_Orden) from estadovehiculo as ev where ev.NumeroChasis = _NumeroChasis into OrdenActual;
 -- tengo orden actual,verifico que la fecha en estado vehiculo sea null donde  

  set OrdenSiguiente = OrdenActual + 1;
   if exists(select Orden from estaciontrabajo where Orden = OrdenSiguiente)then
	 SELECT COUNT(*) INTO isnull FROM terminalautomotriz.estadovehiculo WHERE fechaEgreso IS NULL AND EstacionTrabajo_Orden = OrdenSiguiente AND EstacionTrabajo_idLineaMontaje = idLinea;
     if (isnull = 0) then -- si hay registros con fecha de egreso 
					 -- significa que ya salieron de ese order de la estacion de trabajo
		  update estadovehiculo as ev set ev.fechaEgreso = now() where ev.EstacionTrabajo_Orden = OrdenActual and ev.NumeroChasis = _NumeroChasis;
		insert into estadovehiculo values (_NumeroChasis, now(), null, OrdenSiguiente, idLinea);
		select 0 into nResultado;
		select 'Ingreso exitoso' into nMensaje;
	 else
      select -1 into nResultado;
		select 'Estacion ocupada' into nMensaje;
     END IF;
     
   else
		if exists(select fechaEgreso from estadoVehiculo where EstacionTrabajo_Orden = OrdenActual and  fechaEgreso IS NULL )then
			update estadovehiculo as ev set ev.fechaEgreso = now() where ev.EstacionTrabajo_Orden = OrdenActual and ev.NumeroChasis = _NumeroChasis;
			select ev.fechaEgreso from estadovehiculo as ev where ev.EstacionTrabajo_Orden = OrdenActual  and ev.NumeroChasis = _NumeroChasis into fechaFin;
			update vehiculo as v set v.fechaFin = fechaFin where v.NumeroChasis = _NumeroChasis; 
		end if;
		select 0 into nResultado;
		select 'Automovil Ya fue Terminado'into nMensaje;
  
 end if;
end if;
END$$

DELIMITER ;