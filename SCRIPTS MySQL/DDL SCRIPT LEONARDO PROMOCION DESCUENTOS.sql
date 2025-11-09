
Create table Descuento(
	idDescuento int auto_increment,
    nombre varchar(75),
    esAutomatico tinyint,
    activo tinyint,
    idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia),
    primary key(idDescuento)
)ENGINE=InnoDB;



Create table DescuentoLiquidacion(
	idDescuento int,
    porcentajeLiquidacion float,
	condicionStockMin int,
        PRIMARY KEY(idDescuento),
	idVigencia int,
    foreign key (idDescuento) references Descuento(idDescuento),
    foreign key (idVigencia) references Vigencia(idVigencia)


)Engine=InnoDB;

Create table DescuentoMonto(
	idDescuento int,
    montoEditable float,
	montoMaximo float,
    PRIMARY KEY(idDescuento),
    foreign key (idDescuento) references Descuento(idDescuento),
	idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia)

)Engine=InnoDB;

Create table DescuentoPorcentaje(
	idDescuento int,
    porcentaje float,
        PRIMARY KEY(idDescuento),

    foreign key (idDescuento) references Descuento(idDescuento),
idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia)

)Engine=InnoDB;


Create table Promocion(
	idPromocion int auto_increment,
    nombre varchar(75),
    esAutomatico tinyint,
    activo tinyint,
	primary key(idPromocion),
    idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia)
)engine=InnoDB;

Create table PromocionCombo(
	idPromocion int auto_increment,
    cantidadRequerida int,
    cantidadGratis int,
	primary key(idPromocion),
    foreign key (idPromocion) references Promocion(idPromocion),
    idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia)
)engine=InnoDB;
Create table PromocionConjunto(
	idPromocion int auto_increment,
    porcentajePromocion float,
primary key(idPromocion),
    foreign key (idPromocion) references Promocion(idPromocion),

	idVigencia int,
    foreign key (idVigencia) references Vigencia(idVigencia)
)engine=InnoDB;

CREATE TABLE PrendaPromocion (
    idPrenda INT NOT NULL,
    idPromocion INT NOT NULL,
    PRIMARY KEY (idPrenda, idPromocion), -- clave primaria compuesta
    FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda),
    FOREIGN KEY (idPromocion) REFERENCES Promocion(idPromocion)
)Engine=InnoDB;
CREATE TABLE PrendaDescuento (
    idPrenda INT NOT NULL,
    idDescuento INT NOT NULL,
    PRIMARY KEY (idPrenda, idDescuento), -- clave primaria compuesta
    FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda),
    FOREIGN KEY (idDescuento) REFERENCES Descuento(idDescuento)
)Engine=InnoDB;

commit;
DELIMITER $
drop procedure if exists INSERTAR_PROMOCIONCOMBO;
drop procedure if exists MODIFICAR_PROMOCIONCOMBO;
drop procedure if exists OBTENER_PROMOCIONCOMBO_X_ID;

drop procedure if exists INSERTAR_PROMOCIONCONJUNTO;
drop procedure if exists MODIFICAR_PROMOCIONCONJUNTO;
drop procedure if exists OBTENER_PROMOCIONCONJUNTO_X_ID;

DELIMITER $

create procedure INSERTAR_PROMOCIONCOMBO(out id INT,in nom VARCHAR(75),in cantReque INT, in cantGrat int ,in idV int)
begin 
	insert into Promocion (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into PromocionCombo(idPromocion,cantidadRequerida,cantidadGratis) values (id,cantReque,cantGrat);
	
	
end$
DELIMITER $

create procedure MODIFICAR_PROMOCIONCOMBO(in id int, in nomb VARCHAR(75),in cantReque int , in cantGrat int,in indV int)
BEGIN
		update Promocion 
        set nombre=nomb, idVigencia=indV 
        where idPromocion=id;
        
		update PromocionCombo 
        set cantidadRequerida=cantReque, cantidadGratis=cantGrat 
        where idPromocion=id;

END$
DELIMITER $
create procedure OBTENER_PROMOCIONCOMBO_X_ID(in id int)
	Begin 
	select * from PromocionCombo where idPromocion=id;
End$
DELIMITER $

create procedure INSERTAR_PROMOCIONCONJUNTO(out id INT,in nom VARCHAR(75),in porcentaje float,in idV int)
begin 
	insert into Promocion (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into PromocionConjunto(idPromocion,porcentajePromocion) values (id,porcentaje);
	
	
end$
DELIMITER $

create procedure MODIFICAR_PROMOCIONCONJUNTO(in id int, in nomb VARCHAR(75),in promocion float,in indV int)
BEGIN
		update Promocion 
        set nombre=nomb, idVigencia=indV 
        where idPromocion=id;
        
		update PromocionConjunto 
        set porcentajePromocion=promocion 
        where idPromocion=id;

END$

DELIMITER $
create procedure OBTENER_PROMOCIONCONJUNTO_X_ID(in id int)
	Begin 
	select * from PromocionConjunto where idPromocion=id;
End$

drop procedure MODIFICAR_PROMOCIONCONJUNTO;
drop procedure INSERTAR_PROMOCIONCOMBO;

alter table Vigencia auto_increment=1;
alter table PromocionCombo auto_increment=1;
alter table PromocionConjunto auto_increment=1;
alter table Promocion auto_increment=1;


call INSERTAR_PROMOCIONCOMBO(@idPromocion1,"Promocion Real :D",2,4);
delete from PromocionCombo where idPromocion between 1 and 10;
delete from Promocion where idPromocion between 1 and 10;
delete from Vigencia where idVigencia between 1 and 10;
select p.idPromocion,p.nombre ,c.cantidadRequerida,c.cantidadGratis from PromocionCombo c, Promocion p where p.idPromocion=c.idPromocion;
select * from Vigencia;
select * from PromocionCombo;
select * from PromocionConjunto;
select * from Promocion;
INSERT INTO Vigencia (fechaInicio, fechaFin,activo) 
VALUES ( '2000-11-01', '2011-11-20',1);
INSERT INTO Vigencia (fechaInicio, fechaFin,activo) 
VALUES ( '2000-11-01', '2011-11-22',1);
alter table Vigencia auto_increment=1;

select c.idPromocion,p.nombre ,c.porcentajePromocion from PromocionConjunto c, Promocion p where p.idPromocion=c.idPromocion;


delete from PromocionConjunto where idPromocion between 1 and 10;
delete from Promocion where idPromocion between 1 and 10;
delete from Vigencia where idVigencia between 1 and 10;
DELIMITER $
create  procedure MOSTRAR_PROMOCIONCOMBOS()
Begin

select * from PromocionCombo;

End$
DELIMITER $
create  procedure MOSTRAR_PROMOCIONCONJUNTO()
Begin

select * from PromocionConjunto;

End$

commit;