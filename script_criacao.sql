-- Criação do BD Oficina
create database oficina;
use oficina;

-- Criação das tabelas
create table Clientes(
	id_cliente int auto_increment primary key,
    nome_cliente varchar(100) not null,
    endereco_cliente varchar(255) not null,
    telefone_cliente varchar(20),
    cpf_cliente varchar(11) not null unique
);

create table Veiculos(
	id_veiculo int auto_increment primary key,
    placa varchar(10) not null unique,
    modelo varchar(45) not null,
    marca varchar(45),
    ano int check (ano >= 1900),
    id_cliente int,
    foreign key (id_cliente) references Clientes(id_cliente)
);

create table Equipes(
	id_equipe int auto_increment primary key,
    descricao_equipe varchar(45)
);

create table Mecanicos(
	id_mecanico int auto_increment primary key,
    nome_mecanico varchar(100) not null,
    endereco_mecanico varchar(255),
    especialidade varchar(45),
    id_equipe int,
    foreign key (id_equipe) references Equipes(id_equipe)
);

create table Ordens_Servico(
	id_os int auto_increment primary key,
    num_ordem varchar(10) not null unique,
    data_emissao date not null,
    valor_total decimal(10,2) default 0 check (valor_total >= 0),
    status_os enum('Pendente', 'Em Andamento', 'Concluída', 'Cancelada') not null,
    data_conclusao date,
    id_veiculo int,
    id_equipe int,
    foreign key (id_veiculo) references Veiculos(id_veiculo),
    foreign key (id_equipe) references Equipes(id_equipe)
);

create table Servicos(
	id_servico int auto_increment primary key,
    descricao_servico varchar(150) not null,
    valor_servico decimal(10,2) not null check (valor_servico >= 0)
);

create table Pecas(
	id_peca int auto_increment primary key,
    descricao_peca varchar(100) not null,
    valor_peca decimal(10,2) not null check (valor_peca >= 0)
);

create table OS_Servicos(
	id_os int,
    id_servico int,
    quantidade int not null check (quantidade > 0),
    valor_total decimal(10,2) check (valor_total >= 0),
    primary key (id_os, id_servico),
    foreign key (id_os) references Ordens_Servico(id_os),
    foreign key (id_servico) references Servicos(id_servico)
);

create table OS_Pecas(
	id_os int,
    id_peca int,
    quantidade int not null check (quantidade > 0),
    valor_total decimal(10,2) check (valor_total >= 0),
    primary key (id_os, id_peca),
    foreign key (id_os) references Ordens_Servico(id_os),
    foreign key (id_peca) references Pecas(id_peca)
);