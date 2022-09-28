SELECT 
art.nome AS artista,
alb.nome AS album,
COUNT(seg.artista_id) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.id = alb.artista_id
INNER JOIN SpotifyClone.seguindo_artista AS seg
ON art.id = seg.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC
;