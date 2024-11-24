-- Schema coral_data
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coral_data` DEFAULT CHARACTER SET utf8 ;
USE `coral_data` ;

-- ------------- Schema coral_data
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coral_data` DEFAULT CHARACTER SET utf8 ;
USE `coral_data` ;

-- -----------------------------------------------------
-- Table `coral_data`.`localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`localizacao` (
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NULL,
  `pais` VARCHAR(100) NULL,
  PRIMARY KEY (`cidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recifes_de_corais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recifes_de_corais` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(100) NULL,
  `motivo_de_selecao` VARCHAR(250) NULL,
  `impacto_humano` VARCHAR(100) NULL,
  `protecao_ambiental` VARCHAR(100) NULL,
  `estado_saude` VARCHAR(100) NULL,
  `branquamento` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_recife`),
  INDEX `localizacao_cidade_idx` (`cidade` ASC) VISIBLE,
  CONSTRAINT `localizacao_cidade`
    FOREIGN KEY (`cidade`)
    REFERENCES `coral_data`.`localizacao` (`cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`ameacas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`ameacas` (
  `nome_ameaca` VARCHAR(100) NOT NULL,
  `descricao_ameaca` VARCHAR(250) NULL,
  PRIMARY KEY (`nome_ameaca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recife_ameacas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recife_ameacas` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `nome_ameaca` VARCHAR(100) NOT NULL,
  `intensidade` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_recife`, `nome_ameaca`),
  INDEX `ameacas_nome_ameaca_idx` (`nome_ameaca` ASC) VISIBLE,
  CONSTRAINT `recifes_de_corais_nome_recife_ameacas`
    FOREIGN KEY (`nome_recife`)
    REFERENCES `coral_data`.`recifes_de_corais` (`nome_recife`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ameacas_nome_ameaca`
    FOREIGN KEY (`nome_ameaca`)
    REFERENCES `coral_data`.`ameacas` (`nome_ameaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`genero` (
  `nome_genero` VARCHAR(100) NOT NULL,
  `descricao_genero` VARCHAR(250) NULL,
  PRIMARY KEY (`nome_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`especie` (
  `nome_especie` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(100) NULL,
  `nome_genero` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_especie`),
  INDEX `genero_nome_genero_idx` (`nome_genero` ASC) VISIBLE,
  CONSTRAINT `genero_nome_genero`
    FOREIGN KEY (`nome_genero`)
    REFERENCES `coral_data`.`genero` (`nome_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recife_especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recife_especie` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `nome_especie` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`nome_recife`, `nome_especie`),
  INDEX `especie_nome_especie_idx` (`nome_especie` ASC) VISIBLE,
  CONSTRAINT `recifes_de_corais_nome_recife_especie`
    FOREIGN KEY (`nome_recife`)
    REFERENCES `coral_data`.`recifes_de_corais` (`nome_recife`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `especie_nome_especie`
    FOREIGN KEY (`nome_especie`)
    REFERENCES `coral_data`.`especie` (`nome_especie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

Após o Script, foram criadas as tabelas no Banco CORALDATA, conforme tela abaixo:
 





4.2 Script para popular o Banco

USE coral_data;

INSERT INTO localizacao VALUES
('Arquipelago dos Abrolhos', 'Bahia', 'Brasil'),
('Fernando de Noronha', 'Pernambuco', 'Brasil'),
('Itacaré', 'Recifes dos Itacolomis', 'Brasil'),
('Maracajau', 'Rio Grande do Norte', 'Brasil'),
('Tamandare', 'Pernambuco', 'Brasil'),
('Itaparica', 'Bahia', 'Brasil'),
('Caravelas', 'Bahia', 'Brasil'),
('Porto Seguro', 'Bahia', 'Brasil'),
('Atol das Rocas', 'Rio Grande do Norte', 'Brasil'),
('Praia do Forte', 'Bahia', 'Brasil');

INSERT INTO recifes_de_corais VALUES
('Lingua da Siriba I', 'Arquipelago dos Abrolhos', 'Parque Nacional Marinho', 'Baixa', 'true', 'Baixo', 'Alto'),
('Sueste Trilha', 'Fernando de Noronha', 'Este local terá uma trilha subaquática para mergulho turístico', 'Alto', 'true', 'Baixo', 'Alto'),
('Buraco do Inferno', 'Fernando de Noronha', 'nan', 'nan', 'true', 'Baixo', 'Alto'),
('Canudos', 'Itacaré', 'local com pesca e visitação frequente - local de controle', 'Médio', 'true', 'Baixo', 'Alto'),
('Manoa 2', 'Maracajau', 'local de monitoramento', 'Alto', 'true', 'Baixo', 'Alto'),
('Baixa Seca', 'Tamandare', 'O melhor recife desta zona, colocado numa zona proibida. Ocorrência de branqueamento de coral alto', 'Médio', 'true', 'Alto', 'Baixo'),
('Piscina de Rocas I', 'Atol das Rocas', 'MPA, o único atol do Atlântico Sul e área de recifes totalmente protegida no Brasil', 'Não Há', 'true', 'Baixo', 'Alto'),
('Cabana Pai Orlando', 'Itaparica', 'nan', 'Médio', 'true', 'Baixo', 'Alto'),
('Sancho Bay', 'Fernando de Noronha', 'formações de corais, sem mergulho em Baixaed', 'nan', 'true', 'Baixo', 'Alto'),
('Chapeirao da Debora', 'Caravelas', 'Parque Nacional Marinho', 'Baixa', 'true', 'Moderado', 'Moderado'),
('Coral Vivo Oeste', 'Porto Seguro', 'local de monitoramento', 'Alto', 'true', 'Moderado', 'Moderado'),
('Piscina de Abrolhos', 'Atol das Rocas', 'MPA, o único atol do Atlântico Sul e área de recifes totalmente protegida no Brasil', 'Não Há', 'true', 'Baixo', 'Alto'),
('Barra do Forte', 'Praia do Forte', 'Localizado perto da estação de pesquisa', 'Alto', 'Médio', 'Moderado', 'Moderado');

INSERT INTO ameacas VALUES
('Pesca_com_Bomba', 'técnica de pesca ilegal e destrutiva que utiliza explosivos'),
('Pesca_para_Aquario', 'Pesca de Corais para ornamentação de aquários'),
('Colheita_de_invertebrados_para_gastronomia', 'Colheita de corais exóticos para culinária'),
('Mergulho_De_Turismo', 'Os mergulhadores podem danificar os corais e outros organismos marinhos ao tocar ou esbarrar neles.'),
('Poluição_de_Esgoto', 'Os esgotos domésticos e industriais podem conter uma variedade de poluentes.'),
('Pesca_Comercial', 'A pesca excessiva de peixes e outros organismos marinhos pode levar ao declínio das populações de corais.');

INSERT INTO recife_ameacas VALUES
('Lingua da Siriba I', 'Mergulho_De_Turismo', 'Alto'),
('Sueste Trilha', 'Mergulho_De_Turismo', 'Alto'),
('Buraco do Inferno', 'Mergulho_De_Turismo', 'Alto'),
('Canudos', 'Mergulho_De_Turismo', 'Médio'),
('Canudos', 'Colheita_de_invertebrados_para_gastronomia', 'Médio'),
('Manoa 2', 'Pesca_para_Aquario', 'Médio'),
('Manoa 2', 'Colheita_de_invertebrados_para_gastronomia', 'Médio'),
('Manoa 2', 'Mergulho_De_Turismo', 'Alto'),
('Manoa 2', 'Poluição_de_Esgoto', 'Baixa'),
('Manoa 2', 'Pesca_Comercial', 'Alto'),
('Cabana Pai Orlando', 'Colheita_de_invertebrados_para_gastronomia', 'Baixa'),
('Sancho Bay', 'Mergulho_De_Turismo', 'Baixa'),
('Chapeirao da Debora', 'Mergulho_De_Turismo', 'Baixa'),
('Coral Vivo Oeste', 'Pesca_para_Aquario', 'Alto'),
('Coral Vivo Oeste', 'Colheita_de_invertebrados_para_gastronomia', 'Alto'),
('Coral Vivo Oeste', 'Mergulho_De_Turismo', 'Alto'),
('Coral Vivo Oeste', 'Poluição_de_Esgoto', 'Baixa'),
('Coral Vivo Oeste', 'Pesca_Comercial', 'Alto');

INSERT INTO genero VALUES
('Acropora', 'Ramos finos e delicados'),
('Porites', 'Corpo maciço, que pode ser redondo, oval ou irregular.'),
('Siderastrea', 'crescimento incrustante'),
('Alcyonacea', 'corpo macio e gelatinoso'),
('Dendronephthya', 'ramos finos e delicados'),
('Sinularia', 'corais moles ramificados, com formato de arbustos ou árvores'),
('Tubastraea', 'corais moles incrustantes, com formato de botões ou discos'),
('Sarcophyton', 'corais moles incrustantes'),
('Xenia', 'corais moles ramificados '),
('Mussismilia', 'corais moles incrustantes'),
('Diploria', 'São corais duros, com esqueleto de carbonato de cálcio.'),
('Montastraea', 'pólipos são pequenos e têm oito tentáculos'),
('Lobophora', 'corais moles incrustantes '),
('Millepora', 'corais duros, com esqueleto de carbonato de cálcio.');

INSERT INTO especie VALUES
('Acropora cervicornis (coral-cérebro)', 'Coral Duro', 'Acropora'),
('Acropora palmata (coral-palmeira)', 'Coral Duro', 'Acropora'),
('Acropora prolifera (coral-ramoso)', 'Coral Duro', 'Acropora'),
('Porites astreoides (coral-estrela)', 'Coral Duro', 'Porites'),
('Siderastrea siderea (coral-estrela)', 'Coral Duro', 'Siderastrea'),
('Alcyonacea (corais-cérebro)', 'Coral Mole', 'Alcyonacea'),
('Dendronephthya sp. (coral-de-bambu)', 'Coral Mole', 'Dendronephthya'),
('Sinularia (corais-de-tufo)', 'Coral Mole', 'Sinularia'),
('Tubastraea (corais-de-tubo)', 'Coral Mole', 'Tubastraea'),
('Sarcophyton sp. (coral-de-flor)', 'Coral Duro', 'Sarcophyton'),
('Xenia sp. (coral-de-feixe)', 'Coral Mole', 'Xenia'),
('Porites lobata (coral-de-bolha)', 'Coral Duro', 'Porites'),
('Mussismilia hispida (coral-de-espinho)', 'Coral Duro', 'Mussismilia'),
('Diploria strigosa', 'Coral Duro', 'Diploria'),
('Montastraea annularis', 'Coral Duro', 'Montastraea'),
('Porites porites', 'Coral Duro', 'Porites'),
('Lobophora variegata', 'Coral Mole', 'Lobophora'),
('Millepora alcicornis', 'Coral Mole', 'Millepora'),
('Millepora squarrosa', 'Coral Mole', 'Millepora'),
('Sarcophyton trocheliophorum', 'Coral Mole', 'Sarcophyton'),
('Porites compressa', 'Coral Duro', 'Porites'),
('Acropora cervicornis', 'Coral Duro', 'Acropora');

INSERT INTO recife_especie VALUES
('Sueste Trilha', 'Acropora cervicornis (coral-cérebro)'),
('Sueste Trilha', 'Acropora palmata (coral-palmeira)'),
('Sueste Trilha', 'Acropora prolifera (coral-ramoso)'),
('Sueste Trilha', 'Porites astreoides (coral-estrela)'),
('Sueste Trilha', 'Siderastrea siderea (coral-estrela)'),
('Sueste Trilha', 'Alcyonacea (corais-cérebro)'),
('Sueste Trilha', 'Dendronephthya sp. (coral-de-bambu)'),
('Sueste Trilha', 'Sinularia (corais-de-tufo)'),
('Sueste Trilha', 'Tubastraea (corais-de-tubo)'),
('Lingua da Siriba I', 'Dendronephthya sp. (coral-de-bambu)'),
('Lingua da Siriba I', 'Sarcophyton sp. (coral-de-flor)'),
('Lingua da Siriba I', 'Xenia sp. (coral-de-feixe)'),
('Buraco do Inferno', 'Acropora cervicornis (coral-cérebro)'),
('Buraco do Inferno', 'Acropora palmata (coral-palmeira)'),
('Buraco do Inferno', 'Porites lobata (coral-de-bolha)'),
('Buraco do Inferno', 'Siderastrea siderea (coral-estrela)'),
('Buraco do Inferno', 'Mussismilia hispida (coral-de-espinho)'),
('Buraco do Inferno', 'Dendronephthya sp. (coral-de-bambu)'),
('Buraco do Inferno', 'Sarcophyton sp. (coral-de-flor)'),
('Buraco do Inferno', 'Xenia sp. (coral-de-feixe)'),
('Canudos', 'Acropora cervicornis (coral-cérebro)'),
('Canudos', 'Acropora palmata (coral-palmeira)'),
('Canudos', 'Acropora prolifera (coral-ramoso)'),
('Canudos', 'Diploria strigosa'),
('Canudos', 'Montastraea annularis'),
('Canudos', 'Porites astreoides (coral-estrela)'),
('Canudos', 'Porites compressa'),
('Canudos', 'Porites porites'),
('Canudos', 'Lobophora variegata'),
('Canudos', 'Millepora alcicornis'),
('Canudos', 'Millepora squarrosa'),
('Canudos', 'Sarcophyton trocheliophorum'),
('Manoa 2', 'Acropora cervicornis'),
('Manoa 2', 'Acropora palmata (coral-palmeira)'),
('Manoa 2', 'Acropora prolifera (coral-ramoso)'),
('Manoa 2', 'Diploria strigosa'),
('Manoa 2', 'Montastraea annularis'),
('Manoa 2', 'Porites astreoides (coral-estrela)'),
('Baixa Seca', 'Acropora cervicornis (coral-cérebro)'),
('Baixa Seca', 'Acropora palmata (coral-palmeira)'),
('Baixa Seca', 'Acropora prolifera (coral-ramoso)'),
('Baixa Seca', 'Diploria strigosa'),
('Baixa Seca', 'Montastraea annularis'),
('Baixa Seca', 'Porites astreoides (coral-estrela)'),
('Baixa Seca', 'Porites compressa'),
('Baixa Seca', 'Porites porites'),
('Baixa Seca', 'Lobophora variegata'),
('Baixa Seca', 'Millepora alcicornis'),
('Baixa Seca', 'Millepora squarrosa'),
('Baixa Seca', 'Sarcophyton trocheliophorum'),
('Piscina de Rocas I', 'Acropora cervicornis (coral-cérebro)'),
('Piscina de Rocas I', 'Acropora palmata (coral-palmeira)'),
('Piscina de Rocas I', 'Acropora prolifera (coral-ramoso)'),
('Piscina de Rocas I', 'Diploria strigosa'),
('Piscina de Rocas I', 'Montastraea annularis'),
('Piscina de Rocas I', 'Porites astreoides (coral-estrela)'),
('Piscina de Rocas I', 'Porites compressa'),
('Piscina de Rocas I', 'Porites porites'),
('Piscina de Rocas I', 'Lobophora variegata'),
('Piscina de Rocas I', 'Millepora alcicornis'),
('Piscina de Rocas I', 'Millepora squarrosa'),
('Piscina de Rocas I', 'Sarcophyton trocheliophorum'),
('Cabana Pai Orlando', 'Acropora cervicornis'),
('Cabana Pai Orlando', 'Acropora palmata (coral-palmeira)'),
('Cabana Pai Orlando', 'Porites astreoides (coral-estrela)'),
('Cabana Pai Orlando', 'Porites porites'),
('Cabana Pai Orlando', 'Siderastrea siderea (coral-estrela)'),
('Cabana Pai Orlando', 'Dendronephthya sp. (coral-de-bambu)'),
('Cabana Pai Orlando', 'Sarcophyton sp. (coral-de-flor)'),
('Cabana Pai Orlando', 'Xenia sp. (coral-de-feixe)'),
('Sancho Bay', 'Porites astreoides (coral-estrela)'),
('Sancho Bay', 'Porites porites'),
('Sancho Bay', 'Siderastrea siderea (coral-estrela)'),
('Sancho Bay', 'Dendronephthya sp. (coral-de-bambu)'),
('Sancho Bay', 'Sarcophyton sp. (coral-de-flor)'),
('Chapeirao da Debora', 'Siderastrea siderea (coral-estrela)'),
('Chapeirao da Debora', 'Acropora prolifera (coral-ramoso)'),
('Chapeirao da Debora', 'Acropora cervicornis'),
('Chapeirao da Debora', 'Dendronephthya sp. (coral-de-bambu)'),
('Coral Vivo Oeste', 'Porites lobata (coral-de-bolha)'),
('Coral Vivo Oeste', 'Siderastrea siderea (coral-estrela)'),
('Coral Vivo Oeste', 'Mussismilia hispida (coral-de-espinho)'),
('Coral Vivo Oeste', 'Dendronephthya sp. (coral-de-bambu)'),
('Coral Vivo Oeste', 'Sarcophyton sp. (coral-de-flor)'),
('Piscina de Abrolhos', 'Acropora cervicornis (coral-cérebro)'),
('Piscina de Abrolhos', 'Acropora palmata (coral-palmeira)'),
('Piscina de Abrolhos', 'Porites astreoides (coral-estrela)'),
('Piscina de Abrolhos', 'Porites porites'),
('Piscina de Abrolhos', 'Siderastrea siderea (coral-estrela)'),
('Piscina de Abrolhos', 'Dendronephthya sp. (coral-de-bambu)'),
('Piscina de Abrolhos', 'Sarcophyton sp. (coral-de-flor)'),
('Piscina de Abrolhos', 'Xenia sp. (coral-de-feixe)'),
('Barra do Forte', 'Acropora cervicornis (coral-cérebro)'),
('Barra do Forte', 'Acropora palmata (coral-palmeira)'),
('Barra do Forte', 'Porites astreoides (coral-estrela)'),
('Barra do Forte', 'Porites porites'),
('Barra do Forte', 'Siderastrea siderea (coral-estrela)'),
('Barra do Forte', 'Dendronephthya sp. (coral-de-bambu)'),
('Barra do Forte', 'Sarcophyton sp. (coral-de-flor)'),
('Barra do Forte', 'Xenia sp. (coral-de-feixe)');

4.3 Script das Consultas 
-- CONSULTAS

-- Liste os estados que possuem recifes de corais.
SELECT 
    nome_recife,
    estado
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade;

-- Quantos recifes de corais foram registrados?
SELECT COUNT(nome_recife)
FROM coral_data.recifes_de_corais;

-- Quais os recifes que possuem nível de branqueamento alto?
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE branquamento LIKE 'Alto';

-- Quais os recifes que possuem nível de branqueamento baixo?
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE branquamento LIKE 'Baixo';

-- Quantos recifes de corais foram registrados no estado da Bahia?
SELECT 
	COUNT(nome_recife)
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade
WHERE localizacao.estado = 'Bahia';

-- Qual a ameaca mais presente nos recifes de corais?

SELECT a.nome_ameaca, subquery.max_count AS ameaca_count
FROM (
    SELECT nome_ameaca, COUNT(nome_ameaca) AS max_count
    FROM coral_data.recife_ameacas
    GROUP BY nome_ameaca
) AS subquery
JOIN coral_data.recife_ameacas AS a
ON a.nome_ameaca = subquery.nome_ameaca
WHERE subquery.max_count = (
    SELECT MAX(max_count)
    FROM (
        SELECT COUNT(nome_ameaca) AS max_count
        FROM coral_data.recife_ameacas
        GROUP BY nome_ameaca
    ) AS max_subquery
) GROUP BY nome_ameaca;

-- Selecione os recifes que possuem impacto humano alto ou médio.
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE impacto_humano REGEXP 'alto|médio' COLLATE utf8mb4_unicode_ci;

-- Quantos recifes temos presente no Brasil?
SELECT DISTINCT COUNT(nome_recife) AS recifes_brasileiros
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade
WHERE localizacao.pais LIKE 'Brasil';






------------------------------------------
-- Table `coral_data`.`localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`localizacao` (
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NULL,
  `pais` VARCHAR(100) NULL,
  PRIMARY KEY (`cidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recifes_de_corais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recifes_de_corais` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(100) NULL,
  `motivo_de_selecao` VARCHAR(250) NULL,
  `impacto_humano` VARCHAR(100) NULL,
  `protecao_ambiental` VARCHAR(100) NULL,
  `estado_saude` VARCHAR(100) NULL,
  `branquamento` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_recife`),
  INDEX `localizacao_cidade_idx` (`cidade` ASC) VISIBLE,
  CONSTRAINT `localizacao_cidade`
    FOREIGN KEY (`cidade`)
    REFERENCES `coral_data`.`localizacao` (`cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`ameacas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`ameacas` (
  `nome_ameaca` VARCHAR(100) NOT NULL,
  `descricao_ameaca` VARCHAR(250) NULL,
  PRIMARY KEY (`nome_ameaca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recife_ameacas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recife_ameacas` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `nome_ameaca` VARCHAR(100) NOT NULL,
  `intensidade` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_recife`, `nome_ameaca`),
  INDEX `ameacas_nome_ameaca_idx` (`nome_ameaca` ASC) VISIBLE,
  CONSTRAINT `recifes_de_corais_nome_recife_ameacas`
    FOREIGN KEY (`nome_recife`)
    REFERENCES `coral_data`.`recifes_de_corais` (`nome_recife`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ameacas_nome_ameaca`
    FOREIGN KEY (`nome_ameaca`)
    REFERENCES `coral_data`.`ameacas` (`nome_ameaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`genero` (
  `nome_genero` VARCHAR(100) NOT NULL,
  `descricao_genero` VARCHAR(250) NULL,
  PRIMARY KEY (`nome_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`especie` (
  `nome_especie` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(100) NULL,
  `nome_genero` VARCHAR(100) NULL,
  PRIMARY KEY (`nome_especie`),
  INDEX `genero_nome_genero_idx` (`nome_genero` ASC) VISIBLE,
  CONSTRAINT `genero_nome_genero`
    FOREIGN KEY (`nome_genero`)
    REFERENCES `coral_data`.`genero` (`nome_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coral_data`.`recife_especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coral_data`.`recife_especie` (
  `nome_recife` VARCHAR(100) NOT NULL,
  `nome_especie` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`nome_recife`, `nome_especie`),
  INDEX `especie_nome_especie_idx` (`nome_especie` ASC) VISIBLE,
  CONSTRAINT `recifes_de_corais_nome_recife_especie`
    FOREIGN KEY (`nome_recife`)
    REFERENCES `coral_data`.`recifes_de_corais` (`nome_recife`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `especie_nome_especie`
    FOREIGN KEY (`nome_especie`)
    REFERENCES `coral_data`.`especie` (`nome_especie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

Após o Script, foram criadas as tabelas no Banco CORALDATA, conforme tela abaixo:
 





4.2 Script para popular o Banco

USE coral_data;

INSERT INTO localizacao VALUES
('Arquipelago dos Abrolhos', 'Bahia', 'Brasil'),
('Fernando de Noronha', 'Pernambuco', 'Brasil'),
('Itacaré', 'Recifes dos Itacolomis', 'Brasil'),
('Maracajau', 'Rio Grande do Norte', 'Brasil'),
('Tamandare', 'Pernambuco', 'Brasil'),
('Itaparica', 'Bahia', 'Brasil'),
('Caravelas', 'Bahia', 'Brasil'),
('Porto Seguro', 'Bahia', 'Brasil'),
('Atol das Rocas', 'Rio Grande do Norte', 'Brasil'),
('Praia do Forte', 'Bahia', 'Brasil');

INSERT INTO recifes_de_corais VALUES
('Lingua da Siriba I', 'Arquipelago dos Abrolhos', 'Parque Nacional Marinho', 'Baixa', 'true', 'Baixo', 'Alto'),
('Sueste Trilha', 'Fernando de Noronha', 'Este local terá uma trilha subaquática para mergulho turístico', 'Alto', 'true', 'Baixo', 'Alto'),
('Buraco do Inferno', 'Fernando de Noronha', 'nan', 'nan', 'true', 'Baixo', 'Alto'),
('Canudos', 'Itacaré', 'local com pesca e visitação frequente - local de controle', 'Médio', 'true', 'Baixo', 'Alto'),
('Manoa 2', 'Maracajau', 'local de monitoramento', 'Alto', 'true', 'Baixo', 'Alto'),
('Baixa Seca', 'Tamandare', 'O melhor recife desta zona, colocado numa zona proibida. Ocorrência de branqueamento de coral alto', 'Médio', 'true', 'Alto', 'Baixo'),
('Piscina de Rocas I', 'Atol das Rocas', 'MPA, o único atol do Atlântico Sul e área de recifes totalmente protegida no Brasil', 'Não Há', 'true', 'Baixo', 'Alto'),
('Cabana Pai Orlando', 'Itaparica', 'nan', 'Médio', 'true', 'Baixo', 'Alto'),
('Sancho Bay', 'Fernando de Noronha', 'formações de corais, sem mergulho em Baixaed', 'nan', 'true', 'Baixo', 'Alto'),
('Chapeirao da Debora', 'Caravelas', 'Parque Nacional Marinho', 'Baixa', 'true', 'Moderado', 'Moderado'),
('Coral Vivo Oeste', 'Porto Seguro', 'local de monitoramento', 'Alto', 'true', 'Moderado', 'Moderado'),
('Piscina de Abrolhos', 'Atol das Rocas', 'MPA, o único atol do Atlântico Sul e área de recifes totalmente protegida no Brasil', 'Não Há', 'true', 'Baixo', 'Alto'),
('Barra do Forte', 'Praia do Forte', 'Localizado perto da estação de pesquisa', 'Alto', 'Médio', 'Moderado', 'Moderado');

INSERT INTO ameacas VALUES
('Pesca_com_Bomba', 'técnica de pesca ilegal e destrutiva que utiliza explosivos'),
('Pesca_para_Aquario', 'Pesca de Corais para ornamentação de aquários'),
('Colheita_de_invertebrados_para_gastronomia', 'Colheita de corais exóticos para culinária'),
('Mergulho_De_Turismo', 'Os mergulhadores podem danificar os corais e outros organismos marinhos ao tocar ou esbarrar neles.'),
('Poluição_de_Esgoto', 'Os esgotos domésticos e industriais podem conter uma variedade de poluentes.'),
('Pesca_Comercial', 'A pesca excessiva de peixes e outros organismos marinhos pode levar ao declínio das populações de corais.');

INSERT INTO recife_ameacas VALUES
('Lingua da Siriba I', 'Mergulho_De_Turismo', 'Alto'),
('Sueste Trilha', 'Mergulho_De_Turismo', 'Alto'),
('Buraco do Inferno', 'Mergulho_De_Turismo', 'Alto'),
('Canudos', 'Mergulho_De_Turismo', 'Médio'),
('Canudos', 'Colheita_de_invertebrados_para_gastronomia', 'Médio'),
('Manoa 2', 'Pesca_para_Aquario', 'Médio'),
('Manoa 2', 'Colheita_de_invertebrados_para_gastronomia', 'Médio'),
('Manoa 2', 'Mergulho_De_Turismo', 'Alto'),
('Manoa 2', 'Poluição_de_Esgoto', 'Baixa'),
('Manoa 2', 'Pesca_Comercial', 'Alto'),
('Cabana Pai Orlando', 'Colheita_de_invertebrados_para_gastronomia', 'Baixa'),
('Sancho Bay', 'Mergulho_De_Turismo', 'Baixa'),
('Chapeirao da Debora', 'Mergulho_De_Turismo', 'Baixa'),
('Coral Vivo Oeste', 'Pesca_para_Aquario', 'Alto'),
('Coral Vivo Oeste', 'Colheita_de_invertebrados_para_gastronomia', 'Alto'),
('Coral Vivo Oeste', 'Mergulho_De_Turismo', 'Alto'),
('Coral Vivo Oeste', 'Poluição_de_Esgoto', 'Baixa'),
('Coral Vivo Oeste', 'Pesca_Comercial', 'Alto');

INSERT INTO genero VALUES
('Acropora', 'Ramos finos e delicados'),
('Porites', 'Corpo maciço, que pode ser redondo, oval ou irregular.'),
('Siderastrea', 'crescimento incrustante'),
('Alcyonacea', 'corpo macio e gelatinoso'),
('Dendronephthya', 'ramos finos e delicados'),
('Sinularia', 'corais moles ramificados, com formato de arbustos ou árvores'),
('Tubastraea', 'corais moles incrustantes, com formato de botões ou discos'),
('Sarcophyton', 'corais moles incrustantes'),
('Xenia', 'corais moles ramificados '),
('Mussismilia', 'corais moles incrustantes'),
('Diploria', 'São corais duros, com esqueleto de carbonato de cálcio.'),
('Montastraea', 'pólipos são pequenos e têm oito tentáculos'),
('Lobophora', 'corais moles incrustantes '),
('Millepora', 'corais duros, com esqueleto de carbonato de cálcio.');

INSERT INTO especie VALUES
('Acropora cervicornis (coral-cérebro)', 'Coral Duro', 'Acropora'),
('Acropora palmata (coral-palmeira)', 'Coral Duro', 'Acropora'),
('Acropora prolifera (coral-ramoso)', 'Coral Duro', 'Acropora'),
('Porites astreoides (coral-estrela)', 'Coral Duro', 'Porites'),
('Siderastrea siderea (coral-estrela)', 'Coral Duro', 'Siderastrea'),
('Alcyonacea (corais-cérebro)', 'Coral Mole', 'Alcyonacea'),
('Dendronephthya sp. (coral-de-bambu)', 'Coral Mole', 'Dendronephthya'),
('Sinularia (corais-de-tufo)', 'Coral Mole', 'Sinularia'),
('Tubastraea (corais-de-tubo)', 'Coral Mole', 'Tubastraea'),
('Sarcophyton sp. (coral-de-flor)', 'Coral Duro', 'Sarcophyton'),
('Xenia sp. (coral-de-feixe)', 'Coral Mole', 'Xenia'),
('Porites lobata (coral-de-bolha)', 'Coral Duro', 'Porites'),
('Mussismilia hispida (coral-de-espinho)', 'Coral Duro', 'Mussismilia'),
('Diploria strigosa', 'Coral Duro', 'Diploria'),
('Montastraea annularis', 'Coral Duro', 'Montastraea'),
('Porites porites', 'Coral Duro', 'Porites'),
('Lobophora variegata', 'Coral Mole', 'Lobophora'),
('Millepora alcicornis', 'Coral Mole', 'Millepora'),
('Millepora squarrosa', 'Coral Mole', 'Millepora'),
('Sarcophyton trocheliophorum', 'Coral Mole', 'Sarcophyton'),
('Porites compressa', 'Coral Duro', 'Porites'),
('Acropora cervicornis', 'Coral Duro', 'Acropora');

INSERT INTO recife_especie VALUES
('Sueste Trilha', 'Acropora cervicornis (coral-cérebro)'),
('Sueste Trilha', 'Acropora palmata (coral-palmeira)'),
('Sueste Trilha', 'Acropora prolifera (coral-ramoso)'),
('Sueste Trilha', 'Porites astreoides (coral-estrela)'),
('Sueste Trilha', 'Siderastrea siderea (coral-estrela)'),
('Sueste Trilha', 'Alcyonacea (corais-cérebro)'),
('Sueste Trilha', 'Dendronephthya sp. (coral-de-bambu)'),
('Sueste Trilha', 'Sinularia (corais-de-tufo)'),
('Sueste Trilha', 'Tubastraea (corais-de-tubo)'),
('Lingua da Siriba I', 'Dendronephthya sp. (coral-de-bambu)'),
('Lingua da Siriba I', 'Sarcophyton sp. (coral-de-flor)'),
('Lingua da Siriba I', 'Xenia sp. (coral-de-feixe)'),
('Buraco do Inferno', 'Acropora cervicornis (coral-cérebro)'),
('Buraco do Inferno', 'Acropora palmata (coral-palmeira)'),
('Buraco do Inferno', 'Porites lobata (coral-de-bolha)'),
('Buraco do Inferno', 'Siderastrea siderea (coral-estrela)'),
('Buraco do Inferno', 'Mussismilia hispida (coral-de-espinho)'),
('Buraco do Inferno', 'Dendronephthya sp. (coral-de-bambu)'),
('Buraco do Inferno', 'Sarcophyton sp. (coral-de-flor)'),
('Buraco do Inferno', 'Xenia sp. (coral-de-feixe)'),
('Canudos', 'Acropora cervicornis (coral-cérebro)'),
('Canudos', 'Acropora palmata (coral-palmeira)'),
('Canudos', 'Acropora prolifera (coral-ramoso)'),
('Canudos', 'Diploria strigosa'),
('Canudos', 'Montastraea annularis'),
('Canudos', 'Porites astreoides (coral-estrela)'),
('Canudos', 'Porites compressa'),
('Canudos', 'Porites porites'),
('Canudos', 'Lobophora variegata'),
('Canudos', 'Millepora alcicornis'),
('Canudos', 'Millepora squarrosa'),
('Canudos', 'Sarcophyton trocheliophorum'),
('Manoa 2', 'Acropora cervicornis'),
('Manoa 2', 'Acropora palmata (coral-palmeira)'),
('Manoa 2', 'Acropora prolifera (coral-ramoso)'),
('Manoa 2', 'Diploria strigosa'),
('Manoa 2', 'Montastraea annularis'),
('Manoa 2', 'Porites astreoides (coral-estrela)'),
('Baixa Seca', 'Acropora cervicornis (coral-cérebro)'),
('Baixa Seca', 'Acropora palmata (coral-palmeira)'),
('Baixa Seca', 'Acropora prolifera (coral-ramoso)'),
('Baixa Seca', 'Diploria strigosa'),
('Baixa Seca', 'Montastraea annularis'),
('Baixa Seca', 'Porites astreoides (coral-estrela)'),
('Baixa Seca', 'Porites compressa'),
('Baixa Seca', 'Porites porites'),
('Baixa Seca', 'Lobophora variegata'),
('Baixa Seca', 'Millepora alcicornis'),
('Baixa Seca', 'Millepora squarrosa'),
('Baixa Seca', 'Sarcophyton trocheliophorum'),
('Piscina de Rocas I', 'Acropora cervicornis (coral-cérebro)'),
('Piscina de Rocas I', 'Acropora palmata (coral-palmeira)'),
('Piscina de Rocas I', 'Acropora prolifera (coral-ramoso)'),
('Piscina de Rocas I', 'Diploria strigosa'),
('Piscina de Rocas I', 'Montastraea annularis'),
('Piscina de Rocas I', 'Porites astreoides (coral-estrela)'),
('Piscina de Rocas I', 'Porites compressa'),
('Piscina de Rocas I', 'Porites porites'),
('Piscina de Rocas I', 'Lobophora variegata'),
('Piscina de Rocas I', 'Millepora alcicornis'),
('Piscina de Rocas I', 'Millepora squarrosa'),
('Piscina de Rocas I', 'Sarcophyton trocheliophorum'),
('Cabana Pai Orlando', 'Acropora cervicornis'),
('Cabana Pai Orlando', 'Acropora palmata (coral-palmeira)'),
('Cabana Pai Orlando', 'Porites astreoides (coral-estrela)'),
('Cabana Pai Orlando', 'Porites porites'),
('Cabana Pai Orlando', 'Siderastrea siderea (coral-estrela)'),
('Cabana Pai Orlando', 'Dendronephthya sp. (coral-de-bambu)'),
('Cabana Pai Orlando', 'Sarcophyton sp. (coral-de-flor)'),
('Cabana Pai Orlando', 'Xenia sp. (coral-de-feixe)'),
('Sancho Bay', 'Porites astreoides (coral-estrela)'),
('Sancho Bay', 'Porites porites'),
('Sancho Bay', 'Siderastrea siderea (coral-estrela)'),
('Sancho Bay', 'Dendronephthya sp. (coral-de-bambu)'),
('Sancho Bay', 'Sarcophyton sp. (coral-de-flor)'),
('Chapeirao da Debora', 'Siderastrea siderea (coral-estrela)'),
('Chapeirao da Debora', 'Acropora prolifera (coral-ramoso)'),
('Chapeirao da Debora', 'Acropora cervicornis'),
('Chapeirao da Debora', 'Dendronephthya sp. (coral-de-bambu)'),
('Coral Vivo Oeste', 'Porites lobata (coral-de-bolha)'),
('Coral Vivo Oeste', 'Siderastrea siderea (coral-estrela)'),
('Coral Vivo Oeste', 'Mussismilia hispida (coral-de-espinho)'),
('Coral Vivo Oeste', 'Dendronephthya sp. (coral-de-bambu)'),
('Coral Vivo Oeste', 'Sarcophyton sp. (coral-de-flor)'),
('Piscina de Abrolhos', 'Acropora cervicornis (coral-cérebro)'),
('Piscina de Abrolhos', 'Acropora palmata (coral-palmeira)'),
('Piscina de Abrolhos', 'Porites astreoides (coral-estrela)'),
('Piscina de Abrolhos', 'Porites porites'),
('Piscina de Abrolhos', 'Siderastrea siderea (coral-estrela)'),
('Piscina de Abrolhos', 'Dendronephthya sp. (coral-de-bambu)'),
('Piscina de Abrolhos', 'Sarcophyton sp. (coral-de-flor)'),
('Piscina de Abrolhos', 'Xenia sp. (coral-de-feixe)'),
('Barra do Forte', 'Acropora cervicornis (coral-cérebro)'),
('Barra do Forte', 'Acropora palmata (coral-palmeira)'),
('Barra do Forte', 'Porites astreoides (coral-estrela)'),
('Barra do Forte', 'Porites porites'),
('Barra do Forte', 'Siderastrea siderea (coral-estrela)'),
('Barra do Forte', 'Dendronephthya sp. (coral-de-bambu)'),
('Barra do Forte', 'Sarcophyton sp. (coral-de-flor)'),
('Barra do Forte', 'Xenia sp. (coral-de-feixe)');

4.3 Script das Consultas 
-- CONSULTAS

-- Liste os estados que possuem recifes de corais.
SELECT 
    nome_recife,
    estado
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade;

-- Quantos recifes de corais foram registrados?
SELECT COUNT(nome_recife)
FROM coral_data.recifes_de_corais;

-- Quais os recifes que possuem nível de branqueamento alto?
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE branquamento LIKE 'Alto';

-- Quais os recifes que possuem nível de branqueamento baixo?
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE branquamento LIKE 'Baixo';

-- Quantos recifes de corais foram registrados no estado da Bahia?
SELECT 
	COUNT(nome_recife)
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade
WHERE localizacao.estado = 'Bahia';

-- Qual a ameaca mais presente nos recifes de corais?

SELECT a.nome_ameaca, subquery.max_count AS ameaca_count
FROM (
    SELECT nome_ameaca, COUNT(nome_ameaca) AS max_count
    FROM coral_data.recife_ameacas
    GROUP BY nome_ameaca
) AS subquery
JOIN coral_data.recife_ameacas AS a
ON a.nome_ameaca = subquery.nome_ameaca
WHERE subquery.max_count = (
    SELECT MAX(max_count)
    FROM (
        SELECT COUNT(nome_ameaca) AS max_count
        FROM coral_data.recife_ameacas
        GROUP BY nome_ameaca
    ) AS max_subquery
) GROUP BY nome_ameaca;

-- Selecione os recifes que possuem impacto humano alto ou médio.
SELECT nome_recife
FROM coral_data.recifes_de_corais
WHERE impacto_humano REGEXP 'alto|médio' COLLATE utf8mb4_unicode_ci;

-- Quantos recifes temos presente no Brasil?
SELECT DISTINCT COUNT(nome_recife) AS recifes_brasileiros
FROM coral_data.recifes_de_corais
JOIN coral_data.localizacao
ON recifes_de_corais.cidade = localizacao.cidade
WHERE localizacao.pais LIKE 'Brasil';