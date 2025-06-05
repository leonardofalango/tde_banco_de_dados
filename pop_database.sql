USE maxperformance;

INSERT INTO Endereco (Endereco_PK, Logradouro, Cidade, CEP, Complemento) VALUES
(1, 'Rua das Flores', 'São Paulo', '01001-000', 'Ap 101'),
(2, 'Av. Brasil', 'Rio de Janeiro', '20040-002', ''),
(3, 'Rua Alegre', 'Belo Horizonte', '30110-010', 'Casa'),
(4, 'Av. das Nações', 'Brasília', '70040-010', ''),
(5, 'Rua Verde', 'Curitiba', '80010-020', 'Fundos'),
(6, 'Av. Leste-Oeste', 'Fortaleza', '60060-000', ''),
(7, 'Rua Central', 'Manaus', '69005-020', 'Bloco B'),
(8, 'Av. Atlântica', 'Recife', '50020-030', 'Sala 5'),
(9, 'Rua do Sol', 'Salvador', '40010-000', ''),
(10, 'Av. das Palmeiras', 'Natal', '59020-010', ''),
(11, 'Rua Nova', 'Campinas', '13010-010', ''),
(12, 'Av. Getúlio Vargas', 'Porto Alegre', '90010-020', ''),
(13, 'Rua São João', 'Belém', '66010-000', ''),
(14, 'Av. Tiradentes', 'João Pessoa', '58010-010', ''),
(15, 'Rua da Praia', 'Florianópolis', '88010-020', 'Cobertura');

INSERT INTO Aluno (ID_Aluno, Nome, Data_Nascimento, CPF, fk_Endereco_Endereco_PK, Celular, Email) VALUES
(1, 'Leonardo Falas', STR_TO_DATE('2003-22-07', '%Y-%d-%m'), '09093389910', 1, '41987141533', 'leo@email.com'),
(2, 'Bruno Silva', STR_TO_DATE('1992-22-03', '%Y-%d-%m'), '12345678901', 2, '21999990002', 'bruno@email.com'),
(3, 'Carla Souza', STR_TO_DATE('1990-15-01', '%Y-%d-%m'), '12345678902', 3, '31999990003', 'carla@email.com'),
(4, 'Daniel Rocha', STR_TO_DATE('1996-08-07', '%Y-%d-%m'), '12345678903', 4, '61999990004', 'daniel@email.com'),
(5, 'Elisa Dias', STR_TO_DATE('1988-09-09', '%Y-%d-%m'), '12345678904', 5, '41999990005', 'elisa@email.com'),
(6, 'Fernando Melo', STR_TO_DATE('1991-17-02', '%Y-%d-%m'), '12345678905', 6, '81999990006', 'fernando@email.com'),
(7, 'Gabriela Fonseca', STR_TO_DATE('1993-30-10', '%Y-%d-%m'), '12345678906', 7, '71999990007', 'gabriela@email.com'),
(8, 'Henrique Costa', STR_TO_DATE('1989-01-06', '%Y-%d-%m'), '12345678907', 8, '21999990008', 'henrique@email.com'),
(9, 'Isabela Ribeiro', STR_TO_DATE('1997-11-12', '%Y-%d-%m'), '12345678908', 9, '31999990009', 'isabela@email.com'),
(10, 'João Pedro', STR_TO_DATE('1994-18-08', '%Y-%d-%m'), '12345678909', 10, '51999990010', 'joao@email.com'),
(11, 'Karen Martins', STR_TO_DATE('1995-25-11', '%Y-%d-%m'), '12345678910', 11, '61999990011', 'karen@email.com'),
(12, 'Lucas Torres', STR_TO_DATE('1987-03-04', '%Y-%d-%m'), '12345678911', 12, '71999990012', 'lucas@email.com'),
(13, 'Mariana Lopes', STR_TO_DATE('1992-13-09', '%Y-%d-%m'), '12345678912', 13, '81999990013', 'mariana@email.com'),
(14, 'Nicolas Reis', STR_TO_DATE('1990-27-06', '%Y-%d-%m'), '12345678913', 14, '91999990014', 'nicolas@email.com'),
(15, 'Olivia Cardoso', STR_TO_DATE('1998-05-01', '%Y-%d-%m'), '12345678914', 15, '11999990015', 'olivia@email.com');



INSERT INTO Instrutor (ID_Instrutor, Nome, Data_Nascimento, CPF, fk_Endereco_Endereco_PK, Celular, Email) VALUES
(1, 'Paulo Araujo', '1980-03-15', '32145678900', 1, '11988880001', 'paulo@academia.com'),
(2, 'Renata Gomes', '1985-07-19', '32145678901', 2, '21988880002', 'renata@academia.com'),
(3, 'Sérgio Matos', '1978-10-01', '32145678902', 3, '31988880003', 'sergio@academia.com'),
(4, 'Tatiane Barros', '1982-12-25', '32145678903', 4, '41988880004', 'tatiane@academia.com'),
(5, 'Ubiratan Silva', '1979-08-13', '32145678904', 5, '51988880005', 'ubiratan@academia.com'),
(6, 'Vanessa Leal', '1986-02-07', '32145678905', 6, '61988880006', 'vanessa@academia.com'),
(7, 'Wesley Moura', '1983-09-30', '32145678906', 7, '71988880007', 'wesley@academia.com'),
(8, 'Xênia Santos', '1981-06-22', '32145678907', 8, '81988880008', 'xenia@academia.com'),
(9, 'Yara Lima', '1984-11-11', '32145678908', 9, '91988880009', 'yara@academia.com'),
(10, 'Zé Carlos', '1977-05-05', '32145678909', 10, '11988880010', 'zecarlos@academia.com'),
(11, 'Adriana Teixeira', '1980-01-01', '32145678910', 11, '21988880011', 'adriana@academia.com'),
(12, 'Breno Rocha', '1976-03-20', '32145678911', 12, '31988880012', 'breno@academia.com'),
(13, 'Cíntia Souza', '1983-07-07', '32145678912', 13, '41988880013', 'cintia@academia.com'),
(14, 'Diego Nunes', '1987-10-10', '32145678913', 14, '51988880014', 'diego@academia.com'),
(15, 'Eduarda Meireles', '1975-09-09', '32145678914', 15, '61988880015', 'eduarda@academia.com');


INSERT INTO Maquina (NomeMaquina, DataCompra, Preco, ValorManuntencao) VALUES
('Leg Press', '2020-01-15', 5000.00, 300.00),
('Esteira', '2019-05-22', 8000.00, 400.00),
('Bicicleta', '2021-03-10', 4500.00, 250.00),
('Supino', '2022-07-01', 6000.00, 350.00),
('Cross Over', '2018-09-09', 7000.00, 370.00),
('Remo Indoor', '2020-11-20', 5200.00, 310.00),
('Elíptico', '2023-01-01', 9000.00, 420.00),
('Hack Squat', '2019-12-12', 7500.00, 390.00),
('Step', '2021-06-06', 2000.00, 150.00),
('Puxada Alta', '2022-10-10', 6500.00, 360.00),
('Smith', '2020-02-02', 5800.00, 330.00),
('Pec Deck', '2023-03-03', 6200.00, 300.00),
('Cadeira Extensora', '2018-08-08', 4900.00, 270.00),
('Cadeira Flexora', '2019-09-09', 5100.00, 280.00),
('Abdominal', '2020-04-04', 3000.00, 200.00);

INSERT INTO Exercicio (Nome, Descricao, Ducacao, Nivel, fk_Maquina_NomeMaquina) VALUES
('Agachamento', 'Exercício de pernas', '00:01:30', 3, 'Leg Press'),
('Corrida', 'Exercício aeróbico', '00:20:00', 2, 'Esteira'),
('Pedalar', 'Exercício de resistência', '00:15:00', 2, 'Bicicleta'),
('Supino Reto', 'Peitoral e tríceps', '00:02:00', 4, 'Supino'),
('Crossover', 'Peitoral e ombro', '00:01:30', 3, 'Cross Over'),
('Remada Baixa', 'Costas e bíceps', '00:02:00', 4, 'Remo Indoor'),
('Elíptico', 'Cardio completo', '00:10:00', 2, 'Elíptico'),
('Agachamento Hack', 'Pernas e glúteos', '00:01:40', 3, 'Hack Squat'),
('Subida em Step', 'Glúteos e cardio', '00:05:00', 2, 'Step'),
('Puxada Frontal', 'Costas e braços', '00:02:10', 3, 'Puxada Alta'),
('Supino Inclinado', 'Peitoral superior', '00:02:00', 4, 'Smith'),
('Crucifixo', 'Peitoral', '00:01:50', 3, 'Pec Deck'),
('Extensora', 'Quadríceps', '00:01:30', 2, 'Cadeira Extensora'),
('Flexora', 'Posterior da coxa', '00:01:30', 2, 'Cadeira Flexora'),
('Abdominal Reto', 'Core', '00:02:00', 1, 'Abdominal');


INSERT INTO Aula (Horario, Modalidade, Max_Alunos, Duracao, ID_Aula, Data, DiaSemana, fk_Instrutor_ID_Instrutor) VALUES
('08:00:00', 'Funcional', 20, '00:45:00', 1, '2025-06-01', 'Segunda', 1),
('09:00:00', 'HIIT', 15, '00:30:00', 2, '2025-06-02', 'Terça', 1),
('10:00:00', 'Yoga', 10, '01:00:00', 3, '2025-06-03', 'Quarta', 1),
('11:00:00', 'Pilates', 12, '01:00:00', 4, '2025-06-04', 'Quinta', 1),
('12:00:00', 'Crossfit', 18, '00:50:00', 5, '2025-06-05', 'Sexta', 2),
('13:00:00', 'Dança', 25, '00:45:00', 6, '2025-06-06', 'Sábado', 2),
('14:00:00', 'Spinning', 16, '00:40:00', 7, '2025-06-07', 'Domingo', 3),
('15:00:00', 'Alongamento', 20, '00:30:00', 8, '2025-06-08', 'Segunda',3),
('16:00:00', 'Funcional', 22, '00:45:00', 9, '2025-06-09', 'Terça', 3),
('17:00:00', 'Zumba', 25, '00:50:00', 10, '2025-06-10', 'Quarta', 3),
('18:00:00', 'Aeróbico', 30, '00:40:00', 11, '2025-06-11', 'Quinta', 4),
('19:00:00', 'Musculação', 20, '00:50:00', 12, '2025-06-12', 'Sexta', 5),
('20:00:00', 'Treino Livre', 15, '00:45:00', 13, '2025-06-13', 'Sábado', 6),
('21:00:00', 'HIIT', 12, '00:30:00', 14, '2025-06-14', 'Domingo', 7),
('22:00:00', 'Funcional', 18, '00:50:00', 15, '2025-06-15', 'Segunda', 8);


INSERT INTO Participa (fk_Aluno_ID_Aluno, fk_Aula_ID_Aula) VALUES
(1,1), (1,2), (1,3), (1,4), (1,5),(1,6), (1,7), (1,8), (1,9),
(2,1), (2,2), (2,3), (2,4), (2,5),(2,6), (2,7),
(3,1), (3,2), (3,3), (3,4), (3,5),(3,6),
(4,8), (4,9), (4,10), (4,11), (4,12), (4,13), (4,14), (4,15),
(5,1), (5,2), (5,3), (5,4),
(6,1), (6,15),
(7,5),(7,6), (7,7), (7,8), (7,9), (7,10), (7,11), (7,12), (7,13), (7,14), (7,15),
(8,1),(8,2),(8,3),(8,4), (8,5),
(9,7), (9,8), (9,9), (9,10), (9,11), (9,12), (9,13), (9,14), (9,15),
(10,1),
(11 ,1),(11 ,2)


INSERT INTO Utilizacao (fk_Exercicio_Nome, fk_Aula_ID_Aula, Repeticoes, Series) VALUES
('Agachamento', 1, 15, 3),
('Corrida', 1, 0, 1),
('Pedalar', 2, 2, 1),
('Supino Reto', 4, 12, 4),
('Crossover', 4, 10, 3),
('Remada Baixa', 4, 10, 3),
('Elíptico', 3, 0, 1),
('Agachamento Hack', 5, 15, 3),
('Subida em Step', 1, 0, 1),
('Puxada Frontal', 4, 12, 4),
('Supino Inclinado', 4, 10, 3),
('Crucifixo', 4, 12, 3),
('Extensora', 7, 15, 3),
('Flexora', 8, 15, 3),
('Abdominal Reto', 9, 20, 3);


SELECT * FROM Aluno;
SELECT * FROM Instrutor;
SELECT * FROM Aula;
SELECT * FROM Exercicio;
SELECT * FROM Maquina;
SELECT * FROM Endereco;


SELECT * FROM Participa WHERE fk_Aula_ID_Aula = 3;