

--Punto 1
CREATE VIEW MEDIOS_PAGO_CLIENTES AS
SELECT A.ID_CLIENTE, A.NAME || A.LAST_NAME AS NOMBRE_CLIENTE, C.ID_TIPO_MEDIO_DE_PAGO, C.Descripcion_TIPO_MEDIO_DE_PAGO, B.DESCRIPCIONMETODOPAGO, 
A.SERVICIO_EMPRESARIAL, A.NOMBRE_EMPRESA
FROM CLIENTE A
LEFT JOIN METODO_DE_PAGO B ON A.ID_CLIENTE = B.ID_CLIENTE
LEFT JOIN TIPO_MEDIO_DE_PAGO C ON B.ID_TIPO_MEDIO_DE_PAGO = C.ID_TIPO_MEDIO_DE_PAGO;

--Punto 2
CREATE VIEW VIAJES_CLIENTES AS
SELECT A.FECHASERVICIO AS FECHA_VIAJE, B.NAME || B.LAST_NAME AS NOMBRE_CONDUCTOR, 
G.PLACA AS PLACA_VEHICULO, C.NAME || C.LAST_NAME AS NOMBRE_CLIENTE, D.TOTAL_SERVICIO AS VALOR_TOTAL,
CASE WHEN TIPO_TARIFA = 1 THEN 'TRUE' ELSE 'FALSE' END AS TARIFA_DINAMICA,
H.DESCRIPCIONTIPOVEHICULO AS TIPO_SERVICIO, E.CIUDAD AS CIUDAD_VIAJE
FROM SERVICIO A
INNER JOIN CLIENTE C ON A.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN DETALLE_SERVICIO D ON A.ID_SERVICIO = D.ID_SERVICIO
INNER JOIN GEOGRAFIA E ON A.ID_GEOGRAFIA = E.ID_GEOGRAFIA
INNER JOIN CONDUCTOR_VEHICULO F ON A.ID_CONDUCTORVEHICULO = F.ID_CONDUCTORVEHICULO
INNER JOIN CONDUCTOR B ON B.ID_CONDUCTOR = F.ID_CONDUCTOR
INNER JOIN VEHICULO G ON G.ID_VEHICULO = F.ID_VEHICULO
INNER JOIN TIPO_VEHICULO H ON G.ID_TIPO_VEHICULO = H.ID_TIPOVEHICULO;

--Punto 5.
CREATE OR REPLACE FUNCTION VALOR_DISTANCIA (DISTANCIA NUMBER, CIUDAD2 VARCHAR) 
    RETURN NUMBER       
IS
VALOR_KILO NUMBER;
CIUDAD3 VARCHAR(255);
MENSAJE_ERROR EXCEPTION;
BEGIN
    SELECT VALOR_KILOMETRO, CIUDAD INTO VALOR_KILO, CIUDAD3 FROM GEOGRAFIA WHERE CIUDAD = CIUDAD2;
    
    IF DISTANCIA > 0 AND CIUDAD2 = CIUDAD3 THEN
      RETURN (DISTANCIA * VALOR_KILO) ;
    ELSE 
      RAISE MENSAJE_ERROR;
    END IF;
    
    EXCEPTION
    WHEN MENSAJE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('La cantidad de distancia y/o la ciudad ingresada es errada, favor validar.');
    RETURN NULL;
    
END;
/


--Punto 6.
CREATE OR REPLACE FUNCTION VALOR_TIEMPO (TIEMPO NUMBER, CIUDAD2 VARCHAR) 
    RETURN NUMBER
IS
VALOR_TIMER NUMBER;
CIUDAD3 VARCHAR(255);
MENSAJE_ERROR EXCEPTION;
BEGIN
    SELECT VALOR_MINUTO, CIUDAD  INTO VALOR_TIMER, CIUDAD3 FROM GEOGRAFIA WHERE CIUDAD = CIUDAD2;
    IF TIEMPO > 0 AND CIUDAD2 = CIUDAD3  THEN
      RETURN (TIEMPO * VALOR_TIMER) ;
    ELSE 
      RAISE MENSAJE_ERROR;
    END IF;
    EXCEPTION
    WHEN MENSAJE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('La cantidad de tiempo y/o la ciudad ingresada es errada, favor validar.');
    RETURN NULL;
END;
/


--Punto 7.
CREATE OR REPLACE PROCEDURE CALCULAR_TARIFA (ID_SERVI NUMBER, DISTANCIA_SERVICIO NUMBER, TIEMPO_SERVICIO NUMBER, TOTAL_ADICIONAL NUMBER) AS

ESTADO_SERVICIO VARCHAR(255);
CIUDAD_SERVICIO VARCHAR(255);
TARIFA_BASE1 NUMBER;
VALOR_SERVICIO_DISTANCIA NUMBER;
VALOR_SERVICIO_TIEMPO NUMBER;
VALOR_SERVICIO_TOTAL NUMBER;
VALOR_ADICIONAL NUMBER;

BEGIN

    SELECT I.DESCRIPCIONESTADOSERVICIO ESTADO_VIAJE INTO ESTADO_SERVICIO 
    FROM SERVICIO A
    INNER JOIN DETALLE_SERVICIO D ON A.ID_SERVICIO = D.ID_SERVICIO
    INNER JOIN GEOGRAFIA E ON A.ID_GEOGRAFIA = E.ID_GEOGRAFIA
    INNER JOIN ESTADO_DE_SERVICIO I ON A.ID_ESTADOSERVICIO = I.ID_ESTADOSERVICIO
    WHERE A.ID_SERVICIO = ID_SERVI;
    
    IF ESTADO_SERVICIO = 'REALIZADO' THEN
        SELECT E.TARIFA_BASE, E.CIUDAD INTO TARIFA_BASE1,CIUDAD_SERVICIO 
        FROM SERVICIO A
        INNER JOIN DETALLE_SERVICIO D ON A.ID_SERVICIO = D.ID_SERVICIO
        INNER JOIN GEOGRAFIA E ON A.ID_GEOGRAFIA = E.ID_GEOGRAFIA
        INNER JOIN ESTADO_DE_SERVICIO I ON A.ID_ESTADOSERVICIO = I.ID_ESTADOSERVICIO
        WHERE A.ID_SERVICIO = ID_SERVI;
        
        SELECT VALOR_DISTANCIA( DISTANCIA_SERVICIO, CIUDAD_SERVICIO ) INTO VALOR_SERVICIO_DISTANCIA FROM DUAL;
        SELECT VALOR_TIEMPO( TIEMPO_SERVICIO, CIUDAD_SERVICIO ) INTO VALOR_SERVICIO_TIEMPO FROM DUAL;
        
        VALOR_SERVICIO_TOTAL := VALOR_SERVICIO_DISTANCIA + VALOR_SERVICIO_TIEMPO + TARIFA_BASE1 + VALOR_ADICIONAL;
        
        UPDATE DETALLE_SERVICIO
        SET TOTAL_SERVICIO = VALOR_SERVICIO_TOTAL
        WHERE ID_SERVICIO = (SELECT ID_SERVICIO FROM SERVICIO A WHERE A.ID_SERVICIO = ID_SERVI);
        
        
    ELSE
        UPDATE DETALLE_SERVICIO
        SET TOTAL_SERVICIO = 0
        WHERE ID_SERVICIO = (SELECT ID_SERVICIO FROM SERVICIO A WHERE A.ID_SERVICIO = ID_SERVI);
    END IF;
    
END;
/
