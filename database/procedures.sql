USE maxperformance;
DELIMITER $$
CREATE PROCEDURE sp_alunos_por_modalidade (
    IN modalidade_input VARCHAR(50),
    OUT total_alunos INT
)
BEGIN
    SELECT COUNT(DISTINCT Participa.fk_Aluno_ID_Aluno)
    INTO total_alunos
    FROM Participa
    JOIN Aula ON Participa.fk_Aula_ID_Aula = Aula.ID_Aula
    WHERE Aula.Modalidade = modalidade_input;
END $$
DELIMITER ;

SET @total = 0;
CALL sp_alunos_por_modalidade('Yoga', @total);
SELECT @total AS Total_Alunos;