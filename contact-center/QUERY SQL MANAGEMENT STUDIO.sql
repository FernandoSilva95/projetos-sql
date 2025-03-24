SELECT
	*
FROM ContactCenter.dbo.telecom_dataset_us

SELECT
	*
FROM ContactCenter.dbo.telecom_clients_us

-- Contagem da quantidade de usuários por plano e médias de dia por plano (ref. data: 01/08/2019 à 23/03/2025)
SELECT
	cli.tariff_plan as Plano,
    COUNT(DISTINCT cli.user_id) AS Total_usuarios,
	AVG(DATEDIFF(DAY, cli.date_start, GETDATE())) AS Media_dias_plano

FROM ContactCenter.dbo.telecom_clients_us AS cli
LEFT JOIN ContactCenter.dbo.telecom_dataset_us AS inf
	ON cli.user_id = inf.user_id
GROUP BY cli.tariff_plan;

-- Contagem da quantidade de chamadas recebidas, realizadas, perdidas e adesão ao plano por mês
-- * EXTRACT NÃO É UTILIZADO NO SQL MANAGEMENT STUDIO, NEM O FROM. É DATEPART E VIRGULA
SELECT
	cli.tariff_plan as Plano,
	SUM(CASE WHEN inf.direction = 'in' THEN 1 ELSE 0 END) AS Chamadas_recebidas,
	SUM(CASE WHEN inf.direction = 'out' THEN 1 ELSE 0 END) AS Chamadas_realizadas,
	SUM(CASE WHEN inf.is_missed_call = 'False' THEN 1 ELSE 0 END) AS Chamadas_perdidas,
	DATEPART(MONTH, cli.date_start) AS Ordem_mês,
    CASE 
        WHEN DATEPART(MONTH, cli.date_start) = 08 THEN 'Agosto'
        WHEN DATEPART(MONTH, cli.date_start) = 09 THEN 'Setembro'
        WHEN DATEPART(MONTH, cli.date_start) = 10 THEN 'Outubro'
		else null end as "Mês",
		count(*) as "Adesão"
FROM ContactCenter.dbo.telecom_clients_us AS cli
LEFT JOIN ContactCenter.dbo.telecom_dataset_us AS inf
	ON cli.user_id = inf.user_id
GROUP BY cli.tariff_plan, DATEPART(MONTH, cli.date_start)
ORDER BY cli.tariff_plan, Ordem_mês;

-- Média de duração das chamadas atendidas por plano
SELECT 
	cli.tariff_plan as Plano,
	AVG(TRY_CAST(inf.call_duration AS FLOAT)) AS Media_tempo_chamada
FROM ContactCenter.dbo.telecom_clients_us AS cli
LEFT JOIN ContactCenter.dbo.telecom_dataset_us AS inf
    ON cli.user_id = inf.user_id
WHERE TRY_CAST(inf.call_duration AS FLOAT) IS NOT NULL
GROUP BY cli.tariff_plan

-- Quantas chamadas cada operador realizou e recebeu
SELECT 
    inf.operator_id, 
    COUNT(CASE WHEN inf.direction = 'out' THEN 1 END) AS chamadas_realizadas,
    COUNT(CASE WHEN inf.direction = 'in' THEN 1 END) AS chamadas_recebidas
FROM ContactCenter.dbo.telecom_clients_us AS cli
LEFT JOIN ContactCenter.dbo.telecom_dataset_us AS inf
    ON cli.user_id = inf.user_id
GROUP BY inf.operator_id
HAVING COUNT(CASE WHEN inf.direction = 'out' THEN 1 END) > 0 
    OR COUNT(CASE WHEN inf.direction = 'in' THEN 1 END) > 0
	AND inf.operator_id is not null
ORDER BY chamadas_realizadas DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;  -- NO SQL Server não utiliza LIMIT
