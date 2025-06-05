DROP DATABASE IF EXISTS maxperformance;
CREATE DATABASE maxperformance;
USE maxperformance;

CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20),
    Data_Nascimento DATE,
    CPF VARCHAR(20),
    fk_Endereco_Endereco_PK INT,
    Celular VARCHAR(20),
    Email VARCHAR(80)
);

CREATE TABLE Instrutor (
    ID_Instrutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20),
    Data_Nascimento DATE,
    CPF VARCHAR(20),
    fk_Endereco_Endereco_PK INT,
    Celular VARCHAR(20),
    Email VARCHAR(80)
);

CREATE TABLE Aula (
    Horario TIME,
    Modalidade VARCHAR(20),
    Max_Alunos INT,
    Duracao TIME,
    ID_Aula INT PRIMARY KEY,
    Data DATE,
    DiaSemana VARCHAR(20),
    fk_Instrutor_ID_Instrutor INT
);

CREATE TABLE Exercicio (
    Nome VARCHAR(50) PRIMARY KEY,
    Descricao TEXT,
    Ducacao TIME,
    Nivel INT,
    fk_Maquina_NomeMaquina VARCHAR(20)
);

CREATE TABLE Maquina (
    NomeMaquina VARCHAR(20) PRIMARY KEY,
    DataCompra DATE,
    Preco DOUBLE,
    ValorManuntencao DOUBLE
);

CREATE TABLE Endereco (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    Logradouro VARCHAR(50),
    Cidade VARCHAR(20),
    CEP VARCHAR(20),
    Complemento VARCHAR(50)
);

CREATE TABLE Participa (
    fk_Aluno_ID_Aluno INT,
    fk_Aula_ID_Aula INT,
    PRIMARY KEY (fk_Aluno_ID_Aluno, fk_Aula_ID_Aula)
);

CREATE TABLE Utilizacao (
    fk_Exercicio_Nome VARCHAR(50),
    fk_Aula_ID_Aula INT,
    Repeticoes INT,
    Series INT,
    PRIMARY KEY (fk_Aula_ID_Aula, fk_Exercicio_Nome)
);
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Instrutor ADD CONSTRAINT FK_Instrutor_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Aula ADD CONSTRAINT FK_Aula_2
    FOREIGN KEY (fk_Instrutor_ID_Instrutor)
    REFERENCES Instrutor (ID_Instrutor)
    ON DELETE CASCADE;
 
ALTER TABLE Exercicio ADD CONSTRAINT FK_Exercicio_2
    FOREIGN KEY (fk_Maquina_NomeMaquina)
    REFERENCES Maquina (NomeMaquina)
    ON DELETE CASCADE;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Aluno_ID_Aluno)
    REFERENCES Aluno (ID_Aluno)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Aula_ID_Aula)
    REFERENCES Aula (ID_Aula)
    ON DELETE CASCADE;
 
ALTER TABLE Utilizacao ADD CONSTRAINT FK_Utilizacao_1
    FOREIGN KEY (fk_Exercicio_Nome)
    REFERENCES Exercicio (Nome)
    ON DELETE RESTRICT;
 
ALTER TABLE Utilizacao ADD CONSTRAINT FK_Utilizacao_2
    FOREIGN KEY (fk_Aula_ID_Aula)
    REFERENCES Aula (ID_Aula)
    ON DELETE RESTRICT;


SELECT * FROM Aluno;
SELECT * FROM Instrutor;
SELECT * FROM Aula;
SELECT * FROM Exercicio;
SELECT * FROM Maquina;
SELECT * FROM Endereco;
SELECT * FROM Participa;
SELECT * FROM Utilizacao;

USE maxperformance;
SELECT Id_Aluno FROM Aluno WHERE Email like 'leo@email.com';