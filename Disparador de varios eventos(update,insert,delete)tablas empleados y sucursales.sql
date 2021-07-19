if object_id ('empleados')is not null
	drop table empleados;
if object_id ('sucursales')is not null
	drop table sucursales;

create table sucursales(
	codigo int identity,
	domicilio varchar(30),
	constraint PK_sucursales primary key(codigo)
);

create table empleados(
	documento char(8)not null,
	nombre varchar(30),
	domicilio varchar(30),
	sucursal int not null,
	constraint PK_empleados primary key(documento),
	constraint FK_empleados_sucursal 
		foreign key(sucursal)
		references sucursales(codigo)
);

go

insert into sucursales values ('Colon 123');
insert into sucursales values ('Sucre 234');
insert into sucursales values ('Rivadavia 345');

insert into empleados values ('22222222','Ana Acosta','Avellaneda 1258',1);
insert into empleados values ('23333333','Betina Bustos','Bulnes 345',2);
insert into empleados values ('24444444','Carlos Caseres','Caseros 948',3);
insert into empleados values ('25555555','Fabian Fuentes','Francia 845',1);
insert into empleados values ('26666666','Gustavo Garcia','Guemes 587',2);
insert into empleados values ('27777777','Maria Morales','Maipu 643',3);
go
create trigger dis_empleados_insert_delete_update
  on empleados
  for insert,delete,update
  as
   
			if (select sucursal from inserted)=1 or (select sucursal from deleted)=1
				begin
					raiserror('No puede modificar elementos o registros de la sucursal 1',16,1)
					rollback transaction
				end
go

insert into empleados values('12345678','Carlos Charlie','Borbur',3);
select * from empleados;
--**insert into empleados values('23456789','Charlie Carlos','Mesa',1);--el trigger
--se dispara y deshace la transaccion, no se ingresa ningun registro porque la
--sucursal 1 no puede ser afectada
update empleados set nombre='Charlie yhs' where documento = '12345678';
select * from empleados;
--**update empleados set nombre = 'Mesa' where documento= '22222222';--el trigger
--se dispara y deshace la transaccion, no se ingresa ningun registro porque la
--sucursal 1 no puede ser afectada
delete from empleados where nombre like'Carlos%';
select * from empleados;
--**delete from empleados where nombre = 'Ana Acosta';--el trigger
--se dispara y deshace la transaccion, no se ingresa ningun registro porque la
--sucursal 1 no puede ser afectada
