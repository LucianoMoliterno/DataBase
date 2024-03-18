use terminal_automotriz_alt;

/* Store Procedure - Ejercicio 2 */

DELIMITER //

CREATE PROCEDURE ins_concesionaria(OUT CodResultado INT,
									OUT MsgError VARCHAR(100),
									IN cod VARCHAR(10),
									IN vent_realizadas INT,
									IN cons_id_dom INT)

BEGIN

DECLARE nTotales INT DEFAULT 0;
DECLARE nCantidad INT DEFAULT 0;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
				BEGIN
				SET CodResultado = 1;
				SET MsgError = "Ocurrio un error al ingresar la fila, revisar la informacion";
				END;


SELECT count(*) INTO nCantidad FROM concesionaria WHERE codigo=cod;

SELECT nTotales;
	IF(nTotales > 0) THEN
			
		SELECT 1 INTO CodResultado;
		SELECT 'ERROR: El registro ya existe' INTO MsgError;

	ELSE
		
		INSERT INTO concesionaria(codigo,ventas_realizadas,concesionaria_id_domicilio) VALUES (cod,vent_realizadas,cons_id_dom);
		SELECT 0 INTO CodResultado;
		SELECT 'Ingresado Correctamente' INTO MsgError;

		
    END IF;
END //
DELIMITER ;
/*----------------------------------------------------------------------------------------------------------*/
DELIMITER //
CREATE PROCEDURE del_concesionaria(OUT CodResultado INT,
									OUT MsgError VARCHAR(100),
									IN cod VARCHAR(10),
									IN vent_realizadas INT,
									IN cons_id_dom INT)

BEGIN

DECLARE nTotales INT DEFAULT 1;
DECLARE nCantidad INT DEFAULT 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
				BEGIN
				SET CodResultado = 1;
				SET MsgError = "Ocurrio un error al ingresar la fila, revisar la informacion";
				END;


SELECT count(*) INTO nCantidad FROM concesionaria WHERE codigo=cod;

SELECT nTotales;
	IF(nTotales >= 0) THEN
		DELETE FROM concesionaria WHERE codigo=cod
										and ventas_realizadas=vent_realizadas
										and concesionaria_id_domicilio=cons_id_dom;
		SELECT 0 INTO CodResultado;
		SELECT 'Eliminado Correctamente' INTO MsgError;

	ELSE

		SELECT 1 INTO CodResultado;
		SELECT 'ERROR: El registro no existe' INTO MsgError;

    END IF;
END //
DELIMITER ;
/*----------------------------------------------------------------------------------------------------------*/
DELIMITER //
CREATE PROCEDURE mod_concesionaria(OUT CodResultado INT,
									OUT MsgError VARCHAR(100),
									IN cod VARCHAR(10),
									IN vent_realizadas INT,
									IN cons_id_dom INT)

BEGIN

DECLARE nTotales INT DEFAULT 0;
DECLARE nCantidad INT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
				BEGIN
				SET CodResultado = 1;
				SET MsgError = "Ocurrio un error al ingresar la fila, revisar la informacion";
				END;


SELECT count(*) INTO nCantidad FROM concesionaria WHERE codigo=cod;

SELECT nTotales;
	IF(nTotales > 0) THEN
	
		UPDATE concesionaria SET codigo=cod,
								ventas_realizadas=vent_realizadas,
								concesionaria_id_domicilio=cons_id_dom 
								WHERE codigo=cod;
								
		SELECT 0 INTO CodResultado;
		SELECT 'Actualizado Correctamente' INTO MsgError;

	ELSE

		SELECT 1 INTO CodResultado;
		SELECT 'ERROR: El registro no existe' INTO MsgError;
		
    END IF;
END //
DELIMITER ;