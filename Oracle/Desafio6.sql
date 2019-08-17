INSERT INTO autor VALUES(1, 'Gobatto', '32842024000', '10/09/1978', NULL);
INSERT INTO autor VALUES(2, 'Luiz', '38845124500', '01/12/1963', NULL);
INSERT INTO autor VALUES(3, 'Joaquim', '42012648710', '18/03/1986', NULL);
INSERT INTO autor VALUES(4, 'Regina', '23012024040', '25/04/1992', NULL);

INSERT INTO editora VALUES(1,'Mirandela');
INSERT INTO editora VALUES(2,'Editora Via Norte');
INSERT INTO editora VALUES(3,'Editora Ilhas Tijucas');
INSERT INTO editora VALUES(4,'Maria José');

INSERT INTO assunto VALUES('BAN','Banco');
INSERT INTO assunto VALUES('PRO','Programação');
INSERT INTO assunto VALUES('RED','Redes');
INSERT INTO assunto VALUES('SIS','SO');

INSERT INTO livro VALUES(1,'banco de dados para web', 32.20, '10/01/1999', 1 , 'BAN');
INSERT INTO livro VALUES(2,'programando em linguagem c', 30.00, '01/10/1997', 1 , 'PRO');
INSERT INTO livro VALUES(3,'progrmando em linguagem c++', 115.50, '01/11/1998', 3 , 'PRO');
INSERT INTO livro VALUES(4,'banco de dados na bioinformática', 48.00, '', 2 , 'BAN');
INSERT INTO livro VALUES(5,'redes de computadores', 42.00, '01/09/1996', 2 , 'RED');

INSERT INTO escreve VALUES(1,1);
INSERT INTO escreve VALUES(2,1);
INSERT INTO escreve VALUES(3,2);
INSERT INTO escreve VALUES(4,3);
INSERT INTO escreve VALUES(5,4);

--1
SELECT ass_sigla, liv_preco FROM livro WHERE liv_preco > 100.00;

--2
SELECT max(liv_preco) FROM livro;

--3
SELECT COUNT(*) as editoras FROM editora; 

--4
SELECT liv_titulo, to_char(LIV_LANCAMENTO, 'DD/MM/YYYY') Data_lancamento FROM livro WHERE edi_codigo = 1;

--5
SELECT COUNT(*) as Autores FROM autor;

--6
SELECT UPPER(LIV_TITULO) FROM livro;

--7
SELECT 'O livro '||LIV_TITULO||' tem '||LENGTH(LIV_TITULO)||' caracteres' FROM livro;
