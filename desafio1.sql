DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      valor DOUBLE(3,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      data_lancamento INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musica(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      duracao_segundos INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (id),
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproducoes(
      usuario_id INT NOT NULL,
      musica_id INT NOT NULL,
      data_reproducao DATE,
			CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (id),
      FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musica (id)  
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.plano (nome, valor)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

	INSERT INTO SpotifyClone.usuario (nome, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-14'),
		('Sandi Metz', 58, 2, '2018-04-29'),
		('Paulo Freire', 19, 3, '2018-02-14'),
		('Bell Hooks', 26, 3, '2018-01-05'),
		('Christopher Alexander', 85, 4, '2019-06-05'),
		('Judith Butler', 45, 4, '2020-05-13'),
		('Jorge Amado', 58, 4, '2017-02-17');

	INSERT INTO SpotifyClone.artista (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
		('Blind Guardian'),
		('Nina Simone');

	INSERT INTO SpotifyClone.album (nome, artista_id, data_lancamento)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
		('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
		('QVVJFA?', 4, 2003),
		('Somewhere Far Beyond', 5, 2007),
		('I Put A Spell On You', 6, 2012);

	INSERT INTO SpotifyClone.musica (nome, artista_id, album_id, duracao_segundos)
  VALUES
		('Break My Soul', 1, 1, 279), 
		('Virgos''s Groove', 1, 1, 369), 
		('Alien Superstar', 1, 1, 116),
    ('Don''t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
		('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ('Samba em Paris', 4, 6, 267),
		('The Bard''s Song', 5, 7, 244),
		('Feeling Good', 6, 8, 100);
