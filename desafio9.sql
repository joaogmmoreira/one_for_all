SELECT COUNT(his.musica_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_de_reproducoes AS his
INNER JOIN SpotifyClone.usuario AS usu
ON usu.id = his.usuario_id
WHERE usu.nome = "Barbara Liskov";