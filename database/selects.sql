USE maxperformance;
SELECT 
    A.ID_Aula,
    A.Modalidade AS Modalidade_Aula,
    COUNT(P.fk_Aluno_ID_Aluno) AS Total_Alunos_Inscritos,
    A.Max_Alunos AS Capacidade_Maxima,
    A.Data AS Data_Aula
FROM Aula A
JOIN Participa P ON A.ID_Aula = P.fk_Aula_ID_Aula
GROUP BY A.ID_Aula, A.Modalidade
ORDER BY Total_Alunos_Inscritos DESC;


SELECT 
    I.ID_Instrutor,
    I.Nome AS Nome_Instrutor,
    ROUND(AVG(QtdAlunos.Total_Alunos), 2) AS Media_Alunos_Por_Aula
FROM Instrutor I
JOIN Aula A ON I.ID_Instrutor = A.fk_Instrutor_ID_Instrutor
JOIN (
    SELECT 
        fk_Aula_ID_Aula,
        COUNT(fk_Aluno_ID_Aluno) AS Total_Alunos
    FROM Participa
    GROUP BY fk_Aula_ID_Aula
) AS QtdAlunos ON A.ID_Aula = QtdAlunos.fk_Aula_ID_Aula
GROUP BY I.ID_Instrutor, I.Nome
ORDER BY Media_Alunos_Por_Aula DESC;


SELECT 
    M.NomeMaquina,
    COUNT(U.fk_Exercicio_Nome) AS Total_Utilizacoes
FROM Maquina M
JOIN Exercicio E ON M.NomeMaquina = E.fk_Maquina_NomeMaquina
JOIN Utilizacao U ON E.Nome = U.fk_Exercicio_Nome
GROUP BY M.NomeMaquina
ORDER BY Total_Utilizacoes DESC;


SELECT 
    Aluno.Nome AS Nome_Aluno,
    Instrutor.Nome AS Nome_Instrutor,
    Aula.Modalidade
FROM Participa
JOIN Aluno ON Participa.fk_Aluno_ID_Aluno = Aluno.ID_Aluno
JOIN Aula ON Participa.fk_Aula_ID_Aula = Aula.ID_Aula
JOIN Instrutor ON Aula.fk_Instrutor_ID_Instrutor = Instrutor.ID_Instrutor;

SELECT 
    Aula.ID_Aula,
    Aula.Modalidade,
    Maquina.NomeMaquina,
    Aula.Data,
    Aula.Horario,
    Aula.Duracao
FROM Utilizacao
JOIN Exercicio ON Utilizacao.fk_Exercicio_Nome = Exercicio.Nome
JOIN Maquina ON Exercicio.fk_Maquina_NomeMaquina = Maquina.NomeMaquina
JOIN Aula ON Utilizacao.fk_Aula_ID_Aula = Aula.ID_Aula;

SELECT 
    Aluno.Nome AS Nome_Aluno,
    Aula.Modalidade,
    Exercicio.Nome AS Nome_Exercicio
FROM Participa
JOIN Aula ON Participa.fk_Aula_ID_Aula = Aula.ID_Aula
JOIN Utilizacao ON Aula.ID_Aula = Utilizacao.fk_Aula_ID_Aula
JOIN Exercicio ON Utilizacao.fk_Exercicio_Nome = Exercicio.Nome
JOIN Aluno ON Participa.fk_Aluno_ID_Aluno = Aluno.ID_Aluno;
