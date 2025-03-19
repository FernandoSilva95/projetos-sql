# Análise de Vendas e Performance Comercial com SQL

Este projeto tem como objetivo fornecer insights detalhados sobre o desempenho comercial de uma empresa através de consultas SQL otimizadas.

## 🚀 Estrutura do Projeto

O projeto é composto por cinco principais consultas SQL que fornecem diferentes análises sobre os dados:

1. Receita, Leads, Conversão e Ticket Médio Mês a Mês

Colunas: mês, leads (#), receita (K, R$), conversão (%), ticket médio (K, R$)

Objetivo: Permite acompanhar a tendência de acessos ao funil de vendas e medir a performance comercial ao longo do tempo.

2. Estados que Mais Venderam

Colunas: país, estado, vendas (#)

Objetivo: Identifica os estados com maior volume de vendas, permitindo otimização de estratégias de marketing e distribuição.

3. Marcas que Mais Venderam no Mês

Colunas: marca, vendas (#)

Objetivo: Analisa as marcas mais populares entre os clientes para orientar estratégias de promoção e estoque.

4. Lojas que Mais Venderam

Colunas: loja, vendas (#)

Objetivo: Identifica as lojas com melhor desempenho, permitindo otimização de operações e planejamento estratégico.

5. Dias da Semana com Maior Número de Visitas ao Site

Colunas: dia da semana, visitas (#)

Objetivo: Entender o comportamento dos clientes e otimizar campanhas de marketing com base nos dias de maior tráfego.

### 🔧 Tecnologia Utilizada: SQL e PostgreSQL

Linguagem SQL

A Structured Query Language (SQL) é utilizada para manipulação e extração de dados estruturados. Neste projeto, o SQL é empregado para realizar consultas complexas, agregando informações relevantes para a tomada de decisão.

Benefícios do Uso de SQL

- Eficiência e rapidez
- Integração com outras tecnologias
- Automatização de relatórios

PostgreSQL e pgAdmin 4

Para este projeto, utilizamos o banco de dados PostgreSQL junto com a interface gráfica pgAdmin 4. O PostgreSQL é um dos bancos de dados relacionais mais avançados e robustos disponíveis, sendo amplamente utilizado para aplicações analíticas e transacionais. O pgAdmin 4 facilita a administração do banco de dados, permitindo a execução de queries, gerenciamento de tabelas e visualização de dados de maneira intuitiva.

### 📚 Banco de Dados utilizado

Utilizado um "Schemas" (esquema) para organizar e agrupar o dataset, que contém tabelas de customers (clientes), funnel (funil de vendas), products (produtos) e stores (lojas).

### 📋 Resultados

Podemos concluir que houve uma tendência de crescimento na performance comercial ao longo do período analisado, atingindo seu ponto mais alto em agosto de 2021. Esse crescimento pode estar associado a fatores como aumento na captação de leads, maior conversão ou estratégias eficazes de vendas. Além disso, o ticket médio manteve-se estável na maior parte do tempo, sugerindo que o valor médio das vendas não sofreu grandes variações, exceto pelo pico em dezembro de 2020, possivelmente influenciado por sazonalidade, promoções de fim de ano ou maior demanda do mercado nesse período.

Sugestão de melhorias:

- Ampliar esforços de vendas e marketing nos estados e lojas que tiveram melhor desempenho.
- Implementar estratégias regionais para impulsionar vendas em áreas com menor performance.
- Implementar ações promocionais nos meses de menor conversão para manter um fluxo estável de vendas.

## ✒️ Agradecimentos

Este projeto é parte final do curso "SQL para Análise de Dados: Do básico ao avançado", criado por Midori Toyota. Agradeço pela didática e clareza no ensino. Todos os objetivos propostos foram alcançados.

---