CREATE TABLE tb_empregado(
  cd_empregado integer,
  nm_empregado VARCHAR2(200),
  dt_nasc_empregado date,
  nm_end_empregado varchar(300),
  cd_departamento integer,

  CONSTRAINT empregado_cdempregado_PK PRIMARY KEY (cd_empregado),
  constraint emp_depto_cddepartamento_fk foreign key (cd_departamento) references tb_departamento(cd_departamento)
)
CREATE TABLE tb_departamento(
  cd_departamento integer,
  nm_departamento varchar2(250),
  
  CONSTRAINT tb_departamento_PK PRIMARY KEY (cd_departamento)
)
CREATE TABLE tb_projeto(
  cd_projeto integer,
  nm_projeto varchar2(300),
  dt_ini_projeto date,
  dt_fin_projeto date,
  
  CONSTRAINT tb_projeto_PK PRIMARY KEY (cd_projeto),
  constraint projeto_dtini_ck check(dt_ini_projeto < dt_fin_projeto),
  constraint projeto_dtfin_ck check(dt_fin_projeto > dt_ini_projeto)
)
CREATE TABLE tb_projeto_empregado(
  cd_projeto integer,
  cd_empregado integer,
  
  CONSTRAINT tb_projeto_empregado_PK PRIMARY KEY (cd_projeto,cd_empregado),
  constraint proj_empr_cdprojeto_fk foreign key (cd_projeto) references tb_projeto(cd_projeto),
  constraint proj_emp_cdempregado_fk foreign key (cd_empregado) references tb_empregado(cd_empregado)
)