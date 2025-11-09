##Cargos
SELECT *
FROM Cargo;

DELIMITER $
CREATE PROCEDURE `insertar_cargo`(
	OUT _idCargo INT,
    IN _abreviatura CHAR,
    IN _descripcion VARCHAR(75)
)
BEGIN
	INSERT INTO Cargo (abreviatura,descripcion,activo) VALUES (
		_abreviatura,_descripcion,1);
	SET _idCargo = @@last_insert_id;
END$

DELIMITER $
CREATE PROCEDURE `eliminar_cargo`(
	IN _idCargo INT
)
BEGIN
	UPDATE Cargo SET activo = 0
    WHERE idCargo=_idCargo;
END$

DELIMITER $
CREATE PROCEDURE `modificar_cargo`(
	IN _idCargo INT,
	IN _abreviatura CHAR,
    IN _descripcion VARCHAR(75)
)
BEGIN
	UPDATE Cargo
    SET abreviatura=_abreviatura,
    descripcion=_descripcion
    WHERE idCargo=_idCargo;
END$

DELIMITER $
CREATE PROCEDURE `mostrar_cargos`()
BEGIN
	SELECT *
    FROM Cargo;
END$

DELIMITER $
CREATE PROCEDURE `obtener_cargo_X_id`(
	IN _idCargo INT
)
BEGIN
	SELECT *
    FROM Cargo
    WHERE idCargo=_idCargo;
END$

##TIPO CUENTA
SELECT *
FROM TipoCuenta;

DELIMITER $
CREATE PROCEDURE `insertar_tipoCuenta`(
	OUT _idTipoCuenta INT,
    IN _descripcion VARCHAR(75)
)
BEGIN
	INSERT INTO TipoCuenta (descripcion,activo) VALUES (
		_descripcion,1);
	SET _idTipoCuenta = @@last_insert_id;
END$

CALL insertar_tipoCuenta(@id,'ADMINISTRADOR2');

DELIMITER $
CREATE PROCEDURE `eliminar_tipoCuenta`(
	IN _idTipoCuenta INT
)
BEGIN
	UPDATE TipoCuenta SET activo = 0
    WHERE idTipoCuenta=_idTipoCuenta;
END$

CALL eliminar_tipoCuenta(2);

DELIMITER $
CREATE PROCEDURE `modificar_tipoCuenta`(
	IN _idTipoCuenta INT,
    IN _descripcion VARCHAR(75)
)
BEGIN
	UPDATE TipoCuenta
    SET descripcion=_descripcion
    WHERE idTipoCuenta=_idTipoCuenta;
END$

CALL modificar_tipoCuenta(2,'EMPLEAADO');

DELIMITER $
CREATE PROCEDURE `mostrar_tipoCuentas`()
BEGIN
	SELECT *
    FROM TipoCuenta
    WHERE activo=1;
END$

CALL mostrar_tipoCuentas();

DELIMITER $
CREATE PROCEDURE `obtener_tipoCuenta_X_id`(
	IN _idTipoCuenta INT
)
BEGIN
	SELECT *
    FROM TipoCuenta
    WHERE idTipoCuenta=_idTipoCuenta;
END$

CALL obtener_tipoCuenta_X_id(1);

COMMIT;

##CUENTA USUARIO
SELECT *
FROM CuentaUsuario;

DELIMITER $
CREATE PROCEDURE `insertar_cuentaUsuario`(
	OUT _idCuenta INT,
    IN _username VARCHAR(75),
    IN _contrasenha VARCHAR(75),
    IN _email VARCHAR(75),
    IN _TipoCuenta_idTipoCuenta INT
)
BEGIN
	INSERT INTO CuentaUsuario (username,contrasenha,email,
    TipoCuenta_idTipoCuenta,activo) 
    VALUES (_username,_contrasenha,_email,
    _TipoCuenta_idTipoCuenta,1);
	SET _idCuenta = @@last_insert_id;
END$

CALL insertar_cuentaUsuario(@id,'Luis','asws','hola@gamil',1);

DELIMITER $
CREATE PROCEDURE `eliminar_cuentaUsuario`(
	IN _idCuenta INT
)
BEGIN
	UPDATE CuentaUsuario SET activo = 0
    WHERE idCuenta=_idCuenta;
END$

CALL eliminar_cuentaUsuario(2);

DELIMITER $
CREATE PROCEDURE `modificar_cuentaUsuario`(
	IN _idCuenta INT,
    IN _username VARCHAR(75),
    IN _contrasenha VARCHAR(75),
    IN _email VARCHAR(75),
    IN _TipoCuenta_idTipoCuenta INT
)
BEGIN
	UPDATE CuentaUsuario
    SET username=_username, contrasenha=_contrasenha, 
    email=_email, 
    TipoCuenta_idTipoCuenta=_TipoCuenta_idTipoCuenta
    WHERE idCuenta=_idCuenta;
END$

CALL modificar_cuentaUsuario(2,'Pato','1234','pato@hotmail',2);

DELIMITER $
CREATE PROCEDURE `mostrar_cuentaUsuarios`()
BEGIN
	SELECT c.idCuenta, c.username, c.contrasenha, c.email,
    t.idTipoCuenta, t.descripcion
    FROM CuentaUsuario c
    INNER JOIN TipoCuenta t ON t.idTipoCuenta=c.TipoCuenta_idTipoCuenta
    WHERE c.activo=1;
END$

CALL mostrar_cuentaUsuarios();

DELIMITER $
CREATE PROCEDURE `obtener_cuentaUsuarios_X_id`(
	IN _idCuenta INT
)
BEGIN
	SELECT c.idCuenta, c.username, c.contrasenha, c.email,
    c.activo, t.idTipoCuenta, t.descripcion
    FROM CuentaUsuario c
    INNER JOIN TipoCuenta t ON t.idTipoCuenta=c.TipoCuenta_idTipoCuenta
    WHERE idCuenta=_idCuenta;
END$

CALL obtener_cuentaUsuarios_X_id(2);

COMMIT;

##INSERTAR EMPLEADO
SELECT *
FROM Empleado;
SELECT *
FROM Persona;
SELECT *
FROM Cargo;

CALL insertar_cargo(@id,'G','GERENTE');
ALTER TABLE Persona DROP COLUMN activo;
ALTER TABLE Empleado ADD(
	activo TINYINT
);
UPDATE Empleado SET activo = 0
WHERE idEmpleado=14;

DELIMITER $
CREATE PROCEDURE `insertar_empleado`(
	OUT _idEmpleado INT,
    IN _nombre VARCHAR(75),
    IN _primerApellido VARCHAR(75),
    IN _segundoApellido VARCHAR(75),
    IN _dni INT,
    IN _telefono INT,
    IN _genero CHAR,
    IN _Cargo_idCargo INT,
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	INSERT INTO Persona (nombre,primerApellido,segundoApellido,
    dni,telefono,genero)
    VALUES (_nombre,_primerApellido,_segundoApellido,
    _dni,_telefono,_genero);
	SET _idEmpleado = @@last_insert_id;
    INSERT INTO Empleado(idEmpleado,Cargo_idCargo,sueldo,activo)
    VALUES (_idEmpleado,_Cargo_idCargo,_sueldo,1);
END$

CALL insertar_empleado(@id,'ANA','RONCAL','GUANIRA',
77738876,93322341,'F',5,3500.00);

DELIMITER $
CREATE PROCEDURE `eliminar_empleado`(
	IN _idEmpleado INT
)
BEGIN
	UPDATE Empleado SET activo = 0
    WHERE idEmpleado=_idEmpleado;
END$

CALL eliminar_empleado(8);

DELIMITER $
CREATE PROCEDURE `modificar_empleado`(
	IN _idEmpleado INT,
    IN _nombre VARCHAR(75),
    IN _primerApellido VARCHAR(75),
    IN _segundoApellido VARCHAR(75),
    IN _dni INT,
    IN _telefono INT,
    IN _genero CHAR,
    IN _Cargo_idCargo INT,
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE Persona SET nombre=_nombre,
    primerApellido=_primerApellido,
    segundoApellido=_segundoApellido,
    dni=_dni,telefono=_telefono,genero=_genero
    WHERE idPersona=_idEmpleado;

    UPDATE Empleado SET Cargo_idCargo=_Cargo_idCargo,
    sueldo=_sueldo
    WHERE idEmpleado=_idEmpleado;
END$

CALL modificar_empleado(11,'MANUEL','TUPIA','KLEIVNIKOV',
11111111,999999999,'M',6,13500.00);

DELIMITER $
CREATE PROCEDURE `mostrar_empleados`()
BEGIN
	SELECT p.idPersona, p.nombre, p.primerApellido, p.segundoApellido,
    p.dni, p.telefono, p.genero, e.sueldo, c.idCargo, c.abreviatura,
    c.descripcion
    FROM Persona p
    INNER JOIN Empleado e ON p.idPersona=e.idEmpleado
    INNER JOIN Cargo c ON c.idCargo=e.Cargo_idCargo
    WHERE e.activo=1;
END$

CALL mostrar_empleados();

DELIMITER $
CREATE PROCEDURE `obtener_empleado_X_id`(
	IN _idEmpleado INT
)
BEGIN
	SELECT p.idPersona, p.nombre, p.primerApellido, p.segundoApellido,
    p.dni, p.telefono, p.genero, e.activo, e.sueldo, c.idCargo,
    c.abreviatura, c.descripcion
    FROM Persona p
    INNER JOIN Empleado e ON p.idPersona=e.idEmpleado
    INNER JOIN Cargo c ON c.idCargo=e.Cargo_idCargo
    WHERE e.idEmpleado=_idEmpleado;
END$

CALL obtener_empleado_X_id(11);

commit;
