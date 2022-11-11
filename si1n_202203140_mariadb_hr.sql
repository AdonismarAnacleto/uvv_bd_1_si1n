CREATE DATABASE uvv;

CREATE TABLE cargos (
                id_cargo VARCHAR(50) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo NUMERIC(8,2),
		salario_maximo NUMERIC(8,2),
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);

COMMENT ON cargos
    IS 'criacao da tabela cargos';

CREATE UNIQUE INDEX cargos_idx
 ON cargos
 ( id_cargo );

CREATE UNIQUE INDEX cargos_idx1
 ON cargos
 ( id_cargo );

CREATE UNIQUE INDEX cargos_idx2
 ON cargos
 ( cargo );

CREATE TABLE regioes (
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(25) NOT NULL,
                CONSTRAINT id_regiao PRIMARY KEY (id_regiao)
);

COMMENT ON regioes
    IS 'criacao da tabela regioes';

CREATE UNIQUE INDEX regioes_idx
 ON regioes
 ( nome );

CREATE TABLE paises (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INTEGER NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);

COMMENT ON paises
    IS 'criacao da tabela paises';

CREATE UNIQUE INDEX paises_idx
 ON paises
 ( nome );

CREATE TABLE localizacoes (
                id_localizacao INTEGER NOT NULL,
                endereco VARCHAR(50),
                cep VARCHAR(12),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                id_pais CHAR(2) NOT NULL,
                CONSTRAINT id_localizacao PRIMARY KEY (id_localizacao)
);

COMMENT ON localizacoes
    IS 'criacao da tabela localizacoes';

CREATE TABLE departamentos (
                id_departamento INTEGER NOT NULL,
                nome VARCHAR(50),
                id_localizacao INTEGER NOT NULL,
                id_gerente INTEGER NOT NULL,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento)
);

COMMENT ON departamentos
    IS 'criacao da tabela departamentos';

CREATE UNIQUE INDEX departamentos_idx
 ON departamentos
 ( nome );

CREATE TABLE empregados (
                id_empregado INTEGER NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(50) NOT NULL,
                salario NUMERIC(8,2),
                comissao NUMERIC(4,2),
                id_departamentto INTEGER NOT NULL,
                id_supervisor INTEGER NOT NULL,
                CONSTRAINT id_empregado PRIMARY KEY (id_empregado)
);

COMMENT ON empregados
    IS 'criacao da tabela empregados';

CREATE UNIQUE INDEX empregados_idx
 ON empregados
 ( email );

CREATE TABLE historico_cargos (
                id_empregado INTEGER NOT NULL,
                data_inicial DATE NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(50) NOT NULL,
                id_departamento INTEGER NOT NULL,
                CONSTRAINT id_empregado__data_inicial PRIMARY KEY (id_empregado, data_inicial)
);

COMMENT ON historico_cargos
    IS 'criacao da tabela historico_cargos';

ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON empregados
    IS 'transformacao da column id_cargo em FK';

ALTER TABLE historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON historico_cargos
    IS 'transformacao da column id_cargo em FK';

ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON paises
    IS 'transformacao da column id_regiao em FK';

ALTER TABLE localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON localizacoes
    IS 'transformacao da column id_pais em FK';

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON departamentos
    IS 'transformacao da column id_localizacao em FK';

ALTER TABLE historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON historico_cargos
    IS 'transformacao da column id_departamento em FK';

ALTER TABLE empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamentto)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON empregados
    IS 'transformacao da column id_departamento em FK';

ALTER TABLE empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON empregados
    IS 'transformacao da column id_supervisor em FK';

ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

COMMENT ON historico_cargos
    IS 'transformacao da column id_empregado em FK';


INSERT INTO regioes (id_regiao, nome) VALUES
( '1', 'Europe');
INSERT INTO regioes (id_regiao, nome) VALUES
( '2', 'Americas');
INSERT INTO regioes (id_regiao, nome) VALUES
( '3', 'Asia');
INSERT INTO regioes (id_regiao, nome) VALUES
( '4', 'Middle East and Africa');

COMMENT ON table regioes
    IS 'Inserindo os dados referentes as regioes, importados do Oracle';


INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'AD_PRES', 'President', '20080', '40000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'AD_VP', 'Administration Vice President', '15000', '30000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'AD_ASST', 'Administration Assistant', '3000', '6000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'FI_MGR', 'Finance Manager', '8200', '16000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'FI_ACCOUNT', 'Accountant', '4200', '9000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'AC_MGR', 'Accounting Manager', '8200', '16000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'AC_ACCOUNT', 'Public Accountant', '4200', '9000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'SA_MAN', 'Sales Manager', '10000', '20080');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'SA_REP', 'Sales Representative', '6000', '12008');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'PU_MAN', 'Purchasing Manager', '8000', '15000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'PU_CLERK', 'Purchasing Clerk', '2500', '5500');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'ST_MAN', 'Stock Manager', '5500', '8500');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'ST_CLERK', 'Stock Clerk', '2008', '5000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'SH_CLERK', 'Shipping Clerk', '2500', '5500');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'IT_PROG', 'Programmer', '4000', '10000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'MK_MAN', 'Marketing Manager', '9000', '15000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'MK_REP', 'Marketing Representative', '4000', '9000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'HR_REP', 'Human Resources Representative', '4000', '9000');
INSERT INTO cargos (id_cargo, cargo, salario_minimo, salario_maximo) VALUES
( 'PR_REP', 'Public Relations Representative', '4500', '10500');


COMMENT ON table cargos
    IS 'Inserindo os dados referentes aos cargos, importados do Oracle';


INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'AR', 'Argentina', '2');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'AU', 'Australia', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'BE', 'Belgium', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'BR', 'Brazil', '2');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'CA', 'Canada', '2');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'CH', 'Switzerland', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'CN', 'China', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'DE', 'Germany', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'DK', 'Denmark', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'EG', 'Egypt', '4');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'FR', 'France', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'IL', 'Israel', '4');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'IN', 'India', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'IT', 'Italy', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'JP', 'Japan', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'KW', 'Kuwait', '4');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'ML', 'Malaysia', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'MX', 'Mexico', '2');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'NG', 'Nigeria', '4');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'NL', 'Netherlands', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'SG', 'Singapore', '3');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'UK', 'United Kingdom', '1');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'US', 'United States of America', '2');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'ZM', 'Zambia', '4');
INSERT INTO paises (id_pais, nome, id_regiao) VALUES
( 'ZW', 'Zimbabwe', '4');


COMMENT ON table paises
    IS 'Inserindo os dados referentes aos paises, importados do Oracle';


INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1000', '1297', 'Via Cola di Rie', '00989', 'Roma', 'IT');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1100', '93091', 'Calle della Testa', '10934', 'Venice', 'IT');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1200', '2017', 'Shinjuku-ku', '1689', 'Tokyo', 'Tokyo PrefectureJP');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1300', '9450', 'Kamiya-cho', '6823', 'Hiroshima', 'JP');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1400', '2014', 'Jabberwocky Rd', '26192', 'Southlake', 'TexasUS');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1500', '2011', 'Interiors Blvd', '99236', 'South San Francisco', 'CaliforniaUS');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1600', '2007', 'Zagora St', '50090', 'South Brunswick', 'New JerseyUS');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1700', '2004', 'Charade Rd', '98199', 'Seattle', 'WashingtonUS');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1800', '147', 'Spadina Ave', 'M5V 2L7', 'Toronto', 'OntarioCA');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '1900', '6092', 'Boxwood St', 'YSW 9T2', 'Whitehorse', 'YukonCA');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2000', '40-5-12', 'Laogianggen', '190518', 'Beijing', 'CN');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2100', '1298', 'Vileparle (E)', '490231', 'Bombay', 'MaharashtraIN');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2200', '12-98', 'Victoria Street', '2901', 'Sydney', 'New South WalesAU');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2300', '198', 'Clementi North', '540198', 'Singapore', 'SG');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2400', '8204', 'Arthur St', '', 'London', 'UK');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2500', '1298', 'The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'OxfordUK');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2600', '9702', 'Chester Road', '09629850293', 'Stretford', 'ManchesterUK');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2700', '7031', 'Schwanthalerstr', '80925', 'Munich', 'BavariaDE');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2800', '01307-002', 'Rua Frei Caneca', '1360 ', 'Sao Paulo', 'BR');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '2900', '20', 'Rue des Corps-Saints', '1730', 'Geneva', 'GeneveCH');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '3000', '921', 'Murtenstrasse', '3095', 'Bern', 'BECH');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '3100', '837', 'Pieter Breughelstraat', '3029SK', 'Utrecht', 'UtrechtNL');
INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES
( '3200', '837', 'Mariano Escobedo', '11932', 'Mexico City', 'Distrito Federal,MX');


COMMENT ON table localizacoes
    IS 'Inserindo os dados referentes as localizacoes, importados do Oracle';


INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '10', 'Administration', '1300', '200');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '20', 'Marketing', '2000', '201');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '30', 'Purchasing', '1300', '114');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '40', 'Human Resources', '2400', '203');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '50', 'Shipping', '2400', '121');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '60', 'IT', '1300', '103');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '70', 'Public Relations', '2400', '204');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '80', 'Sales', '2400', '145');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '90', 'Executive', '1300', '100');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '100', 'Finance', '1300', '108');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '110', 'Accounting', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '120', 'Treasury', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '130', 'Corporate Tax', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '140', 'Control And Credit', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '150', 'Shareholder Services', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '160', 'Benefits', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '170', 'Manufacturing', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '180', 'Construction', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '190', 'Contracting', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '200', 'Operations', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '210', 'IT Support', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '220', 'NOC', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '230', 'IT Helpdesk', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '240', 'Government Sales', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '250', 'Retail Sales', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '260', 'Recruiting', '1300', '205');
INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES
( '270', 'Payroll', '1300', '205');


COMMENT ON table departamentos
    IS 'Inserindo os dados referentes aos departamentos, importados do Oracle';


INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(100, 'Steven King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000, null, 90, null);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(101, 'Neena Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000, null, 90, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(102, 'Lex De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000, null, 90, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(103, 'Alexander Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000, null, 60, 102);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(104, 'Bruce Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000, null, 60, 103);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(105, 'David Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800, null, 60, 103);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(106, 'Valli Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800, null, 60, 103);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(107, 'Diana Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200, null, 60, 103);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(108, 'Nancy Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008, null, 100, 101);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(109, 'Daniel Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000, null, 100, 108);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(110, 'John Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200, null, 100, 108);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(111, 'Ismael Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700, null, 100, 108);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(112, 'Jose Manuel Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800, null, 100, 108);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(113, 'Luis Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900, null, 100, 108);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(114, 'Den Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000, null, 30, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(115, 'Alexander Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100, null, 30, 114);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(116, 'Shelli Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900, null, 30, 114);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(117, 'Sigal Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800, null, 30, 114);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(118, 'Guy Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600, null, 30, 114);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(119, 'Karen Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500, null, 30, 114);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(120, 'Matthew Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000, null, 50, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(121, 'Adam Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200, null, 50, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(122, 'Payam Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900, null, 50, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(123, 'Shanta Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', 6500, null, 50, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(124, 'Kevin Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', 5800, null, 50, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(125, 'Julia Nayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', 3200, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(126, 'Irene Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', 2700, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(127, 'James Landry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', 2400, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(128, 'Steven Markle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', 2200, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(129, 'Laura Bissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', 3300, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(130, 'Mozhe Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', 2800, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(131, 'James Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', 2500, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(132, 'TJ Olson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', 2100, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(133, 'Jason Mallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', 3300, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(134, 'Michael Rogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', 2900, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(135, 'Ki Gee', 'KGEE', '650.127.1734', '2007-12-12', 'ST_CLERK', 2400, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(136, 'Hazel Philtanker', 'HPHILTAN', '650.127.1634', '2008-02-06', 'ST_CLERK', 2200, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(137, 'Renske Ladwig', 'RLADWIG', '650.121.1234', '2003-07-14', 'ST_CLERK', 3600, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(138, 'Stephen Stiles', 'SSTILES', '650.121.2034', '2005-10-26', 'ST_CLERK', 3200, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(139, 'John Seo', 'JSEO', '650.121.2019', '2006-02-12', 'ST_CLERK', 2700, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(140, 'Joshua Patel', 'JPATEL', '650.121.1834', '2006-04-06', 'ST_CLERK', 2500, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(141, 'Trenna Rajs', 'TRAJS', '650.121.8009', '2003-10-17', 'ST_CLERK', 3500, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(142, 'Curtis Davies', 'CDAVIES', '650.121.2994', '2005-01-29', 'ST_CLERK', 3100, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(143, 'Randall Matos', 'RMATOS', '650.121.2874', '2006-03-15', 'ST_CLERK', 2600, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(144, 'Peter Vargas', 'PVARGAS', '650.121.2004', '2006-07-09', 'ST_CLERK', 2500, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(145, 'John Russell', 'JRUSSEL', '011.44.1344.429268', '2004-10-01', 'SA_MAN', 14000, .4, 80, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(146, 'Karen Partners', 'KPARTNER', '011.44.1344.467268', '2005-01-05', 'SA_MAN', 13500, .3, 80, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(147, 'Alberto Errazuriz', 'AERRAZUR', '011.44.1344.429278', '2005-03-10', 'SA_MAN', 12000, .3, 80, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(148, 'Gerald Cambrault', 'GCAMBRAU', '011.44.1344.619268', '2007-10-15', 'SA_MAN', 11000, .3, 80, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(149, 'Eleni Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2008-01-29', 'SA_MAN', 10500, .2, 80, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(150, 'Peter Tucker', 'PTUCKER', '011.44.1344.129268', '2005-01-30', 'SA_REP', 10000, .3, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(151, 'David Bernstein', 'DBERNSTE', '011.44.1344.345268', '2005-03-24', 'SA_REP', 9500, .25, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(152, 'Peter Hall', 'PHALL', '011.44.1344.478968', '2005-08-20', 'SA_REP', 9000, .25, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(153, 'Christopher Olsen', 'COLSEN', '011.44.1344.498718', '2006-03-30', 'SA_REP', 8000, .2, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(154, 'Nanette Cambrault', 'NCAMBRAU', '011.44.1344.987668', '2006-12-09', 'SA_REP', 7500, .2, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(155, 'Oliver Tuvault', 'OTUVAULT', '011.44.1344.486508', '2007-11-23', 'SA_REP', 7000, .15, 80, 145);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(156, 'Janette King', 'JKING', '011.44.1345.429268', '2004-01-30', 'SA_REP', 10000, .35, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(157, 'Patrick Sully', 'PSULLY', '011.44.1345.929268', '2004-03-04', 'SA_REP', 9500, .35, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(158, 'Allan McEwen', 'AMCEWEN', '011.44.1345.829268', '2004-08-01', 'SA_REP', 9000, .35, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(159, 'Lindsey Smith', 'LSMITH', '011.44.1345.729268', '2005-03-10', 'SA_REP', 8000, .3, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(160, 'Louise Doran', 'LDORAN', '011.44.1345.629268', '2005-12-15', 'SA_REP', 7500, .3, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(161, 'Sarath Sewall', 'SSEWALL', '011.44.1345.529268', '2006-11-03', 'SA_REP', 7000, .25, 80, 146);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(162, 'Clara Vishney', 'CVISHNEY', '011.44.1346.129268', '2005-11-11', 'SA_REP', 10500, .25, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(163, 'Danielle Greene', 'DGREENE', '011.44.1346.229268', '2007-03-19', 'SA_REP', 9500, .15, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(164, 'Mattea Marvins', 'MMARVINS', '011.44.1346.329268', '2008-01-24', 'SA_REP', 7200, .1, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(165, 'David Lee', 'DLEE', '011.44.1346.529268', '2008-02-23', 'SA_REP', 6800, .1, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(166, 'Sundar Ande', 'SANDE', '011.44.1346.629268', '2008-03-24', 'SA_REP', 6400, .1, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(167, 'Amit Banda', 'ABANDA', '011.44.1346.729268', '2008-04-21', 'SA_REP', 6200, .1, 80, 147);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(168, 'Lisa Ozer', 'LOZER', '011.44.1343.929268', '2005-03-11', 'SA_REP', 11500, .25, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(169, 'Harrison Bloom', 'HBLOOM', '011.44.1343.829268', '2006-03-23', 'SA_REP', 10000, .2, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(170, 'Tayler Fox', 'TFOX', '011.44.1343.729268', '2006-01-24', 'SA_REP', 9600, .2, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(171, 'William Smith', 'WSMITH', '011.44.1343.629268', '2007-02-23', 'SA_REP', 7400, .15, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(172, 'Elizabeth Bates', 'EBATES', '011.44.1343.529268', '2007-03-24', 'SA_REP', 7300, .15, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(173, 'Sundita Kumar', 'SKUMAR', '011.44.1343.329268', '2008-04-21', 'SA_REP', 6100, .1, 80, 148);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(174, 'Ellen Abel', 'EABEL', '011.44.1644.429267', '2004-05-11', 'SA_REP', 11000, .3, 80, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(175, 'Alyssa Hutton', 'AHUTTON', '011.44.1644.429266', '2005-03-19', 'SA_REP', 8800, .25, 80, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(176, 'Jonathon Taylor', 'JTAYLOR', '011.44.1644.429265', '2006-03-24', 'SA_REP', 8600, .2, 80, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(177, 'Jack Livingston', 'JLIVINGS', '011.44.1644.429264', '2006-04-23', 'SA_REP', 8400, .2, 80, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(178, 'Kimberely Grant', 'KGRANT', '011.44.1644.429263', '2007-05-24', 'SA_REP', 7000, .15, null, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(179, 'Charles Johnson', 'CJOHNSON', '011.44.1644.429262', '2008-01-04', 'SA_REP', 6200, .1, 80, 149);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(180, 'Winston Taylor', 'WTAYLOR', '650.507.9876', '2006-01-24', 'SH_CLERK', 3200, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(181, 'Jean Fleaur', 'JFLEAUR', '650.507.9877', '2006-02-23', 'SH_CLERK', 3100, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(182, 'Martha Sullivan', 'MSULLIVA', '650.507.9878', '2007-06-21', 'SH_CLERK', 2500, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(183, 'Girard Geoni', 'GGEONI', '650.507.9879', '2008-02-03', 'SH_CLERK', 2800, null, 50, 120);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(184, 'Nandita Sarchand', 'NSARCHAN', '650.509.1876', '2004-01-27', 'SH_CLERK', 4200, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(185, 'Alexis Bull', 'ABULL', '650.509.2876', '2005-02-20', 'SH_CLERK', 4100, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(186, 'Julia Dellinger', 'JDELLING', '650.509.3876', '2006-06-24', 'SH_CLERK', 3400, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(187, 'Anthony Cabrio', 'ACABRIO', '650.509.4876', '2007-02-07', 'SH_CLERK', 3000, null, 50, 121);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(188, 'Kelly Chung', 'KCHUNG', '650.505.1876', '2005-06-14', 'SH_CLERK', 3800, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(189, 'Jennifer Dilly', 'JDILLY', '650.505.2876', '2005-08-13', 'SH_CLERK', 3600, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(190, 'Timothy Gates', 'TGATES', '650.505.3876', '2006-07-11', 'SH_CLERK', 2900, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(191, 'Randall Perkins', 'RPERKINS', '650.505.4876', '2007-12-19', 'SH_CLERK', 2500, null, 50, 122);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(192, 'Sarah Bell', 'SBELL', '650.501.1876', '2004-02-04', 'SH_CLERK', 4000, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(193, 'Britney Everett', 'BEVERETT', '650.501.2876', '2005-03-03', 'SH_CLERK', 3900, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(194, 'Samuel McCain', 'SMCCAIN', '650.501.3876', '2006-07-01', 'SH_CLERK', 3200, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(195, 'Vance Jones', 'VJONES', '650.501.4876', '2007-03-17', 'SH_CLERK', 2800, null, 50, 123);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(196, 'Alana Walsh', 'AWALSH', '650.507.9811', '2006-04-24', 'SH_CLERK', 3100, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(197, 'Kevin Feeney', 'KFEENEY', '650.507.9822', '2006-05-23', 'SH_CLERK', 3000, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(198, 'Donald OConnell', 'DOCONNEL', '650.507.9833', '2007-06-21', 'SH_CLERK', 2600, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(199, 'Douglas Grant', 'DGRANT', '650.507.9844', '2008-01-13', 'SH_CLERK', 2600, null, 50, 124);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(200, 'Jennifer Whalen', 'JWHALEN', '515.123.4444', '2003-09-17', 'AD_ASST', 4400, null, 10, 101);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(201, 'Michael Hartstein', 'MHARTSTE', '515.123.5555', '2004-02-17', 'MK_MAN', 13000, null, 20, 100);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(202, 'Pat Fay', 'PFAY', '603.123.6666', '2005-08-17', 'MK_REP', 6000, null, 20, 201);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(203, 'Susan Mavris', 'SMAVRIS', '515.123.7777', '2002-06-07', 'HR_REP', 6500, null, 40, 101);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(204, 'Hermann Baer', 'HBAER', '515.123.8888', '2002-06-07', 'PR_REP', 10000, null, 70, 101);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(205, 'Shelley Higgins', 'SHIGGINS', '515.123.8080', '2002-06-07', 'AC_MGR', 12008, null, 110, 101);
INSERT INTO empregados (id_empregado, nome, email, telefone, data_contratacao, id_cargo, salario, comissao, id_departamento, id_supervisor) VALUES
(206, 'William Gietz', 'WGIETZ', '515.123.8181', '2002-06-07', 'AC_ACCOUNT', 8300, null, 110, 205);
