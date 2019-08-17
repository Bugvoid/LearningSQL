CREATE TABLE tb_cliente
  (
    cd_cliente     NUMBER (10) NOT NULL ,
    nm_cliente     VARCHAR2 (2000 CHAR) NOT NULL ,
    ie_cpf_cnpj    VARCHAR2 (15 CHAR) ,
    id_tipocliente CHAR (1 CHAR) NOT NULL
  ) ;
ALTER TABLE tb_cliente ADD CONSTRAINT cliente_tipocliente_CK CHECK (id_tipocliente IN ('J','F')) ;
ALTER TABLE tb_cliente ADD CONSTRAINT cliente_PK PRIMARY KEY ( cd_cliente ) ;
ALTER TABLE tb_cliente ADD CONSTRAINT tb_cliente_UN UNIQUE ( ie_cpf_cnpj ) ;

select nm_cliente from tb_cliente where id_tipocliente = J;
select nm_cliente,ie_cpf_cnpj from tb cliente where nome like 'a%';
select nm_cliente from tbcliente where id_tipocliente != J;
 

CREATE TABLE tb_clienteconta
  (
    cd_cliente NUMBER (10) NOT NULL ,
    cd_conta   NUMBER (10) NOT NULL
  ) ;
ALTER TABLE tb_clienteconta ADD CONSTRAINT tb_clienteconta_PK PRIMARY KEY ( cd_cliente, cd_conta ) ;


CREATE TABLE tb_conta
  (
    cd_conta     NUMBER (10) NOT NULL ,
    nm_conta     VARCHAR2 (250) NOT NULL ,
    cd_tipoconta NUMBER (10) NOT NULL
  ) ;
ALTER TABLE tb_conta ADD CONSTRAINT conta_PK PRIMARY KEY ( cd_conta ) ;
ALTER TABLE tb_conta ADD CONSTRAINT conta_UN UNIQUE ( nm_conta ) ;

UPDATE TB_TIPOCONTA set IE_ATIVO = 1 where CD_TIPOCONTA = 0;


CREATE TABLE tb_movimentacao
  (
    cd_cliente      NUMBER (10) NOT NULL ,
    cd_conta        NUMBER (10) NOT NULL ,
    dt_movimentacao DATE DEFAULT SYSDATE NOT NULL ,
    ds_movimentacao VARCHAR2 (300 CHAR) NOT NULL
  ) ;
ALTER TABLE tb_movimentacao ADD CONSTRAINT movimentacao_PK PRIMARY KEY ( cd_cliente, cd_conta, dt_movimentacao ) ;
Select * from tb_movimentacao where dt_movimentacao between '01/01/2018' and '13/05/2018';

delete from tb_movimentacao where (cd_conta = 2 and cd_conta = 3 ) and (dt_movimentacao > '02/02/2018');

CREATE TABLE tb_tipoconta
  (
    cd_tipoconta NUMBER (10) NOT NULL ,
    nm_tipoconta VARCHAR2 (250 CHAR) NOT NULL ,
    ie_ativo     NUMBER (1) NOT NULL
  ) ;

ALTER TABLE tb_tipoconta ADD CONSTRAINT tipoconta_CK CHECK (ie_tipoconta IN (0,1)) ;
ALTER TABLE tb_tipoconta ADD CONSTRAINT tipoconta_PK PRIMARY KEY ( cd_tipoconta ) ;
ALTER TABLE tb_tipoconta ADD CONSTRAINT tipoconta_UN UNIQUE ( nm_tipoconta ) ;


ALTER TABLE tb_movimentacao ADD CONSTRAINT movimentacao_clienteconta_FK FOREIGN KEY ( cd_cliente, cd_conta ) REFERENCES tb_clienteconta ( cd_cliente, cd_conta ) ;

ALTER TABLE tb_clienteconta ADD CONSTRAINT tb_clienteconta_tb_cliente_FK FOREIGN KEY ( cd_cliente ) REFERENCES tb_cliente ( cd_cliente ) ;

ALTER TABLE tb_clienteconta ADD CONSTRAINT tb_clienteconta_tb_conta_FK FOREIGN KEY ( cd_conta ) REFERENCES tb_conta ( cd_conta ) ;

ALTER TABLE tb_conta ADD CONSTRAINT tb_conta_tb_tipoconta_FK FOREIGN KEY ( cd_tipoconta ) REFERENCES tb_tipoconta ( cd_tipoconta ) ;


