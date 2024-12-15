create table inquilino(
cpf_inquilino int,
telefone int unique not null,
nome varchar(200) not null,
email varchar(200) unique not null,
primary key (cpf_inquilino)
);

create table corretor(
cpf_corretor int,
telefone varchar(200) unique not null,
nome varchar(200) not null,
email varchar(200) unique not null,
primary key (cpf_corretor)
);

create table proprietario(
cpf_proprietario int,
nome varchar(200) not null,
telefone varchar(200) unique not null,
email varchar(200) unique not null,
primary key (cpf_proprietario)
);

create table imovel(
cod_imovel int,
tipo varchar(50) not null,
valor float not null,
status boolean not null,
rua varchar(250) not null,
bairro varchar(200) not null,
cidade varchar (150) not null,
numero int not null,
cpf_proprietario int not null, 
primary key (cod_imovel),
foreign key (cpf_proprietario) references proprietario 
on update cascade 
on delete cascade
);

create table aluguel(
cod_aluguel int not null,
dataInicio date not null,
dataFim date not null,
cod_imovel int not null,
cpf_inquilino int not null,
cpf_corretor int not null,
primary key (cod_aluguel),
foreign key (cod_imovel) references imovel
on update cascade 
on delete cascade,
foreign key (cpf_inquilino) references inquilino
on update cascade 
on delete cascade,
foreign key (cpf_corretor) references corretor
on update cascade 
on delete cascade
);