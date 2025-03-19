-- (Query 1) Receita, leads, conversão e ticket médio mês a mês
-- Colunas: mês, leads (#) RECEITA (K, R$), conversão (%), ticket médio (k, R$)
-- Essa query é útil para analisar o volume de acessos mensais ao funil
-- de vendas, permitindo acompanhar tendências ao longo do tempo

with
	leads as (

		select
			date_trunc('month', visit_page_date)::date as visit_page_month,
			count(*) as visit_page_count
		from sales.funnel
		group by visit_page_month
		order by visit_page_month
	),

	payments as (
		select 
			date_trunc('month', fun.paid_date)::date as paid_month,
			count(fun.paid_date) as paid_count,
			sum(pro.price * (1 + fun.discount)) as receita
		from sales.funnel as fun
		left join sales.products as pro
			on fun.product_id = pro.product_id
		where fun.paid_date is not null
		group by paid_month
		order by paid_month
	)

select 
	leads.visit_page_month as "Mês",
	leads.visit_page_count as "Leads (#)",
	payments.paid_count as "Vendas (#)",
	(payments.receita/1000) as "Receitas (k, R$)",
	(payments.paid_count::float/leads.visit_page_count::float) as "conversão (%)",
	(payments.receita/payments.paid_count/1000) as "ticket médio (k, R$)"
from leads
left join payments
	on leads.visit_page_month = paid_month

-- (Query 2) Estados que mais venderam
-- Colunas: país, estado, vendas (#)

select
	'Brazil' as País,
	cus.state as Estado,
	count(fun.paid_date) as "Vendas (#)"
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
where paid_date between '2021-08-01' and '2021-08-31'
group by País, Estado
order by "Vendas (#)" desc
limit 5

-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)

select 
	pro.brand as Marca,
	count(fun.paid_date) as "Vendas (#)"
from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
where paid_date between '2021-08-01' and '2021-08-31'
group by Marca
order by "Vendas (#)" desc
limit 5

-- (Query 4) Lojas que mais venderam
-- Colunas: loja, vendas (#)

select 
	sto.store_name as Loja,
	count(fun.paid_date) as "Vendas (#)"
from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
where paid_date between '2021-08-01' and '2021-08-31'
group by Loja
order by "Vendas (#)" desc
limit 5

-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)

select
	extract('dow' from visit_page_date) as dia_semana,
	case 
		when extract('dow' from visit_page_date) = 0 then 'domindo'
		when extract('dow' from visit_page_date) = 1 then 'segunda'
		when extract('dow' from visit_page_date) = 2 then 'terça'
		when extract('dow' from visit_page_date) = 3 then 'quarta'
		when extract('dow' from visit_page_date) = 4 then 'quinta'
		when extract('dow' from visit_page_date) = 5 then 'sexta'
		when extract('dow' from visit_page_date) = 6 then 'sábado'
		else null end as "dia da semana",
		count(*) as "visitas (#)"

from sales.funnel
where visit_page_date between '2021-08-01' and '2021-08-31'
group by dia_semana
order by dia_semana