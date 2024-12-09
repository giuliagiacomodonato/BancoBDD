#GIULIA GIACOMODONATO
#TOMÁS KRECZMER
CREATE DATABASE banco;

USE banco;

#TABLAS
#--------------------------------------------------------------------------------------------------------------------------------------------------------
#Ciudad (cod_postal, nombre)
#cod postal es un natural de 4 cifras y nombre es una cadena de caracteres.

CREATE TABLE ciudad(
	cod_postal SMALLINT UNSIGNED NOT NULL CHECK(cod_postal <= 9999),
	nombre VARCHAR(45) NOT NULL,

	CONSTRAINT primary_key_ciudad
	PRIMARY KEY(cod_postal)

);

#Sucursal (nro_suc, nombre, direccion, telefono, horario, cod postal)
#número es un natural de 3 cifras; nombre, direccion, telefono y horario son cadenas de caracteres;
#y cod postal corresponde al código postal de una ciudad.

CREATE TABLE sucursal(
	nro_suc SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	direccion VARCHAR(20) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	horario VARCHAR(30) NOT NULL,
	cod_postal SMALLINT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_sucursal
	PRIMARY KEY(nro_suc),

	CONSTRAINT fk_sucursal_CP
	FOREIGN KEY (cod_postal) REFERENCES ciudad(cod_postal)
	ON DELETE RESTRICT ON UPDATE CASCADE

) ;


#Empleado (legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,nro suc)
#legajo es un natural de 4 cifras; apellido, nombre, tipo doc, direccion, telefono, cargo y password
#son cadenas de caracteres; nro_doc es un natural de 8 cifras; nro_suc corresponde al número de
#una sucursal. El campo password debe ser una cadena de 32 caracteres, para poder almacenarlo
#de forma segura utilizando la función de hash MD5 provista por MySQL

CREATE TABLE empleado(
	legajo SmallInt UNSIGNED NOT NULL AUTO_INCREMENT,
	apellido VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	tipo_doc VARCHAR(20) NOT NULL,
	nro_doc INT UNSIGNED NOT NULL CHECK(nro_doc <= 99999999),
	direccion VARCHAR(20) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	cargo VARCHAR(20) NOT NULL,
	password CHAR(32) NOT NULL,
	nro_suc SmallInt UNSIGNED NOT NULL,

	CONSTRAINT primary_key_empleado
	PRIMARY KEY(legajo),


	CONSTRAINT fk_empleado_NS
	FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#cliente (nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
#nro_cliente es un natural de 5 cifras; apellido, nombre, tipo_doc, direccion y telefono son cadenas
#de caracteres; nro doc es un numero de 8 cifras.

CREATE TABLE cliente(
	nro_cliente MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
	apellido VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	tipo_doc VARCHAR(20) NOT NULL,
	nro_doc INT UNSIGNED NOT NULL CHECK(nro_doc <= 99999999),
	direccion VARCHAR(20) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	fecha_nac DATE NOT NULL,


	CONSTRAINT primary_key_cliente
	PRIMARY KEY(nro_cliente)

);


#plazo_fijo (nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)
#nro plazo es un natural de 8 cifras; capital, tasa interes e interes son reales positivos con 2 decimales;
#nro suc corresponde a un numero de sucursal.

CREATE TABLE plazo_fijo(
	nro_plazo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	capital DECIMAL(16,2) UNSIGNED NOT NULL CHECK(capital >= 0),
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	tasa_interes DECIMAL(4,2) UNSIGNED NOT NULL CHECK(tasa_interes >= 0),
	interes DECIMAL(16,2) UNSIGNED NOT NULL CHECK(interes >= 0),
	nro_suc SMALLINT UNSIGNED NOT NULL,


	CONSTRAINT primary_key_plazo_fijo
	PRIMARY KEY(nro_plazo),

	CONSTRAINT fk_plazoFijo_NS
	FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#tasa_plazo_fijo(periodo, monto_inf, monto_sup, tasa)
#periodo es un natural de 3 cifras; monto inf, monto sup, tasa son reales positivos con 2 decimales.

CREATE TABLE tasa_plazo_fijo(
	periodo SMALLINT UNSIGNED NOT NULL CHECK(periodo <= 999),
	monto_inf DECIMAL(16,2) UNSIGNED NOT NULL CHECK(monto_inf >= 0),
	monto_sup DECIMAL(16,2) UNSIGNED NOT NULL CHECK(monto_sup >= 0),
	tasa DECIMAL(4,2) UNSIGNED NOT NULL CHECK(tasa >= 0),

	CONSTRAINT primary_key_tasa_plazo_fijo
	PRIMARY KEY(periodo,monto_inf,monto_sup)

);


#plazo_cliente (nro_plazo, nro_cliente)
#nro_plazo y nro cliente corresponden a un número de plazo fijo y cliente respectivamente

CREATE TABLE plazo_cliente(
	nro_plazo INT UNSIGNED NOT NULL,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_plazo_cliente
	PRIMARY KEY(nro_plazo,nro_cliente),

	CONSTRAINT fk_plazoCliente_NP
	FOREIGN KEY (nro_plazo) REFERENCES plazo_fijo(nro_plazo)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_plazoCliente_NC
	FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#prestamo (nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo,nro_cliente)
#nro_prestamo es un natural de 8 cifras; cant meses es un natural de 2 cifras; monto, tasa_interes,
#interes y valor_cuota, son reales positivos con 2 decimales; legajo corresponde al legajo de un
#empleado y nro_cliente corresponde a un número de cliente.

CREATE TABLE prestamo(
	nro_prestamo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	fecha DATE NOT NULL,
	cant_meses TINYINT UNSIGNED NOT NULL,
	monto DECIMAL(10,2) UNSIGNED NOT NULL CHECK(monto >= 0),
	tasa_interes DECIMAL(4,2)  UNSIGNED NOT NULL CHECK(tasa_interes >= 0),
	interes DECIMAL(9,2) UNSIGNED NOT NULL CHECK(interes >= 0),
	valor_cuota DECIMAL(9,2) UNSIGNED NOT NULL CHECK(valor_cuota >= 0),
	legajo SMALLINT UNSIGNED NOT NULL,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_prestamo
	PRIMARY KEY(nro_prestamo),

	CONSTRAINT fk_prestamo_l
	FOREIGN KEY (legajo) REFERENCES empleado(legajo)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_prestamo_NC
	FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#pago (nro_prestamo, nro_pago, fecha_venc, fecha_pago)
#nro_prestamo corresponde a un número de préstamo; nro pago es un natural de 2 cifras

CREATE TABLE pago(
	nro_prestamo INT UNSIGNED NOT NULL,
	nro_pago TINYINT UNSIGNED NOT NULL CHECK(nro_pago <= 99),
	fecha_venc DATE NOT NULL,
	fecha_pago DATE,

	CONSTRAINT primary_key_pago
	PRIMARY KEY(nro_prestamo,nro_pago),

	CONSTRAINT fk_pago_NP
	FOREIGN KEY (nro_prestamo) REFERENCES prestamo(nro_prestamo)
	ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#tasa_prestamo (periodo, monto_inf, monto_sup, tasa)
#perido es un natural de 3 cifras; monto_inf, monto_sup y tasa son reales positivos con 2 decimales.

CREATE TABLE tasa_prestamo(
	periodo SMALLINT UNSIGNED NOT NULL CHECK(periodo <= 999),
	monto_inf DECIMAL(10,2) UNSIGNED NOT NULL CHECK(monto_inf >= 0),
	monto_sup DECIMAL(10,2) UNSIGNED NOT NULL CHECK(monto_sup >= 0),
	tasa DECIMAL(4,2) UNSIGNED NOT NULL CHECK(tasa >= 0),


	CONSTRAINT primary_key_tasa_prestamo
	PRIMARY KEY(periodo,monto_inf,monto_sup)

);


#caja_Ahorro (nro_ca, CBU, saldo)
#nro_ca es un natural de 8 cifras, CBU es un natural de 18 cifras y saldo es un real positivo con
#2 decimales.

CREATE TABLE caja_ahorro(
	nro_ca INT UNSIGNED AUTO_INCREMENT NOT NULL,
	CBU BIGINT UNSIGNED NOT NULL CHECK(CBU <= 999999999999999999),
	saldo DECIMAL(16,2) UNSIGNED NOT NULL CHECK(saldo >= 0),

	PRIMARY KEY(nro_ca)

);


#cliente_ca (nro_cliente, nro_ca)
#nro_cliente corresponde a un número de cliente, nro_ca corresponde a un número de caja de
#Ahorro.

CREATE TABLE cliente_ca(
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,
	nro_ca INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_cliente_ca
	PRIMARY KEY(nro_cliente,nro_ca),

	CONSTRAINT fk_clienteCA_NCl
	FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_clienteCA_NCa
	FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE


);


#tarjeta (nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
#nro_tarjeta es un natural de 16 cifras; PIN y CVT son cadenas de 32 caracteres, para poder
#almacenarlos de forma segura utilizando la funci´on de hash MD5 provista por MySQL(ver sección B.2); nro_cliente, nro_ca corresponden a un número de cliente y caja de ahorro presentes
#en la relación cliente CA.

CREATE TABLE tarjeta(
	nro_tarjeta BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
	PIN CHAR(32) NOT NULL,
	CVT CHAR(32) NOT NULL,
	fecha_venc DATE NOT NULL,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,
	nro_ca INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_tarjeta
	PRIMARY KEY(nro_tarjeta),

	CONSTRAINT fk_tarjeta
	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES cliente_ca(nro_cliente,nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#caja (cod_caja)
#cod_caja es un natural de 5 cifras.

CREATE TABLE caja(
	cod_caja MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,

	CONSTRAINT primary_key_caja
	PRIMARY KEY(cod_caja)

) ;


#Ventanilla (cod_caja, nro_suc)
#cod_caja corresponde a una caja y nro_suc corresponde a una sucursal

CREATE TABLE ventanilla(
	cod_caja MEDIUMINT UNSIGNED NOT NULL,
	nro_suc SMALLINT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_ventanilla
	PRIMARY KEY(cod_caja),

	CONSTRAINT fk_ventanilla_CC
	FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_ventanilla_NS
	FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#atm (cod_caja, cod_postal, direccion)
#cod_caja corresponde a una caja, cod_postal corresponde a una ciudad y direccion es una cadena
#de caracteres.

CREATE TABLE atm(
	cod_caja MEDIUMINT UNSIGNED NOT NULL,
	cod_postal SMALLINT UNSIGNED NOT NULL,
	direccion VARCHAR(45) NOT NULL,

	CONSTRAINT primary_key_atm
	PRIMARY KEY(cod_caja),

	CONSTRAINT fk_atm_CC
	FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_atm_CP
	FOREIGN KEY (cod_postal) REFERENCES ciudad(cod_postal)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#transaccion (nro_trans, fecha, hora, monto)
#nro_trans es un natural de 10 cifras y monto es un real positivo con 2 decimales.

CREATE TABLE transaccion(
	nro_trans BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	monto DECIMAL(16,2) UNSIGNED NOT NULL CHECK(monto >= 0),

	CONSTRAINT primary_key_transaccion
	PRIMARY KEY(nro_trans)

) ;


#debito (nro_trans, descripcion, nro_cliente, nro_ca)
#nro_trans corresponde a un número de transaccion; descripcion es una cadena de caracteres;
#nro_cli, nro_ca corresponde a un número de cliente y número de caja de ahorro presentes en
#la relacion cliente CA.

CREATE TABLE debito(
	nro_trans BIGINT UNSIGNED NOT NULL,
	descripcion TEXT,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,
	nro_ca INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_debito
	PRIMARY KEY(nro_trans),

	CONSTRAINT fk_debito_NT
	FOREIGN KEY (nro_trans) REFERENCES transaccion(nro_trans)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_debito_NC
	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES cliente_ca(nro_cliente,nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#transaccion_por_caja (nro_trans, cod_caja)
#nro_trans corresponde a un número de transacción y cod caja corresponde a una caja.

CREATE TABLE transaccion_por_caja(
	nro_trans BIGINT UNSIGNED NOT NULL,
	cod_caja MEDIUMINT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_transaccion_por_caja
	PRIMARY KEY(nro_trans),

	CONSTRAINT fk_transCaja_NT
	FOREIGN KEY (nro_trans) REFERENCES transaccion(nro_trans)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_transCaja_CC
	FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#deposito (nro_trans, nro_ca)
#nro_trans corresponde a un número de Transacción por caja; nro_ca corresponde a un número
#de caja de Ahorro.

CREATE TABLE deposito(
	nro_trans BIGINT UNSIGNED NOT NULL,
	nro_ca INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_deposito
	PRIMARY KEY(nro_trans),

	CONSTRAINT fk_deposito_NT
	FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_deposito_NC
	FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#extraccion (nro_trans, nro_cliente, nro_ca)
#nro_trans corresponde a un número de transacción por caja; nro_cliente, nro_ca corresponde a
#un número de cliente y número de caja de Ahorro presentes en la relacion cliente CA.

CREATE TABLE extraccion(
	nro_trans BIGINT UNSIGNED NOT NULL,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,
	nro_ca INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_extraccion
	PRIMARY KEY(nro_trans),

	CONSTRAINT fk_extraccion_NT
	FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_extraccion_NC
	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES cliente_ca(nro_cliente,nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE

);


#transferencia (nro_trans, nro_cliente, origen, destino)
#nro_trans corresponde a un número de transacción por caja; nro_cliente y origen corresponden
#a un número de cliente y número de caja de Ahorro (de la relación cliente CA) de donde
#provienen los fondos; destino corresponde a un número de caja de Ahorro destino

CREATE TABLE transferencia(
	nro_trans BIGINT UNSIGNED NOT NULL,
	nro_cliente MEDIUMINT UNSIGNED NOT NULL,
	origen INT UNSIGNED NOT NULL,
	destino INT UNSIGNED NOT NULL,

	CONSTRAINT primary_key_transferencia
	PRIMARY KEY(nro_trans),

	CONSTRAINT fk_transferencia_NT
	FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_transferencia_NC
	FOREIGN KEY (nro_cliente,origen) REFERENCES cliente_ca(nro_cliente,nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_transferencia_NC2
	FOREIGN KEY (destino) REFERENCES caja_ahorro(nro_ca)
	ON DELETE RESTRICT ON UPDATE CASCADE

);

#VISTA -------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW ca_datos_cli AS
	SELECT * FROM (caja_ahorro NATURAL JOIN cliente_ca) NATURAL JOIN cliente;

CREATE VIEW transaccion_datos_nro_caja AS
	SELECT * FROM transaccion NATURAL JOIN transaccion_por_caja;

CREATE VIEW debito_caja_ahorro AS
 SELECT ca_datos_cli.nro_ca, ca_datos_cli.saldo, debito.nro_trans, transaccion.fecha, transaccion.hora, 'debito' AS tipo, transaccion.monto, NULL AS cod_caja,
       ca_datos_cli.nro_cliente, ca_datos_cli.tipo_doc, ca_datos_cli.nro_doc, ca_datos_cli.nombre, ca_datos_cli.apellido, NULL AS destino
 	FROM (debito JOIN ca_datos_cli ON debito.nro_cliente = ca_datos_cli.nro_cliente AND debito.nro_ca = ca_datos_cli.nro_ca) JOIN transaccion ON debito.nro_trans = transaccion.nro_trans;

CREATE VIEW extraccion_caja_ahorro AS
	SELECT ca_datos_cli.nro_ca, ca_datos_cli.saldo, extraccion.nro_trans, transaccion_datos_nro_caja.fecha, transaccion_datos_nro_caja.hora, 'extraccion' AS tipo,
		transaccion_datos_nro_caja.monto, transaccion_datos_nro_caja.cod_caja,
    ca_datos_cli.nro_cliente, ca_datos_cli.tipo_doc, ca_datos_cli.nro_doc, ca_datos_cli.nombre, ca_datos_cli.apellido, NULL AS destino
 	FROM (extraccion JOIN ca_datos_cli ON extraccion.nro_cliente = ca_datos_cli.nro_cliente AND extraccion.nro_ca = ca_datos_cli.nro_ca) JOIN transaccion_datos_nro_caja ON extraccion.nro_trans = transaccion_datos_nro_caja.nro_trans;

CREATE VIEW deposito_caja_ahorro AS
	SELECT deposito.nro_ca, caja_ahorro.saldo, deposito.nro_trans, transaccion_datos_nro_caja.fecha, transaccion_datos_nro_caja.hora, 'deposito' AS tipo,
		transaccion_datos_nro_caja.monto, transaccion_datos_nro_caja.cod_caja, NULL AS nro_cliente, NULL AS tipo_doc, NULL AS nro_doc, NULL AS nombre, NULL AS apellido, NULL AS destino
 	FROM (deposito JOIN transaccion_datos_nro_caja ON (deposito.nro_trans = transaccion_datos_nro_caja.nro_trans))
	NATURAL JOIN caja_ahorro;

CREATE VIEW transferencia_caja_ahorro AS
	SELECT ca_datos_cli.nro_ca, ca_datos_cli.saldo, transferencia.nro_trans, transaccion_datos_nro_caja.fecha, transaccion_datos_nro_caja.hora, 'transferencia' as tipo,
		transaccion_datos_nro_caja.monto, transaccion_datos_nro_caja.cod_caja, ca_datos_cli.nro_cliente, ca_datos_cli.tipo_doc,
		ca_datos_cli.nro_doc, ca_datos_cli.nombre, ca_datos_cli.apellido, transferencia.destino
	FROM (transferencia JOIN ca_datos_cli ON (transferencia.origen = ca_datos_cli.nro_ca AND transferencia.nro_cliente = ca_datos_cli.nro_cliente)) JOIN transaccion_datos_nro_caja ON transferencia.nro_trans = transaccion_datos_nro_caja.nro_trans;


CREATE VIEW trans_cajas_ahorro AS
	(SELECT * FROM debito_caja_ahorro) UNION ALL
	(SELECT * FROM extraccion_caja_ahorro) UNION ALL
	(SELECT * FROM transferencia_caja_ahorro) UNION ALL
	(Select * from deposito_caja_ahorro);


#--------------PROYECTO 3----------------------------------------------------------------------------------------



#--------------TRANSFERENCIA----------------------------------------------------------------------------------------
delimiter !

CREATE PROCEDURE transferir(IN nro_cli BIGINT, IN cod_ATM MEDIUMINT,IN nro_ca_origen INT,IN nro_ca_destino INT,IN monto DECIMAL(16,2))
	BEGIN

		DECLARE saldo_origen DECIMAL(16,2);
		DECLARE saldo_destino DECIMAL(16,2);
		DECLARE num_trans INT(10);
		DECLARE num_dep INT(10);

		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN 
				SELECT 'ERROR: SQLEXCEPTION, TRANSACION ABORTADA' AS resultado;
				ROLLBACK;
			END;

		START TRANSACTION;
			#------------ VERIFICAR QUE EXISTAN LAS CAJAS DE AHORRO
			IF EXISTS (SELECT * FROM caja_ahorro WHERE nro_ca=nro_ca_origen) AND
				EXISTS (SELECT * FROM caja_ahorro WHERE nro_ca=nro_ca_destino) THEN

				IF EXISTS (SELECT * FROM caja WHERE cod_caja=cod_ATM) THEN

			#------------ GUARDAR SALDO ACTUAL DE AMBAS CAJAS DE AHORRO
                    SELECT saldo INTO saldo_origen FROM caja_ahorro WHERE nro_ca = nro_ca_origen FOR UPDATE;
					SELECT saldo INTO saldo_destino FROM caja_ahorro WHERE nro_ca = nro_ca_destino FOR UPDATE;

					IF saldo_origen >= monto THEN
						UPDATE caja_ahorro SET saldo = saldo - monto WHERE nro_ca=nro_ca_origen;
						UPDATE caja_ahorro SET saldo = saldo + monto WHERE nro_ca=nro_ca_destino;
			#------------ INSERTAR TRANSFERENCIA Y TRANSACCION POR CAJA
						INSERT INTO transaccion VALUES(NULL,CURDATE(),CURTIME(),monto);

						SET num_trans= last_insert_id();

						INSERT INTO transaccion_por_caja VALUES(num_trans,cod_ATM);

						INSERT INTO transferencia VALUES(num_trans,nro_cli,nro_ca_origen,nro_ca_destino);

			#------------ INSERTAR DEPOSITO Y TRANSACCION POR CAJA
						INSERT INTO transaccion VALUES(NULL,CURDATE(),CURTIME(),monto);
						
						SET num_dep= last_insert_id();

						INSERT INTO transaccion_por_caja VALUES(num_dep,cod_ATM);

						INSERT INTO deposito VALUES(num_dep,nro_ca_destino);
					
						SELECT 'Transferencia Exitosa' AS resultado;
					ELSE
						SELECT 'ERROR: SALDO INSUFICIENTE PARA TRANSFERIR' AS resultado;
					END IF;
				ELSE
					SELECT 'ERROR: CODIGO DE ATM INVALIDO' AS resultado;
				END IF;
			ELSE
				SELECT 'ERROR: LA CAJA DE AHORRO NO EXISTE' AS resultado;
			END IF;
		COMMIT;

	END; !


#--------------EXTRACCION----------------------------------------------------------------------------------------

CREATE PROCEDURE extraer(IN nro_cli INT, IN cod_ATM INT, IN nro_ca_origen INT, IN monto DECIMAL(16,2))
    BEGIN

        DECLARE saldo_ca_origen DECIMAL(16,2);
        DECLARE num_trans INT;

        DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                SELECT 'ERROR SQLEXCEPTION: TRANSACCION ABORTADA' AS resultado;
                ROLLBACK;
            END;

        START TRANSACTION;
			#------------ VERIFICAR QUE EXISTA LA CAJA DE AHORRO
            IF EXISTS (SELECT * FROM caja_ahorro NATURAL JOIN cliente_ca WHERE nro_ca=nro_ca_origen AND nro_cliente=nro_cli)
                AND EXISTS (SELECT * FROM caja WHERE cod_caja=cod_ATM) THEN

				IF EXISTS (SELECT * FROM caja WHERE cod_caja=cod_ATM) THEN

					#------------ OBTENER EL SALDO DE LA CAJA DE AHORRO
						SELECT saldo INTO saldo_ca_origen FROM caja_ahorro WHERE nro_ca = nro_ca_origen FOR UPDATE;

						IF saldo_ca_origen >= monto THEN

					#------------ MODIFICAR SALDO DE LA CAJA DE AHORRO 
							UPDATE caja_ahorro SET saldo = saldo_ca_origen - monto WHERE nro_ca = nro_ca_origen;

					#------------ INSETAR EXTRACCIÓN Y TRANSACCIÓN POR CAJA
							INSERT INTO transaccion (fecha, hora, monto) VALUES(CURDATE(), CURTIME(), monto);

							SELECT last_insert_id() INTO num_trans;

							INSERT INTO transaccion_por_caja VALUES(num_trans, cod_ATM);
							INSERT INTO extraccion VALUES(num_trans, nro_cli, nro_ca_origen);


							SELECT 'Extraccion Exitosa' AS resultado;
						ELSE
							SELECT 'ERROR: SALDO INSUFICIENTE PARA EXTRAER' AS resultado;
						END IF;
				ELSE
					SELECT "ERROR: CODIGO DE ATM INVALIDO" AS resultado;
				END IF;
			ELSE
				SELECT 'ERROR: CAJA DE AHORRO INVALIDA' AS resultado;
			END IF;
        COMMIT;

    END; !

delimiter ;



#--------------TRIGGER PAGOS DE PRESTAMOS----------------------------------------------------------------------------------------

delimiter !

	CREATE TRIGGER trigger_pagos_prestamo AFTER INSERT ON prestamo

	FOR EACH ROW

	BEGIN

		declare mes int;
    	set mes = 1;
    	while mes<=NEW.cant_meses do

      	INSERT INTO pago VALUES(NEW.nro_prestamo,mes,DATE_ADD(NEW.fecha, INTERVAL mes MONTH),NULL);

			set mes=mes+1;
    	end while;

	END; !

delimiter ;



#USUARIOS -----------------------------------------------------------------------------------------------------


#ADMIN-----------------------------------------------------------------

CREATE USER 'admin'@'localhost'  IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

#EMPLEADO---------------------------------------------------------------

CREATE USER 'empleado'@'%'  IDENTIFIED BY 'empleado';

GRANT SELECT ON banco.empleado TO 'empleado'@'%';
GRANT SELECT ON banco.sucursal TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_plazo_fijo TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_prestamo TO 'empleado'@'%';

GRANT SELECT, INSERT ON banco.prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_fijo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_cliente TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.caja_ahorro TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.tarjeta TO 'empleado'@'%';

GRANT SELECT, INSERT, UPDATE ON banco.cliente_ca TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.cliente TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.pago TO 'empleado'@'%';

#ATM--------------------------------------------------------------------

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';

GRANT SELECT ON banco.trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE ON banco.tarjeta TO 'atm'@'%';
GRANT EXECUTE ON PROCEDURE banco.extraer TO 'atm'@'%';
GRANT EXECUTE ON PROCEDURE banco.transferir TO 'atm'@'%';