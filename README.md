; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;Universidade de Vila Velha;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;Design e Desenvolvimento de Banco de Dados;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PSET1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;Aluno: Adonismar de Souza Anacleto;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Data:2022-14-11;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

###**Criação de banco de Dados de HR na UVV**###

Criando Super usuário
-- Papel: anacleto
-- DROP ROLE SE EXISTE anacleto;

CRIAR PAPEL anacleto COM
  CONECTE-SE
  SUPERUSUÁRIO
  HERDAR
  CREATEDB
  CREATEROLA
  REPLICAÇÃO
  SENHA ENCRIPTADA ' SCRAM-SHA-256$4096:2Q2n8KQlaraNnVdECed7kQ==$szA3pO5mX8X887qCMV9sfJSjzo/CMQ679oUjDyyTAZg=:T6m2RN6MMgHgpvfiuE78dcUnimzKuyFcpzrAz9Dcch4= ' ;

-- Banco de dados: uvv

Criando o Banco de Dados

-- DROP DATABASE SE EXISTE uvv;

CRIAR BANCO DE  DADOS  uvv
    COM
    PROPRIETÁRIO = anacleto
    CODIFICAÇÃO =  ' UTF8 '
    LC_COLLATE =  ' en_US.UTF-8 '
    LC_CTYPE =  ' en_US.UTF-8 '
    TABLESPACE = pg_default
LIMITE      DE CONEXÃO =  - 1 ;

COMENTAR NO BANCO DE DADOS uvv
    IS ' Criação de Banco de Dados UVV ' ;

Criando o Esquema hr

-- ESQUEMA: hr

-- RETIRE O ESQUEMA SE EXISTE hr ;

CRIAR  ESQUEMA  SE NÃO EXISTIR hr
    AUTORIZAÇÃO anacleto;

COMENTAR NO ESQUEMA hr
    IS ' Criação do Schemas hr ' ;


Criando a Tabela Cargos, com as colunas:
|| id_cargo || cargo || salario_minimo || salario_maximo ||
Chave Primaria id_cargo


Criando a Tabela regioes, com as colunas:
|| id_regiao || nome || 
Chave Primaria id_regiao


Criando a Tabela paises, com as colunas:
|| id_pais || nome || id_rgiao ||
Chave Primaria id_pais


Criando a Tabela localizacoes, com as colunas:
|| id_localizacao || endereco || cep || cidade || uf || id_pais ||
Chave Primaria id_localizacao


Criando a Tabela departamentos, com as colunas:
|| id_departamento || nome || id_localizacao || id_gerente ||
Chave Primaria id_departamento


Criando a Tabela empregados, com as colunas:
|| id_empregado || nome || e-mail || telefone || data_contratacao || id_cargo || salario || id_departamento || id_supervisor ||
Chave Primaria id_empregado


Criando a Tabela historico_cargos, com as colunas:
|| id_empregado || data_inicial || data_final || id_cargo || id_departamento
Chave Primaria id_empregado, data_inicial

