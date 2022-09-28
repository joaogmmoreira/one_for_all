SELECT 
FORMAT(MIN(plan.valor), 2) AS faturamento_minimo,
FORMAT(MAX(plan.valor), 2)AS faturamento_maximo,
FORMAT(ROUND(AVG(plan.valor), 2), 2)AS faturamento_medio,
FORMAT(SUM(plan.valor), 2) AS faturamento_total
FROM SpotifyClone.usuario AS usu
INNER JOIN SpotifyClone.plano AS plan
ON plan.id = usu.plano_id;
