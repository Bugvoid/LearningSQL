DROP TABLE tb_cliente;

CREATE TABLE tb_cliente(
  cd_cliente NUMBER(10),
  nm_cliente VARCHAR2(2000 CHAR),
  ie_cpf_cnpj VARCHAR2(15 CHAR),
  id_tipocliente CHAR(1 CHAR),
  
  
)
CREATE TABLE tb_tipoconta(
  cd_tipoconta NUMBER(10),
  nm_tipoconta VARCHAR2(250 CHAR),
  ie_ativo NUMBER(1),
  
  CONSTRAINT tipoconta_PK PRIMARY KEY (cd_tipoconta),
  CONSTRAINT tipoconta_UN UNIQUE(nm_tipoconta)
  
 )
 CREATE TABLE tb_conta(
  cd_conta NUMBER(10),
  nm_conta VARCHAR2(250),
  cd_tipoconta NUMBER(10),
    
  CONSTRAINT conta_PK PRIMARY KEY (cd_conta),
  CONSTRAINT conta_UN UNIQUE(nm_conta),
  CONSTRAINT tb_conta_tb_tipoconta_FK FOREIGN KEY (cd_tipoconta) REFERENCES tb_tipoconta (cd_tipoconta)
 )
 
 CREATE TABLE tb_clienteconta(
  cd_cliente NUMBER(10),
  cd_conta NUMBER(10),
  
  CONSTRAINT tb_clienteconta_PK PRIMARY KEY (cd_cliente,cd_conta),
  CONSTRAINT tb_clienteconta_tb_cliente_FK FOREIGN KEY (cd_cliente) REFERENCES tb_cliente (cd_cliente), 
  CONSTRAINT tb_clienteconta_tb_conta_FK FOREIGN KEY (cd_conta) REFERENCES tb_conta (cd_conta)
 )
 
 CREATE TABLE tb_movimentacao(
  cd_cliente NUMBER(10),
  cd_conta NUMBER(10),
  dt_movimentacao DATE,
  ds_movimentacao VARCHAR2(200),
  
  CONSTRAINT movimentacao_PK PRIMARY KEY (cd_cliente,cd_conta,dt_movimentacao),
  CONSTRAINT tb_movimentacao_tb_clienteconta_FK FOREIGN KEY(cd_cliente,cd_conta) REFERENCES tb_clienteconta(cd_cliente,cd_conta)
 )
 
   ALTER TABLE tb_cliente
  ADD(CONSTRAINT cliente_tipocliente_CK CHECK(id_tipocliente IN('J','F')));
  CONSTRAINT cliente_PK PRIMARY KEY (cd_cliente),
  CONSTRAINT tb_cliente_UN UNIQUE(ie_cpf_cnpj)

ALTER TABLE tb_tipoconta
ADD(CONSTRAINT tipoconta_CK CHECK(ie_ativo IN(0,1)));

 