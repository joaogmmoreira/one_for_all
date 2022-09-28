SELECT usu.nome AS usuario,
COUNT(his.data_reproducao) AS qt_de_musicas_ouvidas,
ROUND(SUM(mus.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.usuario AS usu
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON usu.id = his.usuario_id
INNER JOIN SpotifyClone.musica AS mus
ON mus.id = his.musica_id
GROUP BY usuario
ORDER BY usuario ASC;