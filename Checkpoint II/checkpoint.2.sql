CREATE DATABASE IF NOT EXISTS `nair_costuras`;
USE `nair_costuras`;

CREATE TABLE IF NOT EXISTS Medidas
(
	id TINYINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    busto DECIMAL (6,2) NOT NULL,
    torax DECIMAL (6,2) NOT NULL,
    cintura DECIMAL (6,2) NOT NULL,
    quadril DECIMAL (6,2) NOT NULL,
    coxa_direita DECIMAL (6,2) NULL,
    coxa_esquerda DECIMAL (6,2) NULL,
    panturrilha_direita DECIMAL (6,2) NULL,
    panturrilha_esquerda DECIMAL (6,2) NULL,
    
    CONSTRAINT PK_Medidas_id PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Cliente
(
	id TINYINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR (50) NOT NULL,
    sobrenome VARCHAR (50) NOT NULL,
    contato CHAR (12) NOT NULL,
    id_medida TINYINT UNSIGNED,
    
    CONSTRAINT PK_Cliente_id PRIMARY KEY (id),
    CONSTRAINT FK_Medidas_clinente_id_medida FOREIGN KEY (id_medida) REFERENCES Medidas (id)
);

CREATE TABLE IF NOT EXISTS Modelos
(
	id TINYINT UNSIGNED AUTO_INCREMENT,
    modelo VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_Modelos_id PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Orçamentos 
(
	id TINYINT UNSIGNED AUTO_INCREMENT,
    id_cliente_nome TINYINT UNSIGNED,
    id_modelo TINYINT UNSIGNED,
    valorOrcamento DECIMAL (7,2) NOT NULL,
    
    CONSTRAINT PK_Orcamento_id PRIMARY KEY (id),
    CONSTRAINT FK_Cliente_Orcamentos_idNome FOREIGN KEY (id_cliente_nome) REFERENCES Cliente (id),
    CONSTRAINT FK_Modelos_Orcamentos_idModelo FOREIGN KEY (id_modelo) REFERENCES Modelos (id)  
      
);

