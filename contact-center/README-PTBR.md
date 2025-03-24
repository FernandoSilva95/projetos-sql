# Contact Center – Desempenho de uma empresa de Telemarketing

O objetivo deste projeto é realizar a extração, transformação, carregamento e análise das informações a partir do banco de dados fornecido pela organização, através de consultas SQL e visualizações gráficas. Foram identificados padrões de uso, desempenho dos operadores, eficiência dos planos tarifários e outros insights que possam melhorar a gestão do Contact Center.

## 🚀 Principais Técnicas e Ferramentas Utilizadas

1. Sistema Gerenciador de Banco de Dados: SQL Server

2. Consultas SQL:

- Aggregation Functions (COUNT, AVG, SUM)

- Joins entre tabelas

- Uso de DATEPART para extração de informações temporais

- Filtragem e tratamento de dados nulos

- Ordenação e Paginação de resultados

3. Visualização de Dados e Insights: Power BI

- Gráfico de Pizza: Utilizado para representar a distribuição de usuários por plano tarifário, facilitando a visualização da participação de cada plano.

- Gráfico de Colunas: Aplicado para demonstrar a quantidade de chamadas recebidas e a adesão de planos pelos usuários, permitindo comparações diretas entre períodos.

- Gráfico de Linhas: Escolhido para analisar tendências ao longo do tempo, como o histórico de chamadas, realizadas pelos operadores.

- Cartão: Utilizado para destacar métricas-chave, como o número total de chamadas recebidas e realizdas pelos operadores, proporcionando uma visão rápida e objetiva.

### 🔧 Tabelas:

telecom_dataset_us (user_id, tariff_plann, date_start)

telecom_clients_us (user_id, direction, internal, operador_id, is_missed_call, calls_count, call_duration, total_call_duration)

### 📋 Insights e Resultados Obtidos

1. Distribuição de Planos e Tempo de Uso:

Identificou-se a quantidade de usuários por plano tarifário.

2. Volume de Chamadas:

Destaque para as chamadas recebidas e realizadas dos operadores, apresentando o desempenho no período analisado.

3. Adesão de planos e média de chamadas recebidas pelos operadores:

Mede a média de  das chamadas recebidas pelos operadores, por plano tarifário, estimulando a verificação do motivo do tempo apresentado e se a adesão dos usuários está sendo satisfatório.

4. Desempenho dos Operadores, mediante o histórico de chamadas.

Identifica o desempenho dos operadores, no período de agosto a setembro de 2019.

## ✒️ Possíveis Soluções Baseadas nas Respostas das Queries

1. Otimização de Planos Tarifários:

Ajustar os planos com base no tempo médio de adesão e volume de chamadas realizadas.

2. Melhoria no Atendimento:

Identificar motivos de chamadas perdidas e implementar soluções para reduzi-las.

3. Gestão de Operadores:

Redistribuir cargas de trabalho com base no desempenho individual dos operadores.

4. Estratégias de Retenção de Clientes:

Analisar o comportamento dos clientes para oferecer promoções e incentivos.


---