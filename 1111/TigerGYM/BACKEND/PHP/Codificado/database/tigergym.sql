
--  ME TIRA ERROR CUANDO LE METO EL AUTO INCREMENT POR QUEEE?

CREATE DATABASE tigergym_1;
USE tigergym;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `usuario`

CREATE TABLE usuario (

  ID_USUARIO int(6) NOT NULL,
  ID_TIPO int(4) NOT NULL,
  DNI int(8) NOT NULL,
  nombre varchar(15) NOT NULL,
  apellido varchar(15) NOT NULL,
  email int(20) NOT NULL,
  telefono varchar(15) NOT NULL,
  direccion varchar(30) NOT NULL,
  sexo varchar(10) NOT NULL,
  fecha_alta date,
  pass varchar(20) NOT NULL,

  CONSTRAINT pk_usuario  PRIMARY KEY (ID_USUARIO),
  CONSTRAINT uq_usuarios UNIQUE (ID_DNI),
  CONSTRAINT uq_email UNIQUE (email),
  CONSTRAINT fk_usuario_actividad FOREIGN KEY (ID_TIPO) REFERENCES  tipo (ID_TIPO), 
) 

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tipo`    REVISAAAAAAR EL AUTO INCREMENT Y CUALES MIERDA ERAN LSO TIPOS

CREATE TABLE tipo (
  ID_TIPO int (4)  NOT NULL,
  nombre varchar(20) NOT NULL,
  CONSTRAINT pk_tipo  PRIMARY KEY (ID_TIPO),
);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `actividad_usuario`
CREATE TABLE actividad_usuario (
  ID_ACTIVIDAD_USUARIO int(11) NOT NULL,
  ID_ACTIVIDAD int(11) NOT NULL,
  ID_USUARIO int(6) NOT NULL,
  CONSTRAINT pk_actividad_usuario  PRIMARY KEY (ID_ACTIVIDAD_USUARIO),
  CONSTRAINT fk_actividad_usuario_actividad FOREIGN KEY (ID_ACTIVIDAD) REFERENCES actividad (ID_ACTIVIDAD),
  CONSTRAINT fk_usuario_actividad_usuario FOREIGN KEY (ID_USUARIO) REFERENCES  usuario (ID_USUARIO), 
);
 
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `actividad`
CREATE TABLE actividad (
  ID_ACTIVIDAD int(11) NOT NULL,
  ID_USUARIO int(6) NOT NULL,
  nombre_actividad varchar(20) NOT NULL,
  precio_actividad float(1000,2) NOT NULL,
  CONSTRAINT pk_actividad PRIMARY KEY(ID_ACTIVIDAD),
  CONSTRAINT uq_nombre_actividad UNIQUE (nombre_actividad),
);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `dia`
CREATE TABLE dia (
  ID_DIA int(4) NOT NULL,
  nombre_dia varchar(10) NOT NULL,
  CONSTRAINT pk_dia  PRIMARY KEY (ID_DIA),
);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `horario`

CREATE TABLE horario (
  ID_HORARIO int(10) NOT NULL AUTO_INCREMENT,
  ID_ACTIVIDAD int(11) NOT NULL,
  ID_DIA int(4) NOT NULL,
  hora_entrada time,
  hora_salida time,
  CONSTRAINT pk_actividad PRIMARY KEY(ID_HORARIO),
  CONSTRAINT fk_horario_actividad FOREIGN KEY (ID_ACTIVIDAD) REFERENCES  actividad (ID_ACTIVIDAD), 
  CONSTRAINT fk_horario_dia FOREIGN KEY (ID_DIA) REFERENCES  dia (ID_DIA),
) ;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `pago`
CREATE TABLE pago (
  ID_PAGO int(255) NOT NULL,
  ID_USUARIO int(6) NOT NULL,
  fecha_pago date NOT NULL,
  fecha_vencimiento date NOT NULL,
  monto int (10) NOT NULL,
  CONSTRAINT pk_pago  PRIMARY KEY (ID_PAGO),
  CONSTRAINT fk_PAGO_usuario FOREIGN KEY (ID_USUARIO) REFERENCES  usuario (ID_USUARIO),
);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `registro_e_s`
CREATE TABLE registro_e_s (
  ID_REGISTRO_E_S int (255) NOT NULL,
  ID_USUARIO int(6) NOT NULL,
  ID_PAGO int (255) NOT NULL,
  fecha date NOT NULL,
  hora_entrada time NOT NULL,
  hora_salida time NOT NULL,
  CONSTRAINT pk_registro_e_s  PRIMARY KEY (ID_REGISTRO_E_S),
  CONSTRAINT fk_registroES_usuario FOREIGN KEY (ID_USUARIO) REFERENCES  usuario (ID_USUARIO),
  CONSTRAINT fk_registroES_pago FOREIGN KEY (ID_PAGO) REFERENCES  pagos (ID_PAGO),
);
 
