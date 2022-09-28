SELECT mus.nome AS cancao,
COUNT(his.musica_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes as his
INNER JOIN SpotifyClone.musica AS mus
ON mus.id = his.musica_id
GROUP BY mus.nome
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
