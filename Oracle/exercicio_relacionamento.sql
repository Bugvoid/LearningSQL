--1
SELECT cnt.id_conta "Numero da conta", cnt.nr_digito_conta "Digito da conta", 
  cnt.vl_saldo "Saldo", b.nm_banco "Nome do Banco", ba.nm_agencia "Nome da Agencia", tc.NM_TIPO_CONTA "Tipo da Conta"
FROM tab_correntista c
JOIN tab_conta cnt ON c.ID_CORRENTISTA=cnt.id_correntista
JOIN TAB_BANCO b ON cnt.ID_BANCO=b.id_banco
JOIN TAB_BANCO_AGENCIA ba ON cnt.id_agencia=ba.id_agencia
JOIN TAB_TIPO_CONTA tc ON cnt.ID_TIPO_CONTA=tc.ID_TIPO_CONTA
WHERE nm_nome = 'ADALTON ISIDORO';

--2
SELECT COUNT(*) "Quantidade de Municipios", m.id_uf "UF", NM_UF "Estado" 
FROM TAB_MUNICIPIO m
JOIN TAB_ESTADO e ON m.id_uf=e.ID_UF
GROUP BY m.id_uf, NM_UF
ORDER BY NM_UF;

--3
SELECT c.nm_nome "Nome", nm_municipio "Municipio", e.NM_UF "Estado", c.DT_NASCIMENTO "Data de Nascimento", 
  l.DS_TIPO||' '||l.nm_nome "Endereco", nr_numero "Numero"  
FROM tab_correntista c
JOIN TAB_MUNICIPIO m ON c.id_municipio=m.ID_MUNICIPIO
JOIN TAB_ESTADO e ON m.ID_UF=e.id_uf
JOIN TAB_LOGRADOURO l ON c.ID_CEP=l.ID_CEP
WHERE dt_nascimento LIKE '%/71';

--4
SELECT COUNT(*) "Total de contas", NM_TIPO_CONTA "Tipo de conta"
FROM TAB_CONTA c
JOIN TAB_TIPO_CONTA tc ON c.ID_TIPO_CONTA=tc.ID_TIPO_CONTA
GROUP BY NM_TIPO_CONTA
HAVING COUNT(*) > 100;