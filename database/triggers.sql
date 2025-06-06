USE maxperformance;

DELIMITER $$
CREATE TRIGGER trg_check_max_alunos
BEFORE INSERT ON Participa
FOR EACH ROW
BEGIN
    DECLARE current_count INT;

    SELECT COUNT(*) INTO current_count
    FROM Participa
    WHERE fk_Aula_ID_Aula = NEW.fk_Aula_ID_Aula;

    IF current_count >= (SELECT Max_Alunos FROM Aula WHERE ID_Aula = NEW.fk_Aula_ID_Aula) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Capacidade máxima da aula atingida.';
    END IF;
END $$

DELIMITER ;
UPDATE Aula SET Max_Alunos = 3 WHERE ID_Aula = 1; 
SELECT * FROM Aula WHERE ID_Aula = 1;
INSERT INTO Participa (fk_Aula_ID_Aula, fk_Aluno_ID_Aluno) VALUES (1, 1);
INSERT INTO Participa (fk_Aula_ID_Aula, fk_Aluno_ID_Aluno) VALUES (1, 2);
INSERT INTO Participa (fk_Aula_ID_Aula, fk_Aluno_ID_Aluno) VALUES (1, 3);
