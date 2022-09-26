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
      data_assinatura TIMESTAMP,
      FOREIGN KEY (plano_id) REFERENCES plano(id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      data_lancamento TIMESTAMP,
      FOREIGN KEY (artista_id) REFERENCES artista(id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musica(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      duracao_segundos TIMESTAMP,
      FOREIGN KEY (artista_id) REFERENCES artista(id),
      FOREIGN KEY (album_id) REFERENCES album(id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproducoes(
      usuario_id INT NOT NULL,
      musica_id INT NOT NULL,
      data_reproducao TIMESTAMP,
      FOREIGN KEY (usuario_id) REFERENCES usuario(id),
      FOREIGN KEY (musica_id) REFERENCES musica(id)  
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.plano (nome, valor)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

	INSERT INTO SpotifyClone.usuario (nome, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, 2019-10-20),
    ('Robert Cecil Martin', 58, 1, 2017-01-06),
    ('universitário', 5.99),
    ('pessoal', 6.99);
