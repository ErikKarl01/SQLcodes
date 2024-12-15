Database: Alura

DROP DATABASE IF EXISTS "Alura";

CREATE DATABASE "Alura"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

select * from aluno;
insert into aluno (
	nome, 
	cpf, 
	observacao, 
	idade,
	dinehiro,
	altura,
	ativo,
	data_nacimento,
	hora_aula,
	matriculado_em
)
values (
	'diogo', 
	123456789, 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultrices massa felis, non tempus metus mollis eget. Phasellus pretium eleifend turpis, et rhoncus risus dapibus sit amet. Vestibulum consequat porta tortor, ut congue turpis lacinia eget. Nunc at dui scelerisque, varius ligula non, hendrerit libero. Nulla pretium ex et quam hendrerit molestie. Aenean sed felis euismod, tempor velit et, placerat odio. Aliquam imperdiet massa viverra congue varius. Donec mollis nec ex at condimentum. Sed quis posuere risus. Sed euismod ante odio.',
	32,
	155.9,
	true,
	'1992-09-10',
	'17:30:00',
	'2024-01-19 18:03:03'
	
);

/* select é um comando que mostra os registros na tabela com um filtro dado por where;
   o asterisco indica que todas as colunas da tabela irão ser selecionadas*/
select * from aluno where id = 1;
update aluno set nome = 'Muadib', 
	cpf = 222333444, 
	observacao = 'Teste', 
	idade = 34,
	dinehiro = 5.80,
	altura = 2.1,
	ativo = false,
	data_nacimento = '1994-29-12',
	hora_aula = '07:00:30',
	matriculado_em = '2024-01-23 18:02:02' 
where id = 1;

delete from aluno where nome = 'Muadib';

/* nesse caso há filtros de seleção com as, o select então vai mostrar essas colunas com um
   determinado nome e também há um filtro para data*/
select nome as "nome do aluno",
	idade, 
	matriculado_em as data_que_matriculou
from aluno;

select * from aluno where nome like "aqui se escreve algo que se pareça com o nome procurado";

/* seleciona todas as colunas onde noe está nulo, pode usar not null caso queira ver os que são nulos*/
select * from aluno where nome is null;

/* intervalo do between é inclusivo*/
select * from aluno between idade 30 and 35;

/* booleano*/
select * from aluno where ativo = false;

