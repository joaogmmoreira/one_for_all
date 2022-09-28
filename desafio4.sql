SELECT nome AS usuario,
IF(YEAR(MAX(his.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo')
AS status_usuario
FROM SpotifyClone.usuario AS usu
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON usu.id = his.usuario_id
GROUP BY usuario_id
ORDER BY usuario ASC;