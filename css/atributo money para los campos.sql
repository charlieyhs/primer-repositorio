if object_id ('cuentas')is not null
	drop table cuentas;

create table cuentas(
	Numero_Cuenta char(4),
	documento varchar(20),
	nombre varchar(20),
	saldo money,
	primary key(Numero_cuenta)
);
go

 insert into cuentas(Numero_Cuenta,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(Numero_Cuenta,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(Numero_Cuenta,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(Numero_Cuenta,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);

select * from cuentas
	where saldo > 4000;

select Numero_Cuenta,saldo from cuentas
	where nombre = 'Juan Lopez';

select * from cuentas
	where saldo < 0;

select * from cuentas
	where Numero_Cuenta >= 3000;


