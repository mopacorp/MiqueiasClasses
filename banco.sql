CREATE TABLE `cliente` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cpf VARCHAR(20),
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  situacao INT default 1
  )

CREATE TABLE `empresa` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cnpj VARCHAR(45) NOT NULL,
  longitude FLOAT NOT NULL,
  latitude FLOAT NOT NULL
  )


CREATE TABLE `contato` (
id_empresa int,
telefone VARCHAR(20),
email varchar(255),
site varchar(255),
FOREIGN KEY (id_empresa) REFERENCES empresa(id)
)

CREATE TABLE `cliente_empresa` (
id_cliente int, 
id_empresa int,
avaliacao double (2,2),
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_empresa) REFERENCES empresa(id)
)

CREATE TABLE `compra` (
id int PRIMARY KEY AUTO_INCREMENT,
id_cliente int,
id_empresa int,
situacao int default 1,
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_empresa) REFERENCES empresa(id)
)

CREATE TABLE `categoria` (
id int PRIMARY KEY AUTO_INCREMENT,	
nome VARCHAR(50),
descricao varchar(100),
situacao int default 1
)

CREATE TABLE `produto` (
id int PRIMARY KEY AUTO_INCREMENT,
nome varchar(250),
id_categoria int,
FOREIGN KEY (id_categoria) REFERENCES categoria(id)
)

CREATE TABLE `produto_empresa` (
id_empresa int, 
id_produto int,
preco decimal(7.2),
descricao VARCHAR(255),
situacao int default 1,
FOREIGN KEY (id_empresa) REFERENCES empresa(id),
FOREIGN KEY (id_produto) REFERENCES produto(id)
)

CREATE TABLE `venda_produto` (
id int PRIMARY KEY AUTO_INCREMENT,
id_compra int,
id_produto int /*Produto empresa*/, 
situacao int default 1,
solicitacao int default 0,
motivo VARCHAR(255) DEFAULT "",
observacao VARCHAR(255),/*Observação dentro do pedido, ex: Coca ja com o canudo ou pizza sem bordas e pouco pimentão*/
FOREIGN KEY (id_produto) REFERENCES produto_empresa(id_produto),
FOREIGN KEY (id_compra) REFERENCES compra(id)
)

