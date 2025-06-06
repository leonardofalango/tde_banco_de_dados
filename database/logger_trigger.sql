USE maxperformance;

DELIMITER $$
CREATE TRIGGER trg_log_participa_changes
AFTER INSERT ON Participa
FOR EACH ROW
BEGIN
    DECLARE log_message VARCHAR(255);
    
    SET log_message = CONCAT('Aluno ID ', NEW.fk_Aluno_ID_Aluno, 
                             ' participou da aula ID ', NEW.fk_Aula_ID_Aula, 
                             ' em ', NOW());
    
    INSERT INTO Log (message, created_at) VALUES (log_message, NOW());
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_log_participa_updates
AFTER UPDATE ON Participa
FOR EACH ROW
BEGIN
    DECLARE log_message VARCHAR(255);
    
    SET log_message = CONCAT('Participação de Aluno ID ', NEW.fk_Aluno_ID_Aluno, 
                             ' na aula ID ', NEW.fk_Aula_ID_Aula, 
                             ' foi atualizada em ', NOW());
    
    INSERT INTO Log (message, created_at) VALUES (log_message, NOW());
END $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER trg_log_participa_deletes
AFTER DELETE ON Participa
FOR EACH ROW
BEGIN
    DECLARE log_message VARCHAR(255);
    
    SET log_message = CONCAT('Participação de Aluno ID ', OLD.fk_Aluno_ID_Aluno, 
                             ' na aula ID ', OLD.fk_Aula_ID_Aula, 
                             ' foi removida em ', NOW());
    
    INSERT INTO Log (message, created_at) VALUES (log_message, NOW());
END $$
DELIMITER ;


CREATE TABLE Log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Participa (fk_Aula_ID_Aula, fk_Aluno_ID_Aluno) VALUES (15, 15);
INSERT INTO Participa (fk_Aula_ID_Aula, fk_Aluno_ID_Aluno) VALUES (15, 13);
UPDATE Participa SET fk_Aluno_ID_Aluno = 14 WHERE fk_Aula_ID_Aula = 15 AND fk_Aluno_ID_Aluno = 15;
DELETE FROM Participa WHERE fk_Aula_ID_Aula = 15 AND fk_Aluno_ID_Aluno = 14;


SELECT * FROM Log ORDER BY created_at DESC;
