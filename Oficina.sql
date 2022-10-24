CREATE DATABASE dboficina;

USE dboficina;


-- ENTIDADES ESSENCIAIS
CREATE TABLE IF NOT EXISTS `dboficina`.`tipo_logradouro` (
  `id_tipo_logradouro` INT NOT NULL AUTO_INCREMENT,
  `tipo_logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_logradouro`))
ENGINE = InnoDB;

INSERT INTO tipo_logradouro	(tipo_logradouro)
	VALUES	('Rua'),
			('Avenida'),
            ('Alameda'),
            ('Travessa'),
            ('Rodovia'),
            ('Estrada');

CREATE TABLE IF NOT EXISTS `dboficina`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  `sigla_estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;

INSERT INTO estado (estado, sigla_estado)
	VALUES	('Acre', 'AC'),
			('Alagoas', 'AL'),
			('Amapá', 'AP'),
			('Amazonas', 'AM'),
			('Bahia', 'BA'),
			('Ceará', 'CE'),
			('Distrito Federal', 'DF'),
			('Espírito Santo', 'ES'),
			('Goiás', 'GO'),
			('Maranhão', 'MA'),
			('Mato Grosso', 'MT'),
			('Mato Grosso do Sul', 'MS'),
			('Minas Gerais', 'MG'),
			('Pará', 'PA'),
			('Paraíba', 'PB'),
			('Paraná', 'PR'),
			('Pernambuco', 'PE'),
			('Piauí', 'PI'),
			('Rio de Janeiro', 'RJ'),
			('Rio Grande do Norte', 'RN'),
			('Rio Grande do Sul', 'RS'),
			('Rondônia', 'RO'),
			('Roraima', 'RR'),
			('Santa Catarina', 'SC'),
			('São Paulo', 'SP'),
			('Sergipe', 'SE'),
			('Tocantins', 'TO');

CREATE TABLE IF NOT EXISTS `dboficina`.`equipe_especialidade` (
  `id_especialidade` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_especialidade`))
ENGINE = InnoDB;

INSERT INTO equipe_especialidade (especialidade)
	VALUES	('Mecatrônica'),
			('Funilaria'),
            ('Borracharia'),
            ('Pintura'),
            ('Elétrica');

CREATE TABLE IF NOT EXISTS `dboficina`.`peca` (
  `id_peca` INT NOT NULL AUTO_INCREMENT,
  `nome_peca` VARCHAR(45) NULL,
  `valor_peca` FLOAT NULL,
  PRIMARY KEY (`id_peca`))
ENGINE = InnoDB;

INSERT INTO peca (nome_peca, valor_peca)
	VALUES	('Rebimboca da Parafuseta', '1500'),
			('Parafuso', 20),
            ('Porca', 10),
            ('Pneu', 50),
            ('Janela Dianteira', 250),
            ('Janela Traseira', 250),
            ('Janela Lateral', 150),
            ('Tinta', 120);

CREATE TABLE IF NOT EXISTS `dboficina`.`servico` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `servico` VARCHAR(45) NOT NULL,
  `valor_servico` FLOAT NOT NULL,
  PRIMARY KEY (`id_servico`))
ENGINE = InnoDB;

INSERT INTO servico (servico, valor_servico)
	VALUES	('Pintura', 900),
			('Funilaria', 850),
            ('Troca de Pneu', 100),
            ('Troca de Vidro', 95),
            ('Substituição de Parafuso', 30),
            ('Enrolada no Cliente', 1300);

CREATE TABLE IF NOT EXISTS `dboficina`.`ordem_servico_status` (
  `id_ordem_servico_status` INT NOT NULL AUTO_INCREMENT,
  `ordem_servico_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ordem_servico_status`))
ENGINE = InnoDB;

INSERT INTO ordem_servico_status (ordem_servico_status)
	VALUES	('Em Análise'),
			('Aguardando Aprovação'),
            ('Orçamento Reprovado'),
            ('Orçamento Aprovado'),
            ('Pronto para Retirada'),
            ('Veículo Entregue');


-- DEMAIS ENTIDADES
CREATE TABLE IF NOT EXISTS `dboficina`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(20) NOT NULL,
  `sobrenome_cliente` VARCHAR(50) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefone_residencial` VARCHAR(20) NULL DEFAULT 'Null',
  `telefone_celular` VARCHAR(20) NOT NULL,
  `telefone_comercial` VARCHAR(20) NULL DEFAULT 'Null',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO cliente (nome_cliente, sobrenome_cliente, cpf, email, telefone_residencial, telefone_celular, telefone_comercial)
	VALUES	('Paulo', 'silveira', '12345678901', 'paullllosils@gmail.com', Null, '011559990000', Null),
			('Ana', 'tavares', '23456789012', 'ancaha@gmail.com', '01123234545', '0119876681111', Null),
            ('Julio', 'tamyo', '34567890123', 'tamyooi@gmail.com', '01132234554', '011977772222', '01144553322'),
            ('Fatima', 'linharem', '45678901234', 'fattimalinhare@hotmail.com', '024366329872', '021966663333', '02155442233'),
            ('Taine', 'tatax', '56789012345', 'tane@hotmail.com', '0315559842', '038955554444', '03145456565'),
            ('Fabiano', 'Freitas', '67890123456', 'fabiano_freitas@hotmail.com', '09125852585', '011944445555', '01136963696'),
            ('Goret', 'silva', '78901234567', 'gorettee@gmail.com', Null, '011933336666', Null),
            ('Haro', 'tamashho', '89012345678', 'horot@hotmail.com', Null, '06722227777', Null),
            ('Fabio', 'menezes', '90123456789', 'fabhiomz@gmail.com', Null, '011911118888', Null),
            ('Hugo', 'wesk', '01234567890', 'wesk12@gmail.com', Null, '08899809999', Null);            


CREATE TABLE IF NOT EXISTS `db_oficina`.`veiculo` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `tipo_veiculo` VARCHAR(45) NOT NULL,
  `modelo_veiculo` VARCHAR(45) NOT NULL,
  `marca_veiculo` VARCHAR(45) NOT NULL,
  `ano_veiculo` DATE NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  INDEX `fk_veiculo_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO veiculo (id_cliente, tipo_veiculo, modelo_veiculo, marca_veiculo, ano_veiculo)
	VALUES	(1, 'Popular Hatch', 'Mobi', 'Fiat', '2019-01-01'),
			(2, 'Popular Sedan', 'Logan', 'Renault', '2017-01-01'),
            (3, 'SUV', 'A5', 'Audi', '2022-01-01'),
            (4, 'Utilitário', 'Saveiro', 'Volkswagem', '2009-01-01'),
            (5, 'Utilitário', 'Strada', 'Fiat', '2000-01-01'),
            (6, 'Luxo Hatch', 'A1', 'Audi', '2018-01-01'),
            (7, 'Luxo Sedan', 'A4', 'Audi', '2020-01-01'),
            (8, 'Popular Sedan', 'Gol', 'Volkswagem', '2000-01-01'),
            (9, 'Popular Sedan', 'Logan', 'Renault', '2010-01-01'),
            (10, 'Popular Hatch', 'Mobi', 'Fiat', '2018-01-01');
 
  CREATE TABLE IF NOT EXISTS `db_oficina`.`veiculo_servico` (
  `id_veiculo_servico` INT NOT NULL AUTO_INCREMENT,
  `id_veiculo` INT NOT NULL,
  `id_servico` INT NOT NULL,
  PRIMARY KEY (`id_veiculo_servico`, `id_veiculo`, `id_servico`),
  INDEX `fk_veiculo_servico_veiculo1_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `fk_veiculo_servico_servico1_idx` (`id_servico` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_servico_veiculo1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `db_oficina`.`veiculo` (`id_veiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_servico_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO veiculo_servico (id_veiculo, id_servico)
	VALUES	(21, 4),
			(22, 2),
            (23, 3),
            (24, 1),
            (25, 5),
            (26, 6),
            (27, 6),
            (28, 1),
            (29, 2),
            (30, 1);

CREATE TABLE IF NOT EXISTS `db_oficina`.`tabela_referencia` (
  `id_tabela_referencia` INT NOT NULL AUTO_INCREMENT,
  `id_servico` INT NOT NULL,
  `valor_servico` FLOAT NOT NULL,
  `tempo_conclusao` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tabela_referencia`),
  INDEX `fk_tabela_referencia_servico1_idx` (`id_servico` ASC) VISIBLE,
  CONSTRAINT `fk_tabela_referencia_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO tabela_referencia (id_servico, valor_servico, tempo_conclusao)
	VALUES	(1, 900, '5 dias'),
			(2, 850, '10 dias'),
            (3, 100, '1 dia'),
            (4, 95, '10 dias'),
            (5, 30, '8 dias'),
            (6, 1300, '45 dias');    


CREATE TABLE IF NOT EXISTS `dboficina`.`equipe` (
  `id_equipe` INT NOT NULL AUTO_INCREMENT,
  `nome_equipe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipe`))
ENGINE = InnoDB;

INSERT INTO equipe (nome_equipe)
	VALUES	('Equipe Alfa'),
			('Equipe Beta'),
            ('Equipe Gama');

CREATE TABLE IF NOT EXISTS `db_oficina`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_logradouro` INT NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_endereco_estado1_idx` (`id_estado` ASC) VISIBLE,
  INDEX `fk_endereco_tipo_logradouro1_idx` (`id_tipo_logradouro` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `db_oficina`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_tipo_logradouro1`
    FOREIGN KEY (`id_tipo_logradouro`)
    REFERENCES `db_oficina`.`tipo_logradouro` (`id_tipo_logradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO endereco (id_tipo_logradouro, logradouro, numero, complemento, bairro, cep, cidade, id_estado)
	VALUES	(1, 'Itagiba', '45', Null, 'Roseira', 12345678, 'São Paulo', 25),
			(2, 'Mogi das Cruzes', '100', Null, 'Olinda', '12345678', 'São Paulo', 25),
			(3, 'Helio Pelegrino', '21', Null, 'Jandira', '12345678', 'São Paulo', 25),
            (4, 'Feira de Santana', '11', 'Fundos', 'Vila Maluca', '12345678', 'São Paulo', 25),
            (1, 'Olimpia', '12', Null, 'Mexilhão', '12345678', 'São Paulo', 25),
            (2, 'Peneira Curta', '66', Null, 'Honduras', '12345678', 'São Paulo', 25),
            (3, 'Passe de Mágica', '444', Null, 'Olinda', '12345678', 'São Paulo', 25),
            (4, 'da Vovó', '123', Null, 'Rampa', '12345678', 'São Paulo', 25),
            (1, 'Asfaltada', '1900', Null, 'Colinas', '12345678', 'Rio de Janeiro', 19),
            (2, 'Dois Irmãos', '2044', 'Casa 80', 'Colinas', '12345678', 'Belo Horizonte', 13);


CREATE TABLE IF NOT EXISTS `db_oficina`.`mecanico` (
  `id_mecanico` INT NOT NULL,
  `id_especialidade` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  `nome_mecanico` VARCHAR(45) NOT NULL,
  `sobrenome_mecanico` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  INDEX `fk_mecanico_equipe_especialidade1_idx` (`id_especialidade` ASC) VISIBLE,
  INDEX `fk_mecanico_equipe1_idx` (`id_equipe` ASC) VISIBLE,
  INDEX `fk_mecanico_endereco1_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_equipe_especialidade1`
    FOREIGN KEY (`id_especialidade`)
    REFERENCES `db_oficina`.`equipe_especialidade` (`id_especialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_equipe1`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `db_oficina`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_endereco1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `db_oficina`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE mecanico
MODIFY COLUMN id_mecanico INT NOT NULL AUTO_INCREMENT;

INSERT INTO mecanico (id_especialidade, id_equipe, id_endereco, nome_mecanico, sobrenome_mecanico)
	VALUES	(1, 1, 1, 'Afonso', 'Américo'),
			(1, 2, 2, 'Breno', 'Bertolucci'),
            (2, 3, 3, 'Camilo', 'Correia'),
            (2, 1, 4, 'Dalton', 'Demarco'),
            (3, 2, 5, 'Eliseu', 'Epaminondas'),
            (3, 3, 6, 'Frederico', 'Frota'),
            (4, 1, 7, 'Genival', 'Gama'),
            (4, 2, 8, 'Homero', 'Himo'),
            (5, 3, 9, 'Iago', 'Icaro'),
            (5, 1, 10, 'Juarez', 'Junior');

CREATE TABLE IF NOT EXISTS `db_oficina`.`ordem_servico` (
  `id_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `numero_ordem_servico` INT NOT NULL,
  `id_ordem_servico_status` INT NOT NULL,
  `id_tabela_referencia` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `data_emissao` DATE NULL,
  `valor` FLOAT NULL,
  `ordem_servico_status` VARCHAR(45) NULL,
  `data_conclusao` DATE NULL,
  PRIMARY KEY (`id_ordem_servico`),
  INDEX `fk_ordem_servico_ordem_servico_status1_idx` (`id_ordem_servico_status` ASC) VISIBLE,
  INDEX `fk_ordem_servico_tabela_referencia1_idx` (`id_tabela_referencia` ASC) VISIBLE,
  INDEX `fk_ordem_servico_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_ordem_servico_equipe1_idx` (`id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_ordem_servico_ordem_de_servico_status1`
    FOREIGN KEY (`id_ordem_servico_status`)
    REFERENCES `db_oficina`.`ordem_servico_status` (`id_ordem_servico_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_tabela_referencia1`
    FOREIGN KEY (`id_tabela_referencia`)
    REFERENCES `db_oficina`.`tabela_referencia` (`id_tabela_referencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_equipe1`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `db_oficina`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO ordem_servico (id_ordem_servico_status, numero_ordem_servico, id_tabela_referencia, id_cliente, id_equipe, data_emissao, valor, ordem_servico_status, data_conclusao)
	VALUES	(1, 1, 1, 1, 1, '2022-09-20', 900, 'Em Análise', CURRENT_TIMESTAMP),
			(1, 1, 2, 1, 1, '2022-09-20', 850, 'Em Análise', CURRENT_TIMESTAMP),
			(2, 2, 2, 2, 2, '2022-09-19', 850, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (2, 2, 3, 2, 2, '2022-09-19', 100, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (3, 3, 3, 3, 3, '2022-09-18', 100, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 4, 3, 3, '2022-09-18', 95, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 5, 3, 3, '2022-09-18', 30, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 1, 3, 3, '2022-09-18', 900, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (4, 4, 4, 4, 1, '2022-09-17', 95, 'Orçamento Aprovado', CURRENT_TIMESTAMP),
            (5, 5, 5, 5, 2, '2022-09-16', 30, 'Pronto para Retirada', CURRENT_TIMESTAMP),
            (6, 6, 6, 6, 3, '2022-09-15', 1300, 'Veículo Entregue', CURRENT_TIMESTAMP),
            (1, 7, 1, 7, 1, '2022-09-14', 900, 'Em Análise', CURRENT_TIMESTAMP),
            (2, 8, 2, 8, 2, '2022-09-13', 850, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (3, 9, 3, 9, 3, '2022-12-09', 100, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (4, 10, 4, 10, 1, '2022-11-09', 95, 'Orçamento Aprovado', CURRENT_TIMESTAMP);


SELECT * FROM peca;
SELECT * FROM ordem_servico;
    
CREATE TABLE IF NOT EXISTS `db_oficina`.`peca_ordem_servico` (
  `id_peca_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `id_peca` INT NOT NULL,
  `id_ordem_servico` INT NOT NULL,
  INDEX `fk_peca_has_ordem_servico_ordem_servico1_idx` (`id_ordem_servico` ASC) VISIBLE,
  INDEX `fk_peca_has_ordem_servico_peca1_idx` (`id_peca` ASC) VISIBLE,
  PRIMARY KEY (`id_peca_ordem_servico`),
  CONSTRAINT `fk_peca_has_ordem_servico_peca1`
    FOREIGN KEY (`id_peca`)
    REFERENCES `db_oficina`.`peca` (`id_peca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peca_has_ordem_servico_ordem_servico1`
    FOREIGN KEY (`id_ordem_servico`)
    REFERENCES `db_oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO peca_ordem_servico (id_peca, id_ordem_servico)
	VALUES	(1, 16),
			(1, 23),
            (1, 27),
            (2, 17),
            (2, 18),
            (2, 28),
            (3, 19),
            (3, 20),
            (3, 29),
            (4, 21),
            (4, 24),
            (4, 30),
            (5, 22),
            (5, 25),
            (6, 26);
          

CREATE TABLE IF NOT EXISTS `db_oficina`.`servico_ordem_servico` (
  `id_servico_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `id_servico` INT NOT NULL,
  `id_ordem_servico` INT NOT NULL,
  PRIMARY KEY (`id_servico_ordem_servico`),
  INDEX `fk_servico_ordem_servico_servico1_idx` (`id_servico` ASC) VISIBLE,
  INDEX `fk_servico_ordem_servico_ordem_de_servico1_idx` (`id_ordem_servico` ASC) VISIBLE,
  CONSTRAINT `fk_servico_ordem_servico_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_ordem_servico_ordem_servico1`
    FOREIGN KEY (`id_ordem_servico`)
    REFERENCES `db_oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM ordem_servico;

SELECT id_servico, id_ordem_servico FROM servico
INNER JOIN ordem_servico WHERE id_tabela_referencia=servico.id_servico;

INSERT INTO servico_ordem_servico (id_servico, id_ordem_servico)
	VALUES	(1,	16),
			(1,	23),
			(1,	27),
			(2,	17),
			(2,	18),
			(2,	28),
			(3,	19),
			(3,	20),
			(3,	29),
			(4,	21),
			(4,	24),
			(4,	30),
			(5,	22),
			(5,	25),
			(6,	26);

-- INICIO DOS SELECTS

-- SELECTS SIMPLES
SHOW TABLES;
SELECT * FROM cliente;
SELECT * FROM endereco;
SELECT * FROM equipe;
SELECT * FROM equipe_especialidade;
SELECT * FROM estado;
SELECT * FROM mecanico;
SELECT * FROM ordem_servico;
SELECT * FROM ordem_servico_status;
SELECT * FROM peca;
SELECT * FROM peca_ordem_servico;
SELECT * FROM servico;
SELECT * FROM servico_ordem_servico;
SELECT * FROM tabela_referencia;
SELECT * FROM tipo_logradouro;
SELECT * FROM veiculo;
SELECT * FROM veiculo_servico;


-- SELECTS COM WHERE
SELECT modelo_veiculo 
	FROM veiculo
WHERE marca_veiculo='Fiat';

SELECT bairro
	FROM endereco
WHERE cidade='São Paulo';

-- ATRIBUTOS DERIVADOS E GROUP BY
SELECT CONCAT(nome_cliente,' ',sobrenome_cliente) AS 'Nome Cliente', telefone_celular AS 'Telefone', email
	FROM cliente
WHERE email LIKE '%@gmail.com'
ORDER BY 'Nome Cliente';

SELECT CONCAT(nome_cliente,' ',sobrenome_cliente) AS 'Nome Cliente', telefone_celular AS 'Telefone', email
	FROM cliente
WHERE email LIKE '%@hotmail.com'
ORDER BY 'Nome Cliente';

SELECT ordem_servico.ordem_servico_status AS 'Status', CONCAT(cliente.nome_cliente,' ',cliente.sobrenome_cliente) AS 'Cliente', ordem_servico.valor, COUNT(*)
	FROM ordem_servico, cliente
WHERE cliente.id_cliente=ordem_servico.id_cliente GROUP BY ordem_servico.id_cliente, ordem_servico.valor;

-- HAVING STATEMENT
SELECT ordem_servico.ordem_servico_status AS 'Status', ordem_servico.valor AS 'Valor', cliente.nome_cliente AS 'Nome', cliente.sobrenome_cliente AS 'Sobrenome', cliente.telefone_celular AS 'Celular'
	FROM cliente, ordem_servico
WHERE ordem_servico.id_cliente=cliente.id_cliente HAVING ordem_servico.valor>500;

-- JUNÇÕES ENTRE TABELAS
SELECT CONCAT(nome_cliente,' ',sobrenome_cliente) AS 'Nome Cliente', email AS 'E-mail', modelo_veiculo AS 'Modelo Carro', marca_veiculo AS 'Marca Carro', servico AS 'Serviço'
	FROM cliente
    INNER JOIN veiculo ON veiculo.id_cliente=cliente.id_cliente
	INNER JOIN veiculo_servico ON veiculo.id_veiculo=veiculo_servico.id_veiculo
    INNER JOIN servico ON servico.id_servico=veiculo_servico.id_servico
ORDER BY 'Nome Cliente';


-- PERGUNTAS

-- QUAIS OS ORÇAMENTOS ESTÃO EM ANÁLISE NA OFICINA, RETORNANDO O STATUS, CLIENTE, MODELO E MARCA DO VEÍCULO, VALOR DO ORÇAMENTO E SERVIÇO A SER EXECUTADO
SELECT ordem_servico.ordem_servico_status AS 'Status', cliente.nome_cliente AS 'Cliente', veiculo.modelo_veiculo AS 'Modelo', veiculo.marca_veiculo AS 'Marca', ordem_servico.valor AS 'Orçamento', servico.servico AS 'Serviço'
	FROM cliente, veiculo, veiculo_servico, servico, ordem_servico
WHERE cliente.id_cliente=veiculo.id_cliente 
		AND veiculo.id_veiculo=veiculo_servico.id_veiculo 
        AND veiculo_servico.id_servico=servico.id_servico 
        AND servico.id_servico=ordem_servico.id_tabela_referencia
        AND ordem_servico.ordem_servico_status='Em Análise';
        
-- QUAIS OS CLIENTES POSSUEM O VEICULO DA MARCA AUDI, RETORNANDO O NOME COMPLETO, E-MAIL DO CLIENTE E MODELO DO VEICULO
SELECT CONCAT(cliente.nome_cliente,' ', cliente.sobrenome_cliente) AS 'Nome Cliente', cliente.email AS 'E-mail', veiculo.modelo_veiculo AS 'Modelo'
	FROM cliente
    INNER JOIN veiculo ON cliente.id_cliente=veiculo.id_cliente
WHERE veiculo.marca_veiculo='Audi';