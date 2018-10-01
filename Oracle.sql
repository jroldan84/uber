--creo  la  tabla TIPO_DOCUMENTO  con los  campos y su  clave primaria y  secundaria.

create table TIPO_DOCUMENTO  (
ID_TipoDocumento int not null,
DescripcionDocumento VARCHAR2 (255) not null,

CONSTRAINT TIPO_DOCUMENTO_PK PRIMARY KEY(ID_TipoDocumento)

); 

--creo  la  tabla GEOGRAFIA  con los  campos y su  clave primaria y  secundaria.

create table GEOGRAFIA  (
ID_Geografia int not null,
Departamento VARCHAR2 (255) not null,
Pais VARCHAR2 (255) not null,
Cuidad VARCHAR2 (255) not null,

CONSTRAINT GEOGRAFIA_PK PRIMARY KEY(ID_Geografia)

); 


--creo  la  tabla LENGUAJE  con los  campos y su  clave primaria y  secundaria.

create table LENGUAJE  (
ID_lenguaje int not null,
Descripcion_Lenguaje VARCHAR2 (255) not null,

CONSTRAINT LENGUAJE_PK PRIMARY KEY(ID_lenguaje)

); 


--creo  la  tabla CLIENTE  con los  campos y su  clave primaria y  secundaria.

create table CLIENTE  (
ID_Cliente int not null,
Name VARCHAR2 (255) not null,
Last_Name VARCHAR2 (255) not null,
Profile_Photo VARCHAR2 (255) not null,
ID_lenguaje INT not null,
Email_Adress VARCHAR2 (255) not null,
Email_Adress_2 VARCHAR2 (255) not null,
Mobile VARCHAR2 (255) not null,
ID_Geografia INT not null,
Invite_Code VARCHAR2 (255) not null,

CONSTRAINT CLIENTE_PK PRIMARY KEY(ID_Cliente),

CONSTRAINT FK_ID_lenguaje FOREIGN KEY (ID_lenguaje)     
    REFERENCES LENGUAJE  (ID_lenguaje),

CONSTRAINT FK_ID_Geografia FOREIGN KEY (ID_Geografia)     
    REFERENCES GEOGRAFIA  (ID_Geografia)

);  

--creo  la  tabla CODIGO_PROMOCIONAL  con los  campos y su  clave primaria y  secundaria.

create table CODIGO_PROMOCIONAL  (
ID_CodigoPromocional int not null,
Descripcion_Codigo VARCHAR2 (255) not null,
ID_Cliente int not null,
FechaAsignacion date not null,

CONSTRAINT CODIGO_PROMOCIONAL_PK PRIMARY KEY(ID_CodigoPromocional),

CONSTRAINT FK_ID_Cliente FOREIGN KEY (ID_Cliente)     
    REFERENCES CLIENTE  (ID_Cliente)

); 

--creo  la  tabla DETALLE_CODIGO_PROMOCIONAL  con los  campos y su  clave primaria y  secundaria.

create table DETALLE_CODIGO_PROMOCIONAL  (
ID_DetalleCodigoPromocional int not null,
ID_CodigoPromocional int not null,
Valor_Codigo VARCHAR2 (255) not null,
EstadoCodigo VARCHAR2 (255) not null,
FechaRedencion date not null,

CONSTRAINT DETALLE_CODIGO_PROMOCIONAL_PK PRIMARY KEY(ID_DetalleCodigoPromocional)

); 

--creo  la  tabla METODO_DE_PAGO  con los  campos y su  clave primaria y  secundaria.

create table METODO_DE_PAGO  (
ID_MetodoPago int not null,
DescripcionMetodoPago VARCHAR2 (255) not null,

CONSTRAINT METODO_DE_PAGO_PK PRIMARY KEY(ID_MetodoPago)

); 

--creo  la  tabla DATALLE_METODO_DE_PAGO  con los  campos y su  clave primaria y  secundaria.

create table DATALLE_METODO_DE_PAGO  (
ID_DetalleMetodoPago int not null,
ID_MetodoPago int not null,
TipoMedioPago VARCHAR2 (255) not null,
NumeroTarjeta VARCHAR2 (255) not null,
CodigoSeguridadTarjeta VARCHAR2 (255) not null,
FechaVencimientoTarjeta date not null,

CONSTRAINT DATALLE_METODO_DE_PAGO_PK PRIMARY KEY(ID_DetalleMetodoPago),

CONSTRAINT FK_ID_MetodoPago FOREIGN KEY (ID_MetodoPago)     
    REFERENCES METODO_DE_PAGO  (ID_MetodoPago)

); 

--creo  la  tabla MONEDA  con los  campos y su  clave primaria y  secundaria.

create table MONEDA  (
ID_Moneda int not null,
Descripcion_Moneda VARCHAR2 (255) not null,
Valor int not null,
ID_Geografia int not null,


CONSTRAINT MONEDA_PK PRIMARY KEY(ID_Moneda),

CONSTRAINT FK_ID_Geografia_Moneda FOREIGN KEY (ID_Geografia)     
    REFERENCES GEOGRAFIA  (ID_Geografia)

); 

--creo  la  tabla LOG_SERVICIO  con los  campos y su  clave primaria y  secundaria.

create table LOG_SERVICIO  (
ID_LogServicio int not null,
DetalleLogServicio VARCHAR2 (255) not null,

CONSTRAINT LOG_SERVICIO_PK PRIMARY KEY(ID_LogServicio)

); 

--creo  la  tabla TIPO_VEHICULO  con los  campos y su  clave primaria y  secundaria.

create table TIPO_VEHICULO  (
ID_TipoVehiculo int not null,
DescripcionTipoVehiculo VARCHAR2 (255) not null,

CONSTRAINT TIPO_VEHICULO_PK PRIMARY KEY(ID_TipoVehiculo)

); 

--creo  la  tabla AÑO  con los  campos y su  clave primaria y  secundaria.

create table AÑO  (
ID_Año int not null,
DescripcionAño VARCHAR2 (255) not null,

CONSTRAINT AÑO_PK PRIMARY KEY(ID_Año)

); 


--creo  la  tabla MODELO  con los  campos y su  clave primaria y  secundaria.

create table MODELO  (
ID_Modelo int not null,
DescripcionModelo VARCHAR2 (255) not null,
ID_Año int not null,

CONSTRAINT  MODELO_PK PRIMARY KEY(ID_Modelo),

CONSTRAINT FK_ID_Año FOREIGN KEY (ID_Año)     
    REFERENCES AÑO  (ID_Año)

); 


--creo  la  tabla MARCA  con los  campos y su  clave primaria y  secundaria.

create table MARCA  (
ID_Marca int not null,
DescripcionMarca VARCHAR2 (255) not null,
ID_Modelo int not null,

CONSTRAINT  MARCA_PK PRIMARY KEY(ID_Marca),

CONSTRAINT FK_ID_Modelo FOREIGN KEY (ID_Modelo)     
    REFERENCES MODELO  (ID_Modelo)

); 

--creo  la  tabla VEHICULO  con los  campos y su  clave primaria y  secundaria.

create table VEHICULO  (
ID_Vehiculo int not null,
Placa VARCHAR2 (255) not null,
ID_Marca int not null,
DescripcionVehiculo VARCHAR2 (255) not null,

CONSTRAINT  VEHICULO_PK PRIMARY KEY(ID_Vehiculo),

CONSTRAINT FK_ID_Marca FOREIGN KEY (ID_Marca)     
    REFERENCES MARCA  (ID_Marca)

); 


--creo  la  tabla CONDUCTOR  con los  campos y su  clave primaria y  secundaria.

create table CONDUCTOR  (
ID_Conductor int not null,
Name VARCHAR2 (255) not null,
Last_Name VARCHAR2 (255) not null,
Profile_Photo VARCHAR2 (255) not null,
ID_lenguaje INT not null,
Email_Adress VARCHAR2 (255) not null,
Email_Adress_2 VARCHAR2 (255) not null,
Mobile VARCHAR2 (255) not null,
ID_Geografia INT not null,

CONSTRAINT  CONDUCTOR_PK PRIMARY KEY(ID_Conductor),

CONSTRAINT FK_ID_lenguaje_Conductor FOREIGN KEY (ID_lenguaje)     
    REFERENCES LENGUAJE  (ID_lenguaje),

CONSTRAINT FK_ID_Geografia_Conductor FOREIGN KEY (ID_Geografia)     
    REFERENCES GEOGRAFIA  (ID_Geografia)

);

--creo  la  tabla ENTIDAD_DE_PAGO  con los  campos y su  clave primaria y  secundaria.

create table ENTIDAD_DE_PAGO  (
ID_EntidadPago int not null,
DescripcionEntidadPago VARCHAR2 (255) not null,

CONSTRAINT  ID_EntidadPago_PK PRIMARY KEY(ID_EntidadPago)

);


--creo  la  tabla REPORTE_PAGO_DETALLE  con los  campos y su  clave primaria y  secundaria.



create table REPORTE_PAGO_DETALLE     (
ID_ReportePagoDetalle int not null,
ID_EntidadPago int not null,
FechaPago date not null,
ValorPago int not null,
DescripcionPago VARCHAR2 (255) not null,

CONSTRAINT  ID_ReportePagoDetalle_PK PRIMARY KEY(ID_ReportePagoDetalle),

CONSTRAINT FK_ID_EntidadPago FOREIGN KEY (ID_EntidadPago)     
    REFERENCES ENTIDAD_DE_PAGO  (ID_EntidadPago)

);

--creo  la  tabla DETALLE_VEHICULO  con los  campos y su  clave primaria y  secundaria.



create table DETALLE_VEHICULO     (
ID_DetalleVehiculo int not null,
ID_Vehiculo int not null,


CONSTRAINT  ID_DetalleVehiculo_PK PRIMARY KEY(ID_DetalleVehiculo),

CONSTRAINT FK_ID_Vehiculo FOREIGN KEY (ID_Vehiculo)     
    REFERENCES VEHICULO  (ID_Vehiculo)

);

--creo  la  tabla ESTADO_DE_SERVICIO  con los  campos y su  clave primaria y  secundaria.



create table ESTADO_DE_SERVICIO     (
ID_EstadoServicio int not null,
DescripcionEstadoServicio VARCHAR2 (255) not null,


CONSTRAINT  ID_EstadoServicio_PK PRIMARY KEY(ID_EstadoServicio)

);


--creo  la  tabla SERVICIO  con los  campos y su  clave primaria y  secundaria.



create table SERVICIO       (
ID_Servicio int not null,
FechaServicio date not null,
Conductor VARCHAR2 (255) not null,
Vehiculo VARCHAR2 (255) not null,
Ciudad VARCHAR2 (255) not null,
ID_EstadoServicio int not null,

CONSTRAINT  ID_Servicio_PK PRIMARY KEY(ID_Servicio),

CONSTRAINT FK_ID_EstadoServicio FOREIGN KEY (ID_EstadoServicio)     
    REFERENCES ESTADO_DE_SERVICIO  (ID_EstadoServicio)


);


--creo  la  tabla CONDUCTOR_VEHICULO  con los  campos y su  clave primaria y  secundaria.



create table CONDUCTOR_VEHICULO       (
ID_ConductorVehiculo int not null,
ID_Conductor int not null,
ID_Vehiculo int not null,

CONSTRAINT  ID_ConductorVehiculo_PK PRIMARY KEY(ID_ConductorVehiculo),

CONSTRAINT FK_ID_Conductor FOREIGN KEY (ID_Conductor)     
    REFERENCES CONDUCTOR  (ID_Conductor),

CONSTRAINT FK_ID_Vehiculo FOREIGN KEY (ID_Vehiculo)     
    REFERENCES VEHICULO  (ID_Vehiculo)

);


--creo  la  tabla DETALLE_RECORRIDO  con los  campos y su  clave primaria y  secundaria.



create table DETALLE_RECORRIDO       (
ID_DetalleRecorrido int not null,
Longitud VARCHAR2 (255) not null,
latitud VARCHAR2 (255) not null,
fecha_hora date not null,

CONSTRAINT  ID_DetalleRecorrido_PK PRIMARY KEY(ID_DetalleRecorrido)

);

--creo  la  tabla DETALLE_SERVICIO  con los  campos y su  clave primaria y  secundaria.



create table DETALLE_SERVICIO       (
ID_DetalleServicio int not null,
Tarifa int not null,
MedioPago VARCHAR2 (255) not null,
TiempoTotal VARCHAR2 (255) not null,
Recorrido VARCHAR2 (255) not null,

CONSTRAINT  ID_DetalleServicio_PK PRIMARY KEY(ID_DetalleServicio)

);

--creo  la  tabla LIQUIDACION  con los  campos y su  clave primaria y  secundaria.



create table LIQUIDACION       (
ID_Liquidacion int not null,

CONSTRAINT  ID_Liquidacion_PK PRIMARY KEY(ID_Liquidacion)

);


--creo  la  tabla FACTURA  con los  campos y su  clave primaria y  secundaria.



create table FACTURA       (
ID_Factura int not null,

CONSTRAINT  ID_Factura_PK PRIMARY KEY(ID_Factura)

);


--creo  la  tabla DETALLE_FACTURA  con los  campos y su  clave primaria y  secundaria.



create table DETALLE_FACTURA       (
ID_DetalleFactura int not null,
ID_Factura int not null,
Detalle_Factura VARCHAR2 (255) not null,
Valor VARCHAR2 (255) not null,


CONSTRAINT  ID_DetalleFactura_PK PRIMARY KEY(ID_DetalleFactura,

CONSTRAINT FK_ID_Factura FOREIGN KEY (ID_Factura)     
    REFERENCES FACTURA  (ID_Factura)

);



--creo  la  tabla DETALLE_RECORRIDO  con los  campos y su  clave primaria y  secundaria.



create table DETALLE_RECORRIDO       (
ID_DetalleRecorrido int not null,
ID_DetalleServicio int not null,
Longitud VARCHAR2 (255) not null,
latitud VARCHAR2 (255) not null,
fecha_hora date not null,

CONSTRAINT  ID_DetalleRecorrido_PK PRIMARY KEY(ID_DetalleRecorrido),

CONSTRAINT FK_ID_DetalleServicio FOREIGN KEY (ID_DetalleServicio)     
    REFERENCES DETALLE_SERVICIO  (ID_DetalleServicio)

);


--creo  la  tabla SERVICIO  con los  campos y su  clave primaria y  secundaria.



create table SERVICIO       (
ID_Servicio int not null,
FechaServicio date not null,
ID_Conductor VARCHAR2 (255) not null,
Vehiculo VARCHAR2 (255) not null,
Ciudad VARCHAR2 (255) not null,
ID_EstadoServicio int not null,

CONSTRAINT  ID_Servicio_PK PRIMARY KEY(ID_Servicio),

CONSTRAINT FK_ID_EstadoServicio FOREIGN KEY (ID_EstadoServicio)     
    REFERENCES ESTADO_DE_SERVICIO  (ID_EstadoServicio),

CONSTRAINT FK_ID_Conductor FOREIGN KEY (ID_Conductor)     
    REFERENCES CONDUCTOR  (ID_Conductor)

);






