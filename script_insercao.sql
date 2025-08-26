-- População de tabelas
use oficina;

insert into Clientes(nome_cliente, endereco_cliente, telefone_cliente, cpf_cliente) values
('João Silva', 'Rua A, 123', '11988887777', '12345678901'),
('Maria Oliveira', 'Av. B, 456', '21999998888', '98765432100'),
('Carlos Souza', 'Rua C, 789', '31977776666', '11122233344'),
('Fernanda Lima', 'Travessa D, 101', '41955554444', '55566677788'),
('Paulo Mendes', 'Rua E, 202', '51944443333', '99988877766');

insert into Veiculos (placa, modelo, marca, ano, id_cliente) values
('ABC1D23', 'Civic', 'Honda', 2020, 1),
('XYZ9K88', 'Corolla', 'Toyota', 2021, 2),
('LMN3P45', 'Gol', 'Volkswagen', 2018, 3),
('QRS7T89', 'Fiesta', 'Ford', 2019, 4),
('JKL5M67', 'Onix', 'Chevrolet', 2022, 5);

insert into Equipes (descricao_equipe) values
('Equipe Motor'),
('Equipe Suspensão'),
('Equipe Freios'),
('Equipe Elétrica'),
('Equipe Revisão Geral');

insert into Mecanicos (nome_mecanico, endereco_mecanico, especialidade, id_equipe) values
('Ricardo Almeida', 'Rua Alfa, 11', 'Motor', 1),
('Juliana Costa', 'Rua Beta, 22', 'Suspensão', 2),
('Marcos Paulo', 'Rua Gama, 33', 'Freios', 3),
('Ana Beatriz', 'Rua Delta, 44', 'Elétrica', 4),
('Felipe Santos', 'Rua Épsilon, 55', 'Revisão Geral', 5);

insert into Servicos (descricao_servico, valor_servico) values
('Troca de óleo', 150.00),
('Alinhamento e Balanceamento', 200.00),
('Revisão completa', 600.00),
('Troca de pastilhas de freio', 300.00),
('Serviço de injeção eletrônica', 400.00);

insert into Pecas (descricao_peca, valor_peca) values
('Filtro de óleo', 50.00),
('Pastilhas de freio', 200.00),
('Bateria 60Ah', 450.00),
('Correia dentada', 180.00),
('Amortecedor dianteiro', 350.00);

insert into Ordens_Servico (num_ordem, data_emissao, valor_total, status_os, data_conclusao, id_veiculo, id_equipe) values
('OS001', '2025-08-01', 0, 'Pendente', NULL, 1, 1),
('OS002', '2025-08-02', 0, 'Em Andamento', NULL, 2, 2),
('OS003', '2025-08-03', 0, 'Concluída', '2025-08-05', 3, 3),
('OS004', '2025-08-04', 0, 'Cancelada', NULL, 4, 4),
('OS005', '2025-08-05', 0, 'Em Andamento', NULL, 5, 5);

insert into OS_Servicos (id_os, id_servico, quantidade, valor_total) values
(1, 1, 1, 150.00),
(2, 2, 1, 200.00),
(3, 3, 1, 600.00),
(4, 4, 1, 300.00), 
(5, 5, 1, 400.00);

insert into OS_Pecas (id_os, id_peca, quantidade, valor_total) values
(1, 1, 1, 50.00),
(2, 5, 2, 700.00),
(3, 2, 1, 200.00),
(4, 3, 1, 450.00),
(5, 4, 1, 180.00);