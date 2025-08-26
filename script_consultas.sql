-- Queries de teste

use oficina;

-- Listar todos os clientes e seus veículos
select c.id_cliente, c.nome_cliente, v.modelo, v.ano, v.placa
from Clientes c
join Veiculos v on c.id_cliente = v.id_cliente;

-- Listar OS's com cliente, veículo e equipe responsável
select os.num_ordem, c.nome_cliente, v.modelo, v.placa, e.descricao_equipe, os.status_os, os.valor_total
from Ordens_Servico os
join Veiculos v on os.id_veiculo = v.id_veiculo
join Clientes c on v.id_cliente = c.id_cliente
join Equipes e on os.id_equipe = e.id_equipe;

-- Listar todos os serviços executados em uma OS específica (OS001)
select os.num_ordem, s.descricao_servico, oss.quantidade, oss.valor_total
from Ordens_Servico os
join OS_Servicos oss on os.id_os = oss.id_os
join Servicos s on oss.id_servico = s.id_servico
where os.num_ordem = 'OS001';

-- Listar todas as peças em uma OS específica (OS001)
select os.num_ordem, p.descricao_peca, osp.quantidade, osp.valor_total
from Ordens_Servico os
join OS_Pecas osp on os.id_os = osp.id_os
join Pecas p on osp.id_peca = p.id_peca
where os.num_ordem = 'OS001';

-- Calcular o total gasto em cada OS
select os.num_ordem,
	coalesce(sum(oss.valor_total),0) + coalesce(sum(osp.valor_total),0) as valor_calculado
from Ordens_Servico os
left join OS_Servicos oss on os.id_os = oss.id_os
left join OS_Pecas osp on os.id_os = osp.id_os
group by os.num_ordem;

-- Listar OS's concluídas ordenadas pelo valor total
select os.num_ordem, os.data_emissao, os.valor_total
from Ordens_Servico os
where os.status_os = 'Concluída'
order by os.valor_total desc;

-- Retornar a quantidade de OS's por status
select os.status_os, count(*) as total
from Ordens_Servico os
group by os.status_os;

-- Retornar apenas status com 2 ou mais OS's
select os.status_os, count(*) as total
from Ordens_Servico os
group by os.status_os
having count(*) >= 2;

-- Listar os serviços mais caros (TOP 3)
select descricao_servico, valor_servico
from Servicos
order by valor_servico desc
limit 3;

-- Listar clientes que mais gastaram
select c.nome_cliente, sum(os.valor_total) as total_gasto
from Clientes c
join Veiculos v on c.id_cliente = v.id_cliente
join Ordens_Servico os on v.id_veiculo = os.id_veiculo
group by c.nome_cliente
order by total_gasto desc;