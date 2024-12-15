create table diciplica(
id_dis serial,
nome_dis text not null,
credito int not null,
id_dep int not null,
primary key (id_dis)
);

create table instrutor(
id_ins serial,
nome_ins text not null,
salario float check(salario between 5000 and 8000) not null,
id_dep int not null,
primary key (id_ins)
);

create table ministra (
id_min serial,
ano int not null,
semestre int not null,
id_ins int not null,
id_dis int not null,
primary key (id_min),
foreign key (id_ins) references instrutor on update cascade 
on delete cascade,
foreign key (id_ins) references diciplina on update cascade 
on delete cascade
);

/*comando de apagar tabela*/
drop table ministra;

/*alterar nome tabela*/
alter table instrutor rename to professor;

/*alterar nome do atributo*/
alter table professor rename id_ins to id_pro;
alter table professro rename nome_ins to nome_pro;

/*criar uma chave primária*/
alter table ministra add primary key (id_min);

/*incluir chave estrangeira*/
alter table ministra add foreign key (id_pro) references professor
on update cascade on delete cascade,
add foreign key (id_dis) references diciplina 
on update cascade on delete cascade;

/*adicionar atributo*/
alter table professor add cpf bigint;
alter table professro add unique (cpf);

/*adicionar condição para um atributo (crédito tem que ser igual a 2 ou 4 ou 6)*/
alter table diciplina add check (credito in (2, 4, 6));

/*alterar tipo do atributo*/
alter table professor alter cpf type text;

/*definir uma restrição de integridade para informar que um atributo é obrigatório*/
alter table professro alter cpf set not null

/*definir um valor pradrão para um atributo, caso deixado em branco, o sgbd preenche com o valor 4*/
alter table diciplina alter credito set default 4;

/*apagar um atrubuto*/
alter table professor drop cpf;

/* ====== Comandos de manipulação de dados ====== */

/*comando de inserir tuplas em uma tabela, on conflit evita que seja inserido os dados com conflito
com o do nothing indica a ação a fazer no caso de conflito de dados, nesse caso não faz nada*/
insert into departamento (
nome_dep,
pedido,
orcamento
) 
values (
'Ci~encias exatas', 
'DCE-A', 
20000
) on conflict (nome_dep) do nothing; 

/*do update = caso haja conflito o valor é atualizado com novos valoores*/
insert into departamento (
id_dep, 
nome_dep, 
predio, 
orcamento 
) values 
(1, 'Engenharias', 'DE-A', 70000),
(2, 'Saúde', 'DCA-A', 10000),
(3, 'Pedagogia', 'DEEP-C', 20000) 
on conflict (id_dep) do update set
nome_dep = excluded.nome_dep,
pedido =  excluded.pedido,
orcamento = excluded.orcamento;

insert into professor (nome_pro, salario, id_dep)
values 
('paulo', 8000, 1),
('enzo', 7000, 2),
('leticia', 14000, 3);

insert into diciplina (nome_dis, credito, id_dep)
values 
('astrofísica', 4, 1),
('anatomia', 4, 2),
('filosofia', 4, 3);

insert into aluno (nome_alu, magtricula, telefone, cidade)
values 
('olaf', 444444444, 829234564, 'patú'),
('hagnar', 666666666, 984562334, 'apodí'),
('bjorn', 333333333, 987934567, 'caraúbas');

/*alterar valores dos campos, nesse caso todfos os professores terão salário de 7000*/
update professor set salario = 7000;
update professro set salario = salario*1.10;
update professro set salario = 8000 where id_dis = 3;
update diciplina set credito = 6 where id_dis = 3;
update departamento set orcamento = orcamento*1.05 where orcamento = 2000000 or id_dep = 2;


/*deleção de tuplas em uma tabela, no primeiro caso apaga todas as tuplas*/
delete from professros;
delete from aluno where id_alu = 1;









