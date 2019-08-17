CREATE TABLE tb_tipo_conta(
  cd_tipoconta NUMBER(5),
  nm_tipoconta VARCHAR2(200),
  CONSTRAINT tb_tipoconta_PK PRIMARY KEY(cd_tipoconta)
);

CREATE TABLE tb_agencia(
  cd_agencia NUMBER(5),
  nr_agencia VARCHAR2(10),
  nm_agencia VARCHAR2(200),
  CONSTRAINT tb_agencia_PK PRIMARY KEY(cd_agencia)
);

CREATE TABLE tb_conta(
  cd_conta NUMBER(5),
  cd_agencia NUMBER(5),
  cd_cliente NUMBER(6),
  cd_tipoconta NUMBER(5),
  nr_conta VARCHAR2(10),
  dt_abertura DATE,
  dt_fechamento DATE,
  CONSTRAINT tb_conta_PK PRIMARY KEY (cd_conta, cd_agencia, cd_cliente),
  CONSTRAINT tb_conta_UN UNIQUE(nr_conta)
);

CREATE TABLE tb_movimento(
  cd_conta NUMBER(5),
  cd_agencia NUMBER(5),
  cd_cliente NUMBER(6),
  ie_cred_deb VARCHAR2(1),
  vl_movimento NUMBER(12,2),
  nr_documento VARCHAR2(20),
  dt_movimento DATE
);

CREATE TABLE tb_cliente(
  cd_cliente NUMBER(6),
  nm_cliente VARCHAR2(200),
  dt_inicio DATE,
  dt_fim DATE,
  CONSTRAINT tb_cliente_PK PRIMARY KEY(cd_cliente)
);

CREATE TABLE tb_contato(
  cd_contato NUMBER(10),
  nr_telefone VARCHAR2(15),
  cd_cliente NUMBER(6),
  CONSTRAINT tb_contato_PK PRIMARY KEY(cd_contato)
);

ALTER TABLE tb_conta
ADD(
  CONSTRAINT tb_tipo_conta_FK FOREIGN KEY(cd_tipoconta) REFERENCES tb_tipo_conta(cd_tipoconta),
  CONSTRAINT tb_agencia_FK FOREIGN KEY(cd_agencia) REFERENCES tb_agencia(cd_agencia),
  CONSTRAINT conta_cliente_FK FOREIGN KEY(cd_cliente) REFERENCES tb_cliente(cd_cliente)
);

ALTER TABLE tb_movimento
ADD(
  CONSTRAINT movimento_conta_FK FOREIGN KEY(cd_conta,cd_agencia,cd_cliente) REFERENCES tb_conta(cd_conta,cd_agencia,cd_cliente)
);

ALTER TABLE tb_contato
ADD(
  CONSTRAINT contato_cliente_FK FOREIGN KEY(cd_cliente) REFERENCES tb_cliente(cd_cliente)
);

/*EXERCICIOS*/
--2
ALTER TABLE tb_movimento
ADD(
  CONSTRAINT tb_movimento_CK CHECK(ie_cred_deb IN('D','C'))
);

--3
INSERT INTO tb_tipo_conta VALUES(54321,'Conta Corrente');
INSERT INTO tb_tipo_conta VALUES(54897,'Conta Poupança');

INSERT INTO tb_agencia VALUES(19784,'0123456789', 'Bradesco Vila Formosa');
INSERT INTO tb_agencia VALUES(15479,'5478965236', 'Itau Vila Prudente');
INSERT INTO tb_agencia VALUES(14789,'1457898542', 'Banco do Brasil Tatuape');
INSERT INTO tb_agencia VALUES(65577,'1254645212', 'Caixa Economica Carrao');

INSERT INTO tb_cliente VALUES(123456, 'Caio da Silva', '01-01-2015', '30-01-2018');
INSERT INTO tb_cliente VALUES(654321, 'Amanda Santos', '25-10-2009', '01-02-2012');
INSERT INTO tb_cliente VALUES(765432, 'Jessica Alves', '12-11-2012', '27-10-2013');
INSERT INTO tb_cliente VALUES(987654, 'Tiago Dias', '01-05-2017', '18-03-208');
INSERT INTO tb_cliente VALUES(876543, 'Jomas Mattos', '07-07-2013', '18-09-2013');
INSERT INTO tb_cliente VALUES(456789, 'Mauro Quadros', '10-01-2018', '01-02-2018');
INSERT INTO tb_cliente VALUES(345789, 'Luan Castro', '15-02-2012', '19-05-2014');
INSERT INTO tb_cliente VALUES(123987, 'Thales Silva Dias', '01-03-2002', '03-04-2017');
INSERT INTO tb_cliente VALUES(987456, 'Aline Armani', '01-12-2003', '11-10-2016');
INSERT INTO tb_cliente VALUES(654123, 'Josias da Silva', '12-04-2013', '10-01-2015');

INSERT INTO tb_contato VALUES(5461237895,'11 2872-7410', 123456);
INSERT INTO tb_contato VALUES(7895656133,'11 99211-6577', 654321);
INSERT INTO tb_contato VALUES(1578974561,'11 3333-1111', 765432);
INSERT INTO tb_contato VALUES(8784513211,'11 4002-0022', 987654);
INSERT INTO tb_contato VALUES(1254564564,'11 4003-0033', 876543);

INSERT INTO tb_conta VALUES(12345, 19784, 123456, 54321, '550970', '01-02-2017', '10-02-2018');
INSERT INTO tb_conta VALUES(65432, 15479, 654321, 54897, '789452', '15-05-2017', '15-06-2017');
INSERT INTO tb_conta VALUES(23456, 14789, 765432, 54897, '1328', '12-07-2017', '07-12-2017');
INSERT INTO tb_conta VALUES(98765, 19784, 987654, 54321, '15487', '07-08-2017', '04-11-2017');
INSERT INTO tb_conta VALUES(78945, 15479, 876543, 54321, '8789544', '30-10-2017', '15-01-2018');

INSERT INTO tb_movimento VALUES(12345, 19784, 123456, 'D', 365.30, '254788899', '02-06-2017');
INSERT INTO tb_movimento VALUES(65432, 15479, 654321, 'C', 1280.70, '54564654', '02-06-2017');
INSERT INTO tb_movimento VALUES(23456, 14789, 765432, 'C', 95.00, '215645646', '02-06-2017');
INSERT INTO tb_movimento VALUES(98765, 19784, 987654, 'C', 12680.99, '1456456', '02-06-2017');
INSERT INTO tb_movimento VALUES(78945, 15479, 876543, 'D', 458.45, '1564756', '02-06-2017');
INSERT INTO tb_movimento VALUES(12345, 19784, 123456, 'D', 125.69, '545646', '02-06-2017');
INSERT INTO tb_movimento VALUES(12345, 19784, 123456, 'C', 9.98, '489789789', '02-06-2017');
INSERT INTO tb_movimento VALUES(65432, 15479, 654321, 'D', 20.99, '15646561', '02-06-2017');
INSERT INTO tb_movimento VALUES(65432, 15479, 654321, 'C', 157.99, '021321321', '02-06-2017');
INSERT INTO tb_movimento VALUES(12345, 19784, 123456, 'D', 747.00, '5144500', '02-06-2017');
INSERT INTO tb_movimento VALUES(12345, 19784, 123456, 'D', 71.00, '545646', '08-06-2017');
INSERT INTO tb_movimento VALUES(23456, 14789, 765432, 'C', 978.66, '9887321', '02-06-2017');
INSERT INTO tb_movimento VALUES(98765, 19784, 987654, 'D', 367.99, '12457456', '02-06-2017');
INSERT INTO tb_movimento VALUES(98765, 19784, 987654, 'C', 220.30, '215649423', '02-06-2017');
INSERT INTO tb_movimento VALUES(98765, 19784, 987654, 'C', 77.99, '123415475', '02-06-2017');

--4
ALTER TABLE tb_movimento
MODIFY (vl_movimento  not null, nr_documento not null, dt_movimento not null);

ALTER TABLE tb_movimento
MODIFY (dt_movimento  DATE DEFAULT SYSDATE);

ALTER TABLE tb_movimento
ADD(ds_historico varchar2(200));

--5
SELECT * FROM tb_conta WHERE dt_abertura BETWEEN '01/01/1998' AND '20/03/2018';

--6
SELECT cd_cliente, nm_cliente FROM tb_cliente WHERE DT_INICIO < '20/02/1993';

--7
UPDATE tb_conta SET DT_FECHAMENTO = '20/03/2018' WHERE cd_cliente = 12;

--8
SELECT CD_CONTA, CD_AGENCIA, CD_CLIENTE, IE_CRED_DEB FROM tb_movimento WHERE vl_movimento > 1500.00 AND vl_movimento < 5000.00 AND IE_CRED_DEB = 'D';
