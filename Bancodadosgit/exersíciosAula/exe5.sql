create table cliente (
	id_cli serial primary key,
	nome varchar(200),
	telefone bigint,
	cpf bigint,
	cidade varchar(200),
	num_conta bigint
);

create table carro (
	id_car serial primary key, 
	chassi varchar(200),
	modelo varchar(200),
	cor varchar(50),
	ano int,
	preco float
);

create table aluguel (
	id_alu serial primary key,
	id_cli int references cliente(id_cli) on update cascade on delete cascade,
	id_car int references carro(id_car) on update cascade on delete cascade,
	data_ent date,
	data_sai date,
	total float
);


alter table cliente 
	add agencia varchar(150),
	add rua varchar(200),
	add numero bigint,
	add bairro varchar(200);

alter table cliente rename column num_conta to conta;
alter table aluguel add foreign key (id_car) references carro(id_car) on update cascade
on delete cascade; 
alter table aluguel add foreign key (id_cli) references cliente(id_cli) on update cascade
on delete cascade;

alter table cliente
drop column conta,
drop column agencia;

alter table carro rename column preco to valor;

alter table carro alter column valor set default 0;

insert into cliente (
	id_cli,
	nome,
	telefone,
	cpf,
	cidade
) values (
	1,
	'Ana',
	11111111111,
	996111111,
	'Campinas'
);

insert into cliente (
	id_cli,
	nome,
	telefone,
	cpf,
	cidade
) values (
	2,
	'Fábio',
	22222222222,
	996222222,
	'Jundiaí'

);

insert into cliente (
	id_cli,
	nome,
	telefone,
	cpf,
	cidade
) values (
	3,
	'Maria',
	33333333333,
	996333333,
	'São Paulo'

);

insert into cliente (
	id_cli,
	nome,
	telefone,
	cpf,
	cidade
) values (
	4,
	'Fernando',
	44444444444,
	9964444444,
	'Campinas'
);

insert into aluguel (id_cli, data_ent, data_sai, total) values
(1, '2024-08-21', '2024-08-26', 750.00),
(2, '2024-09-12', '2024-09-15', 450.00),
(3, '2024-09-26', null, null);

update aluguel set data_ent = '2024-05-12', total = 220.00 where id_alu = 1; 

update cliente set cpf = 9976666666 where cpf = 9964444444;

update carro set valor = 300.00 where id_car = 1;

delete from cliente where id_cli = 3;