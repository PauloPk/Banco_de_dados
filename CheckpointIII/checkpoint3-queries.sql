CREATE SCHEMA IF NOT EXISTS db_bar DEFAULT CHARACTER SET utf8 ;
USE db_bar ;

CREATE TABLE IF NOT EXISTS cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_sobrenome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendedores (
  id_vendedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_sobrenome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendas (
  id_vendas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_venda DATE NOT NULL,
  preco_total INT NOT NULL,
  id_cliente INT NOT NULL,
  id_vendedores INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_vendedores) REFERENCES vendedores (id_vendedores)
);

CREATE TABLE IF NOT EXISTS fornecedores (
  id_fornecedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cnpj VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos (
  id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL,
  tamanho VARCHAR(45) NOT NULL,
  preco FLOAT NOT NULL,
  sabor VARCHAR(45) NOT NULL,
  id_fornecedores INT NOT NULL,
  FOREIGN KEY (id_fornecedores) REFERENCES fornecedores (id_fornecedores)
);

CREATE TABLE IF NOT EXISTS notas (
  id_notas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_da_venda DATE NOT NULL,
  quantidade INT NOT NULL,
  preco_total INT NOT NULL,
  id_vendas INT NOT NULL,
  FOREIGN KEY (id_vendas) REFERENCES vendas (id_vendas)
);

SELECT * FROM cliente;
INSERT INTO cliente(nome_sobrenome, telefone, email)
VALUES('Liliane Soares', '14785236901', 'email@fake.com.br'),
('Lucas Araujo','14785236902', 'email@fake.com.br'),
('Antonio Raimundo','14785236903', 'email@fake.com.br'),
('Carlos Santana','14785236902', 'email@fake.com.br'),
('Vinicius Taurisiano','14785236903', 'email@fake.com.br'),
('Camila Monaco','14785236904', 'email@fake.com.br'),
('Paulo Matheus PK','14785236905', 'email@fake.com.br'),
('Roberto Carlos','14785236906', 'email@fake.com.br'),
('Naruto Usumaki','14785236907', 'email@fake.com.br'),
('Florzinha USA','14785236908', 'email@fake.com.br'),
('Docinho USA','14785236909', 'email@fake.com.br'),
('Lindinha USA','14785236909', 'email@fake.com.br');

SELECT * FROM vendedores;
INSERT INTO vendedores(nome_sobrenome, telefone)
VALUES('Liliane Soares', '14785236901'),
('Lucas Araujo','14785236902'),
('Antonio Raimundo','14785236903'),
('Carlos Santana','14785236902'),
('Vinicius Taurisiano','14785236903'),
('Camila Monaco','14785236904'),
('Paulo Matheus PK','14785236905'),
('Roberto Carlos','14785236906'),
('Naruto Usumaki','14785236907'),
('Florzinha USA','14785236908'),
('Docinho USA','14785236909'),
('Lindinha USA','14785236910');

SELECT * FROM vendas;
INSERT INTO vendas(data_venda,preco_total,id_cliente,id_vendedores)
VALUES('2022-01-25',100,1,2), 
('2022-01-25',100,1,5),
('2022-02-5',200,1,2),
('2022-03-25',300,1,1),
('2022-04-25',100,1,3),
('2022-05-25',100,1,1),
('2022-06-25',500,1,2),
('2022-07-25',600,1,3),
('2022-08-25',700,1,4),
('2022-09-25',800,1,10),
('2022-10-25',100,1,12),
('2022-11-25',200,1,11);

SELECT * FROM fornecedores;
INSERT INTO fornecedores(cnpj)
VALUES(1025478911),
(1025478963),
(1025478999),
(1025478900),
(1025478911),
(1025478963),
(1025478963),
(1025474463),
(1025475563),
(1025478966),
(1025478977),
(1025478988);

SELECT * FROM produtos;
INSERT INTO produtos(descricao,tamanho,preco,sabor,id_fornecedores)
VALUES('cerveja DEVASSA tropicalizada', '500 ML', 10,'puro malte',1),
('cerveja DEVASSA tropicalizada', '400 ML', 10,'puro malte',1),
('cerveja BRAHMA BRAHMOSIDADE', '400 ML', 10,'puro malte',2),
('cerveja DEVASSA tropicalizada', '800 ML', 10,'puro malte',4),
('cerveja BRAHMA BRAHMOSIDADE', '700 ML', 10,'puro malte',5),
('cerveja SKOLL desce redondo', '600 ML', 10,'puro malte',7),
('cerveja BRAHMA BRAHMOSIDADE', '800 ML', 10,'puro malte',6),
('cerveja DEVASSA tropicalizada', '200 ML', 10,'puro malte',8),
('cerveja BRAHMA BRAHMOSIDADE', '100 ML', 10,'puro malte',7),
('cerveja SKOLL desce redondo', '400 ML', 10,'puro malte',9),
('cerveja BRAHMA tropicalizada', '800 ML', 10,'puro malte',10),
('cerveja SKOLL desce redondo', '700 ML', 10,'puro malte',11),
('cerveja SKOLL desce redondo', '500 ML', 10,'puro malte',12);

SELECT * FROM notas;
INSERT INTO notas(data_da_venda,quantidade,preco_total,id_vendas)
VALUES('2022-01-25', 20, 100,1),
('2022-01-25', 20, 100,6),
('2022-01-25', 20, 300,11),
('2022-01-25', 20, 500,12),
('2022-01-25', 20, 300,10),
('2022-01-25', 20, 200,9),
('2022-01-25', 20, 200,7),
('2022-01-25', 20, 500,8),
('2022-01-25', 20, 600,7),
('2022-01-25', 20, 700,4),
('2022-01-25', 20, 800,5),
('2022-01-25', 20, 900,2),
('2022-01-25', 20, 100,1);

SELECT * FROM cliente;
UPDATE cliente
SET nome_sobrenome = 'Neymar Junior'
WHERE id_cliente = 2;

SELECT * FROM fornecedores;
UPDATE fornecedores
SET cnpj = '1025478964'
WHERE id_fornecedores = 7;

SELECT * FROM fornecedores;
UPDATE fornecedores
SET cnpj = '1025478947'
WHERE id_fornecedores = 9;

SELECT * FROM fornecedores;
UPDATE fornecedores
SET cnpj = '1025478955'
WHERE id_fornecedores = 8;

SELECT * FROM notas;
UPDATE notas
SET quantidade = 50
WHERE id_notas = 6;

UPDATE notas
SET quantidade = 30
WHERE id_notas = 4;

UPDATE notas
SET quantidade = 90
WHERE id_notas = 8;

UPDATE notas
SET quantidade = 10
WHERE id_notas = 8;

UPDATE notas
SET quantidade = 10
WHERE id_notas = 1;

SELECT * FROM produtos;
UPDATE produtos
SET preco = 50
WHERE id_produto = 6;

UPDATE produtos
SET preco = 20
WHERE id_produto = 2;

UPDATE produtos
SET preco = 20
WHERE id_produto = 10;

UPDATE produtos
SET preco = 50
WHERE id_produto = 7;

SELECT * FROM vendas;
UPDATE vendas
SET id_cliente = 2
WHERE id_vendas = 1;

UPDATE vendas
SET id_cliente = 3
WHERE id_vendas = 4;

UPDATE vendas
SET id_cliente = 12
WHERE id_vendas = 2;

UPDATE vendas
SET id_cliente = 2
WHERE id_vendas = 10;

UPDATE vendas
SET id_cliente = 10
WHERE id_vendas = 11;

UPDATE vendas
SET id_cliente = 6
WHERE id_vendas = 7;

SELECT * FROM vendedores;
DELETE FROM vendedores WHERE id_vendedores = 9;
DELETE FROM vendedores WHERE id_vendedores = 8;
SELECT * FROM vendas;

SELECT * FROM cliente;

ALTER TABLE cliente
ADD cpf VARCHAR(11);

SELECT * FROM cliente;

UPDATE cliente
SET cpf = '12547896301'
WHERE id_cliente= 1;

UPDATE cliente
SET cpf = '12547896741'
WHERE id_cliente= 2;

UPDATE cliente
SET cpf = '12547777741'
WHERE id_cliente= 3;

UPDATE cliente
SET cpf = '12547963741'
WHERE id_cliente= 4;

UPDATE cliente
SET cpf = '12547874741'
WHERE id_cliente= 5;

UPDATE cliente
SET cpf = '12547896700'
WHERE id_cliente= 6;

UPDATE cliente
SET cpf = '14747896741'
WHERE id_cliente= 7;

UPDATE cliente
SET cpf = '12547896799'
WHERE id_cliente= 8;

UPDATE cliente
SET cpf = '12777896741'
WHERE id_cliente= 9;

UPDATE cliente
SET cpf = '12547896791'
WHERE id_cliente= 10;

UPDATE cliente
SET cpf = '11547896741'
WHERE id_cliente= 11;

UPDATE cliente
SET cpf = '22547896741'
WHERE id_cliente= 12;

DROP PROCEDURE IF EXISTS `proc_venda_info`;
DELIMITER $$
USE db_bar $$
CREATE PROCEDURE `proc_venda_info` (IN vIdCliente INT)
BEGIN
	SELECT id_cliente INTO vIdCliente FROM cliente WHERE id_cliente = vIdCliente;
    
    SELECT cliente.id_cliente,
    vendas.preco_total, vendas.data_venda
    FROM cliente
    INNER JOIN vendas
    ON cliente.id_cliente = vendas.id_cliente
    WHERE cliente.id_cliente = vIdCliente;
END$$
DELIMITER ;

CALL proc_venda_info(1);

SELECT * FROM vendas;
SELECT COUNT(*) FROM vendas WHERE id_cliente = 1;

DROP VIEW IF EXISTS view_cliente_venda;
CREATE VIEW view_cliente_venda AS 
SELECT vendas.id_vendas, vendas.preco_total, vendas.id_vendedores
FROM vendas
GROUP BY id_vendedores ORDER BY id_vendas;
    
SELECT * FROM view_cliente_venda;